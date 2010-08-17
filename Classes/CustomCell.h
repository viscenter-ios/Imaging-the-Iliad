//
//  StateTableCellView.h
//  States
//
//  Created by Julio Barros on 1/26/09.
//  Copyright 2009 E-String Technologies, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoView.h"

@interface CustomCell : UITableViewCell <UIWebViewDelegate> {
	InfoView * infoView;
	IBOutlet UILabel *pageLabel;
	NSString *htmls;
	NSString *hls;
	IBOutlet UIWebView *textWeb;
	IBOutlet UITextView *textTemp;
	NSMutableString * currentText;
	
	//NEW STUFF
	IBOutlet UITextView *textView;
	IBOutlet UIImageView * ImageView; 
	IBOutlet UIImage *boxImage;
}

-(void)loadweb;
-(void)addobserv;

@property (nonatomic,retain) IBOutlet UILabel *pageLabel;
@property (nonatomic,retain) IBOutlet UIWebView *textWeb;
@property (nonatomic,retain) IBOutlet UITextView *textTemp;
@property (nonatomic,retain) NSString *htmls;
@property (nonatomic,retain) NSString *hls;

@property (nonatomic,retain) IBOutlet UITextView *textView;
@property (nonatomic,retain) IBOutlet UIImageView *ImageView;
@property (nonatomic,retain) IBOutlet UIImage *boxImage;
@end
