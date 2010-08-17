//
//  NoteView.h
//
//  Created by Zach Whelchel on 7/30/10.
//  Copyright 2010 Asbury College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface NoteView: UIViewController <UITextViewDelegate, MFMailComposeViewControllerDelegate>{
	IBOutlet UITextView * txtView;
	UIButton * emailbutton;
}

@end
