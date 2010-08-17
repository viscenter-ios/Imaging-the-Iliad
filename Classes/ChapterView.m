//
//  BookmarkView.m
//  Iliad
//
//  Created by Vis Center on 7/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ChapterView.h"
#import "TouchXML.h"
#import "AboutView.h"

@implementation ChapterView


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	self.contentSizeForViewInPopover = CGSizeMake(280, 363);
	
	self.title = @"Books";
	
	searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 0)];
	searchBar.barStyle=UIBarStyleDefault;
	searchBar.showsCancelButton=YES;
	searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
	searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
	searchBar.delegate=self;
	self.tableView.tableHeaderView=searchBar;
	[searchBar removeFromSuperview];

	[searchBar release];
	
	
	chaptersArray = [[NSArray alloc] initWithObjects:@"About",@"Book I",@"Book II",@"Book III",@"Book IV",@"Book V",@"Book VI",@"Book VII",@"Book VIII",@"Book IX",@"Book X",@"Book XI",@"Book XII",@"Book XIII",@"Book XIV",@"Book XV",@"Book XVI",@"Book XVII",@"Book XVIII",@"Book XIX",@"Book XX",@"Book XXI",@"Book XXII",@"Book XXIII",@"Book XXIV",nil];
	chaptersFolioArray = [[NSArray alloc] initWithObjects:@"12r",@"24v",@"42r",@"51v",@"62v",@"80v",@"91r",@"101r",@"112r",@"126r",@"137v",@"154v",@"164r",@"180v",@"191r",@"206r",@"223v",@"239r",@"251v",@"260r",@"270r",@"282v",@"293r",@"311r",nil];
	foliosArray = [[NSArray alloc] initWithObjects:@"12r",@"12v",@"13r",@"13v",@"14r",@"14v",@"15r",@"15v",@"16r",@"16v",@"17r",@"17v",@"18r",@"18v",@"19r",@"19v",@"20r",@"20v",@"21r",@"21v",@"22r",@"22v",@"23r",@"23v",@"24r",@"24v",@"25r",@"25v",@"26r",@"26v",@"27r",@"27v",@"28r",@"28v",@"29r",@"29v",@"30r",@"30v",@"31r",@"31v",@"32r",@"32v",@"33r",@"33v",@"34r",@"34v",@"35r",@"35v",@"36r",@"36v",@"37r",@"37v",@"38r",@"38v",@"39r",@"39v",@"40r",@"40v",@"41r",@"41v",@"42r",@"42v",@"43r",@"43v",@"44r",@"44v",@"45r",@"45v",@"46r",@"46v",@"47r",@"47v",@"48r",@"48v",@"49r",@"49v",@"50r",@"50v",@"51r",@"51v",@"52r",@"52v",@"53r",@"53v",@"54r",@"54v",@"55r",@"55v",@"56r",@"56v",@"57r",@"57v",@"58r",@"59r",@"59v",@"60r",@"60v",@"61r",@"61v",@"62r",@"62v",@"63r",@"64r",@"64v",@"65r",@"65v",@"66r",@"66v",@"67r",@"67v",@"68r",@"68v",@"69r",@"69v",@"70r",@"70v",@"71r",@"71v",@"72r",@"72v",@"73r",@"73v",@"74r",@"74v",@"75r",@"75v",@"76r",@"76v",@"77r",@"77v",@"78r",@"78v",@"79r",@"79v",@"80r",@"80v",@"81r",@"81v",@"82r",@"82v",@"83r",@"83v",@"84r",@"84v",@"85r",@"85v",@"86r",@"86v",@"87r",@"87v",@"88r",@"88v",@"89r",@"89v",@"90r",@"90v",@"91r",@"91v",@"92r",@"92v",@"93r",@"93v",@"94r",@"94v",@"95r",@"95v",@"96r",@"96v",@"97r",@"97v",@"98r",@"98v",@"99r",@"99v",@"100r",@"100v",@"101r",@"101v",@"102r",@"102v",@"103r",@"103v",@"104r",@"104v",@"105r",@"105v",@"106r",@"106v",@"107r",@"107v",@"108r",@"108v",@"109r",@"109v",@"110r",@"110v",@"111r",@"111v",@"112r",@"112v",@"113r",@"113v",@"114r",@"114v",@"115r",@"115v",@"116r",@"116v",@"117r",@"117v",@"118r",@"118v",@"119r",@"119v",@"120r",@"120v",@"121r",@"121v",@"122r",@"122v",@"123r",@"123v",@"124r",@"124v",@"125r",@"125v",@"126r",@"126v",@"127r",@"127v",@"128r",@"128v",@"129r",@"129v",@"130r",@"130v",@"131r",@"131v",@"132r",@"132v",@"133r",@"133v",@"134r",@"134v",@"135r",@"135v",@"136r",@"136v",@"137r",@"137v",@"138r",@"138v",@"139r",@"139v",@"140r",@"140v",@"141r",@"141v",@"142r",@"142v",@"143r",@"143v",@"144r",@"144v",@"145r",@"145v",@"146r",@"146v",@"147r",@"147v",@"148r",@"148v",@"149r",@"149v",@"150r",@"150v",@"151r",@"151v",@"152r",@"152v",@"153r",@"153v",@"154r",@"154v",@"155r",@"155v",@"156r",@"156v",@"157r",@"157v",@"158r",@"158v",@"159r",@"159v",@"160r",@"160v",@"161r",@"161v",@"162r",@"162v",@"163r",@"163v",@"164r",@"164v",@"165r",@"165v",@"166r",@"166v",@"167r",@"167v",@"168r",@"168v",@"169r",@"169v",@"170r",@"170v",@"171r",@"171v",@"172r",@"172v",@"173r",@"173v",@"174r",@"174v",@"175r",@"175v",@"176r",@"176v",@"177r",@"177v",@"178r",@"178v",@"179r",@"179v",@"180r",@"180v",@"181r",@"181v",@"182r",@"182v",@"183r",@"183v",@"184r",@"184v",@"185r",@"185v",@"186r",@"186v",@"187r",@"187v",@"188r",@"188v",@"189r",@"189v",@"190r",@"190v",@"191r",@"191v",@"192r",@"192v",@"193r",@"193v",@"194r",@"194v",@"195r",@"195v",@"196r",@"196v",@"197r",@"197v",@"198r",@"198v",@"199r",@"199v",@"200r",@"200v",@"201r",@"201v",@"202r",@"202v",@"203r",@"203v",@"204r",@"204v",@"205r",@"205v",@"206r",@"206v",@"207r",@"207v",@"208r",@"208v",@"209r",@"209v",@"210r",@"210v",@"211r",@"211v",@"212r",@"212v",@"213r",@"213v",@"214r",@"214v",@"215r",@"215v",@"216r",@"216v",@"217r",@"217v",@"218r",@"218v",@"219r",@"219v",@"220r",@"220v",@"221r",@"221v",@"222r",@"222v",@"223r",@"223v",@"224r",@"224v",@"225r",@"225v",@"226r",@"226v",@"227r",@"227v",@"228r",@"228v",@"229r",@"229v",@"230r",@"230v",@"231r",@"231v",@"232r",@"232v",@"233r",@"233v",@"234r",@"234v",@"235r",@"235v",@"236r",@"236v",@"237r",@"237v",@"238r",@"238v",@"239r",@"239v",@"240r",@"240v",@"241r",@"241v",@"242r",@"242v",@"243r",@"243v",@"244r",@"244v",@"245r",@"245v",@"246r",@"246v",@"247r",@"247v",@"248r",@"248v",@"249r",@"249v",@"250r",@"250v",@"251r",@"251v",@"252r",@"252v",@"253r",@"253v",@"254r",@"254v",@"255r",@"255v",@"256r",@"256v",@"257r",@"257v",@"258r",@"258v",@"259r",@"259v",@"260r",@"260v",@"261r",@"261v",@"262r",@"262v",@"263r",@"263v",@"264r",@"264v",@"265r",@"265v",@"266r",@"266v",@"267r",@"267v",@"268r",@"268v",@"269r",@"269v",@"270r",@"270v",@"271r",@"271v",@"272r",@"272v",@"273r",@"273v",@"274r",@"274v",@"275r",@"275v",@"276r",@"276v",@"277r",@"277v",@"278r",@"278v",@"279r",@"279v",@"280r",@"280v",@"281r",@"281v",@"282r",@"282v",@"283r",@"283v",@"284r",@"284v",@"285r",@"285v",@"286r",@"286v",@"287r",@"287v",@"288r",@"288v",@"289r",@"289v",@"290r",@"290v",@"291r",@"291v",@"292r",@"292v",@"293r",@"293v",@"294r",@"294v",@"295r",@"295v",@"296r",@"296v",@"297r",@"297v",@"298r",@"298v",@"299r",@"299v",@"300r",@"300v",@"301r",@"301v",@"302r",@"302v",@"303r",@"303v",@"304r",@"304v",@"305r",@"305v",@"306r",@"306v",@"307r",@"307v",@"308r",@"308v",@"309r",@"309v",@"310r",@"310v",@"311r",@"311v",@"312r",@"312v",@"313r",@"313v",@"314r",@"314v",@"315r",@"315v",@"316r",@"316v",@"317r",@"317v",@"318r",@"318v",@"319r",@"319v",@"320r",@"320v",@"321r",@"321v",@"322r",@"322v",@"323r",@"323v",@"324r",@"324v",@"325r",@"325v",@"326r",@"326v",nil];	
	
	
	copyListOfItems = [[NSMutableArray alloc] initWithObjects:nil];
	
	
	sortController = [[UISegmentedControl alloc] initWithItems:
					  [NSArray arrayWithObjects:
					   @"Chapters",
					   @"Folios",
					   nil]];
	
	[sortController addTarget:self action:@selector(sortController_Changed) forControlEvents:UIControlEventValueChanged];
	sortController.frame = CGRectMake(0, 0, 280, 30);
	sortController.segmentedControlStyle = UISegmentedControlStyleBar;
	
	sortController.selectedSegmentIndex = 0;
	
	listOn = 1;
	
	UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:sortController];
	[sortController release];
    
	self.navigationItem.rightBarButtonItem = segmentBarItem;
	[segmentBarItem release];
	
	
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


- (void) viewDidDisappear:(BOOL)animated {
	
	
	self.title = @"Back";

}

- (void) viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];

  self.title = @" ";
}


- (void) viewDidAppear:(BOOL)animated {

//self.title = @" ";

}


- (void) viewWillDisappear:(BOOL)animated {
	//self.title = @"Back";
}


- (void) sortController_Changed {
	
	
	if (listOn == 1) {
		
		listOn = 2;
		
		searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
		searchBar.barStyle=UIBarStyleDefault;
		searchBar.showsCancelButton=YES;
		searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
		searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
		searchBar.delegate=self;
		searchBar.keyboardType = UIKeyboardTypeNumberPad;
		self.tableView.tableHeaderView=searchBar;
		//[searchBar removeFromSuperview];
		
		[searchBar release];
		
		searchBar.placeholder = @"folio name";
		
		
		//self.tableView.frame = CGRectMake(0,0,320,100);

		
		
		searchBar.text = nil;	
		[searchBar becomeFirstResponder];
		
		searching = NO;
		
		[self.tableView reloadData];
		[self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
	}
	else {
		listOn = 1;
		
		
		searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 0)];
		searchBar.barStyle=UIBarStyleDefault;
		searchBar.showsCancelButton=YES;
		searchBar.autocorrectionType=UITextAutocorrectionTypeNo;
		searchBar.autocapitalizationType=UITextAutocapitalizationTypeNone;
		searchBar.delegate=self;
		self.tableView.tableHeaderView=searchBar;
		[searchBar removeFromSuperview];
		
		[searchBar release];
		
		
		searchBar.text = nil;	
		[searchBar resignFirstResponder];
		
		searching = NO;
		
		
		
		
		
		[self.tableView reloadData];
		[self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];

	}
	
	
	[self.tableView reloadData];
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
		else if(folioNumber<99) {
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
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 // Uncomment the following line to preserve selection between presentations.
 // self.clearsSelectionOnViewWillAppear = NO;
 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 }
 */

/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
	 
	 //sortController.hidden = YES;
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
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (listOn == 1) {
		return [chaptersArray count];
	}
	else {
		if (searching == NO) {
			return [foliosArray count];
		}
		else {
			return [copyListOfItems count];
			
		}
		
	}
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.selectionStyle = UITableViewCellSelectionStyleGray;
	
	if (listOn == 1) {
		cell.textLabel.text = [chaptersArray objectAtIndex:indexPath.row];
	}
	else {
		if (searching == NO) {
			cell.textLabel.text = [NSString stringWithFormat:@"Folio %@ - Page %i", [foliosArray objectAtIndex:indexPath.row], [self getPageNumber:[foliosArray objectAtIndex:indexPath.row]]];
		}
		else {
			cell.textLabel.text = [NSString stringWithFormat:@"Folio %@ - Page %i", [copyListOfItems objectAtIndex:indexPath.row], [self getPageNumber:[copyListOfItems objectAtIndex:indexPath.row]]];
		}
		
		
	}
	
	
    return cell;
}




- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath 
{ 
	if (listOn == 1) {
		if (indexPath.row == 0) {
			return UITableViewCellAccessoryDisclosureIndicator; 
		}
		else {
			return UITableViewCellAccessoryNone; 
		}

	}
} 



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	parseDirection = 1;
	
	if (listOn == 1) {
		if (indexPath.row == 0) {
			
			
			
			AboutView *aboutView = [[AboutView alloc] initWithNibName:@"AboutView" bundle:nil];
			[self.navigationController pushViewController:aboutView animated:YES];
						
		}
		else {
			[folio setString:[chaptersFolioArray objectAtIndex:indexPath.row - 1]];
			
			[previousText setString:@""];
			[uniqueText setString:@""];
			[uniqueLeftText setString:@""];
			[uniqueRightText setString:@""];
			[previousLeftText setString:@""];
			[previousRightText setString:@""];
			
			[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
		}
	
	}
	else {
		if (searching == NO) {
			[folio setString:[foliosArray objectAtIndex:indexPath.row]];
			
			[previousText setString:@""];
			[uniqueText setString:@""];
			[uniqueLeftText setString:@""];
			[uniqueRightText setString:@""];
			[previousLeftText setString:@""];
			[previousRightText setString:@""];
			
			[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
		}
		else {
			[folio setString:[copyListOfItems objectAtIndex:indexPath.row]];
			
			[previousText setString:@""];
			[uniqueText setString:@""];
			[uniqueLeftText setString:@""];
			[uniqueRightText setString:@""];
			[previousLeftText setString:@""];
			[previousRightText setString:@""];
			
			[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
		}
		
	}
		
}





/*
- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
	
	//This method is called again when the user clicks back from teh detail view.
	//So the overlay is displayed on the results, which is something we do not want to happen.
	if(searching)
		return;
	
	//Add the overlay view.
	//if(ovController == nil)
	//	ovController = [[OverlayViewController alloc] initWithNibName:@"OverlayView" bundle:[NSBundle mainBundle]];
	
	//CGFloat yaxis = self.navigationController.navigationBar.frame.size.height;
	//CGFloat width = self.view.frame.size.width;
	//CGFloat height = self.view.frame.size.height;
	
	//Parameters x = origion on x-axis, y = origon on y-axis.
	//CGRect frame = CGRectMake(0, yaxis, width, height);
	//ovController.view.frame = frame;	
	//ovController.view.backgroundColor = [UIColor grayColor];
	//ovController.view.alpha = 0.5;
	
	//ovController.rvController = self;
	
	//[self.tableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
	
	searching = YES;
	letUserSelectRow = NO;
	//self.tableView.scrollEnabled = NO;
	
	//Add the done button.
	//self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
	//										   initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
	//										   target:self action:@selector(doneSearching_Clicked:)] autorelease];
}
*/

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
	
	//Remove all objects first.
	[copyListOfItems removeAllObjects];
	
	if([searchText length] > 0) {
		
		//[ovController.view removeFromSuperview];
		searching = YES;
		letUserSelectRow = YES;
		//self.tableView.scrollEnabled = YES;
		[self searchTableView];
	}
	else {
		
		//[self.tableView insertSubview:ovController.view aboveSubview:self.parentViewController.view];
		
		searching = NO;
		letUserSelectRow = NO;
		//self.tableView.scrollEnabled = NO;
	}
	
	[self.tableView reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
	
	[self searchTableView];
}

- (void) searchTableView {
	
	NSString *searchText = searchBar.text;
	
	for (int i = 0; i < [foliosArray count]; i++) {
		
		NSRange titleResultsRange = [[foliosArray objectAtIndex:i] rangeOfString:searchText options:NSCaseInsensitiveSearch];
		
		//NSRange titleResultsRange2 = [[NSString stringWithFormat:@"%i", [self getPageNumber:[foliosArray objectAtIndex:i]]] rangeOfString:searchText options:NSCaseInsensitiveSearch];

		if (titleResultsRange.length > 0){
			
			[copyListOfItems addObject:[foliosArray objectAtIndex:i]];
		}
		//else if (titleResultsRange2.length > 0) {

			
		//	[copyListOfItems addObject:[foliosArray objectAtIndex:i]];

		//}

	}
}



- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{	
	searchBar.text = nil;	
	[searchBar resignFirstResponder];
	
	searching = NO;
	
	[self.tableView reloadData];
}



/*
 - (void) doneSearching_Clicked:(id)sender {
 
 searchBar.text = @"";
 [searchBar resignFirstResponder];
 
 letUserSelectRow = YES;
 searching = NO;
 self.navigationItem.rightBarButtonItem = nil;
 self.tableView.scrollEnabled = YES;
 
 //[ovController.view removeFromSuperview];
 //[ovController release];
 //ovController = nil;
 
 [self.tableView reloadData];
 }
 */


















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
	
	NSLog(@"folio:%@, book:%@ startLine:%@, nextStartLine:%@, next2StopLine:%d, prevStartLIne:%@",folio, book, startLine, nextStartLine,next2StopLine, prevStartLine);
	
	
	
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

