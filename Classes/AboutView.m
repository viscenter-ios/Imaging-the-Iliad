//
//  NoteView.m
//
//  Created by Zach Whelchel on 7/30/10.
//  Copyright 2010 Asbury College. All rights reserved.
//

#import "AboutView.h"
#import "IliadAppDelegate.h"

@implementation AboutView



-(void) viewDidLoad {
	

	
	[scrollHome addSubview:theView];
	
	scrollHome.contentSize = CGSizeMake(280, 1400);
	
	
	
	self.contentSizeForViewInPopover = CGSizeMake(280, 363);
	self.title = @"About";
	

}



-(void)viewDidAppear:(BOOL)animated {
	

	
}

- (void) email {
	[self showEmailModalView];
}


-(void) showEmailModalView {
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self; // <- very important step if you want feedbacks on what the user did with your email sheet
	[picker setSubject: [NSString stringWithFormat: @"Iliad Note: Folio %@",[mainDelegate.bookmarksArray objectAtIndex:mainDelegate.indexClicked]]];
	
	
	
	// Fill out the email body text
	//NSString *content = @"http://mugunthkumar.com/mygreatapp"; // replace it with yours
	//NSString *pageLink = @"http://mugunthkumar.com/mygreatapp"; // replace it with yours
	//NSString *iTunesLink = @"http://link-to-mygreatapp"; // replate it with yours
	//NSString *emailBody = [NSString stringWithFormat:@"%@\n\n<h3>Sent from <a href = '%@'>MyGreatApp</a> on iPhone. <a href = '%@'>Download</a> yours from AppStore now!</h3>", content, pageLink, iTunesLink];
	
	
	NSString *emailBody = [NSString stringWithFormat:@"%@",  [mainDelegate.bookmarksNotesArray objectAtIndex:mainDelegate.indexClicked]];
	[picker setMessageBody:emailBody isHTML:YES]; // depends. Mostly YES, unless you want to send it as plain text (boring)
	picker.navigationBar.barStyle = UIBarStyleDefault; // choose your style, unfortunately, Translucent colors behave quirky.
	[self presentModalViewController:picker animated:YES];
	[picker release];
	
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	[self dismissModalViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
		return NO;
	
	else
		return YES;
}


@end

