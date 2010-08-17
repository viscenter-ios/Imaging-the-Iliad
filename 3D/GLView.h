#import "Interfaces.hpp"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GLView : UIView {
@private
    IApplicationEngine* m_applicationEngine;
    IRenderingEngine* m_renderingEngine;
    IResourceManager* m_resourceManager;
    EAGLContext* m_context;
    float m_timestamp;
	
	NSMutableData *objData,*jpgData;
	NSURLConnection *objConnection;
	NSURLConnection *jpgConnection;
	BOOL hasData;
	BOOL jpgFinished, objFinished;
	
	
 
}

- (void) drawView: (CADisplayLink*) displayLink;

- (void) passFolio: (NSString *) folio;

@end
