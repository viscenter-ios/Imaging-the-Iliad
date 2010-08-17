#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <string>
#import <iostream>
#import "Interfaces.hpp"

using namespace std;

namespace Darwin {
    
class ResourceManager : public IResourceManager {
public:
    string GetResourcePath() const
    {
        NSString* bundlePath =[[NSBundle mainBundle] resourcePath];
        return [bundlePath UTF8String];
    }
    void LoadPngImage(const string& name)
    {
		NSLog(@"load png");
		/*
        NSString* basePath = [[NSString alloc] initWithUTF8String:name.c_str()];
      //  NSBundle* mainBundle = [NSBundle mainBundle];
        
		
		//NSString* fullPath = [mainBundle pathForResource:basePath ofType:@"jpg"];
		
		//NSString* fullPath = [[NSBundle mainBundle] pathForResource:@"va012rn" ofType:@"png"];
		
        //UIImage* uiImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
		
		
		
		//UIImage* uiImage = [UIImage imageNamed:@"va012rn.png"];

		
	//	NSString * folioName = @"012R";
		
		id path = [NSString stringWithFormat:@"http://scipio.vis.uky.edu/~baumann/va/images/VA%@N.jpg", basePath];
		NSURL *url = [NSURL URLWithString:path];
		NSData *data = [NSData dataWithContentsOfURL:url];
		UIImage* uiImage = [[UIImage alloc] initWithData:data];*/
		UIImage* uiImage = [[UIImage alloc] initWithData:[NSData dataWithBytes:name.c_str() length:name.length()]];
		
		
		UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 2048, 2048)];
		[iv setImage:uiImage];

		CGRect imageRect = iv.frame;

		UIGraphicsBeginImageContext(iv.bounds.size);
		[iv.layer renderInContext:UIGraphicsGetCurrentContext()];
		UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		
		
		// NEED THIS HERE?
        CGImageRef cgImage = viewImage.CGImage;
		m_imageSize.x = CGImageGetWidth(cgImage);
        m_imageSize.y = CGImageGetHeight(cgImage);
		NSLog(@"%.d",CGImageGetBitsPerPixel(cgImage));
        m_imageData = CGDataProviderCopyData(CGImageGetDataProvider(cgImage));
        [uiImage release];
		[iv release];
		
      //  [basePath release];
    }
    void* GetImageData()
    {
        return (void*) CFDataGetBytePtr(m_imageData);
    }
    ivec2 GetImageSize()
    {
        return m_imageSize;
    }
    void UnloadImage()
    {
        CFRelease(m_imageData);
    }
private:
    ivec2 m_imageSize;
    CFDataRef m_imageData;
};

IResourceManager* CreateResourceManager()
{
    return new ResourceManager();
}

}