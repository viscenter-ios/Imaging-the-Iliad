//
//  StateTableCellView.m
//  States
//
//  Created by Julio Barros on 1/26/09.
//  Copyright 2009 E-String Technologies, Inc.. All rights reserved.
//

#import "CustomCell.h"
#import "InfoView.h"
#import "IliadViewController.h"

@implementation CustomCell

@synthesize pageLabel, textWeb, textView, ImageView, boxImage;
@synthesize htmls;
@synthesize textTemp;
@synthesize hls;

- (void) viewDidLoad {
	NSLog(@"viewdidload CustomCell");
}
/*
 - (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
 if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
 // Initialization code
 }
 return self;
 }
 */

-(void)loadweb{
	//textWeb.delegate = self;
	//NSLog(@"loadweb");
	//textTemp.font = [UIFont fontWithName:@"Cochin" size:16.0];
	//textWeb.userInteractionEnabled = NO;
	//NSString *path = [[NSBundle mainBundle] bundlePath];
	//NSURL *baseURL = [NSURL fileURLWithPath:path];
	//[textWeb loadHTMLString:htmls baseURL:baseURL];
	//textWeb.hidden = YES;
	
	
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
	NSLog(@"webView didstart");
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
	//[self highlightText];
	//textTemp.hidden = YES;
	//textWeb.hidden = NO;
	NSLog(@"webView didfinish");
	
}


/*
 
 -(void)addobserv{
 
 NSLog(@"add observ customcell");
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(newString:)
 name:@"NewString" object:nil];
 
 }
 
 
 
 
 - (NSInteger) highlightAllOccurencesOfString:(NSString*)str {
 
 NSString *pathJS = [[NSBundle mainBundle] pathForResource:@"searchWebView" ofType:@"js"];
 NSString *jsCode = [NSString stringWithContentsOfFile:pathJS encoding:NSUTF8StringEncoding error:nil];
 [textWeb stringByEvaluatingJavaScriptFromString:jsCode];
 NSString *startSearch = [NSString stringWithFormat:@"MyApp_HighlightAllOccurencesOfString('%@')",str];
 [textWeb stringByEvaluatingJavaScriptFromString:startSearch];
 NSString *result = [textWeb stringByEvaluatingJavaScriptFromString:@"MyApp_SearchResultCount"];
 NSLog(@"result:%@", result);
 return [result integerValue];
 
 }
 
 - (void)removeAllHighlights {
 [textWeb stringByEvaluatingJavaScriptFromString:@"MyApp_RemoveAllHighlights()"];
 }
 
 
 - (void)highlightText{
 NSLog(hls);
 [self highlightAllOccurencesOfString:[NSString stringWithFormat:@"%@", hls ]];
 
 }
 
 - (void) newString: (NSNotification *)notification {
 NSLog(@"newStuff got called");
 currentText = [notification object];
 
 //NSLog([NSString stringWithFormat: @"READ THIS:  %@",currentText]);
 
 
 }
 
 */

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}


- (void)dealloc {
	[pageLabel release];
	[textWeb release];
	
    [super dealloc];
}


@end
