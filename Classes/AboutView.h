//
//  NoteView.h
//
//  Created by Zach Whelchel on 7/30/10.
//  Copyright 2010 Asbury College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface AboutView: UIViewController <MFMailComposeViewControllerDelegate>{
	UIButton * emailbutton;
	
	IBOutlet UIScrollView *scrollHome;	
	IBOutlet UIView *theView;	
}

@end
