//
//  InfoView.m
//  Iliad
//
//  Created by Zach Whelchel on 5/21/10.
//  Copyright 2010 Asbury College. All rights reserved.
//

#import "InfoView.h"
#import "TouchXML.h"
#import "CustomCell.h"

@implementation InfoView


- (void) viewDidLoad {
	searchProgression = 1;
	[tableView reloadData];
	self.contentSizeForViewInPopover = CGSizeMake(280, 400);
	[searchBar setDelegate:self];
	[searchBar becomeFirstResponder];
	//[searchBar resignFirstResponder];
	
	
	searchGoogle.enabled = NO;
	searchWikipedia.enabled = NO;

	
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {	
	
	[super viewDidAppear:animated];
}


- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {

	if([searchText length] > 0) {
		searchGoogle.enabled = YES;
		searchWikipedia.enabled = YES;

	}
	else {
		searchGoogle.enabled = NO;
		searchWikipedia.enabled = NO;

	}

}



-(IBAction) searchGoogleClicked {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.google.com/#hl=en&safe=active&q=%@&aq=f&aqi=g10&aql=&oq=&gs_rfai=&fp=d8daa30b5519f2bc", searchBar.text]]];
}

-(IBAction) searchWikipediaClicked {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://en.wikipedia.org/wiki/Special:Search?search=%@&go=Go", searchBar.text]]];
}




- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {

	currentParse = 0;

	searchProgression = 2;
	[tableView reloadData];
	
	[self performSelector:@selector(parseStart) withObject:nil afterDelay:0.01];

	//[self parseStart];
}



- (void) parseStart {
	[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
}



//----------StartFileParsing()-----------------------------------------------------------------------------------

-(void)startfileparsing{
    

	
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    NSString *path;
	
	//Start searching the currentText, currentBook and CurrentLine of the word we are looking for		
	if (currentParse == 0)
    {
		path = [[NSBundle mainBundle] pathForResource:@"Iliad" ofType:@"xml"];
		NSString *xmlPath=[[NSString alloc] initWithString:path];
		//NSLog(@"CurrentParse=%d->XMLPath passed : %@",currentParse,xmlPath);
		[self parseXMLFileAtURL:xmlPath];
    }
	
	
	//We alredy have the information to get the Prev, Unique and Next Information 
	else if (currentParse == 1) {
		path = [[NSBundle mainBundle] pathForResource:@"VAFolioIndex" ofType:@"xml"];
        NSString *xmlPath=[[NSString alloc] initWithString:path];
        NSURL *xmlURL = [NSURL fileURLWithPath:xmlPath];
		CXMLDocument *xmlDocument = [[[CXMLDocument alloc] initWithContentsOfURL:xmlURL options:0 error:nil] autorelease];
		
		// Conditions for lines in the same Book:
		// Get the first line element that precedes the book+line we are looking for
		NSString *folioPrev2XPath = [NSString stringWithFormat:@"/root/line[book=%d and start <= %d]/preceding-sibling::line[2]",
									 [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
									 [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
									 ];
		
		NSString *folioPrevXPath = [NSString stringWithFormat:@"/root/line[book=%d and start <= %d]/preceding-sibling::line[1]",
									[[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
									[[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
									];
		
		// Get the last line element that contains this book+line
        NSString *folioXPath = [NSString stringWithFormat:@"/root/line[book=%d and start <= %d]",
                                [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
                                [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
                                ];
		
		// Get the first line element that follows the book+line we are looking for
		NSString *folioNextXPath = [NSString stringWithFormat:@"/root/line[book=%d and start <= %d]/following-sibling::line[1]",
									[[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
									[[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
									];
		
		// Get the second line element that follows the book+line we are looking for (just to have the stopLine of the NextText)
		NSString *folioNext2XPath = [NSString stringWithFormat:@"/root/line[book=%d and start <= %d]/following-sibling::line[2]",
									 [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
									 [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
									 ];
		
		NSString *folioNext3XPath = [NSString stringWithFormat:@"/root/line[book=%d and start <= %d]/following-sibling::line[3]",
									 [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
									 [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
									 ];
		
        //We get the nodes but we only need the lastObject (only one Node)
		CXMLElement * CurrentFolio = [[xmlDocument nodesForXPath:folioXPath error:nil] lastObject];
		CXMLElement * NextFolio = [[xmlDocument nodesForXPath:folioNextXPath error:nil] lastObject];
		CXMLElement * PrevFolio = [[xmlDocument nodesForXPath:folioPrevXPath error:nil] lastObject];
		CXMLElement * Prev2Folio = [[xmlDocument nodesForXPath:folioPrev2XPath error:nil] lastObject];
		CXMLElement * Next2Folio = [[xmlDocument nodesForXPath:folioNext2XPath error:nil] lastObject];
		CXMLElement * Next3Folio = [[xmlDocument nodesForXPath:folioNext3XPath error:nil] lastObject];
		
		
		
		// Condition for lines between Books: 
		//If we didn't find anything, we need to look again with an alternate method (finds e.g. book 2, line 1)
        if (CurrentFolio == nil) {
            NSLog(@"Trying alternate XPath");
            // Look for the first element past the one we want,
            // then select its first preceding sibling
			
			// Get the first line element that precedes the book+line we are looking for
			
			
			folioPrev2XPath = [NSString stringWithFormat:@"/root/line[book=%d and start > %d][1]/preceding-sibling::line[3]",
							   [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
							   [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
							   ];
			
			
			folioPrevXPath = [NSString stringWithFormat:@"/root/line[book=%d and start > %d][1]/preceding-sibling::line[2]",
							  [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
							  [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
							  ];
			
			// Get the first line element that precedes the book+line we are looking for
			folioXPath = [NSString stringWithFormat:@"/root/line[book=%d and start > %d][1]/preceding-sibling::line[1]",
                          [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
                          [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
                          ];
			
            // Get the first line element that follows the book+line we are looking for
			folioNextXPath = [NSString stringWithFormat:@"/root/line[book=%d and start > %d][1]",
							  [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
							  [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
							  ];
			
			// Get the second line element that follows the book+line we are looking for
			folioNext2XPath = [NSString stringWithFormat:@"/root/line[book=%d and start > %d][2]",
							   [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
							   [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
							   ];
			
			folioNext3XPath = [NSString stringWithFormat:@"/root/line[book=%d and start > %d][3]",
							   [[[stories objectAtIndex:rowSelected] objectForKey: @"div1"] intValue],
							   [[[stories objectAtIndex:rowSelected] objectForKey: @"milestone"] intValue]
							   ];
			
			
			//We get the nodes but we only need the lastObject (only one Node)
            CurrentFolio = [[xmlDocument nodesForXPath:folioXPath error:nil] lastObject];
			PrevFolio = [[xmlDocument nodesForXPath:folioPrevXPath error:nil] lastObject];
			Prev2Folio = [[xmlDocument nodesForXPath:folioPrev2XPath error:nil] lastObject];
			NextFolio = [[xmlDocument nodesForXPath:folioNextXPath error:nil] lastObject];
			Next2Folio = [[xmlDocument nodesForXPath:folioNext2XPath error:nil] lastObject];
			Next3Folio = [[xmlDocument nodesForXPath:folioNext3XPath error:nil] lastObject];
			
		}
		
		
		// Unique Information
		folio = [[[CurrentFolio elementsForName:@"folio"] lastObject] stringValue];
		book= [[[CurrentFolio elementsForName:@"book"] lastObject] stringValue];
		stopBook=[[[NextFolio elementsForName:@"book"] lastObject] stringValue];
		startLine= [[[CurrentFolio elementsForName:@"start"] lastObject] stringValue];
		stopLine= [[[NextFolio elementsForName:@"start"] lastObject] stringValue];
		stopLine=[stopLine intValue]-1;
		folio = [folio stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSLog([NSString stringWithFormat:@"FoLiO IMAGE: %@", folio]);
		folioImageName = [NSString stringWithFormat:@"%@", folio];
		//NSLog(@"FolioNAme:%@",folioImageName);
		
		
		//Prev Information
		prevFolio = [[[PrevFolio elementsForName:@"folio"] lastObject] stringValue];
		prevBook = [[[PrevFolio elementsForName:@"book"] lastObject] stringValue];
		prevStartLine= [[[PrevFolio elementsForName:@"start"] lastObject] stringValue];
		prevStopLine= [[[CurrentFolio elementsForName:@"start"] lastObject] stringValue];
		prevStopLine=[prevStopLine intValue]-1;
		prevStopBook= [[[CurrentFolio elementsForName:@"book"] lastObject] stringValue];
		prevPrevStartLine= [[[Prev2Folio elementsForName:@"start"] lastObject] stringValue];
		prevPrevBook= [[[Prev2Folio elementsForName:@"book"] lastObject] stringValue];
		
		previousFolioImageName = [NSString stringWithFormat:@"%@", prevFolio];

		
		//Next Information
		nextFolio = [[[NextFolio elementsForName:@"folio"] lastObject] stringValue];
		nextBook = [[[NextFolio elementsForName:@"book"] lastObject] stringValue];
		nextStartLine= [[[NextFolio elementsForName:@"start"] lastObject] stringValue];
		nextStopLine= [[[Next2Folio elementsForName:@"start"] lastObject] stringValue];
		nextStopLine=[nextStopLine intValue]-1;
		nextStopBook= [[[Next2Folio elementsForName:@"book"] lastObject] stringValue];
		nextPrevStartLine= [[[CurrentFolio elementsForName:@"start"] lastObject] stringValue];
		nextPrevBook= [[[PrevFolio elementsForName:@"book"] lastObject] stringValue];
		next2StopLine=[[[Next3Folio elementsForName:@"start"] lastObject] stringValue];
		next2StopLine=[next2StopLine intValue]-1;
		
		nextFolioImageName = [NSString stringWithFormat:@"%@", nextFolio];

		//------------------->----------------
		
		
		//Unique INT Information
		bookTemp=      [book intValue];
		startLineTemp= [startLine intValue];
		stopBookTemp=  [stopBook intValue];
		prevStartLineTemp= [prevStartLine intValue];
		prevBookTemp = [prevBook intValue];
		
		//Left INT Information
		bookLeftTemp=      [prevBook intValue];
		startLineLeftTemp= [prevStartLine intValue];
		stopBookLeftTemp=  [prevStopBook intValue];
		prevStartLineLeftTemp= [prevPrevStartLine intValue];
		prevBookLeftTemp = [prevPrevBook intValue];
		
		//Right INT Information
		bookRightTemp=      [nextBook intValue];
		startLineRightTemp= [nextStartLine intValue];
		stopBookRightTemp=  [nextStopBook intValue];
		prevStartLineRightTemp= [nextPrevStartLine intValue];
		prevBookRightTemp = [nextPrevBook intValue];
		
		//Setting the object for the IMAGES
		//NSLog([NSString stringWithFormat:@"%@", prevFolio]);
		leftFolioImage= [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:prevFolio ofType:@"jpg"]];
		rightFolioImage= [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:nextFolio ofType:@"jpg"]];
		folioImage= [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:folio ofType:@"jpg"]];
		
		//NSLog(@"PREV: book:%d, startLine:%d, stopBook:%d, prevStartLine:%d,prevBook:%d",bookLeftTemp,startLineLeftTemp,stopBookLeftTemp,prevStartLineLeftTemp,prevBookLeftTemp);
		//NSLog(@"NEXT: book:%d, startLine:%d, stopBook:%d, prevStartLine:%d, prevBook:%d, next2StopLine:%d, nextStopLine:%d",bookRightTemp,startLineRightTemp,stopBookRightTemp,prevStartLineRightTemp,prevBookRightTemp, next2StopLine, nextStopLine);
		
		//NSLog(@"PrevFolio:%@, PrevBook:%@, PrevStart:%@, PrevStop:%d",prevFolio,prevBook,prevStartLine,prevStopLine);
		//NSLog(@"UniqueFolio:%@, UniqueBook:%@, UniqueStart:%@, UniqueStop:%d, StopBook:%@", folio, book, startLine, stopLine, stopBook);
		//NSLog(@"prevStartLine:%d, prevBook:%d", prevStartLineTemp, prevBookTemp);
		//NSLog(@"NextFolio:%@, NextBook:%@, NextStart:%@, NextStop:%d",nextFolio,nextBook,nextStartLine,nextStopLine);
		
		//NSLog(@"CurrentParse=%d->XMLPath passed : %@",currentParse,xmlPath);
		[self parseXMLFileAtURL:xmlPath];
		//[xmlDocument release];
		
	}
	
	
	//FIND TEXT
	else if (currentParse == 2) {
		
		path = [[NSBundle mainBundle] pathForResource:@"Iliad" ofType:@"xml"];
        NSString *xmlPath=[[NSString alloc] initWithString:path];
        NSURL *xmlURL = [NSURL fileURLWithPath:xmlPath];
		CXMLDocument *xmlDocument = [[[CXMLDocument alloc] initWithContentsOfURL:xmlURL options:0 error:nil] autorelease];
		
		//----------------------Getting Current UniqueText:-----------------------			
		NSLog(@"Finding Unique TEXT!");
		//Condition for lines that are in the same book
		if (stopBookTemp==bookTemp) {
			NSLog(@"Books are the same!");
			NSString *uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d and milestone<=%d]/txt", bookTemp, startLineTemp, stopLine];
			
			//If we are in the end of the Iliad, it doesnt know what is gonna be the nextStopLine so it will be equal to the UniqueStopLine! 
			if(stopLine==nextStopLine){
				uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d]/txt", bookTemp, startLineTemp];
			}
			
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the same book (in each iteration)
						//NSLog(@"NODE:%@", nodeValue);
						uniqueText= [NSString stringWithFormat:@"%@ %@", uniqueText ,nodeValue];
					}
				}	
			}
			else if([nodes count]==0){
				uniqueText=@"";
			}
			
		}
		//Condition for lines that arent in the same book 
		else if (stopBookTemp!=bookTemp) {
			NSLog(@"Books are NOT the same!");
			NSString * uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone >= %d]/txt", bookTemp, startLineTemp];
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the ACTUAL book (in each iteration)
						uniqueText= [NSString stringWithFormat:@"%@ %@", uniqueText ,nodeValue];
					}
				}
				NSString * uniqueXPath2 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone <= %d]/txt", stopBookTemp, stopLine];
				NSArray *nodes2 = [[xmlDocument rootElement] nodesForXPath:uniqueXPath2 error:nil];
				
				for (CXMLNode *pNode2 in nodes2)
				{
					for (CXMLNode *childNode2 in [pNode2 children])
					{
						NSString *nodeValue2 = [childNode2 stringValue]; // should contain 'Uniquetext' of the NEXT book (in each iteration)
						uniqueText= [NSString stringWithFormat:@"%@ %@", uniqueText ,nodeValue2];			
					}
				}
				
			}
			else if([nodes count]==0){
				uniqueText=@"";
			}
			
		}
		
		
		//----------------------Getting LEFT UniqueText:-----------------------			
		NSLog(@"Finding Unique TEXT!");
		//Condition for lines that are in the same book
		if (stopBookLeftTemp==bookLeftTemp) {
			NSLog(@"Books are the same!");
			NSString *uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d and milestone<=%d]/txt", bookLeftTemp, startLineLeftTemp, prevStopLine];
			
			//If we are in the end of the Iliad, it doesnt know what is gonna be the nextStopLine so it will be equal to the UniqueStopLine! 
			if(prevStopLine==stopLine){
				uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d]/txt", bookLeftTemp, startLineLeftTemp];
			}
			
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the same book (in each iteration)
						//NSLog(@"NODE:%@", nodeValue);
						uniqueLeftText= [NSString stringWithFormat:@"%@ %@", uniqueLeftText ,nodeValue];
					}
				}	
			}
			else if([nodes count]==0){
				uniqueLeftText=@"";
			}
			
		}
		//Condition for lines that arent in the same book 
		else if (stopBookLeftTemp!=bookLeftTemp) {
			NSLog(@"Books are NOT the same!");
			NSString * uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone >= %d]/txt", bookLeftTemp, startLineLeftTemp];
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the ACTUAL book (in each iteration)
						uniqueLeftText= [NSString stringWithFormat:@"%@ %@", uniqueLeftText ,nodeValue];
					}
				}
				NSString * uniqueXPath2 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone <= %d]/txt", stopBookLeftTemp, prevStopLine];
				NSArray *nodes2 = [[xmlDocument rootElement] nodesForXPath:uniqueXPath2 error:nil];
				
				for (CXMLNode *pNode2 in nodes2)
				{
					for (CXMLNode *childNode2 in [pNode2 children])
					{
						NSString *nodeValue2 = [childNode2 stringValue]; // should contain 'Uniquetext' of the NEXT book (in each iteration)
						uniqueLeftText= [NSString stringWithFormat:@"%@ %@", uniqueLeftText ,nodeValue2];			
					}
				}
				
			}
			else if([nodes count]==0){
				uniqueLeftText=@"";
			}
			
		}
		
		NSLog(@"UniqueLeftText:%@", uniqueLeftText);
		
		//----------------------Getting Right UniqueText:-----------------------
		
		NSLog(@"Finding Unique TEXT!");
		//Condition for lines that are in the same book
		if (stopBookRightTemp==bookRightTemp) {
			NSLog(@"Books are the same!");
			NSString *uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d and milestone<=%d]/txt", bookRightTemp, startLineRightTemp, nextStopLine];
			
			//If we are in the end of the Iliad, it doesnt know what is gonna be the nextStopLine so it will be equal to the UniqueStopLine! 
			if(nextStopLine==next2StopLine){
				uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d]/txt", bookRightTemp, startLineRightTemp];
			}
			
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the same book (in each iteration)
						
						uniqueRightText= [NSString stringWithFormat:@"%@ %@", uniqueRightText ,nodeValue];
					}
				}	
			}
			else if([nodes count]==0){
				uniqueRightText=@"";
			}
			
		}
		//Condition for lines that arent in the same book 
		else if (stopBookRightTemp!=bookRightTemp) {
			NSLog(@"Books are NOT the same!");
			NSString * uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone >= %d]/txt", bookRightTemp, startLineRightTemp];
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the ACTUAL book (in each iteration)
						uniqueRightText= [NSString stringWithFormat:@"%@ %@", uniqueRightText ,nodeValue];
					}
				}
				NSString * uniqueXPath2 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone <= %d]/txt", stopBookRightTemp, nextStopLine];
				NSArray *nodes2 = [[xmlDocument rootElement] nodesForXPath:uniqueXPath2 error:nil];
				
				for (CXMLNode *pNode2 in nodes2)
				{
					for (CXMLNode *childNode2 in [pNode2 children])
					{
						NSString *nodeValue2 = [childNode2 stringValue]; // should contain 'Uniquetext' of the NEXT book (in each iteration)
						uniqueRightText= [NSString stringWithFormat:@"%@ %@", uniqueRightText ,nodeValue2];			
					}
				}
				
			}
			else if([nodes count]==0){
				uniqueRightText=@"";
			}
			
		}
		NSLog(@"UniqueRightText:%@", uniqueRightText);		
		
		//--------------------Getting Current PreviousText:-----------------------
		
		NSLog(@"Finding Prev TEXT!");
		
		if(prevBookTemp==bookTemp){
			
			NSString * uniqueXPathPrev = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone<%d]/milestone", bookTemp, startLineTemp];
			//if(stopBookTemp!=prevBookTemp){
			//uniqueXPathPrev = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>%d]/milestone", bookTemp, prevStartLineTemp];
			//}
			
			NSArray *nodes3 = [[xmlDocument rootElement] nodesForXPath:uniqueXPathPrev error:nil];
			if([nodes3 count]!=0){
				
				for (CXMLNode *itemNode3 in nodes3)
				{
					for (CXMLNode *childNode3 in [itemNode3 children])
					{
						
						NSString *nodeValue3 = [childNode3 stringValue]; // should contain 'numberLines' that are less that startLine and greater than prevStartLine (in each iteration)
						
						//Get the following line of that prevLine to make a comparision in the following instruction (in each iteration)
						NSString * uniqueXPath4 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]/following-sibling::p[1]", bookTemp, nodeValue3];
						CXMLElement * folloLinePath = [[xmlDocument nodesForXPath:uniqueXPath4 error:nil] lastObject];
						NSString *followingLine = [[[folloLinePath elementsForName:@"milestone"] lastObject] stringValue];	  
						
						
						//Comparision: To know if that Line should be the prevLine
						if([nodeValue3 intValue] < startLineTemp && [followingLine intValue] > startLineTemp)
						{
							//If the line is the previous one we get the text
							NSString * uniqueXPath5 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]", bookTemp, nodeValue3];
							CXMLElement * prevTextPath = [[xmlDocument nodesForXPath:uniqueXPath5 error:nil] lastObject];
							NSString *prevText = [[[prevTextPath elementsForName:@"txt"] lastObject] stringValue];	  
							previousText= prevText;
						}
						else {
							previousText=@"";
						}
						
						
					}
					
				}
			}
			else if ([nodes3 count]==0){
				previousText=@"";
				
			}
			
		}
		
		else if(prevBookTemp!=bookTemp){
			
			
			if(startLineTemp!=1){
				
				NSString * uniqueXPathPrev = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone<%d]/milestone", bookTemp, startLineTemp];
				NSArray *nodes3 = [[xmlDocument rootElement] nodesForXPath:uniqueXPathPrev error:nil];
				if([nodes3 count]!=0){
					for (CXMLNode *itemNode3 in nodes3)
					{
						for (CXMLNode *childNode3 in [itemNode3 children])
						{
							
							NSString *nodeValue3 = [childNode3 stringValue]; // should contain 'numberLines' that are less that startLine and greater than prevStartLine (in each iteration)
							
							//Get the following line of that prevLine to make a comparision in the following instruction (in each iteration)
							NSString * uniqueXPath4 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]/following-sibling::p[1]", bookTemp, nodeValue3];
							CXMLElement * folloLinePath = [[xmlDocument nodesForXPath:uniqueXPath4 error:nil] lastObject];
							NSString *followingLine = [[[folloLinePath elementsForName:@"milestone"] lastObject] stringValue];	  
							//Comparision: To know if that Line should be the prevLine
							if([nodeValue3 intValue] < startLineTemp && [followingLine intValue] > startLineTemp)
							{
								//If the line is the previous one we get the text
								NSString * uniqueXPath5 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]", bookTemp, nodeValue3];
								CXMLElement * prevTextPath = [[xmlDocument nodesForXPath:uniqueXPath5 error:nil] lastObject];
								NSString *prevText = [[[prevTextPath elementsForName:@"txt"] lastObject] stringValue];	  
								previousText= prevText;
							}	
							else {
								previousText=@"";
							}
							
						}
					}
				}
				else if( [nodes3 count]==0){
					previousText=@"";
				}
			}
			else if (startLineTemp==1){
				previousText=@"";
			}
		}
		
		//--------------------Getting Previous RightText:-----------------------
		
		NSLog(@"Finding Prev TEXT!");
		
		if(prevBookRightTemp==bookRightTemp){
			
			NSString * uniqueXPathPrev = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone<%d]/milestone", bookRightTemp, startLineRightTemp];
			NSArray *nodes3 = [[xmlDocument rootElement] nodesForXPath:uniqueXPathPrev error:nil];
			if([nodes3 count]!=0){
				
				for (CXMLNode *itemNode3 in nodes3)
				{
					for (CXMLNode *childNode3 in [itemNode3 children])
					{
						NSString *nodeValue3 = [childNode3 stringValue]; // should contain 'numberLines' that are less that startLine and greater than prevStartLine (in each iteration)
						
						//Get the following line of that prevLine to make a comparision in the following instruction (in each iteration)
						NSString * uniqueXPath4 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]/following-sibling::p[1]", bookRightTemp, nodeValue3];
						CXMLElement * folloLinePath = [[xmlDocument nodesForXPath:uniqueXPath4 error:nil] lastObject];
						NSString *followingLine = [[[folloLinePath elementsForName:@"milestone"] lastObject] stringValue];	  
						
						
						//Comparision: To know if that Line should be the prevLine
						if([nodeValue3 intValue] < startLineRightTemp && [followingLine intValue] > startLineRightTemp)
						{
							//If the line is the previous one we get the text
							NSString * uniqueXPath5 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]", bookRightTemp, nodeValue3];
							CXMLElement * prevTextPath = [[xmlDocument nodesForXPath:uniqueXPath5 error:nil] lastObject];
							NSString *prevText = [[[prevTextPath elementsForName:@"txt"] lastObject] stringValue];	  
							previousRightText= prevText;
						}
						else {
							previousRightText=@"";
						}
					}
					
				}
			}
			else if ([nodes3 count]==0){
				previousRightText=@"";
				
			}
		}
		
		else if(prevBookRightTemp!=bookRightTemp){
			
			
			if(startLineRightTemp!=1){
				
				NSString * uniqueXPathPrev = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone<%d]/milestone", bookRightTemp, startLineRightTemp];
				NSArray *nodes3 = [[xmlDocument rootElement] nodesForXPath:uniqueXPathPrev error:nil];
				if([nodes3 count]!=0){
					for (CXMLNode *itemNode3 in nodes3)
					{
						for (CXMLNode *childNode3 in [itemNode3 children])
						{
							
							NSString *nodeValue3 = [childNode3 stringValue]; // should contain 'numberLines' that are less that startLine and greater than prevStartLine (in each iteration)
							
							//Get the following line of that prevLine to make a comparision in the following instruction (in each iteration)
							NSString * uniqueXPath4 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]/following-sibling::p[1]", bookRightTemp, nodeValue3];
							CXMLElement * folloLinePath = [[xmlDocument nodesForXPath:uniqueXPath4 error:nil] lastObject];
							NSString *followingLine = [[[folloLinePath elementsForName:@"milestone"] lastObject] stringValue];	  
							//Comparision: To know if that Line should be the prevLine
							if([nodeValue3 intValue] < startLineRightTemp && [followingLine intValue] > startLineRightTemp)
							{
								//If the line is the previous one we get the text
								NSString * uniqueXPath5 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]", bookRightTemp, nodeValue3];
								CXMLElement * prevTextPath = [[xmlDocument nodesForXPath:uniqueXPath5 error:nil] lastObject];
								NSString *prevText = [[[prevTextPath elementsForName:@"txt"] lastObject] stringValue];	  
								previousRightText= prevText;
							}	
							else {
								previousRightText=@"";
							}
						}
					}
				}
				else if( [nodes3 count]==0){
					previousRightText=@"";
				}
			}
			else if (startLineTemp==1){
				previousRightText=@"";
			}
		}		
		NSLog(@"PrevRightText:%@", previousRightText);		
		//--------------------Getting Previous LeftText:-----------------------
		
		NSLog(@"Finding Prev TEXT!");
		
		if(prevBookLeftTemp==bookLeftTemp){
			
			NSString * uniqueXPathPrev = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone<%d]/milestone", bookLeftTemp, startLineLeftTemp];
			NSArray *nodes3 = [[xmlDocument rootElement] nodesForXPath:uniqueXPathPrev error:nil];
			if([nodes3 count]!=0){
				
				for (CXMLNode *itemNode3 in nodes3)
				{
					for (CXMLNode *childNode3 in [itemNode3 children])
					{
						
						NSString *nodeValue3 = [childNode3 stringValue]; // should contain 'numberLines' that are less that startLine and greater than prevStartLine (in each iteration)
						
						//Get the following line of that prevLine to make a comparision in the following instruction (in each iteration)
						NSString * uniqueXPath4 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]/following-sibling::p[1]", bookLeftTemp, nodeValue3];
						CXMLElement * folloLinePath = [[xmlDocument nodesForXPath:uniqueXPath4 error:nil] lastObject];
						NSString *followingLine = [[[folloLinePath elementsForName:@"milestone"] lastObject] stringValue];	  
						
						
						//Comparision: To know if that Line should be the prevLine
						if([nodeValue3 intValue] < startLineLeftTemp && [followingLine intValue] > startLineLeftTemp)
						{
							//If the line is the previous one we get the text
							NSString * uniqueXPath5 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]", bookLeftTemp, nodeValue3];
							CXMLElement * prevTextPath = [[xmlDocument nodesForXPath:uniqueXPath5 error:nil] lastObject];
							NSString *prevText = [[[prevTextPath elementsForName:@"txt"] lastObject] stringValue];	  
							previousLeftText= prevText;
						}
						else {
							previousLeftText=@"";
						}
					}
				}
			}
			else if ([nodes3 count]==0){
				previousLeftText=@"";
			}
		}
		else if(prevBookLeftTemp!=bookLeftTemp){
			
			
			if(startLineLeftTemp!=1){
				
				NSString * uniqueXPathPrev = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone<%d]/milestone", bookLeftTemp, startLineLeftTemp];
				NSArray *nodes3 = [[xmlDocument rootElement] nodesForXPath:uniqueXPathPrev error:nil];
				if([nodes3 count]!=0){
					for (CXMLNode *itemNode3 in nodes3)
					{
						for (CXMLNode *childNode3 in [itemNode3 children])
						{
							NSString *nodeValue3 = [childNode3 stringValue]; // should contain 'numberLines' that are less that startLine and greater than prevStartLine (in each iteration)
							
							//Get the following line of that prevLine to make a comparision in the following instruction (in each iteration)
							NSString * uniqueXPath4 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]/following-sibling::p[1]", bookLeftTemp, nodeValue3];
							CXMLElement * folloLinePath = [[xmlDocument nodesForXPath:uniqueXPath4 error:nil] lastObject];
							NSString *followingLine = [[[folloLinePath elementsForName:@"milestone"] lastObject] stringValue];	  
							//Comparision: To know if that Line should be the prevLine
							if([nodeValue3 intValue] < startLineLeftTemp && [followingLine intValue] > startLineLeftTemp)
							{
								//If the line is the previous one we get the text
								NSString * uniqueXPath5 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone=%@]", bookLeftTemp, nodeValue3];
								CXMLElement * prevTextPath = [[xmlDocument nodesForXPath:uniqueXPath5 error:nil] lastObject];
								NSString *prevText = [[[prevTextPath elementsForName:@"txt"] lastObject] stringValue];	  
								previousLeftText= prevText;
							}	
							else {
								previousLeftText=@"";
							}
						}
					}
				}
				else if( [nodes3 count]==0){
					previousLeftText=@"";
				}
			}
			else if (startLineTemp==1){
				previousLeftText=@"";
			}
		}
		
		NSLog(@"PrevLeftText:%@", previousLeftText);	
		
		///FINISH SEARCHING FOR TEXT
		
		//NSLog(@"CurrentParse=%d->XMLPath passed : %@",currentParse,newxmlPath);
		[self parseXMLFileAtURL:xmlPath];	
		//[xmlDocument release];
		
	}
	
	
	//Right and Left PROCESS!!
	
	
	[pool release];
}



- (void)parseXMLFileAtURL:(NSString *)URL {
	
	NSAutoreleasePool * pool1 = [[NSAutoreleasePool alloc] init];
	
	if (currentParse == 0)
	{
		if (stories) { 
			[stories release]; 
			stories = nil; 
		}
		
		stories = [[NSMutableArray alloc] init];
	}
	
	NSURL *xmlURL = [NSURL fileURLWithPath:URL];
	
    rssParser = [[[NSXMLParser alloc] initWithContentsOfURL:xmlURL] autorelease];
	
    [rssParser setDelegate:self];
	
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
	[pool1 release];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
	
	NSLog(@"found file and started parsing");
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	
	NSString * errorString = [NSString stringWithFormat:@"You are not connected to the Internet.", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error Loading Content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
	
	currentElement = [elementName copy];
	
	if (currentParse == 0)
	{
		if ([elementName isEqualToString:@"div1"]) {
			item = [[NSMutableDictionary alloc] init];
			currentBook = [[NSMutableString alloc] initWithString:[attributeDict valueForKey:@"n"]];
		}
		
		else if ([elementName isEqualToString:@"txt"]) {
			currentText = [[NSMutableString alloc] init]; 
		}
		
		else if ([elementName isEqualToString:@"milestone"]) {
			currentLine = [[NSMutableString alloc] init]; 
		}
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	
	//FIND THE INPUT.WORD	
	if (currentParse == 0)
	{
		if ([elementName isEqualToString:@"p"]) {
			[item setObject:currentBook forKey:@"div1"];
			[item setObject:currentText forKey:@"txt"];
			[item setObject:currentLine forKey:@"milestone"];
			
			NSString * temp= [NSString stringWithFormat:@"%@", currentText];
			
			
			NSLog (@"%@",[searchBar.text copy]);
			searchWord=[searchBar.text copy];
			//CASE INSENTIVE
			NSRange titleResultsRange = [temp rangeOfString:[searchBar.text copy] options:NSCaseInsensitiveSearch];
			
			if (titleResultsRange.length > 0){
				//NSLog(@"adding story: %@, %@, %@", currentBook, currentText, currentLine);
				[stories addObject:[item copy]];
			}
			//--------------------------------------------------------------------------
			//CASE SENSITIVE
			//if ([temp rangeOfString:[searchBar.text copy]].location != NSNotFound) {
			//	
			//	NSLog(@"adding story: %@, %@, %@", currentBook, currentText, currentLine);
			//	[stories addObject:[item copy]];
			//}
			//----------------------------------------------------------------------------
		}
	}
	
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	if (currentParse == 0)
	{
		if ([currentElement isEqualToString:@"div1"]) {
			//string = [string stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
			//string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
			[currentBook appendString:string];
		} else if ([currentElement isEqualToString:@"milestone"]) {
			//string = [string stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
			//string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
			[currentLine appendString:string];
		} else if ([currentElement isEqualToString:@"txt"]) {
			//string = [string stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
			//string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
			[currentText appendString:string];
		}
	}
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	if (currentParse == 0)
	{
		NSLog(@"all done with currentParse0!");
		NSLog(@"stories array has %d items", [stories count]);
		searchProgression = 3;
		[tableView reloadData];
	}
	else if (currentParse == 1) {
		NSLog(@"all done with currentParse1!");
		[self performSelectorOnMainThread:@selector(udpateLabels) withObject:nil waitUntilDone:YES];
	} 
	else if (currentParse == 2) {
		NSLog(@"all done with currentParse2!");
		[self performSelectorOnMainThread:@selector(udpateLabels2) withObject:nil waitUntilDone:YES];
	}
	else if (currentParse == 3) {
		NSLog(@"all done with currentParse3!");
		[self performSelectorOnMainThread:@selector(udpateLabels2) withObject:nil waitUntilDone:YES];
	}
	
	
}

-(void) udpateLabels {
	
	leftPage=NO;	
	previousText = @"";
	uniqueText = @"";
	uniqueLeftText=@"";
	previousLeftText=@"";
	uniqueRightText=@"";
	previousRightText=@"";
	//prevBook = @"";
	//book = @"";
	//nextBook = @"";
	
	
	currentParse = 2;
	//[NSThread detachNewThreadSelector:@selector(startfileparsing) toTarget:self withObject:nil];
	[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
}

-(void) udpateLabels2 {

	//SEND PARAMETERS BACK

	NSString * goingDirection;
	
	
	if ([folioImageName intValue] > [folio intValue]) {
		goingDirection = @"right";
	}
	else {
		goingDirection = @"left";
	}

	
	NSMutableDictionary *pageData = [[NSMutableDictionary alloc] init];
	
	//[pageData setObject:goingDirection forKey:@"goingDirection"];
	
	
	if([folio isEqualToString: @"12r"]){}
	else{
		[pageData setObject:previousFolioImageName forKey:@"leftFolioImage"];
		
		[pageData setObject:prevBook forKey:@"prevBook"];
	}
	
	
	[pageData setObject:uniqueLeftText forKey:@"uniqueLeftText"];
	
	[pageData setObject:previousLeftText forKey:@"previousLeftText"];
	
	[pageData setObject:previousText forKey:@"previousText"];
	
	[pageData setObject:uniqueText forKey:@"uniqueText"];
	
	[pageData setObject:previousRightText forKey:@"previousRightText"];
	
	[pageData setObject:folioImageName forKey:@"folioImage"];
	
	[pageData setObject:uniqueRightText forKey:@"uniqueRightText"];
	
	[pageData setObject:nextFolioImageName forKey:@"rightFolioImage"];
	
	[pageData setObject:[[searchBar.text copy] copy] forKey:@"searchedText"];

	[pageData setObject:book forKey:@"book"];
	
	[pageData setObject:nextBook forKey:@"nextBook"];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"UpdatePages"
														object:pageData
													  userInfo:nil];	
}



//-------------------------
// Create Search Table
//-------------------------

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (searchProgression == 1)
	{
		return 1;
	}
	else if (searchProgression == 2) {
		return 1;
	}
	else if (searchProgression == 3) {
		if ([stories count] == 0){
			return 1;
		}
		else {
			return [stories count];
		}
	}

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 90.0f;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"CustomCell";
	
	CustomCell *cell = (CustomCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (CustomCell *) currentObject;
				break;
			}
		}
	}	
	// Configure the cell.
	
	//cell.text = @"Loading...";
	
	
	if (searchProgression == 3)
	{
		if ([stories count] == 0){
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
			cell.font = [UIFont fontWithName:@"Helvetica" size:19.0];
			//cell.font. = [UIColor brownColor];
			//cell.textColor = [UIColor brownColor];
			
			cell.text =@"                No Results";
		}
		else {
			cell.selectionStyle = UITableViewCellSelectionStyleGray;
			
			currentBook= [[stories objectAtIndex:indexPath.row] objectForKey: @"div1"];
			currentLine= [[stories objectAtIndex:indexPath.row] objectForKey: @"milestone"];
			currentText= [NSString stringWithFormat:@"%@", [[stories objectAtIndex:indexPath.row] objectForKey: @"txt"]];
			
			cell.pageLabel.text = [NSString stringWithFormat:@"Book: %@ Line: %@", currentBook, currentLine];
			[self subStr:searchWord];
			cell.textView.font = [UIFont fontWithName:@"Cochin" size:16.0];
			cell.textView.text = currentText;
		}
	}
	else if (searchProgression == 2) {
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		cell.font = [UIFont fontWithName:@"Helvetica" size:19.0];
		//cell.textColor = [UIColor brownColor];
		
		cell.text = @"                  Searching...";
		
		
		UIActivityIndicatorView * spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[spinner setCenter:CGPointMake(80, 45)]; // I do this because I'm in landscape mode
		[cell addSubview:spinner]; // spinner is not visible until started
		
		
		[spinner startAnimating];
		
		
	}
	else if (searchProgression == 1) {
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		cell.text = @"";
	}
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (searchProgression == 3) 
	{
		if ([stories count] == 0){
			
		}
		else {
			statsFound = NO;
			rowSelected = indexPath.row;
			currentParse = 1;
			//[NSThread detachNewThreadSelector:@selector(startfileparsing) toTarget:self withObject:nil];
			[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
		}

	
	}

}





- (void) subStr:(NSString *) keyword {
	
	NSString *currentTextTemp= [NSString stringWithFormat:@"%@", currentText];
	NSRange range = [currentText rangeOfString: [NSString stringWithFormat:@"%@",keyword] options:NSCaseInsensitiveSearch];
	NSString * tempR= [NSString stringWithFormat:@"%d", range ];
	
	
	int textLenght= [currentText length];
	int searchWordLenght= [keyword length];
	int location= [tempR intValue];
	int endLocation= location + searchWordLenght;
	
	NSString * searchWordTemp= [currentTextTemp substringWithRange:NSMakeRange(location,searchWordLenght)];
	NSString *firstString=[currentTextTemp substringWithRange:NSMakeRange(0,location)];
	NSString *lastString=[currentTextTemp substringWithRange:NSMakeRange(endLocation,textLenght-endLocation)];
	
	int fSLenght= [firstString length];
	int lSLengh=[lastString length];
	
	if(fSLenght>45)
	{
		for(int count=0;location>37;count++) {
			firstString=[currentTextTemp substringWithRange:NSMakeRange(count,location)];
			location=location-1;	
		}
	}
	
	BOOL upperWord=NO;
	BOOL starLine=NO;
	NSString *tempFirstString=@"";
	NSString *newFirstString=@"";
	
	NSArray *partsOfFS = [firstString componentsSeparatedByString:@" "];
	
	if([partsOfFS count]==1)
	{
		NSString *tempFS = [partsOfFS objectAtIndex:0];
		if([tempFS length]>0){
			firstCharacter=[tempFS characterAtIndex:0];
		}
	}
	else
	{
		NSString *tempFS = [partsOfFS objectAtIndex:1];
		if([tempFS length]>0){
			firstCharacter=[tempFS characterAtIndex:0];
		}
		
		for(int count=1; count<[partsOfFS count]; count++)
		{
			tempFirstString= [NSString stringWithFormat:@"%@ %@", tempFirstString, [partsOfFS objectAtIndex:count]];
			
		}
		
	}
	
	if(isupper(firstCharacter)){
		upperWord=YES;
	}
	
	if(upperWord==YES)
	{
		newFirstString = tempFirstString;
		
	}
	else if(upperWord==NO){
		
		if([tempFirstString length]>0){
			char tempCharacter=[tempFirstString characterAtIndex:0];
			if( (isupper(tempCharacter)) ){
			}
			else{
				tempFirstString= [tempFirstString substringWithRange:NSMakeRange(1,[tempFirstString length]-1)];
				newFirstString = [NSString stringWithFormat:@"...%@",tempFirstString];
				
			}
		}
	}
	
	if(lSLengh>50)
	{
		lastString=[currentTextTemp substringWithRange:NSMakeRange(endLocation,49)];
	}
	
	fSLenght= [firstString length];
	
	NSString *new2FirstString= [newFirstString stringByAppendingString:[NSString stringWithFormat:@"%@", searchWordTemp]];
	NSString *currentText2= [new2FirstString stringByAppendingString: lastString];
	NSString *tempCurrentText2=@"";
	
	if([currentText2 length]>90)
	{
		currentText2=[currentText2 substringWithRange:NSMakeRange(0,85)];
	}
	
	
	NSArray *partsOfCT = [currentText2 componentsSeparatedByString:@" "];
	
	if([partsOfCT count]==1)
	{
		NSString *tempCS = [partsOfCT objectAtIndex:[partsOfCT count]-1];
		if([tempCS length]>0){
			lastCharacter=[tempCS characterAtIndex:[tempCS length]-1];
			prevLastCharacter=[tempCS characterAtIndex:[tempCS length]-2];
		}
	}
	else
	{
		NSString *tempCS = [partsOfCT objectAtIndex:[partsOfCT count]-2];
		if([tempCS length]>0){
			lastCharacter=[tempCS characterAtIndex:[tempCS length]-1];
			prevLastCharacter=[tempCS characterAtIndex:[tempCS length]-2];
		}
	}
	
	
	for(int count=0; count<[partsOfCT count]-1; count++)
	{
		
		tempCurrentText2= [NSString stringWithFormat:@"%@ %@", tempCurrentText2, [partsOfCT objectAtIndex:count]];
		
	}
	
	currentText2=tempCurrentText2;
	
	NSString *tempChar = [NSString stringWithFormat:@"%c", lastCharacter];
	NSString *tempPrevChar = [NSString stringWithFormat:@"%c", prevLastCharacter];
	
	
	if( [tempPrevChar isEqualToString:@"."] && [tempChar isEqualToString:@"\""]){
	}
	else if([tempChar  isEqualToString: @"\""]){
	}
	else if([tempChar  isEqualToString: @"-"]){
		currentText2 = [currentText2 stringByAppendingString:@" ..."];
	}
	else if([tempChar  isEqualToString: @"; "]){
		currentText2 = [currentText2 stringByAppendingString:@" ..."];
	}
	else if ([tempChar isEqualToString: @"."]){
	}
	else if ([tempChar isEqualToString: @","]){
		
	}
	else if ([tempChar isEqualToString: @"?"]){
	}
	else if ([tempChar isEqualToString: @"!"]){
		
	}
	else if ([tempChar isEqualToString: @"\""] && tempPrevChar != @"." ){
		currentText2 = [currentText2 stringByAppendingString:@" ..."];
	}
	else {
		currentText2 = [currentText2 stringByAppendingString:@"..."];
	}
	currentText= [NSString stringWithFormat:@"%@", currentText2 ];
	
}




/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end