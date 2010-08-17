//
//  InfoView.h
//  Iliad
//
//  Created by Zach Whelchel on 5/21/10.
//  Copyright 2010 Asbury College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IliadViewController.h"


@interface InfoView : UIViewController <UISearchBarDelegate> {

	IliadViewController * iliadViewController;
	
	IBOutlet UITableView *tableView;	
	IBOutlet UISearchBar *searchBar;	
	
	NSXMLParser * rssParser;
	NSMutableArray * stories;
	
	NSMutableDictionary * item;
	
	NSString * previousText, * uniqueText;
	NSString * previousLeftText, * uniqueLeftText;
	NSString * previousRightText, * uniqueRightText;
	
	//Previous Info
	NSString * prevBook;
	NSString * prevFolio;
	NSString * prevStartLine;
	NSString * prevStopLine;
	NSString * prev2StartLine; 
	NSString * prevStopBook;
	NSString * prevPrevStartLine;
	NSString * prevPrevBook;
		
	//Unique Info
	NSString * folio;
	NSString * book;
	NSString * startLine; 
	NSString * stopLine;
	NSString * stopBook;
	NSString * folio2;
	
	//Next Info
	NSString * nextBook;
	NSString * nextFolio;
	NSString * nextStartLine;
	NSString * nextStopLine;
	NSString * nextStopBook;
	NSString * nextPrevStartLine;
	NSString * nextPrevBook;
	NSString *next2StopLine;
	
	NSMutableString * currentBook, * currentLine, * currentText;
	NSMutableArray *blogEntries;
	NSString * currentElement;
	NSString *folioImageName;
	NSString *previousFolioImageName;
	NSString *nextFolioImageName;

	
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
	BOOL leftPage;
	
	char firstCharacter;
	char lastCharacter;
	char prevLastCharacter;
	
	int searchProgression; // 1 pre type, 2 searching, 3 done parsing
	
	IBOutlet UIBarItem * searchGoogle;
	IBOutlet UIBarItem * searchWikipedia;

}

-(IBAction) searchGoogleClicked;
-(IBAction) searchWikipediaClicked;

@end
