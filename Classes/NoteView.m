//
//  NoteView.m
//
//  Created by Zach Whelchel on 7/30/10.
//  Copyright 2010 Asbury College. All rights reserved.
//

#import "NoteView.h"
#import "IliadAppDelegate.h"

@implementation NoteView



-(void) viewDidLoad {
	
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];
	
	
	emailbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(email)];      
	//self.tableView.editingAccessoryType = UITableViewCellAccessoryCheckmark;
	self.navigationItem.rightBarButtonItem = emailbutton;
	
	/*
	 NSString * addRibbon = @"add";
	 
	 [[NSNotificationCenter defaultCenter] postNotificationName:@"BookmarkPopChange"
	 object:nil
	 userInfo:nil];
	 */
	
	
	self.contentSizeForViewInPopover = CGSizeMake(400, 240);
	self.title = @"Note";
	
	//txtView.delegate = self;
	
	//[txtView resignFirstResponder]; 
	
	txtView.text = [mainDelegate.bookmarksNotesArray objectAtIndex:mainDelegate.indexClicked];
	
	
		if ([[mainDelegate.bookmarksNotesArray objectAtIndex:mainDelegate.indexClicked] length] > 0) {
			emailbutton.enabled = YES;
		}
		else {
			emailbutton.enabled = NO;
		}
}



- (void)textViewDidChange:(UITextView *)textView{
	
	
	if([txtView.text length] > 0) {
		emailbutton.enabled = YES;
	}
	else {
		emailbutton.enabled = NO;
	}
	
}





-(void)viewDidAppear:(BOOL)animated {
	
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	if ([[mainDelegate.bookmarksNotesArray objectAtIndex:mainDelegate.indexClicked] length] > 0) {

	}
	else {
		[txtView becomeFirstResponder];
	}
	
}

-(void)viewWillDisappear:(BOOL)animated {
	
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];
	
	
	
	[mainDelegate.bookmarksNotesArray replaceObjectAtIndex:mainDelegate.indexClicked withObject:txtView.text];
	
	[super viewWillDisappear:animated];
	
}





- (void) email {
	[self showEmailModalView];
}


-(void) showEmailModalView {
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	[mainDelegate.bookmarksNotesArray replaceObjectAtIndex:mainDelegate.indexClicked withObject:txtView.text];
	
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

