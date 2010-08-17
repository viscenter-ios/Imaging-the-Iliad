//
//  BookmarkView.m
//  Iliad
//
//  Created by Vis Center on 7/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BookmarkView.h"
#import "IliadAppDelegate.h"
#import "TouchXML.h"
#import "NoteView.h"

@implementation BookmarkView


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(newStuff:)
												 name:@"bookmarkInfo" object:nil];
	
	
	
	self.contentSizeForViewInPopover = CGSizeMake(400, 240);
	editbutton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(edit)];      
	addbutton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];      
	//self.tableView.editingAccessoryType = UITableViewCellAccessoryCheckmark;
	self.navigationItem.rightBarButtonItem = addbutton;
	self.navigationItem.leftBarButtonItem = editbutton;
  
	
	
	
	prevBook = [[NSMutableString alloc] init];
	[prevBook setString:@""];
	
	book = [[NSMutableString alloc] init];
	[book setString:@""];
	
	nextBook = [[NSMutableString alloc] init];
	[nextBook setString:@""];
	
	folio = [[NSMutableString alloc] init];
	[folio setString:@"12r"];
	
	prevFolio = [[NSMutableString alloc] init];
	[folio setString:@""];
	
	nextFolio = [[NSMutableString alloc] init];
	[folio setString:@""];
	
	previousText = [[NSMutableString alloc] init];
	[previousText setString:@""];
	
	uniqueText = [[NSMutableString alloc] init];
	[uniqueText setString:@""];
	
	uniqueLeftText = [[NSMutableString alloc] init];
	[uniqueLeftText setString:@""];
	
	uniqueRightText = [[NSMutableString alloc] init];
	[uniqueRightText setString:@""];
	
	previousLeftText = [[NSMutableString alloc] init];
	[previousLeftText setString:@""];
	
	previousRightText = [[NSMutableString alloc] init];
	[previousRightText setString:@""];
	
	
	
	
	[super viewDidLoad];
	
	
	
}



- (void) newStuff: (NSNotification *)notification {
	
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	info = [notification object];
	
	if ([mainDelegate.bookmarksArray containsObject:info]) {
		addbutton.enabled = NO;
	}
	
}



-(void)edit{
	if (self.tableView.editing){
		[self.tableView setEditing:NO animated:YES];
		//self.tableView.editing = NO;
		editbutton.title = @"Edit";
	}
	else {
		[self.tableView setEditing:YES animated:YES];
		//self.tableView.editing = YES;
		editbutton.title = @"Done";
	}
}


-(void)add{
	
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];
	[mainDelegate.bookmarksArray addObject:[info copy]];
	[mainDelegate.bookmarksNotesArray addObject:@""];

	
	NSString * addRibbon = @"add";
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"AddRibbon"
														object:addRibbon
													  userInfo:nil];
	
	
	//NSString * str = [iliadViewController getFolioName];
	
	//NSLog(@"BOOKMARKS ADD %@", currentInfo);
	addbutton.enabled = NO;

	
	[self.tableView reloadData];

}

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/


- (void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];
	
    [super viewWillAppear:animated];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
		return 2;
	}
	else {
		return 1;
	}

}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	if (section == 0) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			return @"Auto-Saved Bookmark (last closed)";
		}
		else {
			if ([mainDelegate.bookmarksArray count] > 0) {
				return @"Bookmarks";

			}
			else {
				return nil;
			}

		}
		
	}
	else if (section == 1) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			if ([mainDelegate.bookmarksArray count] > 0) {
				return @"Bookmarks";
				
			}
			else {
				return nil;
			}
		}
		
	}
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

    // Return the number of rows in the section.
	
	
	if (section == 0) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			return [mainDelegate.bookmarksArrayOneSaved count];
		}
		else {
			return [mainDelegate.bookmarksArray count];
		}

	}
	else if (section == 1) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			return [mainDelegate.bookmarksArray count];
		}
		else {
			return 0;
		}


	}

	
}


- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath 
{ 
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	if (indexPath.section == 0) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			return UITableViewCellAccessoryNone; 
		}
		else {
			return UITableViewCellAccessoryDetailDisclosureButton; 
		}
		
	}
	else if (indexPath.section == 1) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			return UITableViewCellAccessoryDetailDisclosureButton; 
		}
		else {
			return UITableViewCellAccessoryNone; 
		}
		
	}
} 

// Customize the appearance of table view cells.

#define MAINLABEL_TAG 1
#define SECONDLABEL_TAG 2

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	UILabel *mainLabel, *secondLabel;
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		
		CGSize textSize;
		
		
		
		
		
		
		
		
		if (indexPath.section == 0) {
			if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
				textSize = [[NSString stringWithFormat:@"(Page %i - Folio %@)",[self getPageNumber:[mainDelegate.bookmarksArrayOneSaved objectAtIndex:indexPath.row]],[mainDelegate.bookmarksArrayOneSaved objectAtIndex:indexPath.row]] sizeWithFont:[UIFont boldSystemFontOfSize:20.0]];

			}
			else {
				textSize = [[NSString stringWithFormat:@"(Page %i - Folio %@)",[self getPageNumber:[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]],[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]] sizeWithFont:[UIFont boldSystemFontOfSize:20.0]];

			}
			
		}
		else if (indexPath.section == 1) {
			if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
				textSize = [[NSString stringWithFormat:@"(Page %i - Folio %@)",[self getPageNumber:[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]],[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]] sizeWithFont:[UIFont boldSystemFontOfSize:20.0]];

			}
			else {
				
			}
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		mainLabel = [[[UILabel alloc] initWithFrame:CGRectMake(8.0, 8.0, textSize.width, textSize.height)] autorelease];
        mainLabel.tag = MAINLABEL_TAG;
        mainLabel.font = [UIFont boldSystemFontOfSize:20.0];
        mainLabel.textAlignment = UITextAlignmentLeft;
        mainLabel.textColor = [UIColor blackColor];
        //mainLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:mainLabel];
		
        secondLabel = [[[UILabel alloc] initWithFrame:CGRectMake(mainLabel.frame.origin.x + mainLabel.frame.size.width + 8, 8.0, 400 - mainLabel.frame.origin.x - mainLabel.frame.size.width - 44, 26.0)] autorelease];
        secondLabel.tag = SECONDLABEL_TAG;
        secondLabel.font = [UIFont systemFontOfSize:17.0];
        secondLabel.textAlignment = UITextAlignmentLeft;
        secondLabel.textColor = [UIColor darkGrayColor];
        //secondLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        [cell.contentView addSubview:secondLabel];
    } 
	
	else {
        mainLabel = (UILabel *)[cell.contentView viewWithTag:MAINLABEL_TAG];
        secondLabel = (UILabel *)[cell.contentView viewWithTag:SECONDLABEL_TAG];
    }
	cell.selectionStyle = UITableViewCellSelectionStyleGray;

    // Configure the cell...

	if (indexPath.section == 0) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			mainLabel.text = [NSString stringWithFormat:@"(Page %i - Folio %@)",[self getPageNumber:[mainDelegate.bookmarksArrayOneSaved objectAtIndex:0]],[mainDelegate.bookmarksArrayOneSaved objectAtIndex:0]];
			secondLabel.frame = CGRectMake(mainLabel.frame.origin.x + mainLabel.frame.size.width + 8, 8.0, 400 - mainLabel.frame.origin.x - mainLabel.frame.size.width - 44, 26.0);
			secondLabel.text = @"";
		}
		else {
			mainLabel.text = [NSString stringWithFormat:@"(Page %i - Folio %@)",[self getPageNumber:[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]],[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]];
			secondLabel.frame = CGRectMake(mainLabel.frame.origin.x + mainLabel.frame.size.width + 8, 8.0, 400 - mainLabel.frame.origin.x - mainLabel.frame.size.width - 44, 26.0);
			secondLabel.text = [mainDelegate.bookmarksNotesArray objectAtIndex:indexPath.row];
		}
		
	}
	else if (indexPath.section == 1) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			mainLabel.text = [NSString stringWithFormat:@"(Page %i - Folio %@)",[self getPageNumber:[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]],[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]];
			secondLabel.frame = CGRectMake(mainLabel.frame.origin.x + mainLabel.frame.size.width + 8, 8.0, 400 - mainLabel.frame.origin.x - mainLabel.frame.size.width - 44, 26.0);
			secondLabel.text = [mainDelegate.bookmarksNotesArray objectAtIndex:indexPath.row];
		}
		else {

		}
		
	}
	
	
	
	
	
	return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	if (indexPath.section == 0) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			return UITableViewCellEditingStyleNone; 

		}
		else {
			return UITableViewCellEditingStyleDelete; 

		}
		
	}
	else if (indexPath.section == 1) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			return UITableViewCellEditingStyleDelete; 

		}
		else {
			
		}
		
	}
} 



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	if (editingStyle == UITableViewCellEditingStyleDelete) {
			
		if ([[mainDelegate.bookmarksArray objectAtIndex:indexPath.row] isEqualToString:info]) {
			NSString * addRibbon = @"remove";

			[[NSNotificationCenter defaultCenter] postNotificationName:@"AddRibbon"
																object:addRibbon
															  userInfo:nil];
			addbutton.enabled = YES;
		}
		else {
			
			BOOL goingLeft;
			
			NSString * folio1 = [mainDelegate.bookmarksArray objectAtIndex:indexPath.row];
			NSString * folio22 = info;
			
			BOOL result;
			char folio1C;
			char folio2C;
			int tF1= [folio1 intValue];
			int tF2= [folio22 intValue];
			
			if(tF1<=99){
				folio1C=[folio1 characterAtIndex:2];
			}
			else{
				folio1C=[folio1 characterAtIndex:3];
				
			}
			if(tF2<=99){
				folio2C= [folio22 characterAtIndex:2];
			}
			else{
				folio2C= [folio22 characterAtIndex:3];
			}
			
			NSString *tempCharacter1= [NSString stringWithFormat:@"%c", folio1C];
			NSString *tempCharacter2= [NSString stringWithFormat:@"%c", folio2C];
			
			if(tF1>tF2 && [tempCharacter1 isEqualToString: @"r"]){
				if(tF2+1==tF1 && [tempCharacter2 isEqualToString: @"v"]){
					result= YES;
					
				}
				else{ 
					result=NO;
				}
				
			}
			else if( tF1==tF2){
				if([tempCharacter1 isEqualToString: tempCharacter2]){
					result= NO;
				}
				else if([tempCharacter1 isEqualToString: @"r"]){
					result= NO;
				}
				else if([tempCharacter1 isEqualToString: @"v"]){
					result= YES;
				}
			}
			else{
				result=NO;
			}
			
			goingLeft = result;
			
			
			
			
			
			
			
			
			
			
			
			if (!goingLeft) {
				
				NSLog(@"REMOVELEFT");
				
				NSString * addRibbon = @"removeleft";
				
				[[NSNotificationCenter defaultCenter] postNotificationName:@"AddRibbon"
																	object:addRibbon
																  userInfo:nil];
			}
			else {
				
				NSLog(@"REMOVERIGHT");

				NSString * addRibbon = @"removeright";
				
				[[NSNotificationCenter defaultCenter] postNotificationName:@"AddRibbon"
																	object:addRibbon
																  userInfo:nil];
			}

		
			
		}

		
		[mainDelegate.bookmarksArray removeObjectAtIndex:indexPath.row];
		[mainDelegate.bookmarksNotesArray removeObjectAtIndex:indexPath.row];

		
		[self.tableView reloadData];
	}
	
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath 
{
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	mainDelegate.indexClicked = indexPath.row;
	
	NoteView *noteView = [[NoteView alloc] initWithNibName:@"NoteView" bundle:nil];
	[self.navigationController pushViewController:noteView animated:YES];
	
	
}



-(int) getPageNumber:(NSString *)folioString{
	
	if (folioString == NULL) {
		return 0;
		NSLog(@"Im HERE!");
	}
	else {
		int result;
		char folioCharacter;
		int folioNumber= [folioString intValue];
		if(folioNumber > 99){
			folioCharacter=[folioString characterAtIndex:3];
		}
		else if(folioNumber<=99) {
			folioCharacter=[folioString characterAtIndex:2];
		}
		
		NSString *tempCharacter= [NSString stringWithFormat:@"%c", folioCharacter];
		
		folioNumber=folioNumber-12;
		folioNumber=folioNumber*2;
		if([tempCharacter isEqualToString: @"r"])
		{
			folioNumber= folioNumber + 1;
		}
		else if([tempCharacter isEqualToString:@"v"]){
			folioNumber=folioNumber +2;
		}
		
		result=folioNumber;
		NSLog(@"FolioNumber: %i", folioNumber);
		return result;
	}
	
    
	
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	parseDirection = 1;
	
	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];

	
	
	if (indexPath.section == 0) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			[folio setString:[mainDelegate.bookmarksArrayOneSaved objectAtIndex:indexPath.row]];
			
			[previousText setString:@""];
			[uniqueText setString:@""];
			[uniqueLeftText setString:@""];
			[uniqueRightText setString:@""];
			[previousLeftText setString:@""];
			[previousRightText setString:@""];
			
			[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
		}
		else {
			[folio setString:[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]];
			
			[previousText setString:@""];
			[uniqueText setString:@""];
			[uniqueLeftText setString:@""];
			[uniqueRightText setString:@""];
			[previousLeftText setString:@""];
			[previousRightText setString:@""];
			
			[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
		}
		
	}
	else if (indexPath.section == 1) {
		if ([mainDelegate.bookmarksArrayOneSaved count] > 0){
			[folio setString:[mainDelegate.bookmarksArray objectAtIndex:indexPath.row]];
			
			[previousText setString:@""];
			[uniqueText setString:@""];
			[uniqueLeftText setString:@""];
			[uniqueRightText setString:@""];
			[previousLeftText setString:@""];
			[previousRightText setString:@""];
			
			[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
		}
		else {
			
		}
		
	}
	
	
	
	
	
}






//////////////////////PARSE////////////////////////

-(void)startfileparsing{
    
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	
	
	//Setting the new variables for the RIGHT PAGE
	//NSLog(@"OldFolio:%@",folio);
	
	
	//Set the paths to do the Xpath in the "VA.Fixed.xml":
	NSString *newpath = [[NSBundle mainBundle] pathForResource:@"VAFolioIndex" ofType:@"xml"];
	NSString *newxmlPath=[[NSString alloc] initWithString:newpath];
	NSURL *newxmlURL = [NSURL fileURLWithPath:newxmlPath];
	CXMLDocument *xmlDocument = [[[CXMLDocument alloc] initWithContentsOfURL:newxmlURL options:0 error:nil] autorelease];
	
	
	NSString *newPrev2FolioXPath;
	NSString *newPrevFolioXPath;
	NSString *newfolioXPath;
	NSString *folioNextXPath;
	NSString *folioNext2XPath;
	NSString *folioNext3XPath;
	
	//RIGHT
	if(parseDirection==3)
	{
		
		
		newPrev2FolioXPath = [NSString stringWithFormat:@"/root/line[folio='%@']/preceding-sibling::line[1]", folio];
		// Get the previous line NODE from the actual line NODE
		newPrevFolioXPath = [NSString stringWithFormat:@"/root/line[folio='%@']", folio];
		// Get the NEXT line NODE from the actual line NODE
		newfolioXPath = [NSString stringWithFormat:@"/root/line[folio='%@']/following-sibling::line[1]", folio];
		//Get the NEXT line NODE from the NODE you find in the instruction before
		folioNextXPath = [NSString stringWithFormat:@"/root/line[folio='%@']/following-sibling::line[2]", folio];
		folioNext2XPath = [NSString stringWithFormat:@"/root/line[folio='%@']/following-sibling::line[3]", folio];
		folioNext3XPath = [NSString stringWithFormat:@"/root/line[folio='%@']/following-sibling::line[4]", folio];
		
	}
	
	//LEFT
	else if(parseDirection == 2){
		// Get the previous line NODE from the actual line NODE
		
		folioNextXPath= [NSString stringWithFormat:@"/root/line[folio='%@']", folio];
		// Get the PREV line NODE from the actual line NODE
		newfolioXPath = [NSString stringWithFormat:@"/root/line[folio='%@']/preceding-sibling::line[1]", folio];
		//Get the PREV line NODE from the NODE you find in the instruction before
		newPrevFolioXPath = [NSString stringWithFormat:@"/root/line[folio='%@']/preceding-sibling::line[2]", folio];
		newPrev2FolioXPath = [NSString stringWithFormat:@"/root/line[folio='%@']/preceding-sibling::line[3]", folio];
		//Get the PREV line NODE from the NODE you find in the instruction before
		folioNext2XPath = [NSString stringWithFormat:@"/root/line[folio='%@']/following-sibling::line[1]", folio];
		folioNext3XPath = [NSString stringWithFormat:@"/root/line[folio='%@']/following-sibling::line[2]", folio];
	}
	else if(parseDirection==1)
	{
		
		newPrev2FolioXPath = [NSString stringWithFormat:@"/root/line[folio='%@']/preceding-sibling::line[2]", folio];
		newPrevFolioXPath=[NSString stringWithFormat:@"/root/line[folio='%@']/preceding-sibling::line[1]", folio];
		newfolioXPath=[NSString stringWithFormat:@"/root/line[folio='%@']", folio];
		folioNextXPath= [NSString stringWithFormat:@"/root/line[folio='%@']/following-sibling::line[1]",folio];
		folioNext2XPath=[NSString stringWithFormat:@"/root/line[folio='%@']/following-sibling::line[2]", folio];
		folioNext3XPath = [NSString stringWithFormat:@"/root/line[folio='%@']/following-sibling::line[3]", folio];
	}
	
	
	
	NSLog(@"Im HERE!");
	
	//We get the nodes but we only need the lastObject (only one Node)
	CXMLElement * newPrevFolioPath = [[xmlDocument nodesForXPath:newPrevFolioXPath error:nil] lastObject];
	CXMLElement * newPrev2FolioPath = [[xmlDocument nodesForXPath:newPrev2FolioXPath error:nil] lastObject];
	CXMLElement * newCurrentFolioPath = [[xmlDocument nodesForXPath:newfolioXPath error:nil] lastObject];
	CXMLElement * newNextFolioPath = [[xmlDocument nodesForXPath:folioNextXPath error:nil] lastObject];
	CXMLElement * newNext2FolioPath = [[xmlDocument nodesForXPath:folioNext2XPath error:nil] lastObject];
	CXMLElement * newNext3FolioPath = [[xmlDocument nodesForXPath:folioNext3XPath error:nil] lastObject];
	
	
	NSLog(@"Im HERE!");
	
	
	
	//We set the new variables to get the NEXT page when you click or turn the page 
	//UNIQUE INFORMATION
	[folio setString:[[[newCurrentFolioPath elementsForName:@"folio"] lastObject] stringValue]];
	//folioC = [[[[newCurrentFolioPath elementsForName:@"folio"] lastObject] stringValue] UTF8String];
	NSLog(@"NewFolio:%@",folio);
	////NSLog(@"NewFolio:%s",folioC);
	startLine = [[[newCurrentFolioPath elementsForName:@"start"] lastObject] stringValue];
	[book setString: [[[newCurrentFolioPath elementsForName:@"book"] lastObject] stringValue]];
	stopBook = [[[newNextFolioPath elementsForName:@"book"] lastObject] stringValue];
	stopLine = [[[newNextFolioPath elementsForName:@"start"] lastObject] stringValue];
	stopLine= [stopLine intValue]-1;
	nextStopLine= [[[newNext2FolioPath elementsForName:@"start"] lastObject] stringValue];
	nextStopLine= [nextStopLine intValue]-1;
	NSLog(@"PREV");
	
	//Prev Information
	if([folio isEqualToString: [NSString stringWithFormat:@"12r"]]){NSLog(@"IM HERE!");}
	else{
		[prevFolio setString:[[[newPrevFolioPath elementsForName:@"folio"] lastObject] stringValue]];
		[prevBook setString: [[[newPrevFolioPath elementsForName:@"book"] lastObject] stringValue]];
		prevStartLine= [[[newPrevFolioPath elementsForName:@"start"] lastObject] stringValue];
		prevStopLine= [[[newCurrentFolioPath elementsForName:@"start"] lastObject] stringValue];
		prevStopLine=[prevStopLine intValue]-1;
		prevStopBook= [[[newCurrentFolioPath elementsForName:@"book"] lastObject] stringValue];
		prevPrevStartLine= [[[newPrev2FolioPath elementsForName:@"start"] lastObject] stringValue];
		prevPrevBook= [[[newPrev2FolioPath elementsForName:@"book"] lastObject] stringValue];
		NSLog(@"NEXT");
	}
	if([folio isEqualToString: [NSString stringWithFormat:@"326v"]]){}
	else{
		//Next Information
		[nextFolio setString:[[[newNextFolioPath elementsForName:@"folio"] lastObject] stringValue]];
		[nextBook setString: [[[newNextFolioPath elementsForName:@"book"] lastObject] stringValue]];
		nextStartLine= [[[newNextFolioPath elementsForName:@"start"] lastObject] stringValue];
		nextStopLine= [[[newNext2FolioPath elementsForName:@"start"] lastObject] stringValue];
		nextStopLine=[nextStopLine intValue]-1;
		nextStopBook= [[[newNext2FolioPath elementsForName:@"book"] lastObject] stringValue];
		nextPrevStartLine= [[[newCurrentFolioPath elementsForName:@"start"] lastObject] stringValue];
		nextPrevBook= [[[newPrevFolioPath elementsForName:@"book"] lastObject] stringValue];
		next2StopLine=[[[newNext3FolioPath elementsForName:@"start"] lastObject] stringValue];
		next2StopLine=[next2StopLine intValue]-1;
	}
	
	
	
	
	//------------------->----------------
	
	//Unique INT Information
	bookTemp=      [book intValue];
	startLineTemp= [startLine intValue];
	stopBookTemp=  [stopBook intValue];
	prevStartLineTemp= [prevStartLine intValue];
	prevBookTemp = [prevBook intValue];
	
	if([folio isEqualToString: [NSString stringWithFormat:@"12r"]]){NSLog(@"IM HERE!");}
	else{
		
		//Left INT Information
		bookLeftTemp=      [prevBook intValue];
		startLineLeftTemp= [prevStartLine intValue];
		stopBookLeftTemp=  [prevStopBook intValue];
		prevStartLineLeftTemp= [prevPrevStartLine intValue];
		prevBookLeftTemp = [prevPrevBook intValue];
	}
	if([folio isEqualToString: [NSString stringWithFormat:@"326v"]]){}
	else{
		//Right INT Information
		bookRightTemp=      [nextBook intValue];
		startLineRightTemp= [nextStartLine intValue];
		stopBookRightTemp=  [nextStopBook intValue];
		prevStartLineRightTemp= [nextPrevStartLine intValue];
		prevBookRightTemp = [nextPrevBook intValue];
	}
	
	//NSLog(@"folio:%@, book:%@ startLine:%@, nextStartLine:%@, next2StopLine:%d, prevStartLIne:%@",folio, book, startLine, nextStartLine,next2StopLine, prevStartLine);
	
	
	
	//Setting the object for the IMAGES
	if([folio isEqualToString: [NSString stringWithFormat:@"12r"]]){}
	else{
		leftFolioImage= [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:prevFolio ofType:@"jpg"]];
	}
	if([folio isEqualToString: [NSString stringWithFormat:@"326v"]]){}
	else{
		rightFolioImage= [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:nextFolio ofType:@"jpg"]];
	}
	folioImage= [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:folio ofType:@"jpg"]];
	
	
	//Path for search the XML
	newpath = [[NSBundle mainBundle] pathForResource:@"Iliad" ofType:@"xml"];
	newxmlPath=[[NSString alloc] initWithString:newpath];
	newxmlURL = [NSURL fileURLWithPath:newxmlPath];
	xmlDocument = [[[CXMLDocument alloc] initWithContentsOfURL:newxmlURL options:0 error:nil] autorelease];
	
	
	//----------------------Getting UniqueText:-----------------------			
	//NSLog(@"Finding Unique TEXT!");
	//Condition for lines that are in the same book
	if (stopBookTemp==bookTemp) {
		//NSLog(@"Books are the same!");
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
					[uniqueText setString:[NSString stringWithFormat:@"%@ %@", uniqueText ,nodeValue]];
				}
			}	
		}
		else if([nodes count]==0){
			[uniqueText setString:@""];
		}
		
	}
	//Condition for lines that arent in the same book 
	else if (stopBookTemp!=bookTemp) {
		//NSLog(@"Books are NOT the same!");
		NSString * uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone >= %d]/txt", bookTemp, startLineTemp];
		NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
		if([nodes count]!=0){
			for (CXMLNode *pNode in nodes)
			{
				for (CXMLNode *childNodes in [pNode children])
				{
					NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the ACTUAL book (in each iteration)
					[uniqueText setString:[NSString stringWithFormat:@"%@ %@", uniqueText ,nodeValue]];
				}
			}
			NSString * uniqueXPath2 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone <= %d]/txt", stopBookTemp, stopLine];
			NSArray *nodes2 = [[xmlDocument rootElement] nodesForXPath:uniqueXPath2 error:nil];
			
			for (CXMLNode *pNode2 in nodes2)
			{
				for (CXMLNode *childNode2 in [pNode2 children])
				{
					NSString *nodeValue2 = [childNode2 stringValue]; // should contain 'Uniquetext' of the NEXT book (in each iteration)
					[uniqueText setString:[NSString stringWithFormat:@"%@ %@", uniqueText ,nodeValue2]];			
				}
			}
			
		}
		else if([nodes count]==0){
			[uniqueText setString:@""];
		}
		
	}
	
	
	//----------------------Getting LEFT UniqueText:-----------------------			
	//NSLog(@"Finding LEFTUnique TEXT!");
	//Condition for lines that are in the same book
	if( [folio isEqualToString:[NSString stringWithFormat:@"12r"]]){}	
	else{
		if (stopBookLeftTemp==bookLeftTemp) {
			//NSLog(@"Books are the same!");
			
			NSString *uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d and milestone<=%d]/txt", bookLeftTemp, startLineLeftTemp, prevStopLine];
			
			
			//If we are in the end of the Iliad, it doesnt know what is gonna be the nextStopLine so it will be equal to the UniqueStopLine! 
			if(prevStopLine==stopLine){
				uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d]/txt", bookLeftTemp, startLineLeftTemp];
			}
			
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			////NSLog(@"nodes:%@", nodes);
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the same book (in each iteration)
						[uniqueLeftText setString:[NSString stringWithFormat:@"%@ %@", uniqueLeftText ,nodeValue]];
					}
				}	
			}
			else if([nodes count]==0){
				[uniqueLeftText setString:@""];
			}			
		}
		//Condition for lines that arent in the same book 
		else if (stopBookLeftTemp!=bookLeftTemp) {
			//NSLog(@"Books are NOT the same!");
			NSString * uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone >= %d]/txt", bookLeftTemp, startLineLeftTemp];
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the ACTUAL book (in each iteration)
						[uniqueLeftText setString:[NSString stringWithFormat:@"%@ %@", uniqueLeftText ,nodeValue]];
					}
				}
				NSString * uniqueXPath2 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone <= %d]/txt", stopBookLeftTemp, prevStopLine];
				NSArray *nodes2 = [[xmlDocument rootElement] nodesForXPath:uniqueXPath2 error:nil];
				
				for (CXMLNode *pNode2 in nodes2)
				{
					for (CXMLNode *childNode2 in [pNode2 children])
					{
						NSString *nodeValue2 = [childNode2 stringValue]; // should contain 'Uniquetext' of the NEXT book (in each iteration)
						[uniqueLeftText setString:[NSString stringWithFormat:@"%@ %@", uniqueLeftText ,nodeValue2]];			
					}
				}
				
			}
			else if([nodes count]==0){
				[uniqueLeftText setString:@""];
			}
			
		}	
	}
	//NSLog(@"LEFT:%@", uniqueLeftText);	
	
	
	
	//----------------------Getting Right UniqueText:-----------------------
	if( [folio isEqualToString:[NSString stringWithFormat:@"326v"]]){}
	else {
		
		//NSLog(@"Finding RIGHTUnique TEXT!");
		//Condition for lines that are in the same book
		if (stopBookRightTemp==bookRightTemp) {
			//NSLog(@"Books are the same!");
			NSString *uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d and milestone<=%d]/txt", bookRightTemp, startLineRightTemp, nextStopLine];
			
			//If we are in the end of the Iliad, it doesnt know what is gonna be the nextStopLine so it will be equal to the UniqueStopLine! 
			if(nextStopLine==next2StopLine){
				uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone>=%d]/txt", bookRightTemp, startLineRightTemp];
			}
			
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			////NSLog(@"COUNT:%d", [nodes count]);
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the same book (in each iteration)
						[uniqueRightText setString:[NSString stringWithFormat:@"%@ %@", uniqueRightText ,nodeValue]];
					}
				}	
			}
			else if([nodes count]==0){
				[uniqueRightText setString:@""];
			}
			
		}
		//Condition for lines that arent in the same book 
		else if (stopBookRightTemp!=bookRightTemp) {
			//NSLog(@"Books are NOT the same!");
			NSString * uniqueXPath = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone >= %d]/txt", bookRightTemp, startLineRightTemp];
			NSArray *nodes = [[xmlDocument rootElement] nodesForXPath:uniqueXPath error:nil];
			if([nodes count]!=0){
				for (CXMLNode *pNode in nodes)
				{
					for (CXMLNode *childNodes in [pNode children])
					{
						NSString *nodeValue = [childNodes stringValue]; // should contain 'Uniquetext' of the ACTUAL book (in each iteration)
						[uniqueRightText setString:[NSString stringWithFormat:@"%@ %@", uniqueRightText ,nodeValue]];
					}
				}
				NSString * uniqueXPath2 = [NSString stringWithFormat:@"/body/div1[@n='%d']/p[milestone <= %d]/txt", stopBookRightTemp, nextStopLine];
				NSArray *nodes2 = [[xmlDocument rootElement] nodesForXPath:uniqueXPath2 error:nil];
				
				for (CXMLNode *pNode2 in nodes2)
				{
					for (CXMLNode *childNode2 in [pNode2 children])
					{
						NSString *nodeValue2 = [childNode2 stringValue]; // should contain 'Uniquetext' of the NEXT book (in each iteration)
						[uniqueRightText setString:[NSString stringWithFormat:@"%@ %@", uniqueRightText ,nodeValue2]];			
					}
				}
				
			}
			else if([nodes count]==0){
				[uniqueRightText setString:@""];
			}
			
		}
	}
	
	
	
	
	
	
	//NSLog(@"Right:%@", uniqueRightText);			
	//--------------------Getting Current PreviousText:-----------------------
	
	//NSLog(@"Finding Prev TEXT!");
	
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
						[previousText setString:prevText];
					}
					else {
						[previousText setString:@""];
					}
					
					
				}
				
			}
		}
		else if ([nodes3 count]==0){
			[previousText setString:@""];
			
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
							[previousText setString:prevText];
						}	
						else {
							[previousText setString:@""];
						}
						
					}
				}
			}
			else if( [nodes3 count]==0){
				[previousText setString:@""];
			}
		}
		else if (startLineTemp==1){
			[previousText setString:@""];
		}
	}
	
	//--------------------Getting Previous RightText:-----------------------
	
	//NSLog(@"Finding PrevRight TEXT!");
	if( [folio isEqualToString:[NSString stringWithFormat:@"326v"]]){}
	else {
		
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
							[previousRightText setString:prevText];
						}
						else {
							[previousRightText setString:@""];
						}
					}
					
				}
			}
			else if ([nodes3 count]==0){
				[previousRightText setString:@""];
				
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
								[previousRightText setString:prevText];
							}	
							else {
								[previousRightText setString:@""];
							}
						}
					}
				}
				else if( [nodes3 count]==0){
					[previousRightText setString:@""];
				}
			}
			else if (startLineTemp==1){
				[previousRightText setString:@""];
			}
		}	
	}
	//NSLog(@"PREV RUGHT:%@", previousRightText);	
	//--------------------Getting Previous LeftText:-----------------------
	
	//NSLog(@"Finding PrevLeft TEXT!");
	if( [folio isEqualToString:[NSString stringWithFormat:@"12r"]]){}	
	else{
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
							[previousLeftText setString:prevText];
						}
						else {
							[previousLeftText setString:@""];
						}
					}
				}
			}
			else if ([nodes3 count]==0){
				[previousLeftText setString:@""];
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
								[previousLeftText setString:prevText];
							}	
							else {
								[previousLeftText setString:@""];
							}
						}
					}
				}
				else if( [nodes3 count]==0){
					[previousLeftText setString:@""];
				}
			}
			else if (startLineTemp==1){
				[previousLeftText setString:@""];
			}
		}
	}
	//NSLog(@"PREV Left:%@", previousLeftText);		
	//NSLog(@"Folio:%@", folio);
	
	
	
	
	
	NSLog (@"FINISH SEARCHING FOR TEXT");		
	
	////NSLog(@"CurrentParse=%d->XMLPath passed : %@",currentParse,newxmlPath);
	[self parseXMLFileAtURL:newxmlPath];
	
	[pool release];
	
}


- (void)parseXMLFileAtURL:(NSString *)URL {
	
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSURL *xmlURL = [NSURL fileURLWithPath:URL];
	
    rssParser = [[[NSXMLParser alloc] initWithContentsOfURL:xmlURL] autorelease];
	
    [rssParser setDelegate:self];
	
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
	[pool release];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
	
	//NSLog(@"found file and started parsing");
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	
	NSString * errorString = [NSString stringWithFormat:@"You are not connected to the Internet.", [parseError code]];
	//NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error Loading Content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
	//NSLog(@"all done with currentParse3!");
	[self performSelectorOnMainThread:@selector(udpateLabels3) withObject:nil waitUntilDone:YES];
}

-(void) udpateLabels3 {
	NSMutableDictionary *pageData = [[NSMutableDictionary alloc] init];
	
	//[pageData setObject:goingDirection forKey:@"goingDirection"];
	
	[pageData setObject:previousLeftText forKey:@"previousLeftText"];
	
	[pageData setObject:uniqueLeftText forKey:@"uniqueLeftText"];
	
	[pageData setObject:prevFolio forKey:@"leftFolioImage"];
	
	[pageData setObject:previousText forKey:@"previousText"];
	
	[pageData setObject:uniqueText forKey:@"uniqueText"];
	
	[pageData setObject:folio forKey:@"folioImage"];
	
	[pageData setObject:previousRightText forKey:@"previousRightText"];
	
	[pageData setObject:uniqueRightText forKey:@"uniqueRightText"];
	
	[pageData setObject:nextFolio forKey:@"rightFolioImage"];
	
	//[pageData setObject:searchBar.text forKey:@"searchedText"];
	
	[pageData setObject:prevBook forKey:@"prevBook"];
	
	[pageData setObject:book forKey:@"book"];
	
	[pageData setObject:nextBook forKey:@"nextBook"];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"UpdatePages"
														object:pageData
													  userInfo:nil];
}

//////////////////////PARSE////////////////////////













#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

