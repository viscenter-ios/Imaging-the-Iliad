#import "GLView.h"

#define GL_RENDERBUFFER 0x8d41

@implementation GLView

+ (Class) layerClass
{
    return [CAEAGLLayer class];
}


//////////////////////////


- (void) passFolio:(NSString *) folio{
	
	
	
	NSLog(@"folio passed");
	
	int folioInt= [folio intValue];
	NSString *folioResult;

    if(folioInt<=99){
        folioResult=[NSString stringWithFormat:@"0%@",folio];
        folioResult=[folioResult uppercaseString];
    }
    else if(folioInt>99){
        folioResult=[NSString stringWithFormat:@"%@",folio];    
        folioResult=[folioResult uppercaseString];
    }
    else {
        folioResult=[NSString stringWithFormat:@"%@",folio];    
    }	
	
	folio = folioResult;
	
	
	
	
	id thePath = [NSString stringWithFormat:@"http://scipio.vis.uky.edu/~baumann/va/3D/VA%sN.obj", [folio UTF8String]];
	NSLog(@"thePATH = %@",thePath);
	//NSURL *url = [NSURL URLWithString:thePath];
	
	
	
	id path = [NSString stringWithFormat:@"http://scipio.vis.uky.edu/~baumann/va/images/VA%sN.jpg", [folio UTF8String]];
	//NSURL *url = [NSURL URLWithString:path];
	//NSData *data = [NSData dataWithContentsOfURL:url];
	//UIImage* uiImage = [[UIImage alloc] initWithData:data];
	
	
	//UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 2048, 2048)];
	//[iv setImage:uiImage];
	
	//CGRect imageRect = iv.frame;
	
	//UIGraphicsBeginImageContext(iv.bounds.size);
	//[iv.layer renderInContext:UIGraphicsGetCurrentContext()];
	//UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	//UIGraphicsEndImageContext();

	
		// Create the request.
	NSLog(@"about to initiate connection");

	//NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:thePath]];
	// create the connection with the request
	// and start loading the data
	jpgFinished = NO; objFinished = NO;
	objConnection=[[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:thePath]] delegate:self];
	jpgConnection=[[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]] delegate:self];
	NSLog(@"initiated connection");
	if (objConnection && jpgConnection) {
		// Create the NSMutableData to hold the received data.
		// receivedData is an instance variable declared elsewhere.
		
		
		//NSLog(@"%f",[thePath valueForHTTPHeaderField:@"Content-Length"]);
		//[path valueForHTTPHeaderField:@"Content-Length"];

		
		objData = [[NSMutableData data] retain];
		jpgData = [[NSMutableData data] retain];
	} else {
		// Inform the user that the connection failed.
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Failed" message:@"3D Viewing requires Internet Connection."
													   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];	
		[alert release];
	}
	
}




- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	NSString *sizeDownloaded = [NSString stringWithFormat:@"%i", [data length]];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"threeDPageProgress"
														object:sizeDownloaded
													  userInfo:nil];
	
	
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
	if(connection == objConnection) [objData appendData:data];
	else if(connection == jpgConnection) [jpgData appendData:data];
	
	//NSLog(@"Connection stuff here");

}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    // release the connection, and the data object
    [jpgConnection release];
	[objConnection release];
    // receivedData is declared as a method instance elsewhere
   // [receivedData release];
	[objData release];
	[jpgData release];

    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
	
	if( connection == jpgConnection ) {jpgFinished = YES; printf("jpg finished\n"); }
	if( connection == objConnection ) {objFinished = YES; printf("obg finished\n"); }
	
	if( jpgFinished && objFinished )
	{
		NSLog(@"Succeeded! Received %d bytes of data",[jpgData length]);
		NSLog(@"Succeeded! Received %d bytes of data",[objData length]);

		//NSString* theString = [[NSString alloc] initWithData:objData encoding:NSASCIIStringEncoding];
		//printf("nsstring\n");
		
		/*UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 2048, 2048)];
		[iv setImage:uiImage];
		
		CGRect imageRect = iv.frame;
		
		UIGraphicsBeginImageContext(iv.bounds.size);
		[iv.layer renderInContext:UIGraphicsGetCurrentContext()];
		UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();*/
		hasData = YES;
		
		//NSLog(@"%@",theString);
		//NSLog(@"%s",(char*)[objData bytes]);
		m_resourceManager->LoadPngImage(string((char*)[jpgData bytes],[jpgData length]));
		printf("image loaded\n");
		m_applicationEngine->updateView(string((char*)[objData bytes],[objData length]));
//										[theString UTF8String]);	
		printf("updated view\n");
		
		[objData release];
		[jpgData release];
		
		
		
		
		
		//[[NSNotificationCenter defaultCenter] postNotificationName:@"threeDPageLoaded"
		//													object:nil
		//												  userInfo:nil];
	}
	
    // release the connection, and the data object
    [connection release];
}



//////////////////////////



- (id) initWithFrame: (CGRect) frame
{
    if (self = [super initWithFrame:frame])
    {
		hasData = NO;
		
        CAEAGLLayer* eaglLayer = (CAEAGLLayer*) self.layer;
        eaglLayer.opaque = YES;

        EAGLRenderingAPI api = kEAGLRenderingAPIOpenGLES2;
        m_context = [[EAGLContext alloc] initWithAPI:api];
        
        if (!m_context) {
            api = kEAGLRenderingAPIOpenGLES1;
            m_context = [[EAGLContext alloc] initWithAPI:api];
        }
        
        if (!m_context || ![EAGLContext setCurrentContext:m_context]) {
            [self release];
            return nil;
        }
        
        m_resourceManager = Darwin::CreateResourceManager();

        if (api == kEAGLRenderingAPIOpenGLES1) {
            NSLog(@"Using OpenGL ES 1.1");
            m_renderingEngine = TexturedES1::CreateRenderingEngine(m_resourceManager);
        } else {
            NSLog(@"Using OpenGL ES 2.0");
            m_renderingEngine = TexturedES2::CreateRenderingEngine(m_resourceManager);
        }

       m_applicationEngine = ParametricViewer::CreateApplicationEngine(m_renderingEngine, m_resourceManager);

        [m_context
            renderbufferStorage:GL_RENDERBUFFER
            fromDrawable: eaglLayer];
                
        int width = CGRectGetWidth(frame);
        int height = CGRectGetHeight(frame);
        m_applicationEngine->Initialize(width, height);
        
        [self drawView: nil];
        m_timestamp = CACurrentMediaTime();
        
        UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]
                                                   initWithTarget:self action:@selector(handlePinchGesture:)];
        [self addGestureRecognizer: pinchGesture];
        [pinchGesture release];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(handlePanGesture:)];
        panGesture.minimumNumberOfTouches = 3;
        [self addGestureRecognizer:panGesture];
        [panGesture release];
        
        CADisplayLink* displayLink;
        displayLink = [CADisplayLink displayLinkWithTarget:self
                                     selector:@selector(drawView:)];
        
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                     forMode:NSDefaultRunLoopMode];
		
		
		
		UIButton * ribbonButtonRP1 = [UIButton buttonWithType:UIButtonTypeCustom];
		ribbonButtonRP1.frame = CGRectMake(967, 20, 37, 37); // position in the parent view and set the size of the button
		UIImage *ribbonImageRP1 = [UIImage imageNamed:@"exit.png"];
		[ribbonButtonRP1 setImage:ribbonImageRP1 forState:UIControlStateNormal];
		// add targets and actions
		[ribbonButtonRP1 addTarget:self action:@selector(exitClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		//ribbonButtonRP1.alpha = 0.0;
		[self addSubview:ribbonButtonRP1];
		
		
		
    }
    return self;
}

- (void) drawView: (CADisplayLink*) displayLink
{
	if (hasData == NO) {
		return;
	}
    if (displayLink != nil) {
        float elapsedSeconds = displayLink.timestamp - m_timestamp;
        m_timestamp = displayLink.timestamp;
        m_applicationEngine->UpdateAnimation(elapsedSeconds);
    }
    
    m_applicationEngine->Render();
    [m_context presentRenderbuffer:GL_RENDERBUFFER];
}



- (void) exitClicked {

	[[NSNotificationCenter defaultCenter] postNotificationName:@"Remove3D"
														object:nil
													  userInfo:nil];

}

- (void) touchesBegan: (NSSet*) touches withEvent: (UIEvent*) event
{
    UITouch* touch = [touches anyObject];
    CGPoint location  = [touch locationInView: self];
    m_applicationEngine->OnFingerDown(ivec2(location.x, location.y));
}

- (void) touchesEnded: (NSSet*) touches withEvent: (UIEvent*) event
{
    UITouch* touch = [touches anyObject];
    CGPoint location  = [touch locationInView: self];
    m_applicationEngine->OnFingerUp(ivec2(location.x, location.y));
}

- (void) touchesMoved: (NSSet*) touches withEvent: (UIEvent*) event
{
    UITouch* touch = [touches anyObject];
    CGPoint previous  = [touch previousLocationInView: self];
    CGPoint current = [touch locationInView: self];
    m_applicationEngine->OnFingerMove(ivec2(previous.x, previous.y),
                                      ivec2(current.x, current.y));
}

- (IBAction)handlePinchGesture:(UIGestureRecognizer *)sender {
    CGFloat factor = [(UIPinchGestureRecognizer *)sender scale];

    // NSLog([NSString stringWithFormat:@"Pinch: %f", factor]);
    if ([(UIPinchGestureRecognizer *)sender state] == UIGestureRecognizerStateEnded) {
        m_applicationEngine->OnPinchEnd(factor);
    }
    else {
        m_applicationEngine->OnPinchMove(factor);
    }
}

- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)sender {
    CGPoint translate = [sender translationInView:self];
    NSLog(@"%@", [NSString stringWithFormat:@"Pan: %.1f %.1f", translate.x, translate.y]);
    
    if ([(UIPinchGestureRecognizer *)sender state] == UIGestureRecognizerStateEnded) {
        m_applicationEngine->OnPanEnd(translate.x, -translate.y);
    }
    else {
        m_applicationEngine->OnPanMove(translate.x, -translate.y);
    }
}

@end

namespace FacetedES2 { IRenderingEngine* CreateRenderingEngine() { return 0; } }
namespace SolidGL2 { IRenderingEngine* CreateRenderingEngine() { return 0; } }
namespace TexturedGL2 { IRenderingEngine* CreateRenderingEngine() { return 0; } }

