#include "ObjSurface.hpp"
#import <list>
#import <fstream>
#import <assert.h>
#import <sstream>

using namespace std;

ObjSurface::ObjSurface(const string &folio, const string& name) :
	m_folio(folio),
    m_name(name),
    m_faceCount(0),
    m_vertexCount(0)
	
{
	int counter=0;
	NSLog(@"length %d",m_name.length());
	//NSLog(@"%s",m_name.c_str());
    m_faces.resize(GetTriangleIndexCount() / 3);
    istringstream objFile(m_name);
    vector<ivec3>::iterator face = m_faces.begin();
    while (objFile.good()) {
        char c = objFile.get();
		//NSLog(@"%c",c);
        if (c == 'f') {
            assert(face != m_faces.end() && "parse error");
            objFile >> face->x >> face->y >> face->z;
            *face++ -= ivec3(1, 1, 1);
			counter++;
        }
        objFile.ignore(MaxLineSize, '\n');
    }
	//NSLog(@"counter %d",counter);
    assert(face == m_faces.end() && "parse error");
}

int ObjSurface::GetVertexCount() const
{
    if (m_vertexCount != 0)
        return m_vertexCount;
    
    istringstream objFile(m_name);
    while (objFile) {
        char c = objFile.get();
        if (c == 'v') {
            c = objFile.get();
            if (c != 't') {
                m_vertexCount++;
            }
        }
        objFile.ignore(MaxLineSize, '\n');
    }
    return m_vertexCount;
}

int ObjSurface::GetTriangleIndexCount() const
{
    if (m_faceCount != 0)
        return m_faceCount * 3;
    
    istringstream objFile(m_name);
    while (objFile) {
        char c = objFile.get();
        if (c == 'f')
            m_faceCount++;
        objFile.ignore(MaxLineSize, '\n');
    }
    return m_faceCount * 3;
}

void ObjSurface::GenerateVertices(vector<float>& floats, unsigned char flags) const
{
    struct Vertex {
        vec3 Position;
        vec3 Normal;
        vec2 Texture;
    };
    
    int floatsPerVertex = 3;
    if (flags & VertexFlagsNormals)
        floatsPerVertex += 3;
    if (flags & VertexFlagsTexCoords)
        floatsPerVertex += 2;
    
    floats.resize(GetVertexCount() * floatsPerVertex);

    // Read in the vertex positions and initialize lighting normals to (0, 0, 0).
    // floats.resize(GetVertexCount() * 6);
    
    vec3 min, max, cmin, cmax, dimensions, center = vec3(0, 0, 0);
    float scale = 1;
    
    istringstream objFile(m_name);
    Vertex* vertex = (Vertex*) &floats[0];
    while (objFile) {
        char c = objFile.get();
        if (c == 'v') {
            c = objFile.get();
            if (c != 't') {
                vertex->Normal = vec3(0, 0, 0);
                vertex->Texture = vec2(0, 0);
                vec3& position = vertex->Position;
				
				
					objFile >> position.x >> position.y >> position.z;
            

                // first vertex, initialize limits
                if(vertex == (Vertex*) &floats[0]) {
                    min = vertex->Position;
                    max = vertex->Position;
                }
                else {
                    min.x = position.x < min.x ? position.x : min.x;
                    min.y = position.y < min.y ? position.y : min.y;
                    min.z = position.x < min.z ? position.z : min.z;
                    max.x = position.x > max.x ? position.x : max.x;
                    max.y = position.y > max.y ? position.y : max.y;
                    max.z = position.x > max.z ? position.z : max.z;
                }
                
                center += position;
                
                vertex++;
            }
        }
        objFile.ignore(MaxLineSize, '\n');
    }
    
    // calculate scale and center
    center /= GetVertexCount();
    cmin = min - center;
    cmax = max - center;
    dimensions = vec3(abs(cmin.x) + abs(cmax.x),abs(cmin.y) + abs(cmax.y),abs(cmin.z) + abs(cmax.z));
    scale = 7.0 / fmax(fmax(dimensions.x, dimensions.y), dimensions.z);

    // read actual texture coordinates
    vertex = (Vertex*) &floats[0];
    objFile.clear();
    objFile.seekg(0);
	//NSLog(@"%s",m_name.c_str());
    while (objFile) {
        char c = objFile.get();
        if (c == 'v') {
            c = objFile.get();
            if (c == 't') {
                vec2& texture = vertex->Texture;
				
                objFile >> texture.y >> texture.x;
			
				if (m_folio.find('V') != string::npos)
				{
					
					//NSLog(@"1.0 - stuff %s", m_folio.c_str());
					
					texture.x = 1.0 - texture.x;
					texture.y = 1.0 - texture.y;
				}

				
                vertex++;
            }
        }
        objFile.ignore(MaxLineSize, '\n');
    }
    
    vertex = (Vertex*) &floats[0];
    for (size_t faceIndex = 0; faceIndex < m_faces.size(); ++faceIndex) {
        ivec3 face = m_faces[faceIndex];

        // Compute the facet normal.
        vec3 a = vertex[face.x].Position;
        vec3 b = vertex[face.y].Position;
        vec3 c = vertex[face.z].Position;
        vec3 facetNormal = (b - a).Cross(c - a);

        // Add the facet normal to the lighting normal of each adjoining vertex.
        vertex[face.x].Normal += facetNormal;
        vertex[face.y].Normal += facetNormal;
        vertex[face.z].Normal += facetNormal;
    }

    // Normalize the normals.
    for (int v = 0; v < GetVertexCount(); ++v) {
        vertex[v].Position -= center;
        vertex[v].Position.x *= scale;
        vertex[v].Position.y *= scale;
        vertex[v].Position.z *= scale;
        vertex[v].Normal.Normalize();
    }
}

void ObjSurface::GenerateTriangleIndices(vector<unsigned short>& indices) const
{
    indices.resize(GetTriangleIndexCount());
    vector<unsigned short>::iterator index = indices.begin();
    for (vector<ivec3>::const_iterator f = m_faces.begin(); f != m_faces.end(); ++f) {
        *index++ = f->x;
        *index++ = f->y;
        *index++ = f->z;
    }
}
