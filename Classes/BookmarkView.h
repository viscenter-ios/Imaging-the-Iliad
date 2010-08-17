//
//  BookmarkView.h
//  Iliad
//
//  Created by Vis Center on 7/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IliadViewController.h"


@interface BookmarkView : UITableViewController {	
	
	NSString * currentInfo;
	
	UIBarButtonItem *editbutton;
	UIBarButtonItem *addbutton;
	
	NSString * info;
	
	////parse
	
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
	NSString * prevStopLine;
	NSString * prev2StartLine; 
	NSString * prevStopBook;
	NSString * prevPrevStartLine;
	NSString * prevPrevBook;
	
	//Unique Info
	NSMutableString * folio;
	//char * folioC;
	NSMutableString * book;
	NSString * startLine; 
	NSString * stopLine;
	NSString * stopBook;
	NSString * folio2;
	
	//Next Info
	NSMutableString * nextBook;
	NSMutableString * nextFolio;
	NSString * nextStartLine;
	NSString * nextStopLine;
	NSString * nextStopBook;
	NSString * nextPrevStartLine;
	NSString * nextPrevBook;
	NSString * next2StopLine;
	
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
	
	NSTimer * webWait;
	
	
	BOOL allowedToTurnPage;	
	
	BOOL turningToTheRight;
	
	int lastTurnDirection;
}

-(void)edit;
-(void)add;
-(int) getPageNumber:(NSString *)folioString;



@end
