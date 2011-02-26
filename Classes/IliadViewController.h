//
//  LeavesViewController.h
//  Leaves
//
//  Created by Tom Brow on 4/18/10.
//  Copyright Tom Brow 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeavesView.h"
#import "BookmarkView.h"
#import "IliadAppDelegate.h"
#import "CXMLDocument.h"
#import "NYOBetterZoomUIScrollView.h"



#pragma mark UIScrollViewDelegate


@interface IliadViewController : UIViewController <LeavesViewDataSource, LeavesViewDelegate, UIPopoverControllerDelegate, UIWebViewDelegate, UIScrollViewDelegate> {
	
	IliadAppDelegate *mainDelegate;

	LeavesView *leavesView;
	LeavesCache *leavesCache;
	CXMLDocument *xmlDocument;
	
	// Used by the LeavesView stuff, contains 7 views but the first one is always disrigarded so 1+2 are the previous page, 3+4 are the
	// current and 5+6 are the next page.
	NSMutableArray *viewsForAnimation;
	
	// These UIViews are initially loaded into the viewsForAnimation array, they contain images (locally saved) for the first page turn so
	// it dosent have to parse and render those pages on load.
	UIView *page1;
	UIView *page2;
	UIView *page3;
	UIView *page4;
	UIView *page5;
	UIView *page6;
	UIView *page7;
	
	// Timer used to fade up the 3D gradient image, once the 3D has loaded it sends a message back
	// to set the 3D views alpha to .99 (not 1.0 so there can be alpha but that only works in the simulator).
	NSTimer *show3D;

	// There are three pages that cycle so this value starts always at 2 and then changes between 1, 2, or 3
	int viewOn;
	
	
	// These are the 6 views that make up the 3 sets of pages, they are created once and then rotated around to accomodate
	// for the nessecary rendering of pages that are not currently visible
	UIView *leftPage1;
	UIView *rightPage1;	
	UIView *leftPage2;
	UIView *rightPage2;	
	UIView *leftPage3;
	UIView *rightPage3;
	
	// These webviews contain the text of the Iliad and are deficult to deal with because of the load time required to load the html 
	// strings containing the text. You cant use just a textview because the text would all have to be the same.
	UIWebView *webViewRP1;
	UIWebView *webViewRP2;
	UIWebView *webViewRP3;

	UIButton *searchButtonRP1;
	UIButton *searchButtonRP2;
	UIButton *searchButtonRP3;
	
	
	// These also are created only once the uiimages that go in them are switched out
	UIImageView *imagevLP1;
	UIImageView *imagevLP2;
	UIImageView *imagevLP3;

	// These are set by parsing the html strings get loaded into the webviews
	NSString *previousTextRP1;
	NSString *previousTextRP2;
	NSString *previousTextRP3;
	NSString *uniqueTextRP1;
	NSString *uniqueTextRP2;
	NSString *uniqueTextRP3;
	NSString *htmlRP1;
	NSString *htmlRP2;
	NSString *htmlRP3;

	
	UIImageView *imagevP2;
	UITextView *txtViewP3;
	UITextView *overlayTxtViewP3;
	UIImageView *imagevP4;
	UITextView *txtViewP5;
	UITextView *overlayTxtViewP5;
	UIImageView *imagevP6;
	UITextView *txtViewP7;
	UITextView *overlayTxtViewP7;
	
	
	
	UIPopoverController *searchPop;
	UIPopoverController *bookmarksPop;
	UIPopoverController *chaptersPop;

	
	UIButton *bookmarksButtonRP1;
	UIButton *bookmarksButtonRP2;
	UIButton *bookmarksButtonRP3;
	
	UIButton *chaptersButtonRP1;
	UIButton *chaptersButtonRP2;
	UIButton *chaptersButtonRP3;

	UIButton *ribbonButtonRP1;
	UIButton *ribbonButtonRP2;
	UIButton *ribbonButtonRP3;

	//page numbers at bottom
	UILabel *lblPageRP1;
	UILabel *lblPageRP2;
	UILabel *lblPageRP3;

	//book numbers at top
	UILabel *lblBookRP1;
	UILabel *lblBookRP2;
	UILabel *lblBookRP3;

	////parse variables needed to go through the xmls
	NSXMLParser * rssParser;
	NSMutableArray * stories;
	
	NSMutableDictionary * item;
	
	NSMutableString * previousText, * uniqueText;
	NSMutableString * previousLeftText, * uniqueLeftText;
	NSMutableString * previousRightText, * uniqueRightText;
	
	//Previous Info
	NSMutableString * prevBook;
	NSMutableString * prevFolio;
	NSString * prevStartLine;
	int  prevStopLine;
	NSString * prev2StartLine; 
	NSString * prevStopBook;
	NSString * prevPrevStartLine;
	NSString * prevPrevBook;
	
	//Unique Info
	NSMutableString * folio;
	//char * folioC;
	NSMutableString * book;
	NSString * startLine; 
	int  stopLine;
	NSString * stopBook;
	NSString * folio2;
	
	//Next Info
	NSMutableString * nextBook;
	NSMutableString * nextFolio;
	NSString * nextStartLine;
	int  nextStopLine;
	NSString * nextStopBook;
	NSString * nextPrevStartLine;
	NSString * nextPrevBook;
	int  next2StopLine;
	
	NSMutableString * currentBook, * currentLine, * currentText;
	NSMutableArray *blogEntries;
	NSString * currentElement;
	NSMutableString *folioImageName;
	NSMutableString  *previousFolioImageName; 
	NSMutableString  *nextFolioImageName; 

	NSString *searchWord;
	
	int bookTemp;
	int startLineTemp;
	int stopBookTemp;
	int prevStartLineTemp;
	int prevBookTemp ;
	
	int bookLeftTemp;
	int startLineLeftTemp;
	int stopBookLeftTemp;
	int prevStartLineLeftTemp;
	int prevBookLeftTemp;
	
	int bookRightTemp;
	int startLineRightTemp;
	int stopBookRightTemp;
	int prevStartLineRightTemp;
	int prevBookRightTemp;
	
	UIImage *folioImage;
	UIImage *leftFolioImage;
	UIImage *rightFolioImage;
	
	int currentParse;
	int rowSelected;
	int stopLineBook;
	
	BOOL statsFound;	
	//BOOL theLeftPage;	
	int parseDirection;	// 1 - same, 2 - going left, 3 going right

	
	
	NSString * currentFolioName;
	
	//Timer used to wait until webviews are loaded to allow turning of the pages
	NSTimer * webWait;
	
	
	BOOL allowedToTurnPage;	

	BOOL turningToTheRight;
	
	int lastTurnDirection;
	
	id pageData;
	
	NSTimer * animationWait;
	
	int cntr;

	UIActivityIndicatorView * activityIndicatorRP1;
	UIActivityIndicatorView * activityIndicatorRP2;
	UIActivityIndicatorView * activityIndicatorRP3;
	
	BOOL isGoingRight;
	BOOL threeDOn;

	UIView * enlargeView;
	
	int webScrollValueRP1;
	int webScrollValueRP2;
	int webScrollValueRP3;
	
	BOOL didJustTurnLeft;
	
	
	NSUserDefaults *prefs;
	
	UIImageView * threeDBackground;
	
	double totalDownloaded, totalSize;
	
	
	UIImageView * statusBar1;
	UIImageView * statusBar2;
	UIImageView * statusBar3;

	UIImage * imageLP1;
	UIImage * imageLP2;
	UIImage * imageLP3;
	
	
	NSMutableData *objData,*jpgData;
	NSURLConnection *objConnection;
	NSURLConnection *jpgConnection;
	BOOL hasData;
	BOOL jpgFinished, objFinished;
	
	UIImage* uiImage;
	//UIImageView* largeImage;
	UIButton * btn;
	//UIScrollView *scrollView;	
	
	
	
	NYOBetterZoomUIScrollView *_imageScrollView;


}


@property (nonatomic, retain) NYOBetterZoomUIScrollView *imageScrollView;



@property (nonatomic, retain) NSString *htmlRP1;
@property (nonatomic, retain) NSString *htmlRP2;
@property (nonatomic, retain) NSString *htmlRP3;


@property (nonatomic, retain) NSMutableArray *viewsForAnimation;


@property (nonatomic, retain) UIScrollView *scrollView;



-(void) addViewsBack;
-(void) removeViews;

- (void) dataManage;
- (void) saveStuff;

- (NSString *) getFolioName;


@end

