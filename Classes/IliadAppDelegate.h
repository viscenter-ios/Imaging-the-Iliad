//
//  IliadAppDelegate.h
//  Iliad
//
//  Created by Vis Center on 7/13/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IliadAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIViewController *viewController;
	
	NSMutableArray * bookmarksArray;
	NSMutableArray * bookmarksNotesArray;
	
	NSMutableArray * bookmarksArrayOneSaved;


	NSUserDefaults *prefs;

	//IliadViewController * iVC;

	
	int indexClicked;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) NSMutableArray *bookmarksArray;
@property (nonatomic, retain) NSMutableArray *bookmarksNotesArray;

@property (nonatomic, retain) NSMutableArray *bookmarksArrayOneSaved;

@property (nonatomic) int indexClicked;

@end

