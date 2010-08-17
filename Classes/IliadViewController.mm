//
//  LeavesViewController.m
//  Leaves
//
//  Created by Tom Brow on 4/18/10.
//  Copyright Tom Brow 2010. All rights reserved.
//

#import "IliadViewController.h"
#import "Utilities.h"
#import "InfoView.h"
#import "BookmarkView.h"
#import "ChapterView.h"
#import "TouchXML.h"
#import "GLView.h"


@implementation IliadViewController

@synthesize htmlRP1, htmlRP2, htmlRP3, viewsForAnimation;


- (void) dataManage { // where we tryed to save the state of the book on close
	
	//previousTextRP2 = @"Sing, O goddess, the anger of Achilles son of Peleus, that brought countless ills upon the Achaeans. Many a brave soul did it send hurrying down to Hades, and many a hero did it yield a prey to dogs and vultures, for so were the counsels of Jove fulfilled from the day on which the son of Atreus, king of men, and great Achilles, first fell out with one another.";
	//uniqueTextRP2 = @"And which of the gods was it that set them on to quarrel? It was the son of Jove and Leto; for he was angry with the king and sent a pestilence upon the host to plague the people, because the son of Atreus had dishonoured Chryses his priest. Now Chryses had come to the ships of the Achaeans to free his daughter, and had brought with him a great ransom: moreover he bore in his hand the sceptre of Apollo wreathed with a suppliant's wreath and he besought the Achaeans, but most of all the two sons of Atreus, who were their chiefs.";
	
	//htmlRP1 = [prefs stringForKey:@"htmlRP1"];
	//if (htmlRP1 == NULL) {
	htmlRP1 = [[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\">Sing, O goddess, the anger of Achilles son of Peleus, that brought countless ills upon the Achaeans. Many a brave soul  did it send hurrying down to Hades, and many a hero did it yield a prey to dogs and vultures, for so was the will of Zeus fulfilled from the day on which the son of Atreus, king of men, and great Achilles, first fell out with one another. And which of the gods was it that set them on to quarrel? It was the son of Zeus and Leto; for he was angry with the king and sent a pestilence upon the host to plague the people, because the son of Atreus had dishonored Chryses his priest. Now Chryses had come to the ships of the Achaeans to free his daughter, and had brought with him a great ransom: moreover he bore in his hand the scepter of Apollo wreathed with a suppliant's wreath and he besought the Achaeans, but most of all the two sons of Atreus, who were their chiefs. \"Sons of Atreus,\" he cried, \"and all other Achaeans, may the gods who dwell in Olympus grant you to sack the city of Priam, and to reach your homes in safety; but free my daughter, and accept a ransom for her, in reverence to Apollo, son of Zeus.\" On this the rest of the Achaeans with one voice were for respecting the priest and taking the ransom that he offered; but not so Agamemnon, who spoke fiercely to him and sent him roughly away. \"Old man,\" said he, \"let me not find you tarrying about our ships, nor yet coming hereafter. Your scepter of the god and your wreath shall profit you nothing. I will not free her. She shall grow old\"</font></body></html>"];  
	//}
	
	//htmlRP2 = [prefs stringForKey:@"htmlRP2"];
	//if (htmlRP2 == NULL) {
		htmlRP2 = [[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\">Sing, O goddess, the anger of Achilles son of Peleus, that brought countless ills upon the Achaeans. Many a brave soul  did it send hurrying down to Hades, and many a hero did it yield a prey to dogs and vultures, for so was the will of Zeus fulfilled from the day on which the son of Atreus, king of men, and great Achilles, first fell out with one another. And which of the gods was it that set them on to quarrel? It was the son of Zeus and Leto; for he was angry with the king and sent a pestilence upon the host to plague the people, because the son of Atreus had dishonored Chryses his priest. Now Chryses had come to the ships of the Achaeans to free his daughter, and had brought with him a great ransom: moreover he bore in his hand the scepter of Apollo wreathed with a suppliant's wreath and he besought the Achaeans, but most of all the two sons of Atreus, who were their chiefs. \"Sons of Atreus,\" he cried, \"and all other Achaeans, may the gods who dwell in Olympus grant you to sack the city of Priam, and to reach your homes in safety; but free my daughter, and accept a ransom for her, in reverence to Apollo, son of Zeus.\" On this the rest of the Achaeans with one voice were for respecting the priest and taking the ransom that he offered; but not so Agamemnon, who spoke fiercely to him and sent him roughly away. \"Old man,\" said he, \"let me not find you tarrying about our ships, nor yet coming hereafter. Your scepter of the god and your wreath shall profit you nothing. I will not free her. She shall grow old\"</font></body></html>"];  
	//}
	
	//htmlRP3 = [prefs stringForKey:@"htmlRP3"];
	//if (htmlRP3 == NULL) {
	previousTextRP3 = @"who spoke fiercely to him and sent him roughly away. \"Old man,\" said he, \"let me not find you tarrying about our ships, nor yet coming hereafter. Your scepter of the god and your wreath shall profit you nothing. I will not free her. She shall grow old";
	uniqueTextRP3 = @"in my house at Argos far from her own home, busying herself with her loom and visiting my couch; so go, and do not provoke me or it shall be the worse for you.\" The old man feared him and obeyed. Not a word he spoke, but went by the shore of the sounding sea and prayed apart to King Apollo whom lovely Leto had borne. \"Hear me,\" he cried, \"O god of the silver bow, you who protect Chryse and holy Cilla and rule Tenedos with your might, hear me O god of Sminthe. If I have ever decked your temple with garlands, or burned for you thigh-bones in fat of bulls or goats, grant my prayer, and let your arrows avenge these my tears upon the Danaans.\" Thus did he pray, and Apollo heard his prayer. He came down furious from the summits of Olympus, with his bow and his quiver upon his shoulder, and the arrows rattled on his back with the rage that trembled within him. He sat himself down away from the ships with a face as dark as night, and his silver bow rang death as he shot his arrow in the midst of them. First he smote their mules and their hounds, but presently he aimed his shafts at the people themselves, and all day long the pyres of the dead were burning. For nine whole days he shot his arrows among the people, but upon the tenth day Achilles called them in assembly -";
	htmlRP3 = [[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
	//}
	
	
	
	//viewsForAnimation = [[prefs objectForKey:@"viewsForAnimation"] mutableCopy];
	//if (viewsForAnimation == NULL) {
		viewsForAnimation = [[NSMutableArray alloc] initWithObjects:page1, page2, page3, page2, page3, page4, page5, nil];
	//}

	
	//viewOn = [prefs integerForKey:@"viewOn"];
	//if (viewOn == NULL) {
	//	viewOn = 2;
	//}
	
}


- (void) saveStuff {	// saves the last place the book was opened to to appear in the bookmarks tab

	NSLog(@"is saving stuff (should happen after any page turn)%@", folio);
	
	
//	IliadAppDelegate *mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];
	[mainDelegate.bookmarksArrayOneSaved removeAllObjects];
	[mainDelegate.bookmarksArrayOneSaved addObject:folio];
	
	
	
	//viewOn will always start on 2 so adjust accordingly
	/*
	
	[prefs setObject:viewsForAnimation forKey:@"viewsForAnimation"];
	
	if (viewOn == 1) {

		[prefs setObject:[[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1] forKey:@"htmlRP2"];
		
		[prefs setObject:[[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2] forKey:@"htmlRP3"];
		
		[prefs setObject:[[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3] forKey:@"htmlRP1"];
	}
	else if (viewOn == 2) {
		[prefs setObject:[[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1] forKey:@"htmlRP1"];
		
		[prefs setObject:[[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2] forKey:@"htmlRP2"];
		
		[prefs setObject:[[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3] forKey:@"htmlRP3"];		
	}
	else if (viewOn == 3) {
		[prefs setObject:[[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1] forKey:@"htmlRP3"];
		
		[prefs setObject:[[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2] forKey:@"htmlRP1"];
		
		[prefs setObject:[[NSString alloc] initWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3] forKey:@"htmlRP2"];
	}
	
	
	NSLog(@"did save stuff (should happen after any page turn)");

	[prefs synchronize];
*/
}


- (id)init { // sets the variables to start things off and makes all the page views that get switched around
    if (self = [super init]) {
		
		
		
		
		prefs = [NSUserDefaults standardUserDefaults];

		
		// All of these notification things are how other files call functions in this file. So you can find their counterpart
		// to see who sends what into this file.
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(threeDPageLoaded)
													 name:@"threeDPageLoaded" object:nil];
	
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(threeDPageProgress:)
													 name:@"threeDPageProgress" object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(newStuff:)
													 name:@"UpdatePages" object:nil];
		
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(saveStuff)
													 name:@"saveStuff" object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(addRibbon:)
													 name:@"AddRibbon" object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(BookmarkPopChange:)
													 name:@"BookmarkPopChange" object:nil];
		
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(remove3D:)
													 name:@"Remove3D" object:nil];
		
		leavesView = [[LeavesView alloc] initWithFrame:CGRectZero];
        leavesView.mode = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? LeavesViewModeSinglePage : LeavesViewModeFacingPages;
		

		//------------------------
		//    NULL PAGE (IMAGE)
		//------------------------
		
		page1 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 354, 496)] autorelease];
		page1.backgroundColor = [UIColor blueColor];
		
		//------------------------
		// PREV LEFT PAGE (IMAGE)
		//------------------------
		
		page2 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 496, 726)] autorelease];
		//page2.backgroundColor = [UIColor brownColor];
		//[self.view addSubview:page2];
		//page2.alpha = 0.0;
		
		UIImage * imageP2 = [UIImage imageNamed:@"1.jpg"];
		imagevP2 = [[UIImageView alloc] initWithImage:imageP2];
		[page2 addSubview:imagevP2];
		
		//------------------------
		// PREV RIGHT PAGE (IMAGE)
		//------------------------
		
		page3 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 496, 726)] autorelease];
		//page3.backgroundColor = [UIColor brownColor];
		//[leavesView addSubview:page3];
		//page3.alpha = 0.0;
		
		UIImage * imageP3 = [UIImage imageNamed:@"2.jpg"];
		UIImageView *imagevP3 = [[UIImageView alloc] initWithImage:imageP3];
		[page3 addSubview:imagevP3];
		
		/*
		 txtViewP3 = [[UITextView alloc] initWithFrame:CGRectMake(30, 45, 440, 650)];
		 NSString *previousTextP3 = @"";
		 NSString *uniqueTextP3 = @"";
		 txtViewP3.backgroundColor = [UIColor clearColor];		
		 txtViewP3.text = [NSString stringWithFormat:@"%@%@", previousTextP3, uniqueTextP3];
		 txtViewP3.font = [UIFont fontWithName:@"Cochin" size:18.0];
		 txtViewP3.editable = NO;
		 [page3 addSubview:txtViewP3];
		 
		 overlayTxtViewP3 = [[UITextView alloc] initWithFrame:CGRectMake(30, 45, 440, 650)];
		 overlayTxtViewP3.backgroundColor = [UIColor clearColor];		
		 overlayTxtViewP3.text = [NSString stringWithFormat:@"%@", previousTextP3];
		 overlayTxtViewP3.font = [UIFont fontWithName:@"Cochin" size:18.0];
		 overlayTxtViewP3.textColor = [UIColor whiteColor];
		 overlayTxtViewP3.alpha = 0.65;
		 overlayTxtViewP3.editable = NO;
		 [page3 addSubview:overlayTxtViewP3];
		 
		 UILabel *lblP3 = [[UILabel alloc] initWithFrame:CGRectMake(204, 12, 200, 40)];
		 lblP3.backgroundColor = [UIColor clearColor];
		 lblP3.font = [UIFont fontWithName:@"Cochin" size:24.0];
		 lblP3.textColor = [UIColor brownColor];
		 lblP3.text = @"Iliad - Book V";
		 [page3 addSubview:lblP3];
		 
		 UILabel *lblPageP3 = [[UILabel alloc] initWithFrame:CGRectMake(238, 682, 200, 40)];
		 lblPageP3.backgroundColor = [UIColor clearColor];
		 lblPageP3.font = [UIFont fontWithName:@"Cochin" size:16.0];
		 lblPageP3.textColor = [UIColor brownColor];
		 lblPageP3.text = @"-page 1-";
		 [page3 addSubview:lblPageP3];
		 */
		
		//------------------------
		//   LEFT PAGE (IMAGE)
		//------------------------
		
		page4 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 496, 726)] autorelease];
		//page4.backgroundColor = [UIColor brownColor];
		//[self.view addSubview:page4];
		//page4.alpha = 0.0;
		
		UIImage * imageP4 = [UIImage imageNamed:@"3.jpg"];
		imagevP4 = [[UIImageView alloc] initWithImage:imageP4];
		[page4 addSubview:imagevP4];
		
		//UIImage * imagePageOnTopP4 = [UIImage imageNamed:@"leftOnTop.png"];
		//UIImageView *imagevPageOnTopP4 = [[UIImageView alloc] initWithImage:imagePageOnTopP4];
		//[page4 addSubview:imagevPageOnTopP4];
		
		//------------------------
		//   RIGHT PAGE (IMAGE)
		//------------------------
		
		page5 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 496, 726)] autorelease];
		//page5.backgroundColor = [UIColor brownColor];
		//[self.view addSubview:page5];
		//page5.alpha = 0.0;
		
		UIImage * imageP5 = [UIImage imageNamed:@"4.jpg"];
		UIImageView *imagevP5 = [[UIImageView alloc] initWithImage:imageP5];
		[page5 addSubview:imagevP5];
		
		/*
		 txtViewP5 = [[UITextView alloc] initWithFrame:CGRectMake(30, 45, 440, 650)];
		 NSString *previousTextP5 = @"";
		 NSString *uniqueTextP5 = @"";
		 txtViewP5.backgroundColor = [UIColor clearColor];		
		 txtViewP5.text = [NSString stringWithFormat:@"%@%@", previousTextP5, uniqueTextP5];
		 txtViewP5.font = [UIFont fontWithName:@"Cochin" size:18.0];
		 txtViewP5.editable = NO;
		 [page5 addSubview:txtViewP5];
		 
		 overlayTxtViewP5 = [[UITextView alloc] initWithFrame:CGRectMake(30, 45, 440, 650)];
		 overlayTxtViewP5.backgroundColor = [UIColor clearColor];		
		 overlayTxtViewP5.text = [NSString stringWithFormat:@"%@", previousTextP5];
		 overlayTxtViewP5.font = [UIFont fontWithName:@"Cochin" size:18.0];
		 overlayTxtViewP5.textColor = [UIColor whiteColor];
		 overlayTxtViewP5.alpha = 0.65;
		 overlayTxtViewP5.editable = NO;
		 [page5 addSubview:overlayTxtViewP5];
		 
		 UILabel *lblP5 = [[UILabel alloc] initWithFrame:CGRectMake(204, 12, 200, 40)];
		 lblP5.backgroundColor = [UIColor clearColor];
		 lblP5.font = [UIFont fontWithName:@"Cochin" size:24.0];
		 lblP5.textColor = [UIColor brownColor];
		 lblP5.text = @"Iliad - Book V";
		 [page5 addSubview:lblP5];
		 
		 UILabel *lblPageP5 = [[UILabel alloc] initWithFrame:CGRectMake(238, 682, 200, 40)];
		 lblPageP5.backgroundColor = [UIColor clearColor];
		 lblPageP5.font = [UIFont fontWithName:@"Cochin" size:16.0];
		 lblPageP5.textColor = [UIColor brownColor];
		 lblPageP5.text = @"-page 1-";
		 [page5 addSubview:lblPageP5];
		 */
		
		
		//------------------------
		// NEXT LEFT PAGE (IMAGE)
		//------------------------
		
		page6 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 496, 726)] autorelease];
		page6.backgroundColor = [UIColor brownColor];
		//	[self.view addSubview:page6];
		page6.alpha = 0.0;
		
		UIImage * imageP6 = [UIImage imageNamed:@"12v.jpg"];
		imagevP6 = [[UIImageView alloc] initWithImage:imageP6];
		[page6 addSubview:imagevP6];
		
		UIImage * imagePageOnTopP6 = [UIImage imageNamed:@"leftOnTop.png"];
		UIImageView *imagevPageOnTopP6 = [[UIImageView alloc] initWithImage:imagePageOnTopP6];
		[page6 addSubview:imagevPageOnTopP6];
		
		
		//------------------------
		// NEXT RIGHT PAGE (IMAGE)
		//------------------------
		
		page7 = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 496, 726)] autorelease];
		page7.backgroundColor = [UIColor brownColor];
		//[self.view addSubview:page7];
		page7.alpha = 0.0;
		
		UIImage * imageP7 = [UIImage imageNamed:@"right.png"];
		UIImageView *imagevP7 = [[UIImageView alloc] initWithImage:imageP7];
		[page7 addSubview:imagevP7];
		
		txtViewP7 = [[UITextView alloc] initWithFrame:CGRectMake(30, 45, 440, 650)];
		NSString *previousTextP7 = @"";
		NSString *uniqueTextP7 = @"";
		txtViewP7.backgroundColor = [UIColor clearColor];		
		txtViewP7.text = [NSString stringWithFormat:@"%@%@", previousTextP7, uniqueTextP7];
		txtViewP7.font = [UIFont fontWithName:@"Cochin" size:18.0];
		txtViewP7.editable = NO;
		[page7 addSubview:txtViewP7];
		
		overlayTxtViewP7 = [[UITextView alloc] initWithFrame:CGRectMake(30, 45, 440, 650)];
		overlayTxtViewP7.backgroundColor = [UIColor clearColor];		
		overlayTxtViewP7.text = [NSString stringWithFormat:@"%@", previousTextP7];
		overlayTxtViewP7.font = [UIFont fontWithName:@"Cochin" size:18.0];
		overlayTxtViewP7.textColor = [UIColor whiteColor];
		overlayTxtViewP7.alpha = 0.65;
		overlayTxtViewP7.editable = NO;
		[page7 addSubview:overlayTxtViewP7];
		
		UILabel *lblP7 = [[UILabel alloc] initWithFrame:CGRectMake(204, 12, 200, 40)];
		lblP7.backgroundColor = [UIColor clearColor];
		lblP7.font = [UIFont fontWithName:@"Cochin" size:24.0];
		lblP7.textColor = [UIColor brownColor];
		lblP7.text = @"Iliad - Book V";
		[page7 addSubview:lblP7];
		
		UILabel *lblPageP7 = [[UILabel alloc] initWithFrame:CGRectMake(238, 682, 200, 40)];
		lblPageP7.backgroundColor = [UIColor clearColor];
		lblPageP7.font = [UIFont fontWithName:@"Cochin" size:16.0];
		lblPageP7.textColor = [UIColor brownColor];
		lblPageP7.text = @"-page 1-";
		[page7 addSubview:lblPageP7];
		
		//------------------------
		//   -MAKE VIEW ARRAY-
		//------------------------
		
		[self dataManage];			

		
		//------------------------
		// PREV LEFT INIT PAGE (VIEW 1)
		//------------------------		
		
		leftPage1 = [[[UIView alloc] initWithFrame:CGRectMake(16, 12, 496, 726)] autorelease];
		leftPage1.backgroundColor = [UIColor grayColor];
		[self.view addSubview:leftPage1];
		leftPage1.alpha = 0.0;
		
		UIImage * imageLP1 = [UIImage imageNamed:@"1.jpg"];
		imagevLP1 = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 495, 725)];
		[imagevLP1 setImage:imageLP1];
		[leftPage1 addSubview:imagevLP1];
		
		UIImage * imagePageOnTopLP1 = [UIImage imageNamed:@"leftOnTop.png"];
		UIImageView *imagevPageOnTopLP1 = [[UIImageView alloc] initWithImage:imagePageOnTopLP1];
		[leftPage1 addSubview:imagevPageOnTopLP1];
		
		
		//------------------------
		// PREV RIGHT INIT PAGE (VIEW 1)
		//------------------------		
		
		rightPage1 = [[[UIView alloc] initWithFrame:CGRectMake(512, 12, 496, 726)] autorelease];
		rightPage1.backgroundColor = [UIColor grayColor];
		[self.view addSubview:rightPage1];
		rightPage1.alpha = 0.0;
		
		UIImage * imageRP1 = [UIImage imageNamed:@"right.png"];
		UIImageView *imagevRP1 = [[UIImageView alloc] initWithImage:imageRP1];
		[rightPage1 addSubview:imagevRP1];
		

		
		
		searchButtonRP1 = [UIButton buttonWithType:UIButtonTypeCustom];
		searchButtonRP1.frame = CGRectMake(137, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *searchImageRP1 = [UIImage imageNamed:@"SearchButton.png"];
		[searchButtonRP1 setImage:searchImageRP1 forState:UIControlStateNormal];
		// add targets and actions
		[searchButtonRP1 addTarget:self action:@selector(searchClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage1 addSubview:searchButtonRP1];
		
		chaptersButtonRP1 = [UIButton buttonWithType:UIButtonTypeCustom];
		chaptersButtonRP1.frame = CGRectMake(33, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *chaptersImageRP1 = [UIImage imageNamed:@"ChaptersButton.png"];
		[chaptersButtonRP1 setImage:chaptersImageRP1 forState:UIControlStateNormal];
		// add targets and actions
		[chaptersButtonRP1 addTarget:self action:@selector(chaptersClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage1 addSubview:chaptersButtonRP1];
		
		bookmarksButtonRP1 = [UIButton buttonWithType:UIButtonTypeCustom];
		bookmarksButtonRP1.frame = CGRectMake(85, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *bookmarksImageRP1 = [UIImage imageNamed:@"BookmarksButton.png"];
		[bookmarksButtonRP1 setImage:bookmarksImageRP1 forState:UIControlStateNormal];
		// add targets and actions
		[bookmarksButtonRP1 addTarget:self action:@selector(bookmarksClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage1 addSubview:bookmarksButtonRP1];
		
		UIButton *enlargeButtonRP1 = [UIButton buttonWithType:UIButtonTypeCustom];
		enlargeButtonRP1.frame = CGRectMake(428, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *enlargeImageRP1 = [UIImage imageNamed:@"EnlargeButton.png"];
		[enlargeButtonRP1 setImage:enlargeImageRP1 forState:UIControlStateNormal];
		// add targets and actions
		[enlargeButtonRP1 addTarget:self action:@selector(enlargeClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage1 addSubview:enlargeButtonRP1];
		
		
		webViewRP1 = [[UIWebView alloc] initWithFrame:CGRectMake(30, 53, 440, 640)];
		webViewRP1.delegate = self;
		//previousTextRP1 = @"Sing, O goddess, the anger of Achilles son of Peleus, that brought countless ills upon the Achaeans. Many a brave soul did it send hurrying down to Hades, and many a hero did it yield a prey to dogs and vultures, for so were the counsels of Jove fulfilled from the day on which the son of Atreus, king of men, and great Achilles, first fell out with one another.";
		//uniqueTextRP1 = @"And which of the gods was it that set them on to quarrel? It was the son of Jove and Leto; for he was angry with the king and sent a pestilence upon the host to plague the people, because the son of Atreus had dishonoured Chryses his priest. Now Chryses had come to the ships of the Achaeans to free his daughter, and had brought with him a great ransom: moreover he bore in his hand the sceptre of Apollo wreathed with a suppliant's wreath and he besought the Achaeans, but most of all the two sons of Atreus, who were their chiefs.";
		
		webViewRP1.opaque = NO;
		webViewRP1.backgroundColor = [UIColor clearColor];
		[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		////[htmlRP1 release];
		//webViewRP1.userInteractionEnabled = NO;
		[rightPage1 addSubview:webViewRP1];
		
		lblBookRP1 = [[UILabel alloc] initWithFrame:CGRectMake(204, 12, 200, 40)];
		lblBookRP1.backgroundColor = [UIColor clearColor];
		lblBookRP1.font = [UIFont fontWithName:@"Cochin" size:24.0];
		lblBookRP1.textColor = [UIColor brownColor];
		lblBookRP1.text = @"Iliad - Book 1";
		[rightPage1 addSubview:lblBookRP1];
		
		lblPageRP1 = [[UILabel alloc] initWithFrame:CGRectMake(238, 682, 200, 40)];
		lblPageRP1.backgroundColor = [UIColor clearColor];
		lblPageRP1.font = [UIFont fontWithName:@"Cochin" size:16.0];
		lblPageRP1.textColor = [UIColor brownColor];
		lblPageRP1.text = @"-page 1-";
		[rightPage1 addSubview:lblPageRP1];
		
		
		UIImage * gradientTopRP1 = [UIImage imageNamed:@"pageDissolveTop.png"];
		UIImageView *gradientTopVRP1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 52, 448, 24)];
		[gradientTopVRP1 setImage:gradientTopRP1];
		[rightPage1 addSubview:gradientTopVRP1];
		
		UIImage * gradientBottomRP1 = [UIImage imageNamed:@"pageDissolveBottom.png"];
		UIImageView *gradientBottomVRP1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 670, 448, 24)];
		[gradientBottomVRP1 setImage:gradientBottomRP1];
		[rightPage1 addSubview:gradientBottomVRP1];
		
		UIImage * scrollRP1 = [UIImage imageNamed:@"grey.jpg"];
		UIImageView *scrollVRP1 = [[UIImageView alloc] initWithFrame:CGRectMake(463, 50, 5, 642)];
		[scrollVRP1 setImage:scrollRP1];
		[rightPage1 addSubview:scrollVRP1];
		
		ribbonButtonRP1 = [UIButton buttonWithType:UIButtonTypeCustom];
		ribbonButtonRP1.frame = CGRectMake(356, 0, 59, 56); // position in the parent view and set the size of the button
		UIImage *ribbonImageRP1 = [UIImage imageNamed:@"ribbon.png"];
		[ribbonButtonRP1 setImage:ribbonImageRP1 forState:UIControlStateNormal];
		// add targets and actions
		[ribbonButtonRP1 addTarget:self action:@selector(ribbonClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		ribbonButtonRP1.alpha = 0.0;
		[rightPage1 addSubview:ribbonButtonRP1];
		
		
		CGRect frameRP1 = CGRectMake(459.0, 693.0, 30.0, 30.0);
		activityIndicatorRP1 = [[UIActivityIndicatorView alloc] initWithFrame:frameRP1];
		activityIndicatorRP1.hidesWhenStopped = YES;
		activityIndicatorRP1.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
		//[activityIndicatorRP1 startAnimating];
		[activityIndicatorRP1 sizeToFit];
		activityIndicatorRP1.alpha = .5;
		[rightPage1 addSubview:activityIndicatorRP1];
		
		//------------------------
		//    LEFT PAGE INIT (VIEW 2)
		//------------------------		
		
		leftPage2 = [[[UIView alloc] initWithFrame:CGRectMake(16, 12, 496, 726)] autorelease];
		leftPage2.backgroundColor = [UIColor grayColor];
		[self.view addSubview:leftPage2];
		leftPage2.alpha = 1.0;
		
		UIImage * imageLP2 = [UIImage imageNamed:@"12r.jpg"];
		imagevLP2 = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 495, 725)];
		[imagevLP2 setImage:imageLP2];
		[leftPage2 addSubview:imagevLP2];
		
		UIImage * imagePageOnTopLP2 = [UIImage imageNamed:@"leftOnTop.png"];
		UIImageView *imagevPageOnTopLP2 = [[UIImageView alloc] initWithImage:imagePageOnTopLP2];
		[leftPage2 addSubview:imagevPageOnTopLP2];
		

		
		//------------------------
		//    RIGHT PAGE INIT (VIEW 2)
		//------------------------		
		
		rightPage2 = [[[UIView alloc] initWithFrame:CGRectMake(512, 12, 496, 726)] autorelease];
		rightPage2.backgroundColor = [UIColor grayColor];
		[self.view addSubview:rightPage2];
		rightPage2.alpha = 1.0;
		
		
		
		UIImage * imageRP2 = [UIImage imageNamed:@"right.png"];
		UIImageView *imagevRP2 = [[UIImageView alloc] initWithImage:imageRP2];
		[rightPage2 addSubview:imagevRP2];
		
		
		

		
		
		
		
		searchButtonRP2 = [UIButton buttonWithType:UIButtonTypeCustom];
		searchButtonRP2.frame = CGRectMake(137, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *searchImageRP2 = [UIImage imageNamed:@"SearchButton.png"];
		[searchButtonRP2 setImage:searchImageRP2 forState:UIControlStateNormal];
		// add targets and actions
		[searchButtonRP2 addTarget:self action:@selector(searchClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage2 addSubview:searchButtonRP2];
		
		chaptersButtonRP2 = [UIButton buttonWithType:UIButtonTypeCustom];
		chaptersButtonRP2.frame = CGRectMake(33, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *chaptersImageRP2 = [UIImage imageNamed:@"ChaptersButton.png"];
		[chaptersButtonRP2 setImage:chaptersImageRP2 forState:UIControlStateNormal];
		// add targets and actions
		[chaptersButtonRP2 addTarget:self action:@selector(chaptersClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage2 addSubview:chaptersButtonRP2];
		
		bookmarksButtonRP2 = [UIButton buttonWithType:UIButtonTypeCustom];
		bookmarksButtonRP2.frame = CGRectMake(85, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *bookmarksImageRP2 = [UIImage imageNamed:@"BookmarksButton.png"];
		[bookmarksButtonRP2 setImage:bookmarksImageRP2 forState:UIControlStateNormal];
		// add targets and actions
		[bookmarksButtonRP2 addTarget:self action:@selector(bookmarksClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage2 addSubview:bookmarksButtonRP2];
		
		UIButton *enlargeButtonRP2 = [UIButton buttonWithType:UIButtonTypeCustom];
		enlargeButtonRP2.frame = CGRectMake(428, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *enlargeImageRP2 = [UIImage imageNamed:@"EnlargeButton.png"];
		[enlargeButtonRP2 setImage:enlargeImageRP2 forState:UIControlStateNormal];
		// add targets and actions
		[enlargeButtonRP2 addTarget:self action:@selector(enlargeClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage2 addSubview:enlargeButtonRP2];
		
		
		webViewRP2 = [[UIWebView alloc] initWithFrame:CGRectMake(30, 53, 440, 640)];
		webViewRP2.delegate = self;
		
		webViewRP2.opaque = NO;
		webViewRP2.backgroundColor = [UIColor clearColor];
		[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP2 release];
		//webViewRP2.userInteractionEnabled = NO;
		[rightPage2 addSubview:webViewRP2];
		
		lblBookRP2 = [[UILabel alloc] initWithFrame:CGRectMake(204, 12, 200, 40)];
		lblBookRP2.backgroundColor = [UIColor clearColor];
		lblBookRP2.font = [UIFont fontWithName:@"Cochin" size:24.0];
		lblBookRP2.textColor = [UIColor brownColor];
		lblBookRP2.text = @"Iliad - Book 1";
		[rightPage2 addSubview:lblBookRP2];
		
		lblPageRP2 = [[UILabel alloc] initWithFrame:CGRectMake(238, 682, 200, 40)];
		lblPageRP2.backgroundColor = [UIColor clearColor];
		lblPageRP2.font = [UIFont fontWithName:@"Cochin" size:16.0];
		lblPageRP2.textColor = [UIColor brownColor];
		lblPageRP2.text = @"-page 1-";
		[rightPage2 addSubview:lblPageRP2];
		
		UIImage * gradientTopRP2 = [UIImage imageNamed:@"pageDissolveTop.png"];
		UIImageView *gradientTopVRP2 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 52, 448, 24)];
		[gradientTopVRP2 setImage:gradientTopRP2];
		[rightPage2 addSubview:gradientTopVRP2];
		
		UIImage * gradientBottomRP2 = [UIImage imageNamed:@"pageDissolveBottom.png"];
		UIImageView *gradientBottomVRP2 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 670, 448, 24)];
		[gradientBottomVRP2 setImage:gradientBottomRP2];
		[rightPage2 addSubview:gradientBottomVRP2];
		
		UIImage * scrollRP2 = [UIImage imageNamed:@"grey.jpg"];
		UIImageView *scrollVRP2 = [[UIImageView alloc] initWithFrame:CGRectMake(463, 50, 5, 642)];
		[scrollVRP2 setImage:scrollRP2];
		[rightPage2 addSubview:scrollVRP2];
		
		
		ribbonButtonRP2 = [UIButton buttonWithType:UIButtonTypeCustom];
		ribbonButtonRP2.frame = CGRectMake(356, 0, 59, 56); // position in the parent view and set the size of the button
		UIImage *ribbonImageRP2 = [UIImage imageNamed:@"ribbon.png"];
		[ribbonButtonRP2 setImage:ribbonImageRP2 forState:UIControlStateNormal];
		// add targets and actions
		[ribbonButtonRP2 addTarget:self action:@selector(ribbonClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		ribbonButtonRP2.alpha = 0.0;
		
		[rightPage2 addSubview:ribbonButtonRP2];
		
		CGRect frameRP2 = CGRectMake(459.0, 693.0, 30.0, 30.0);
		activityIndicatorRP2 = [[UIActivityIndicatorView alloc] initWithFrame:frameRP2];
		activityIndicatorRP2.hidesWhenStopped = YES;
		activityIndicatorRP2.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
		//[activityIndicatorRP2 startAnimating];
		[activityIndicatorRP2 sizeToFit];
		activityIndicatorRP2.alpha = .5;

		[rightPage2 addSubview:activityIndicatorRP2];
		
		//------------------------
		// NEXT LEFT INIT PAGE (VIEW 3)
		//------------------------		
		
		leftPage3 = [[[UIView alloc] initWithFrame:CGRectMake(16, 12, 496, 726)] autorelease];
		leftPage3.backgroundColor = [UIColor grayColor];
		[self.view addSubview:leftPage3];
		leftPage3.alpha = 0.0;
		
		UIImage * imageLP3 = [UIImage imageNamed:@"2.jpg"];
		imagevLP3 = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 495, 725)];
		[imagevLP3 setImage:imageLP3];
		[leftPage3 addSubview:imagevLP3];
		
		UIImage * imagePageOnTopLP3 = [UIImage imageNamed:@"leftOnTop.png"];
		UIImageView *imagevPageOnTopLP3 = [[UIImageView alloc] initWithImage:imagePageOnTopLP3];
		[leftPage3 addSubview:imagevPageOnTopLP3];
		
		
		//------------------------
		// NEXT RIGHT INIT PAGE (VIEW 3)
		//------------------------		
		
		rightPage3 = [[[UIView alloc] initWithFrame:CGRectMake(512, 12, 496, 726)] autorelease];
		rightPage3.backgroundColor = [UIColor grayColor];
		[self.view addSubview:rightPage3];
		rightPage3.alpha = 0.0;
		
		UIImage * imageRP3 = [UIImage imageNamed:@"right.png"];
		UIImageView *imagevRP3 = [[UIImageView alloc] initWithImage:imageRP3];
		[rightPage3 addSubview:imagevRP3];

		
		searchButtonRP3 = [UIButton buttonWithType:UIButtonTypeCustom];
		searchButtonRP3.frame = CGRectMake(137, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *searchImageRP3 = [UIImage imageNamed:@"SearchButton.png"];
		[searchButtonRP3 setImage:searchImageRP3 forState:UIControlStateNormal];
		// add targets and actions
		[searchButtonRP3 addTarget:self action:@selector(searchClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage3 addSubview:searchButtonRP3];
		
		chaptersButtonRP3 = [UIButton buttonWithType:UIButtonTypeCustom];
		chaptersButtonRP3.frame = CGRectMake(33, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *chaptersImageRP3 = [UIImage imageNamed:@"ChaptersButton.png"];
		[chaptersButtonRP3 setImage:chaptersImageRP3 forState:UIControlStateNormal];
		// add targets and actions
		[chaptersButtonRP3 addTarget:self action:@selector(chaptersClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage3 addSubview:chaptersButtonRP3];
		
		bookmarksButtonRP3 = [UIButton buttonWithType:UIButtonTypeCustom];
		bookmarksButtonRP3.frame = CGRectMake(85, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *bookmarksImageRP3 = [UIImage imageNamed:@"BookmarksButton.png"];
		[bookmarksButtonRP3 setImage:bookmarksImageRP3 forState:UIControlStateNormal];
		// add targets and actions
		[bookmarksButtonRP3 addTarget:self action:@selector(bookmarksClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage3 addSubview:bookmarksButtonRP3];
		
		UIButton *enlargeButtonRP3 = [UIButton buttonWithType:UIButtonTypeCustom];
		enlargeButtonRP3.frame = CGRectMake(428, 16, 44, 33); // position in the parent view and set the size of the button
		UIImage *enlargeImageRP3 = [UIImage imageNamed:@"EnlargeButton.png"];
		[enlargeButtonRP3 setImage:enlargeImageRP3 forState:UIControlStateNormal];
		// add targets and actions
		[enlargeButtonRP3 addTarget:self action:@selector(enlargeClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		[rightPage3 addSubview:enlargeButtonRP3];
		
		
		webViewRP3 = [[UIWebView alloc] initWithFrame:CGRectMake(30, 53, 440, 640)];
		webViewRP3.delegate = self;
		
		webViewRP3.opaque = NO;
		webViewRP3.backgroundColor = [UIColor clearColor];
		[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP3 release];
		//webViewRP3.userInteractionEnabled = NO;
		[rightPage3 addSubview:webViewRP3];
		
		lblBookRP3 = [[UILabel alloc] initWithFrame:CGRectMake(204, 12, 200, 40)];
		lblBookRP3.backgroundColor = [UIColor clearColor];
		lblBookRP3.font = [UIFont fontWithName:@"Cochin" size:24.0];
		lblBookRP3.textColor = [UIColor brownColor];
		lblBookRP3.text = @"Iliad - Book I";
		[rightPage3 addSubview:lblBookRP3];
		
		lblPageRP3 = [[UILabel alloc] initWithFrame:CGRectMake(238, 682, 200, 40)];
		lblPageRP3.backgroundColor = [UIColor clearColor];
		lblPageRP3.font = [UIFont fontWithName:@"Cochin" size:16.0];
		lblPageRP3.textColor = [UIColor brownColor];
		lblPageRP3.text = @"-page 1-";
		[rightPage3 addSubview:lblPageRP3];
		
		UIImage * gradientTopRP3 = [UIImage imageNamed:@"pageDissolveTop.png"];
		UIImageView *gradientTopVRP3 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 52, 448, 24)];
		[gradientTopVRP3 setImage:gradientTopRP3];
		[rightPage3 addSubview:gradientTopVRP3];
		
		UIImage * gradientBottomRP3 = [UIImage imageNamed:@"pageDissolveBottom.png"];
		UIImageView *gradientBottomVRP3 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 670, 448, 24)];
		[gradientBottomVRP3 setImage:gradientBottomRP3];
		[rightPage3 addSubview:gradientBottomVRP3];
		
		UIImage * scrollRP3 = [UIImage imageNamed:@"grey.jpg"];
		UIImageView *scrollVRP3 = [[UIImageView alloc] initWithFrame:CGRectMake(463, 50, 5, 642)];
		[scrollVRP3 setImage:scrollRP3];
		[rightPage3 addSubview:scrollVRP3];
		
		
		
		ribbonButtonRP3 = [UIButton buttonWithType:UIButtonTypeCustom];
		ribbonButtonRP3.frame = CGRectMake(356, 0, 59, 56); // position in the parent view and set the size of the button
		UIImage *ribbonImageRP3 = [UIImage imageNamed:@"ribbon.png"];
		[ribbonButtonRP3 setImage:ribbonImageRP3 forState:UIControlStateNormal];
		// add targets and actions
		[ribbonButtonRP3 addTarget:self action:@selector(ribbonClicked) forControlEvents:UIControlEventTouchUpInside];
		// add to a view
		ribbonButtonRP3.alpha = 0.0;
		[rightPage3 addSubview:ribbonButtonRP3];
		
		CGRect frameRP3 = CGRectMake(459.0, 693.0, 30.0, 30.0);
		activityIndicatorRP3 = [[UIActivityIndicatorView alloc] initWithFrame:frameRP3];
		activityIndicatorRP3.hidesWhenStopped = YES;
		activityIndicatorRP3.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
		//[activityIndicatorRP3 startAnimating];
		[activityIndicatorRP3 sizeToFit];
		activityIndicatorRP3.alpha = .5;
		
		[rightPage3 addSubview:activityIndicatorRP3];
		
		//folioImageName = [[NSMutableString alloc] init];
		//previousFolioImageName = [[NSMutableString alloc] init];
		//nextFolioImageName = [[NSMutableString alloc] init];
		
		
		webScrollValueRP1 = 0;
		webScrollValueRP2 = 0;
		webScrollValueRP3 = 0;
		NSTimer * webScroll = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webScroll) userInfo:nil repeats:YES];

		
		lastTurnDirection = 0;
		
		[leavesView changeCurrentPageIndex:4];

		didJustTurnLeft = NO;
		
		viewOn = 2;

		allowedToTurnPage = YES;

		threeDOn = NO;
		
		mainDelegate = (IliadAppDelegate *)[[UIApplication sharedApplication]delegate];
		
		prevBook = [[NSMutableString alloc] init];
		[prevBook setString:@""];
		
		book = [[NSMutableString alloc] init];
		[book setString:@""];
		
		nextBook = [[NSMutableString alloc] init];
		[nextBook setString:@""];
		
		folio = [[NSMutableString alloc] init];
		[folio setString:@"12r"];
		
		prevFolio = [[NSMutableString alloc] init];
		[prevFolio setString:@""];

		nextFolio = [[NSMutableString alloc] init];
		[nextFolio setString:@""];

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
		
		
		webViewRP1.opaque = NO;
		webViewRP2.opaque = NO;
		webViewRP3.opaque = NO;
		for (int x = 0; x < 10; ++x) { [[[[[webViewRP1 subviews] objectAtIndex:0] subviews] objectAtIndex:x] setHidden:YES]; }
		for (int x = 0; x < 10; ++x) { [[[[[webViewRP2 subviews] objectAtIndex:0] subviews] objectAtIndex:x] setHidden:YES]; }
		for (int x = 0; x < 10; ++x) { [[[[[webViewRP3 subviews] objectAtIndex:0] subviews] objectAtIndex:x] setHidden:YES]; }
		//folioC = "12r";
		

	
		
		
		

		
		
		
		
		UIImage * threeDBackgroundImage = [UIImage imageNamed:@"gradient.png"];
		threeDBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 748)];
		[threeDBackground setImage:threeDBackgroundImage];
		threeDBackground.alpha = 0.0;
		[self.view addSubview:threeDBackground];
		
		
		UIImage * sB1 = [UIImage imageNamed:@"bar.png"];
		statusBar1 = [[UIImageView alloc] initWithFrame:CGRectMake(393, 361, 239, 27)];
		[statusBar1 setImage:sB1];
		statusBar1.alpha = 0.0;
		[self.view addSubview:statusBar1];
		
		UIImage * sB2 = [UIImage imageNamed:@"rod.png"];
		statusBar2 = [[UIImageView alloc] initWithFrame:CGRectMake(405, 365, 0, 18)]; //full is 214
		[statusBar2 setImage:sB2];
		statusBar2.alpha = 0.0;
		[self.view addSubview:statusBar2];
		
		UIImage * sB3 = [UIImage imageNamed:@"cap.png"];
		statusBar3 = [[UIImageView alloc] initWithFrame:CGRectMake(393, 361, 239, 27)];
		[statusBar3 setImage:sB3];
		statusBar3.alpha = 0.0;
		[self.view addSubview:statusBar3];
		
		
		//Adds the 3D view on top, from here its just put on and off by the alpha level.
		
		GLView * m_view;
		
		m_view = [[GLView alloc] initWithFrame: CGRectMake(0, 0, 1024, 748)];
		
		enlargeView = m_view;
		
		m_view.alpha = 0.0;
		
		[self.view addSubview: m_view];  
		
		
		
		
		
		//if ([mainDelegate.bookmarksArrayOneSaved count] > 0) {
			
			//bookmarksButtonRP2.selected = YES;			
		//}
		
		
	}
	
	//[self setUpPages];
	
    return self;
}





















- (void) searchClicked { // clicked the search button
	
	
	
	if (viewOn == 1) {
		CGRect point = searchButtonRP1.frame;
		
		InfoView *infoView = [[InfoView alloc] init];
		searchPop = [[UIPopoverController alloc] initWithContentViewController:infoView];
		[searchPop setDelegate:self];
		
		
		
		
		
		
		[searchPop presentPopoverFromRect:point inView:rightPage1 permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
		[searchPop setPopoverContentSize:CGSizeMake(280, 400)];
		[infoView release];
	}
	else if (viewOn == 2) {
		CGRect point = searchButtonRP2.frame;
		
		InfoView *infoView = [[InfoView alloc] init];
		searchPop = [[UIPopoverController alloc] initWithContentViewController:infoView];
		[searchPop setDelegate:self];
		
		
		/*
		NSArray *segmentedItems = [NSArray arrayWithObjects:@"Bookmarks", @"Recents", @"Contacts", nil];
        UISegmentedControl *ctrl = [[UISegmentedControl alloc] initWithItems:segmentedItems];
        ctrl.segmentedControlStyle = UISegmentedControlStyleBar;
        ctrl.selectedSegmentIndex = 0;
		
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:ctrl];
        ctrl.frame = CGRectMake(0.0f, 5.0f, 320.0f, 30.0f);
		
        NSArray *theToolbarItems = [NSArray arrayWithObjects:item, nil];
        [searchPop setToolbarItems:theToolbarItems];
        [ctrl release]; 
        [item release];
		*/
		
		
		[searchPop presentPopoverFromRect:point inView:rightPage2 permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
		[searchPop setPopoverContentSize:CGSizeMake(280, 400)];
		[infoView release];
		
	}
	else if (viewOn == 3) {
		
		CGRect point = searchButtonRP3.frame;
		
		InfoView *infoView = [[InfoView alloc] init];
		searchPop = [[UIPopoverController alloc] initWithContentViewController:infoView];
		[searchPop setDelegate:self];
		[searchPop presentPopoverFromRect:point inView:rightPage3 permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
		[searchPop setPopoverContentSize:CGSizeMake(280, 400)];
		[infoView release];
	}
	
	
	
	
	
}

- (void) chaptersClicked {
	
	if (viewOn == 1) {
		CGRect point = chaptersButtonRP1.frame;
		ChapterView *cViewController = [[ChapterView alloc] init];
		cViewController.navigationItem.title = @"";
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:cViewController];
		chaptersPop = [[UIPopoverController alloc] initWithContentViewController:navController];
		[chaptersPop presentPopoverFromRect:point inView:rightPage1 permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
		[chaptersPop setPopoverContentSize:CGSizeMake(280, 400)];
	}
	else if (viewOn == 2){
		CGRect point = chaptersButtonRP2.frame;
		ChapterView *cViewController = [[ChapterView alloc] init];
		cViewController.navigationItem.title = @"";
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:cViewController];
		chaptersPop = [[UIPopoverController alloc] initWithContentViewController:navController];
		[chaptersPop presentPopoverFromRect:point inView:rightPage2 permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
		[chaptersPop setPopoverContentSize:CGSizeMake(280, 400)];
	}
	else if (viewOn == 3){
		CGRect point = chaptersButtonRP3.frame;
		ChapterView *cViewController = [[ChapterView alloc] init];
		cViewController.navigationItem.title = @"";
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:cViewController];
		chaptersPop = [[UIPopoverController alloc] initWithContentViewController:navController];
		[chaptersPop presentPopoverFromRect:point inView:rightPage3 permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
		[chaptersPop setPopoverContentSize:CGSizeMake(280, 400)];
	}
	
}


	
- (void) bookmarksClicked {
	
	if (viewOn == 1) {
		CGRect point = bookmarksButtonRP1.frame;
		BookmarkView *bmViewController = [[BookmarkView alloc] init];
		bmViewController.navigationItem.title = @"Bookmarks";
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:bmViewController];
		bookmarksPop = [[UIPopoverController alloc] initWithContentViewController:navController];
		[bookmarksPop presentPopoverFromRect:point inView:rightPage1 permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
		[bookmarksPop setPopoverContentSize:CGSizeMake(400, 277)];
	}
	else if (viewOn == 2){
		CGRect point = bookmarksButtonRP2.frame;
		BookmarkView *bmViewController = [[BookmarkView alloc] init];
		bmViewController.navigationItem.title = @"Bookmarks";
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:bmViewController];
		bookmarksPop = [[UIPopoverController alloc] initWithContentViewController:navController];
		[bookmarksPop presentPopoverFromRect:point inView:rightPage2 permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
		[bookmarksPop setPopoverContentSize:CGSizeMake(400, 277)];
	}
	else if (viewOn == 3){
		CGRect point = bookmarksButtonRP3.frame;
		BookmarkView *bmViewController = [[BookmarkView alloc] init];
		bmViewController.navigationItem.title = @"Bookmarks";
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:bmViewController];
		bookmarksPop = [[UIPopoverController alloc] initWithContentViewController:navController];
		[bookmarksPop presentPopoverFromRect:point inView:rightPage3 permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
		[bookmarksPop setPopoverContentSize:CGSizeMake(400, 277)];
	}
	
	NSString *bookmarksInfo = folio;

	[[NSNotificationCenter defaultCenter] postNotificationName:@"bookmarkInfo"
														object:bookmarksInfo
													  userInfo:nil];
}


- (void) remove3D: (NSNotification *)notification {
	
	[self enlargeClicked];
}



- (void) ribbonClicked { //reloads animation views now that ribbon is gone so that it dosent re-apear when animation happens
	
	int i = [mainDelegate.bookmarksArray indexOfObject:folio];
	[mainDelegate.bookmarksArray removeObjectAtIndex:i];
	[mainDelegate.bookmarksNotesArray removeObjectAtIndex:i];

	
	if (viewOn == 1) {
		ribbonButtonRP1.alpha = 0.0;
		
		leftPage3.alpha = 1.0;
		rightPage3.alpha = 1.0;
		leftPage2.alpha = 1.0;
		rightPage2.alpha = 1.0;
		
		[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
		[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
		[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
		[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
		[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
		[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
		
		[leavesView reloadData];

		leftPage3.alpha = 0.0;
		rightPage3.alpha = 0.0;
		leftPage2.alpha = 0.0;
		rightPage2.alpha = 0.0;
		
		
	}
	else if (viewOn == 2) {
		ribbonButtonRP2.alpha = 0.0;
		
		leftPage3.alpha = 1.0;
		rightPage3.alpha = 1.0;
		leftPage1.alpha = 1.0;
		rightPage1.alpha = 1.0;
		
		[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
		[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
		[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
		[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
		if ([viewsForAnimation objectAtIndex:5] == page4) {
			[viewsForAnimation replaceObjectAtIndex:5 withObject:page4];
		}
		else {
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
		}
		[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
		
		[leavesView reloadData];

		leftPage3.alpha = 0.0;
		rightPage3.alpha = 0.0;
		leftPage1.alpha = 0.0;
		rightPage1.alpha = 0.0;
		
	}
	else if (viewOn == 3) {
		ribbonButtonRP3.alpha = 0.0;
		
		leftPage2.alpha = 1.0;
		rightPage2.alpha = 1.0;
		leftPage1.alpha = 1.0;
		rightPage1.alpha = 1.0;
		
		[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
		[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
		[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
		[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
		[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
		[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
		
		[leavesView reloadData];

		leftPage2.alpha = 0.0;
		rightPage2.alpha = 0.0;
		leftPage1.alpha = 0.0;
		rightPage1.alpha = 0.0;
		
		
	}
	
}


- (NSString *) getFolioName {
	
	NSLog(@"getting folio name");
	return @"HHI";
}


- (void) enlargeClicked {
	
	NSLog(@"enlargeClicked");
	
	
	if (threeDOn) {
		//GLView * cast_view = (GLView *)enlargeView;
		//[enlargeView removeFromSuperview];
		
		
		//Removes the 3D view (alpha out)
		
		enlargeView.alpha = 0.0;
		threeDBackground.alpha = 0.0;
		statusBar1.alpha = 0.0;
		statusBar2.alpha = 0.0;
		statusBar3.alpha = 0.0;

		threeDOn = NO;
		//[enlargeView release];
	}
	else {

		
		// Starts the timer to add the 3D back

		cntr = 0;
		show3D = [NSTimer scheduledTimerWithTimeInterval: (1.0/50.0) target: self selector: @selector(show3DView) userInfo:nil repeats:YES];

		
		
		
		threeDOn = YES;
	}
	
}

- (void) show3DView {
	
	cntr++;

	//enlargeView.alpha = cntr/27.;
	
	statusBar1.alpha = cntr/29.;
	statusBar2.alpha = cntr/29.;
	//statusBar3.alpha = cntr/29.;

	
	threeDBackground.alpha = cntr/29.;

	/*
	if (cntr == 1) {
		enlargeView.alpha = .1;
		threeDBackground.alpha = 0.1;

	}
	else if (cntr == 2) {
		enlargeView.alpha = .2;
		threeDBackground.alpha = 0.15;

	}
	else if (cntr == 3) {
		enlargeView.alpha = .3;
		threeDBackground.alpha = 0.2;

	}
	else if (cntr == 4) {
		enlargeView.alpha = .4;
		threeDBackground.alpha = 0.25;

	}
	else if (cntr == 5) {
		enlargeView.alpha = .5;
		threeDBackground.alpha = 0.3;

	}
	else if (cntr == 6) {
		enlargeView.alpha = .6;
		threeDBackground.alpha = 0.35;

	}
	else if (cntr == 7) {
		enlargeView.alpha = .7;
		threeDBackground.alpha = 0.4;

	}
	else if (cntr == 8) {
		enlargeView.alpha = .8;
		threeDBackground.alpha = 0.45;

	}
	else if (cntr == 9) {
		enlargeView.alpha = .9;
		threeDBackground.alpha = 0.5;

	}
	else if (cntr == 10) {
		enlargeView.alpha = .99;
		threeDBackground.alpha = .55;

	}
*/
	if (cntr == 26) {
		totalDownloaded = 0;
		
		
		// This is where this view calls for the GLView to start reloading the 3D stuff
		
		[enlargeView passFolio:folio];

		NSLog(@"backhere");
		
		
		
		
		cntr = 0;
		[show3D invalidate];
	}
	
}


- (void) threeDPageLoaded { // Is called from a notification found in GLView that is off because it shows the view too early and you see the old folio first
	
	
	
	enlargeView.alpha = .99;
	
	statusBar1.alpha = 0.0;
	statusBar2.alpha = 0.0;
	statusBar3.alpha = 0.0;
	
	statusBar2.frame = CGRectMake(405, 365, 0, 18);

	
}



- (void) threeDPageProgress: (NSNotification *)notification { //Updates the status bar
		
		
	double info = [[notification object] doubleValue];
		
	
	totalDownloaded = totalDownloaded + info;
	
	
	//NSLog(@"DOWNLOADING: %f", totalDownloaded/3705151.0);
		

	
	
	int i = (totalDownloaded/3705151.0) * 214.0; // Needs to know acctual download size instead of arbitrary 3705151.0
	

	statusBar2.frame = CGRectMake(405, 365, i, 18);
	
	if (i == 214) {
		statusBar3.alpha = 1.0;

	}

}


- (void) back {
	
	//[m_view remove];
	
}


- (void) setUpPages { // Called from leaves view when the animation is finished
	
	if (viewOn == 1) {
		leftPage1.alpha = 1.0;
		rightPage1.alpha = 1.0;
	}
	else if (viewOn == 2) {
		leftPage2.alpha = 1.0;
		rightPage2.alpha = 1.0;
	}
	else if (viewOn == 3) {
		leftPage3.alpha = 1.0;
		rightPage3.alpha = 1.0;
	}
	
	//NSLog(@"SETUP");
}

- (void) setUpPagesTurnedLeft { // is called once page HAS TURNED left, reloads the pages on either side to make it ready for the next turn

	didJustTurnLeft = YES;
	
	[prevBook setString:@""];
	[book setString:@""];
	[nextBook setString:@""];
	
	[prevFolio setString:@""];
	//[folio setString:@""];
	[nextFolio setString:@""];

	parseDirection = 2;

	[previousText setString:@""];
	[uniqueText setString:@""];
	[uniqueLeftText setString:@""];
	[uniqueRightText setString:@""];
	[previousLeftText setString:@""];
	[previousRightText setString:@""];
	//prevFolio = NULL;
	//folio = NULL;
	//nextFolio = NULL;

	
	//[leavesView changeCurrentPageIndex:4];

	
	
	[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
	
	if (viewOn == 3) {

		viewOn = 2;
		leftPage2.alpha = 1.0;
		rightPage2.alpha = 1.0;
		[activityIndicatorRP2 startAnimating];

		
		
		if ([folio isEqualToString: @"12r"]) {
			NSLog(@"12rHERE");

		}
		else {
			previousTextRP1 = previousLeftText;
			uniqueTextRP1 = uniqueLeftText;
			htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
			[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			////[htmlRP1 release];
			[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", prevFolio]]];
			[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:prevFolio]]];
			[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", prevBook]];
			
			if ([[mainDelegate bookmarksArray] containsObject:prevFolio]) {
				ribbonButtonRP1.alpha = 1.0;
			}
			else {
				ribbonButtonRP1.alpha = 0.0;
			}

		}

		
		previousTextRP2 = previousText;
		uniqueTextRP2 = uniqueText;
		htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
		[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP2 release];
		[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", folio]]];
		[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:folio]]];
		[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", book]];

		if ([[mainDelegate bookmarksArray] containsObject:folio]) {
			ribbonButtonRP2.alpha = 1.0;
		}
		else {
			ribbonButtonRP2.alpha = 0.0;
		}
		
		previousTextRP3 = previousRightText;
		uniqueTextRP3 = uniqueRightText;
		htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
		[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP3 release];
		[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", nextFolio]]];
		[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:nextFolio]]];
		[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", nextBook]];

		if ([[mainDelegate bookmarksArray] containsObject:nextFolio]) {
			ribbonButtonRP3.alpha = 1.0;
		}
		else {
			ribbonButtonRP3.alpha = 0.0;
		}
		
		allowedToTurnPage = NO;

		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchTo2) userInfo:nil repeats:YES];
	}
	else if (viewOn == 1) {

		viewOn = 3;
		leftPage3.alpha = 1.0;
		rightPage3.alpha = 1.0;
		[activityIndicatorRP3 startAnimating];

		previousTextRP1 = previousRightText;
		uniqueTextRP1 = uniqueRightText;
		htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
		[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		////[htmlRP1 release];
		[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", nextFolio]]];
		[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:nextFolio]]];
		[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", nextBook]];

		if ([[mainDelegate bookmarksArray] containsObject:nextFolio]) {
			ribbonButtonRP1.alpha = 1.0;
		}
		else {
			ribbonButtonRP1.alpha = 0.0;
		}
		
		if ([folio isEqualToString: @"12r"]) {
			NSLog(@"12rHERE");
			
		}
		else {
		previousTextRP2 = previousLeftText;
		uniqueTextRP2 = uniqueLeftText;
		htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
		[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP2 release];
		[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", prevFolio]]];
		[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:prevFolio]]];
		[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", prevBook]];
			
			if ([[mainDelegate bookmarksArray] containsObject:prevFolio]) {
				ribbonButtonRP2.alpha = 1.0;
			}
			else {
				ribbonButtonRP2.alpha = 0.0;
			}
		}
		
		
		
		previousTextRP3 = previousText;
		uniqueTextRP3 = uniqueText;
		htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
		[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP3 release];
		[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", folio]]];
		[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:folio]]];
		[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", book]];

		if ([[mainDelegate bookmarksArray] containsObject:folio]) {
			ribbonButtonRP3.alpha = 1.0;
		}
		else {
			ribbonButtonRP3.alpha = 0.0;
		}
		
		allowedToTurnPage = NO;

		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchTo3) userInfo:nil repeats:YES];
	}
	else if (viewOn == 2) {

		viewOn = 1;
		leftPage1.alpha = 1.0;
		rightPage1.alpha = 1.0;
		[activityIndicatorRP1 startAnimating];

		previousTextRP1 = previousText;
		uniqueTextRP1 = uniqueText;
		htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
		[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		////[htmlRP1 release];
		[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", folio]]];
		[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:folio]]];
		[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", book]];

		if ([[mainDelegate bookmarksArray] containsObject:folio]) {
			ribbonButtonRP1.alpha = 1.0;
		}
		else {
			ribbonButtonRP1.alpha = 0.0;
		}
		
		previousTextRP2 = previousRightText;
		uniqueTextRP2 = uniqueRightText;
		htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
		[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP2 release];
		[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", nextFolio]]];
		[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:nextFolio]]];
		[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", nextBook]];

		if ([[mainDelegate bookmarksArray] containsObject:nextFolio]) {
			ribbonButtonRP2.alpha = 1.0;
		}
		else {
			ribbonButtonRP2.alpha = 0.0;
		}
		
		if ([folio isEqualToString: @"12r"]) {
			NSLog(@"12rHERE");
			
		}
		else {
		previousTextRP3 = previousLeftText;
		uniqueTextRP3 = uniqueLeftText;
		htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
		[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP3 release];
		[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", prevFolio]]];
		[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:prevFolio]]];
		[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", prevBook]];
			
			if ([[mainDelegate bookmarksArray] containsObject:prevFolio]) {
				ribbonButtonRP3.alpha = 1.0;
			}
			else {
				ribbonButtonRP3.alpha = 0.0;
			}
		}
		
		allowedToTurnPage = NO;

		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchTo1) userInfo:nil repeats:YES];
	}
	
	
	//NSLog(@"SETUPTL");
}

- (void) setUpPagesTurnedRight {
	
	//[leavesView changeCurrentPageIndex:4];
		
	[prevBook setString:@""];
	[book setString:@""];
	[nextBook setString:@""];
	
	[prevFolio setString:@""];
	//[folio setString:@""];
	[nextFolio setString:@""];
	
	parseDirection = 3;
	[previousText setString:@""];
	[uniqueText setString:@""];
	[uniqueLeftText setString:@""];
	[uniqueRightText setString:@""];
	[previousLeftText setString:@""];
	[previousRightText setString:@""];
	
	[self performSelectorOnMainThread:@selector(startfileparsing) withObject:nil waitUntilDone:YES];
	
	if (viewOn == 1) {
		viewOn = 2;
		leftPage2.alpha = 1.0;
		rightPage2.alpha = 1.0;
		[activityIndicatorRP2 startAnimating];

		previousTextRP1 = previousLeftText;
		uniqueTextRP1 = uniqueLeftText;
		htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
		[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		////[htmlRP1 release];
		[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", prevFolio]]];
		[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:prevFolio]]];
		[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", prevBook]];

		if ([[mainDelegate bookmarksArray] containsObject:prevFolio]) {
			ribbonButtonRP1.alpha = 1.0;
		}
		else {
			ribbonButtonRP1.alpha = 0.0;
		}
		
		
		previousTextRP2 = previousText;
		uniqueTextRP2 = uniqueText;
		htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
		[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP2 release];
		[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", folio]]];
		[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:folio]]];
		[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", book]];

		if ([[mainDelegate bookmarksArray] containsObject:folio]) {
			ribbonButtonRP2.alpha = 1.0;
		}
		else {
			ribbonButtonRP2.alpha = 0.0;
		}
		
		
		if ([folio isEqualToString: @"326v"]) {
			NSLog(@"326vHERE");
			
		}
		else {
			
		previousTextRP3 = previousRightText;
		uniqueTextRP3 = uniqueRightText;
		htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
		[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP3 release];
		[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", nextFolio]]];
		[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:nextFolio]]];
			[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", nextBook]];

			if ([[mainDelegate bookmarksArray] containsObject:nextFolio]) {
				ribbonButtonRP3.alpha = 1.0;
			}
			else {
				ribbonButtonRP3.alpha = 0.0;
			}
		}
		allowedToTurnPage = NO;
		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchTo2) userInfo:nil repeats:YES];
	}
	else if (viewOn == 2) {
		viewOn = 3;
		leftPage3.alpha = 1.0;
		rightPage3.alpha = 1.0;
		
		[activityIndicatorRP3 startAnimating];

		if ([folio isEqualToString: @"326v"]) {
			NSLog(@"326vHERE");
			
		}
		else {
		previousTextRP1 = previousRightText;
		uniqueTextRP1 = uniqueRightText;
		htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
		[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP1 release];
		[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", nextFolio]]];
		[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:nextFolio]]];
		[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", nextBook]];
			
			if ([[mainDelegate bookmarksArray] containsObject:nextFolio]) {
				ribbonButtonRP1.alpha = 1.0;
			}
			else {
				ribbonButtonRP1.alpha = 0.0;
			}
		}
		
		previousTextRP2 = previousLeftText;
		uniqueTextRP2 = uniqueLeftText;
		htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
		[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP2 release];
		[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", prevFolio]]];
		[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:prevFolio]]];
		[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", prevBook]];

		if ([[mainDelegate bookmarksArray] containsObject:prevFolio]) {
			ribbonButtonRP2.alpha = 1.0;
		}
		else {
			ribbonButtonRP2.alpha = 0.0;
		}
		
		previousTextRP3 = previousText;
		uniqueTextRP3 = uniqueText;
		htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
		[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP3 release];
		[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", folio]]];
		[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:folio]]];
		[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", book]];

		if ([[mainDelegate bookmarksArray] containsObject:folio]) {
			ribbonButtonRP3.alpha = 1.0;
		}
		else {
			ribbonButtonRP3.alpha = 0.0;
		}
		
		
		allowedToTurnPage = NO;
		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchTo3) userInfo:nil repeats:YES];
	}
	else if (viewOn == 3) {
		viewOn = 1;
		leftPage1.alpha = 1.0;
		rightPage1.alpha = 1.0;
		[activityIndicatorRP1 startAnimating];

		
		previousTextRP1 = previousText;
		uniqueTextRP1 = uniqueText;
		htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
		[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP1 release];
		[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", folio]]];
		[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:folio]]];
		[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", book]];

		if ([[mainDelegate bookmarksArray] containsObject:folio]) {
			ribbonButtonRP1.alpha = 1.0;
		}
		else {
			ribbonButtonRP1.alpha = 0.0;
		}
		
		if ([folio isEqualToString: @"326v"]) {
			NSLog(@"326vHERE");
			
		}
		else {
		previousTextRP2 = previousRightText;
		uniqueTextRP2 = uniqueRightText;
		htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
		[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP2 release];
		[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", nextFolio]]];
		[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:nextFolio]]];
		[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", nextBook]];
			
			if ([[mainDelegate bookmarksArray] containsObject:nextFolio]) {
				ribbonButtonRP2.alpha = 1.0;
			}
			else {
				ribbonButtonRP2.alpha = 0.0;
			}
		}
		
		previousTextRP3 = previousLeftText;
		uniqueTextRP3 = uniqueLeftText;
		htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
		[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP3 release];
		[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", prevFolio]]];
		[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:prevFolio]]];
		[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", prevBook]];

		if ([[mainDelegate bookmarksArray] containsObject:prevFolio]) {
			ribbonButtonRP3.alpha = 1.0;
		}
		else {
			ribbonButtonRP3.alpha = 0.0;
		}
		
		allowedToTurnPage = NO;
		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchTo1) userInfo:nil repeats:YES];
	}


	//NSLog(@"SETUPTR");
}

- (void) webWaitSwitchTo1 {
	
	if (!webViewRP1.loading && !webViewRP2.loading && !webViewRP3.loading)
	{
		cntr++;
		
		if (cntr == 3) {
			[activityIndicatorRP1 stopAnimating];

			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			
			[leavesView reloadData];
			
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			[webWait invalidate];
			allowedToTurnPage = YES;
			

			cntr = 0;
			
			//n//[self saveStuff];

		}
	}
}

- (void) webWaitSwitchTo2 {
	
	if (!webViewRP1.loading && !webViewRP2.loading && !webViewRP3.loading)
	{
		cntr++;
		
		if (cntr == 3) {
			[activityIndicatorRP2 stopAnimating];

			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
			
			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			
			[webWait invalidate];
			allowedToTurnPage = YES;
			

			cntr = 0;
			
			//n//[self saveStuff];

		}
	}
}

- (void) webWaitSwitchTo3 {
	
	if (!webViewRP1.loading && !webViewRP2.loading && !webViewRP3.loading)
	{
		cntr++;
		
		if (cntr == 3) {
			[activityIndicatorRP3 stopAnimating];

			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			
			[webWait invalidate];
			allowedToTurnPage = YES;
			

			
			cntr = 0;
			
			//n//[self saveStuff];

		}

	}
}






//////SeARCH TURN STUFF



- (void) setUpPagesTurnedRightSearch {
	
		if (viewOn == 1) {
			
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			viewOn = 2;
		}
		else if (viewOn == 2) {
			
			
			
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			viewOn = 3;
			
		}
		else if (viewOn == 3) {
			
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			
			viewOn = 1;
		}
		
		[leavesView setTypeOfTurn:1];
		
		[self performSelector:@selector(highlightText) withObject:nil afterDelay:0.5];
	
	//n//[self saveStuff];

					  
}

- (void) setUpPagesTurnedLeftSearch {

		if (viewOn == 1) {
			
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			viewOn = 3;
		}
		else if (viewOn == 2) {
			
			
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			
			viewOn = 1;
			
		}
		else if (viewOn == 3) {
			
			
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			viewOn = 2;
		}
		
		[leavesView setTypeOfTurn:1];
			
		[self performSelector:@selector(highlightText) withObject:nil afterDelay:0.5];

	//n//[self saveStuff];


}





- (NSInteger) highlightAllOccurencesOfString:(NSString*)str
{
	NSLog(@"%@",str);
	if (viewOn == 1) {
		NSString *pathJS = [[NSBundle mainBundle] pathForResource:@"highlightSearchWord" ofType:@"js"];
		NSString *jsCode = [NSString stringWithContentsOfFile:pathJS encoding:NSUTF8StringEncoding error:nil];
		[webViewRP1 stringByEvaluatingJavaScriptFromString:jsCode];
		NSString *startSearch = [NSString stringWithFormat:@"MyApp_HighlightAllOccurencesOfString('%@')",str];
		[webViewRP1 stringByEvaluatingJavaScriptFromString:startSearch];
		NSString *result = [webViewRP1 stringByEvaluatingJavaScriptFromString:@"MyApp_SearchResultCount"];
		NSLog(@"result:%@", result);
		return [result integerValue];
	}
	
	if (viewOn == 2) {
		NSString *pathJS = [[NSBundle mainBundle] pathForResource:@"highlightSearchWord" ofType:@"js"];
		NSString *jsCode = [NSString stringWithContentsOfFile:pathJS encoding:NSUTF8StringEncoding error:nil];
		[webViewRP2 stringByEvaluatingJavaScriptFromString:jsCode];
		NSString *startSearch = [NSString stringWithFormat:@"MyApp_HighlightAllOccurencesOfString('%@')",str];
		[webViewRP2 stringByEvaluatingJavaScriptFromString:startSearch];
		NSString *result = [webViewRP2 stringByEvaluatingJavaScriptFromString:@"MyApp_SearchResultCount"];
		NSLog(@"result:%@", result);
		return [result integerValue];
	}
	
	if (viewOn == 3) {
		NSString *pathJS = [[NSBundle mainBundle] pathForResource:@"highlightSearchWord" ofType:@"js"];
		NSString *jsCode = [NSString stringWithContentsOfFile:pathJS encoding:NSUTF8StringEncoding error:nil];
		[webViewRP3 stringByEvaluatingJavaScriptFromString:jsCode];
		NSString *startSearch = [NSString stringWithFormat:@"MyApp_HighlightAllOccurencesOfString('%@')",str];
		[webViewRP3 stringByEvaluatingJavaScriptFromString:startSearch];
		NSString *result = [webViewRP3 stringByEvaluatingJavaScriptFromString:@"MyApp_SearchResultCount"];
		NSLog(@"result:%@", result);
		return [result integerValue];
	}
}

- (void)removeAllHighlights
{
	/*
	if (viewOn == 1) {

		[webViewRP1 stringByEvaluatingJavaScriptFromString:@"MyApp_RemoveAllHighlights()"];
	}
	else if (viewOn == 2) {
		
		[webViewRP2 stringByEvaluatingJavaScriptFromString:@"MyApp_RemoveAllHighlights()"];

	}
	else if (viewOn == 3) {
		
		[webViewRP3 stringByEvaluatingJavaScriptFromString:@"MyApp_RemoveAllHighlights()"];

	}
	 */
}


- (void)highlightText
{
	NSLog(@"WE ARE DOING IT highlightText %@", [pageData objectForKey:@"searchedText"]);
	
	[self highlightAllOccurencesOfString:[NSString stringWithFormat:@"%@", [pageData objectForKey:@"searchedText"] ]];
	
	
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

//RIGHT SEARCH

- (void) webWaitSwitchSearchTo1 {
	
	if (!webViewRP1.loading && !webViewRP2.loading && !webViewRP3.loading)
	{
		cntr ++;
		if (cntr == 3)
		{
		leftPage2.alpha = 1.0;
		rightPage2.alpha = 1.0;
		
		leftPage3.alpha = 1.0;
		rightPage3.alpha = 1.0;
		
			if (didJustTurnLeft == NO) {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
				didJustTurnLeft = NO;

			}

		[leavesView reloadData];
		
		leftPage2.alpha = 0.0;
		rightPage2.alpha = 0.0;
		
		//leftPage1.alpha = 1.0;
		//rightPage1.alpha = 1.0;
		
		leftPage3.alpha = 0.0;
		rightPage3.alpha = 0.0;
		
		allowedToTurnPage = YES;
		
		[webWait invalidate];
		}
	}
}

- (void) webWaitSwitchSearchTo2 {
	
	if (!webViewRP1.loading && !webViewRP2.loading && !webViewRP3.loading)
	{
		cntr ++;
		if (cntr == 3)
		{
		leftPage1.alpha = 1.0;
		rightPage1.alpha = 1.0;
		
		leftPage3.alpha = 1.0;
		rightPage3.alpha = 1.0;
		
	if (didJustTurnLeft == NO) {
		[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
		[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
		[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
		[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
		[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
		[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
	}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
				didJustTurnLeft = NO;

			}

		
		[leavesView reloadData];

		leftPage1.alpha = 0.0;
		rightPage1.alpha = 0.0;
		
		
		//leftPage2.alpha = 1.0;
		//rightPage2.alpha = 1.0;
		
		
		leftPage3.alpha = 0.0;
		rightPage3.alpha = 0.0;
		
		allowedToTurnPage = YES;
		
		[webWait invalidate];
		}
	}
}

- (void) webWaitSwitchSearchTo3 {
	
	if (!webViewRP1.loading && !webViewRP2.loading && !webViewRP3.loading)
	{
		cntr ++;
		if (cntr == 3)
		{
		leftPage1.alpha = 1.0;
		rightPage1.alpha = 1.0;
		
		leftPage2.alpha = 1.0;
		rightPage2.alpha = 1.0;
	
			if (didJustTurnLeft == NO) {

		[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
		[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
		[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
		[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
		[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
		[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
				didJustTurnLeft = NO;
			}

		[leavesView reloadData];
		
		leftPage1.alpha = 0.0;
		rightPage1.alpha = 0.0;
		
		leftPage2.alpha = 0.0;
		rightPage2.alpha = 0.0;
		
		//leftPage3.alpha = 1.0;
		//rightPage3.alpha = 1.0;
		
		allowedToTurnPage = YES;
		
		[webWait invalidate];
			cntr = 0;	
		}
	}
}


- (void) rightUp1 {
	
	[leavesView touchEnded:CGPointMake(990, 384)];
	
	cntr = 0;
	webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo1Part2) userInfo:nil repeats:YES];
	
}

- (void) rightUp2 {
	
	[leavesView touchEnded:CGPointMake(990, 384)];
	
	cntr = 0;
	webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo2Part2) userInfo:nil repeats:YES];
	
}

- (void) rightUp3 {
	
	[leavesView touchEnded:CGPointMake(990, 384)];
	
	cntr = 0;
	webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo3Part2) userInfo:nil repeats:YES];
	
}


- (void) webWaitSearchTo1 {

	if (!webViewRP1.loading)
	{
		cntr ++;
		if (cntr == 3)
		{
		//TURN TO IT
		
		leftPage1.alpha = 1.0;
		rightPage1.alpha = 1.0;
		
			if (didJustTurnLeft == NO) {

			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
		[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
		[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
		[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
		[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
				didJustTurnLeft = NO;
			}

		[leavesView reloadData];
		
		leftPage1.alpha = 0.0;
		rightPage1.alpha = 0.0;
		
		[searchPop dismissPopoverAnimated:YES];
		[chaptersPop dismissPopoverAnimated:YES];
		[bookmarksPop dismissPopoverAnimated:YES];

		[leavesView touchBegan:CGPointMake(990, 384)];
		
		[webWait invalidate];
		
			
			[self performSelector:@selector(rightUp1) withObject:nil afterDelay:.1];

		}
	}	
}
		
		
- (void) webWaitSearchTo1Part2 {
	
	cntr ++;
	if (cntr == 6)
	{	
		previousTextRP1 = [pageData objectForKey:@"previousText"];
		uniqueTextRP1 = [pageData objectForKey:@"uniqueText"];
		htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
		[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP1 release];
		
		[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
		
		[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
		[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
		
		if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
			ribbonButtonRP1.alpha = 1.0;
		}
		else {
			ribbonButtonRP1.alpha = 0.0;
		}
		//[self performSelector:@selector(highlightText) withObject:nil afterDelay:0.1];
		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"326v"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP2 = [pageData objectForKey:@"previousRightText"];
			uniqueTextRP2 = [pageData objectForKey:@"uniqueRightText"];
			htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
			[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP2 release];
			
			[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"rightFolioImage"]]]];
			
			[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"rightFolioImage"]]]];
			[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"nextBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"rightFolioImage"]]) {
				ribbonButtonRP2.alpha = 1.0;
			}
			else {
				ribbonButtonRP2.alpha = 0.0;
			}
		}
		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"12r"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP3 = [pageData objectForKey:@"previousLeftText"];
			uniqueTextRP3 = [pageData objectForKey:@"uniqueLeftText"];
			htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
			[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP3 release];
			
			[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"leftFolioImage"]]]];
			
			[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"leftFolioImage"]]]];
			[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"prevBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"leftFolioImage"]]) {
				ribbonButtonRP3.alpha = 1.0;
			}
			else {
				ribbonButtonRP3.alpha = 0.0;
			}
		}
		
		allowedToTurnPage = NO;
		
		[webWait invalidate];

		//CHEAP FIX ON 1/5 make it 1/10 and glitch
		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchSearchTo1) userInfo:nil repeats:YES];
	}
}


- (void) webWaitSearchTo2 {
	
	if (!webViewRP2.loading)
	{
		//TURN TO IT
		cntr ++;
		if (cntr == 3)
		{
		leftPage2.alpha = 1.0;
		rightPage2.alpha = 1.0;
		
			if (didJustTurnLeft == NO) {

			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
		[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
		[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
		[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
		[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
				
				didJustTurnLeft = NO;
			}

		[leavesView reloadData];
		
		leftPage2.alpha = 0.0;
		rightPage2.alpha = 0.0;
		
		[searchPop dismissPopoverAnimated:YES];
		[chaptersPop dismissPopoverAnimated:YES];
			[bookmarksPop dismissPopoverAnimated:YES];

		[leavesView touchBegan:CGPointMake(990, 384)];
		
		[webWait invalidate];

		[self performSelector:@selector(rightUp2) withObject:nil afterDelay:.1];

		}
	}
}

- (void) webWaitSearchTo2Part2 {
	
	//TURN TO IT
	cntr ++;
	if (cntr == 6)
	{
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"12r"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP1 = [pageData objectForKey:@"previousLeftText"];
			uniqueTextRP1 = [pageData objectForKey:@"uniqueLeftText"];
			htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
			[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP1 release];
			[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"leftFolioImage"]]]];
			
			[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"leftFolioImage"]]]];
			[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"prevBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"leftFolioImage"]]) {
				ribbonButtonRP1.alpha = 1.0;
			}
			else {
				ribbonButtonRP1.alpha = 0.0;
			}
		}
		
		previousTextRP2 = [pageData objectForKey:@"previousText"];
		uniqueTextRP2 = [pageData objectForKey:@"uniqueText"];
		htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
		[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP2 release];
		[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
		//[self performSelector:@selector(highlightText) withObject:nil afterDelay:0.1];
		[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
		[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
		
		if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
			ribbonButtonRP2.alpha = 1.0;
		}
		else {
			ribbonButtonRP2.alpha = 0.0;
		}
		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"326v"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP3 = [pageData objectForKey:@"previousRightText"];
			uniqueTextRP3 = [pageData objectForKey:@"uniqueRightText"];
			htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
			[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP3 release];
			[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"rightFolioImage"]]]];
			[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"rightFolioImage"]]]];
			[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"nextBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"rightFolioImage"]]) {
				ribbonButtonRP3.alpha = 1.0;
			}
			else {
				ribbonButtonRP3.alpha = 0.0;
			}
			
		}
		
		allowedToTurnPage = NO;
		[webWait invalidate];

		//CHEAP FIX ON 1/5 make it 1/10 and glitch
		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchSearchTo2) userInfo:nil repeats:YES];
	}
}

- (void) webWaitSearchTo3 {

	if (!webViewRP3.loading)
	{
		cntr ++;
		if (cntr == 3)
		{

		//TURN TO IT
		
		leftPage3.alpha = 1.0;
		rightPage3.alpha = 1.0;
		
			if (didJustTurnLeft == NO) {

			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
		[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
		[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
		[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
		[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
				
				didJustTurnLeft = NO;
			}

		[leavesView reloadData];
		
		leftPage3.alpha = 0.0;
		rightPage3.alpha = 0.0;
		
		[searchPop dismissPopoverAnimated:YES];
		[chaptersPop dismissPopoverAnimated:YES];
		[bookmarksPop dismissPopoverAnimated:YES];

		
		[leavesView touchBegan:CGPointMake(990, 384)];
		
		[webWait invalidate];
		
			[self performSelector:@selector(rightUp3) withObject:nil afterDelay:.1];
		}
	}
}

- (void) webWaitSearchTo3Part2 {
	
	cntr ++;
	if (cntr == 6)
	{
		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"326v"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP1 = [pageData objectForKey:@"previousRightText"];
			uniqueTextRP1 = [pageData objectForKey:@"uniqueRightText"];
			htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
			[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP1 release];
			[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"rightFolioImage"]]]];
			
			[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"rightFolioImage"]]]];
			[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"nextBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"rightFolioImage"]]) {
				ribbonButtonRP1.alpha = 1.0;
			}
			else {
				ribbonButtonRP1.alpha = 0.0;
			}
		}
		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"12r"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP2 = [pageData objectForKey:@"previousLeftText"];
			uniqueTextRP2 = [pageData objectForKey:@"uniqueLeftText"];
			htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
			[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP2 release];
			[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"leftFolioImage"]]]];
			
			[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"leftFolioImage"]]]];
			[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"prevBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"leftFolioImage"]]) {
				ribbonButtonRP2.alpha = 1.0;
			}
			else {
				ribbonButtonRP2.alpha = 0.0;
			}
		}
		
		previousTextRP3 = [pageData objectForKey:@"previousText"];
		uniqueTextRP3 = [pageData objectForKey:@"uniqueText"];
		htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
		[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP3 release];
		[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
		//[self performSelector:@selector(highlightText) withObject:nil afterDelay:0.1];
		
		[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
		[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
		
		if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
			ribbonButtonRP3.alpha = 1.0;
		}
		else {
			ribbonButtonRP3.alpha = 0.0;
		}
		
		allowedToTurnPage = NO;
		[webWait invalidate];

		//CHEAP FIX ON 1/5 make it 1/10 and glitch
		//CHEAP FIX ON 1/5 make it 1/10 and glitch
		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchSearchTo3) userInfo:nil repeats:YES];
		
	}
}


//////////////////////////////////////////////////////////////////////////////////////


//RIGHT SEARCH

- (void) webWaitSwitchSearchTo1Left {
	
	if (!webViewRP1.loading && !webViewRP2.loading && !webViewRP3.loading)
	{
		cntr ++;
		if (cntr == 3)
		{
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			if (didJustTurnLeft == NO) {

			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
				didJustTurnLeft = NO;
			}

			[leavesView reloadData];
			
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			
			//leftPage1.alpha = 1.0;
			//rightPage1.alpha = 1.0;
			
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			allowedToTurnPage = YES;
			
			[webWait invalidate];
		}
	}
}

- (void) webWaitSwitchSearchTo2Left {
	
	if (!webViewRP1.loading && !webViewRP2.loading && !webViewRP3.loading)
	{
		cntr ++;
		if (cntr == 3)
		{
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			if (didJustTurnLeft == NO) {

			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
				
				didJustTurnLeft = NO;
			}

			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			
			
			//leftPage2.alpha = 1.0;
			//rightPage2.alpha = 1.0;
			
			
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			allowedToTurnPage = YES;
			
			[webWait invalidate];
		}
	}
}

- (void) webWaitSwitchSearchTo3Left {
	
	if (!webViewRP1.loading && !webViewRP2.loading && !webViewRP3.loading)
	{
		cntr ++;
		if (cntr == 3)
		{
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			if (didJustTurnLeft == NO) {

			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
				didJustTurnLeft = NO;
			}

			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			
			//leftPage3.alpha = 1.0;
			//rightPage3.alpha = 1.0;
			
			allowedToTurnPage = YES;
			
			[webWait invalidate];
			cntr = 0;	
		}
	}
}





- (void) webWaitSearchTo1Left {
	
	if (!webViewRP1.loading)
	{
		cntr ++;
		if (cntr == 3)
		{
			//TURN TO IT
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			
			if (didJustTurnLeft == NO) {

			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
				didJustTurnLeft = NO;
			}

			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			
			[searchPop dismissPopoverAnimated:YES];
			[chaptersPop dismissPopoverAnimated:YES];
			[bookmarksPop dismissPopoverAnimated:YES];
					
			[webWait invalidate];

			[leavesView touchBegan:CGPointMake(0, 384)];

			[self performSelector:@selector(leftUp1) withObject:nil afterDelay:.1];

			
			//RESET ARRAY
		}
	}	
}

- (void) leftUp1 {
	
	[leavesView touchEnded:CGPointMake(0, 384)];

	cntr = 0;
	webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo1Part2Left) userInfo:nil repeats:YES];
	
}

- (void) leftUp2 {
	
	[leavesView touchEnded:CGPointMake(0, 384)];
	
	cntr = 0;
	webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo2Part2Left) userInfo:nil repeats:YES];
	
}

- (void) leftUp3 {
	
	[leavesView touchEnded:CGPointMake(0, 384)];
	
	cntr = 0;
	webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo3Part2Left) userInfo:nil repeats:YES];
	
}



- (void) webWaitSearchTo1Part2Left {
	
	cntr ++;
	if (cntr == 6)
	{	
		previousTextRP1 = [pageData objectForKey:@"previousText"];
		uniqueTextRP1 = [pageData objectForKey:@"uniqueText"];
		htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
		[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP1 release];
		
		[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
		
		[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
		[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
		
		if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
			ribbonButtonRP1.alpha = 1.0;
		}
		else {
			ribbonButtonRP1.alpha = 0.0;
		}
		//[self performSelector:@selector(highlightText) withObject:nil afterDelay:0.1];
		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"326v"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP2 = [pageData objectForKey:@"previousRightText"];
			uniqueTextRP2 = [pageData objectForKey:@"uniqueRightText"];
			htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
			[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP2 release];
			
			[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"rightFolioImage"]]]];
			
			[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"rightFolioImage"]]]];
			[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"nextBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"rightFolioImage"]]) {
				ribbonButtonRP2.alpha = 1.0;
			}
			else {
				ribbonButtonRP2.alpha = 0.0;
			}
		}
		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"12r"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP3 = [pageData objectForKey:@"previousLeftText"];
			uniqueTextRP3 = [pageData objectForKey:@"uniqueLeftText"];
			htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
			[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP3 release];
			
			[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"leftFolioImage"]]]];
			
			[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"leftFolioImage"]]]];
			[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"prevBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"leftFolioImage"]]) {
				ribbonButtonRP3.alpha = 1.0;
			}
			else {
				ribbonButtonRP3.alpha = 0.0;
			}
		}
		
		allowedToTurnPage = NO;
		
		[webWait invalidate];
		
		//CHEAP FIX ON 1/5 make it 1/10 and glitch
		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchSearchTo1Left) userInfo:nil repeats:YES];
	}
}


- (void) webWaitSearchTo2Left {
	
	if (!webViewRP2.loading)
	{
		//TURN TO IT
		cntr ++;
		if (cntr == 3)
		{
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			if (didJustTurnLeft == NO) {

			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
				
				didJustTurnLeft = NO;
			}

			[leavesView reloadData];
			
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			
			[searchPop dismissPopoverAnimated:YES];
			[chaptersPop dismissPopoverAnimated:YES];
			[bookmarksPop dismissPopoverAnimated:YES];
			
			[webWait invalidate];
			[leavesView touchBegan:CGPointMake(0, 384)];
			
			[self performSelector:@selector(leftUp2) withObject:nil afterDelay:.1];
		}
	}
}

- (void) webWaitSearchTo2Part2Left {
	
	//TURN TO IT
	cntr ++;
	if (cntr == 6)
	{
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"12r"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP1 = [pageData objectForKey:@"previousLeftText"];
			uniqueTextRP1 = [pageData objectForKey:@"uniqueLeftText"];
			htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
			[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP1 release];
			[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"leftFolioImage"]]]];
			
			[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"leftFolioImage"]]]];
			[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"prevBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"leftFolioImage"]]) {
				ribbonButtonRP1.alpha = 1.0;
			}
			else {
				ribbonButtonRP1.alpha = 0.0;
			}
		}
		
		previousTextRP2 = [pageData objectForKey:@"previousText"];
		uniqueTextRP2 = [pageData objectForKey:@"uniqueText"];
		htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
		[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP2 release];
		[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
		//[self performSelector:@selector(highlightText) withObject:nil afterDelay:0.1];
		[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
		[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
		
		if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
			ribbonButtonRP2.alpha = 1.0;
		}
		else {
			ribbonButtonRP2.alpha = 0.0;
		}
		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"326v"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP3 = [pageData objectForKey:@"previousRightText"];
			uniqueTextRP3 = [pageData objectForKey:@"uniqueRightText"];
			htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
			[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP3 release];
			[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"rightFolioImage"]]]];
			[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"rightFolioImage"]]]];
			[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"nextBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"rightFolioImage"]]) {
				ribbonButtonRP3.alpha = 1.0;
			}
			else {
				ribbonButtonRP3.alpha = 0.0;
			}
			
		}
		
		allowedToTurnPage = NO;
		[webWait invalidate];
		
		//CHEAP FIX ON 1/5 make it 1/10 and glitch
		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchSearchTo2Left) userInfo:nil repeats:YES];
	}
}

- (void) webWaitSearchTo3Left {
	
	if (!webViewRP3.loading)
	{
		cntr ++;
		if (cntr == 3)
		{
			
			//TURN TO IT
			
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			if (didJustTurnLeft == NO) {

			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
				[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
				[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
				[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
				[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
				
				didJustTurnLeft = NO;
			}

			[leavesView reloadData];
			
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			[searchPop dismissPopoverAnimated:YES];
			[chaptersPop dismissPopoverAnimated:YES];
			[bookmarksPop dismissPopoverAnimated:YES];
			
			
			[webWait invalidate];
			[leavesView touchBegan:CGPointMake(0, 384)];
			
			[self performSelector:@selector(leftUp3) withObject:nil afterDelay:.1];
			
		}
	}
}

- (void) webWaitSearchTo3Part2Left {
	
	cntr ++;
	if (cntr == 6)
	{

		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"326v"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP1 = [pageData objectForKey:@"previousRightText"];
			uniqueTextRP1 = [pageData objectForKey:@"uniqueRightText"];
			htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
			[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP1 release];
			[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"rightFolioImage"]]]];
			
			[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"rightFolioImage"]]]];
			[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"nextBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"rightFolioImage"]]) {
				ribbonButtonRP1.alpha = 1.0;
			}
			else {
				ribbonButtonRP1.alpha = 0.0;
			}
		}
		
		if ([[pageData objectForKey:@"folioImage"] isEqualToString: @"12r"]) {
			NSLog(@"12rHERE");
			
		}
		else {
			previousTextRP2 = [pageData objectForKey:@"previousLeftText"];
			uniqueTextRP2 = [pageData objectForKey:@"uniqueLeftText"];
			htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
			[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
			//[htmlRP2 release];
			[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"leftFolioImage"]]]];
			
			[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"leftFolioImage"]]]];
			[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"prevBook"]]];
			
			if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"leftFolioImage"]]) {
				ribbonButtonRP2.alpha = 1.0;
			}
			else {
				ribbonButtonRP2.alpha = 0.0;
			}
		}
		
		previousTextRP3 = [pageData objectForKey:@"previousText"];
		uniqueTextRP3 = [pageData objectForKey:@"uniqueText"];
		htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
		[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
		//[htmlRP3 release];
		[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
		//[self performSelector:@selector(highlightText) withObject:nil afterDelay:0.1];
		
		[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
		[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
		
		if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
			ribbonButtonRP3.alpha = 1.0;
		}
		else {
			ribbonButtonRP3.alpha = 0.0;
		}
		
		allowedToTurnPage = NO;
		[webWait invalidate];
		
		//CHEAP FIX ON 1/5 make it 1/10 and glitch
		//CHEAP FIX ON 1/5 make it 1/10 and glitch
		cntr = 0;
		webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSwitchSearchTo3Left) userInfo:nil repeats:YES];
		
	}
}


//////////////////////////////////////////////////////////////////////////////////////








- (void) addRibbon: (NSNotification *)notification {
	
	//didJustTurnLeft = NO;

	
	
	NSString * addRibbon = [notification object];

	NSLog(@"%@", addRibbon);
	
	allowedToTurnPage = NO;

	
	if ([addRibbon isEqualToString:@"add"]) {
		if (viewOn == 1) {
			ribbonButtonRP1.alpha = 1.0;
			//[activityIndicatorRP1 startAnimating];
			
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			
			[leavesView reloadData];

			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			
			
		}
		else if (viewOn == 2) {
			
			ribbonButtonRP2.alpha = 1.0;
			//[activityIndicatorRP2 startAnimating];
			
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
						
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
			
			
			if ([viewsForAnimation objectAtIndex:5] == page4) {
				[viewsForAnimation replaceObjectAtIndex:5 withObject:page4];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
			}

			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
			
			[leavesView reloadData];

			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
						

		}
		else if (viewOn == 3) {
			
			ribbonButtonRP3.alpha = 1.0;
			//[activityIndicatorRP3 startAnimating];
			
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			
			[leavesView reloadData];

			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			
			
		}
	}
	else if ([addRibbon isEqualToString:@"remove"]) {
		if (viewOn == 1) {
			ribbonButtonRP1.alpha = 0.0;
			//[activityIndicatorRP1 startAnimating];
			
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			
			[leavesView reloadData];

			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			

		}
		else if (viewOn == 2) {
			
			ribbonButtonRP2.alpha = 0.0;
			//[activityIndicatorRP2 startAnimating];
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];

			if ([viewsForAnimation objectAtIndex:5] == page4) {
				[viewsForAnimation replaceObjectAtIndex:5 withObject:page4];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
			}
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			

		}
		else if (viewOn == 3) {
			
			ribbonButtonRP3.alpha = 0.0;
			//[activityIndicatorRP3 startAnimating];
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			
			[leavesView reloadData];

			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			

		}
	}
	else if ([addRibbon isEqualToString:@"removeleft"])
	{
		
		if (viewOn == 1) {
			ribbonButtonRP3.alpha = 0.0;
			//ribbonButtonRP2.alpha = 0.0;

			//[activityIndicatorRP1 startAnimating];
			
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			
			[leavesView reloadData];
			
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
		}
		else if (viewOn == 2) {
			
			ribbonButtonRP1.alpha = 0.0;
			//ribbonButtonRP3.alpha = 0.0;

			//[activityIndicatorRP2 startAnimating];
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			
			
		}
		else if (viewOn == 3) {
			
			ribbonButtonRP2.alpha = 0.0;
			//ribbonButtonRP1.alpha = 0.0;

			//[activityIndicatorRP3 startAnimating];
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			
			
		}
		 
	}
	else if ([addRibbon isEqualToString:@"removeright"])
	{
		
		if (viewOn == 1) {
			//ribbonButtonRP3.alpha = 0.0;
			ribbonButtonRP2.alpha = 0.0;
			
			//[activityIndicatorRP1 startAnimating];
			
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			
			[leavesView reloadData];
			
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
		}
		else if (viewOn == 2) {
			
			//ribbonButtonRP1.alpha = 0.0;
			ribbonButtonRP3.alpha = 0.0;
			
			//[activityIndicatorRP2 startAnimating];
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			
			
		}
		else if (viewOn == 3) {
			
			//ribbonButtonRP2.alpha = 0.0;
			ribbonButtonRP1.alpha = 0.0;
			
			//[activityIndicatorRP3 startAnimating];
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			
			
		}
		
	}
		 
	//[activityIndicatorRP1 stopAnimating];
	//[activityIndicatorRP2 stopAnimating];
	//[activityIndicatorRP3 stopAnimating];

	allowedToTurnPage = YES;


}

- (void) BookmarkPopChange: (NSNotification *)notification {

	//pageData = [notification object];
	
	[bookmarksPop setPopoverContentSize: CGSizeMake(400, 277) animated:YES];	
}


- (void) newStuff: (NSNotification *)notification {
	
	//didJustTurnLeft = NO;

	//[leavesView changeCurrentPageIndex:4];

	pageData = [notification object];

	//[folio setString:[NSString stringWithFormat:@"%@", [pageData objectForKey:@"folioImage"]]];

	if ([[pageData objectForKey:@"folioImage"] isEqualToString:folio]) {
		

		
		[searchPop dismissPopoverAnimated:YES];
		[bookmarksPop dismissPopoverAnimated:YES];
		[chaptersPop dismissPopoverAnimated:YES];

		//Just highlight
		
		[self performSelector:@selector(highlightText) withObject:nil afterDelay:0.5];

	}
	else {
		
		
		NSString * folioname1 = [pageData objectForKey:@"folioImage"];
		NSString * folioname2 = folio;

		
		
		
		bool result;
		char folio1C;
		char folio2C;
		int tF1= [folioname1 intValue];
		int tF2= [folioname2 intValue];
		
		if(tF1<=99){
			folio1C=[folioname1 characterAtIndex:2];
		}
		else{
			folio1C=[folioname1 characterAtIndex:3];
			
		}
		if(tF2<=99){
			folio2C= [folioname2 characterAtIndex:2];
		}
		else{
			folio2C= [folioname2 characterAtIndex:3];
		}
		
		NSString *tempCharacter1= [NSString stringWithFormat:@"%c", folio1C];
		NSString *tempCharacter2= [NSString stringWithFormat:@"%c", folio2C];
		
		if( tF1 > tF2){
			result= YES;
		}
		else if(tF1<tF2){
			result= NO;
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
		
		isGoingRight = result;
		
		
		
		
		
		
	//	isGoingRight = [self is:[pageData objectForKey:@"folioImage"] greaterThan:folio];

		
		//isGoingRight = YES;
		//isGoingRight = NO;

		
		if (isGoingRight) {
			
		//	[leavesView changeCurrentPageIndex:4];
			
			
			[folio setString:[NSString stringWithFormat:@"%@", [pageData objectForKey:@"folioImage"]]];
			
			
			NSLog(@"searched folio name %@", [NSString stringWithFormat:@"%@", [pageData objectForKey:@"folioImage"]]);
			
			[leavesView setTypeOfTurn:2];
			
			
			if (viewOn == 1) {
				
				//RESET ARRAY
				
				previousTextRP2 = [pageData objectForKey:@"previousText"];
				uniqueTextRP2 = [pageData objectForKey:@"uniqueText"];
				htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
				[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
				//[htmlRP2 release];
				
				NSLog(@"FOLIO NAMED: %@", [pageData objectForKey:@"folioImage"]);
				[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
				
				[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
				[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
				
				if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
					ribbonButtonRP2.alpha = 1.0;
				}
				else {
					ribbonButtonRP2.alpha = 0.0;
				}
				
				
				cntr = 0;
				
				webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo2) userInfo:nil repeats:YES];
				
			}
			else if (viewOn == 2) {
				
				//RESET ARRAY
				
				previousTextRP3 = [pageData objectForKey:@"previousText"];
				uniqueTextRP3 = [pageData objectForKey:@"uniqueText"];
				htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
				[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
				//[htmlRP3 release];
				
				NSLog(@"FOLIO NAMED: %@", [pageData objectForKey:@"folioImage"]);
				[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
				
				[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
				[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
				
				if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
					ribbonButtonRP3.alpha = 1.0;
				}
				else {
					ribbonButtonRP3.alpha = 0.0;
				}
				
				cntr = 0;
				
				webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo3) userInfo:nil repeats:YES];
				
			}
			else if (viewOn == 3) {
				
				//RESET ARRAY
				
				previousTextRP1 = [pageData objectForKey:@"previousText"];
				uniqueTextRP1 = [pageData objectForKey:@"uniqueText"];
				htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
				[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
				//[htmlRP1 release];
				
				NSLog(@"FOLIO NAMED: %@", [pageData objectForKey:@"folioImage"]);
				[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
				
				[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
				[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
				
				if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
					ribbonButtonRP1.alpha = 1.0;
				}
				else {
					ribbonButtonRP1.alpha = 0.0;
				}
				
				cntr = 0;
				
				webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo1) userInfo:nil repeats:YES];
				
			}
		}
		else { /////// GOING LEFT
			
			//[leavesView touchBegan:CGPointMake(40, 384)];
			
			//[leavesView changeCurrentPageIndex:2];

			
			[folio setString:[NSString stringWithFormat:@"%@", [pageData objectForKey:@"folioImage"]]];
			
			
			NSLog(@"searched folio name %@", [NSString stringWithFormat:@"%@", [pageData objectForKey:@"folioImage"]]);
			
			[leavesView setTypeOfTurn:2];
			
			
			if (viewOn == 1) {
				
				//RESET ARRAY
				
				previousTextRP3 = [pageData objectForKey:@"previousText"];
				uniqueTextRP3 = [pageData objectForKey:@"uniqueText"];
				htmlRP3 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP3, uniqueTextRP3];  
				[webViewRP3 loadHTMLString:htmlRP3 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
				//[htmlRP3 release];
				
				NSLog(@"FOLIO NAMED: %@", [pageData objectForKey:@"folioImage"]);
				[imagevLP3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
				
				[lblPageRP3 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
				[lblBookRP3 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
				
				if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
					ribbonButtonRP3.alpha = 1.0;
				}
				else {
					ribbonButtonRP3.alpha = 0.0;
				}
				
				
				cntr = 0;
				
				webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo3Left) userInfo:nil repeats:YES];
				
			}
			else if (viewOn == 2) {
				
				//RESET ARRAY
				
				previousTextRP1 = [pageData objectForKey:@"previousText"];
				uniqueTextRP1 = [pageData objectForKey:@"uniqueText"];
				htmlRP1 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP1, uniqueTextRP1];  
				[webViewRP1 loadHTMLString:htmlRP1 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
				//[htmlRP1 release];
				
				NSLog(@"FOLIO NAMED: %@", [pageData objectForKey:@"folioImage"]);
				[imagevLP1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
				
				[lblPageRP1 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
				[lblBookRP1 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
				
				if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
					ribbonButtonRP1.alpha = 1.0;
				}
				else {
					ribbonButtonRP1.alpha = 0.0;
				}
				
				cntr = 0;
				
				webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo1Left) userInfo:nil repeats:YES];
				
			}
			else if (viewOn == 3) {
				
				//RESET ARRAY
				
				previousTextRP2 = [pageData objectForKey:@"previousText"];
				uniqueTextRP2 = [pageData objectForKey:@"uniqueText"];
				htmlRP2 = [NSString stringWithFormat:@"<html><body style=\"background-color:transparent;\"><font face=\"Cochin\" size=\"4\"><font color=\"gray\">%@</font> %@</font></body></html>", previousTextRP2, uniqueTextRP2];  
				[webViewRP2 loadHTMLString:htmlRP2 baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES]];
				//[htmlRP2 release];
				NSLog(@"FOLIO NAMED: %@", [pageData objectForKey:@"folioImage"]);
				[imagevLP2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", [pageData objectForKey:@"folioImage"]]]];
				
				[lblPageRP2 setText:[NSString stringWithFormat:@"-page %i-", [self getPageNumber:[pageData objectForKey:@"folioImage"]]]];
				[lblBookRP2 setText:[NSString stringWithFormat:@"Iliad - Book %@", [pageData objectForKey:@"book"]]];
				
				if ([[mainDelegate bookmarksArray] containsObject:[pageData objectForKey:@"folioImage"]]) {
					ribbonButtonRP2.alpha = 1.0;
				}
				else {
					ribbonButtonRP2.alpha = 0.0;
				}
				
				cntr = 0;
				
				webWait = [NSTimer scheduledTimerWithTimeInterval: (1.0/10.0) target: self selector: @selector(webWaitSearchTo2Left) userInfo:nil repeats:YES];
				
			}
			
		}
			 
	}
			 
}





- (void) setsAllowedToTurnPage:(BOOL) allowed {
	
	allowedToTurnPage = allowed;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if (allowedToTurnPage) {
		

		UITouch *touch = [event.allTouches anyObject];
		CGPoint touchPoint = [touch locationInView:self.view];
		//NSLog(@"%.f", touchPoint.x);
		
		
		if(touchPoint.x < 512)
		{
			
			if ([folio isEqualToString:@"12r"]) {
				
			}
			else {
				turningToTheRight = YES;
				
				[leavesView isGoingRight:YES]; // EVERY OTHER
				
				//[leavesCache setRight:1];
				
				[leavesView changeCurrentPageIndex:2];
				
				if(touchPoint.x < 20)
					[leavesView touchBegan:CGPointMake(0, 384)];
				else if(touchPoint.x > 1008)
					[leavesView touchBegan:CGPointMake(990, 384)];
				else
					[leavesView touchesBegan:touches withEvent:event];
			}

			
			
		}
		else {
			
			if ([folio isEqualToString:@"326v"]) {
				
			}
			else {
			turningToTheRight = NO;

			[leavesView isGoingRight:NO]; // EVERY OTHER

			//[leavesCache setRight:2];

			[leavesView changeCurrentPageIndex:4];
			
			if(touchPoint.x < 20)
				[leavesView touchBegan:CGPointMake(0, 384)];
			else if(touchPoint.x > 1008)
				[leavesView touchBegan:CGPointMake(990, 384)];
			else
				[leavesView touchesBegan:touches withEvent:event];
			}
		}
		
		
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if (allowedToTurnPage) {
		UITouch *touch = [event.allTouches anyObject];
		CGPoint touchPoint = [touch locationInView:self.view];
		if(touchPoint.x < 20)
			[leavesView touchMoved:CGPointMake(0, 384)];
		else if(touchPoint.x > 1008)
			[leavesView touchMoved:CGPointMake(990, 384)];
		else
			[leavesView touchesMoved:touches withEvent:event];
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	if (allowedToTurnPage) {
		
		//allowedToTurnPage = NO;

		UITouch *touch = [event.allTouches anyObject];
		CGPoint touchPoint = [touch locationInView:self.view];
		if(touchPoint.x < 20)
			[leavesView touchEnded:CGPointMake(0, 384)];
		else if(touchPoint.x > 1008)
			[leavesView touchEnded:CGPointMake(990, 384)];
		else
			[leavesView touchesEnded:touches withEvent:event];
	}
}




-(void) removeViews {
		
	leftPage1.alpha = 0.0;
	rightPage1.alpha = 0.0;
	
	leftPage2.alpha = 0.0;
	rightPage2.alpha = 0.0;
	
	leftPage3.alpha = 0.0;
	rightPage3.alpha = 0.0;
}


-(void) addViewsBack {
		
	//leftPage.alpha = 1.0;
	//rightPage.alpha = 1.0;
}






/// HANDLE RERENDERING FOR SCROLL


- (void) webScroll {
	
	
	if (viewOn == 1) {
		int i = [[webViewRP1 stringByEvaluatingJavaScriptFromString:@"window.pageYOffset"] intValue];
		
		if (i != webScrollValueRP1) {
			NSLog(@"web has moved -> reload stuff");
			
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage2];
			
			[leavesView reloadData];
			
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;	
			
			webScrollValueRP1 = i;
		}
	}
	else if (viewOn == 2) {
		int i = [[webViewRP2 stringByEvaluatingJavaScriptFromString:@"window.pageYOffset"] intValue];
		
		if (i != webScrollValueRP2) {
			NSLog(@"web has moved -> reload stuff");
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			leftPage3.alpha = 1.0;
			rightPage3.alpha = 1.0;
			
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage1];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage2];
			if ([viewsForAnimation objectAtIndex:5] == page4) {
				[viewsForAnimation replaceObjectAtIndex:5 withObject:page4];
			}
			else {
				[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage3];
			}
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage3];
			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			leftPage3.alpha = 0.0;
			rightPage3.alpha = 0.0;
			
			webScrollValueRP2 = i;
		}
	}
	else if (viewOn == 3) {
		int i = [[webViewRP3 stringByEvaluatingJavaScriptFromString:@"window.pageYOffset"] intValue];
		
		if (i != webScrollValueRP3) {
			NSLog(@"web has moved -> reload stuff");
			
			leftPage1.alpha = 1.0;
			rightPage1.alpha = 1.0;
			leftPage2.alpha = 1.0;
			rightPage2.alpha = 1.0;
			
			
			[viewsForAnimation replaceObjectAtIndex:1 withObject:leftPage2];
			[viewsForAnimation replaceObjectAtIndex:2 withObject:rightPage2];
			[viewsForAnimation replaceObjectAtIndex:3 withObject:leftPage3];
			[viewsForAnimation replaceObjectAtIndex:4 withObject:rightPage3];
			[viewsForAnimation replaceObjectAtIndex:5 withObject:leftPage1];
			[viewsForAnimation replaceObjectAtIndex:6 withObject:rightPage1];
			
			[leavesView reloadData];
			
			leftPage1.alpha = 0.0;
			rightPage1.alpha = 0.0;
			leftPage2.alpha = 0.0;
			rightPage2.alpha = 0.0;
			
			webScrollValueRP3 = i;
		}
	}
	//NSLog(@"WebPage1 Offset %i", webScrollValueRP1);

	//NSLog(@"WebPage2 Offset %i", webScrollValueRP2);
	
	//NSLog(@"WebPage3 Offset %i", webScrollValueRP3);

}




//////////////////////PARSE////////////////////////

-(void)startfileparsing{
	
	
	//NSLog(@"Im HERE!");

	//Setting the new variables for the RIGHT PAGE
	//NSLog(@"OldFolio:%@",folio);
	

	//Set the paths to do the Xpath in the "VA.Fixed.xml":
	NSString *newpath = [[NSBundle mainBundle] pathForResource:@"VAFolioIndex" ofType:@"xml"];
	NSString *newxmlPath=[[NSString alloc] initWithString:newpath];
	NSURL *newxmlURL = [NSURL fileURLWithPath:newxmlPath];
	xmlDocument = [[[CXMLDocument alloc] initWithContentsOfURL:newxmlURL options:0 error:nil] autorelease];
	
	
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
	
	// dont change
	
	}
	
	//We get the nodes but we only need the lastObject (only one Node)
	CXMLElement * newPrevFolioPath = [[xmlDocument nodesForXPath:newPrevFolioXPath error:nil] lastObject];
	CXMLElement * newPrev2FolioPath = [[xmlDocument nodesForXPath:newPrev2FolioXPath error:nil] lastObject];
	CXMLElement * newCurrentFolioPath = [[xmlDocument nodesForXPath:newfolioXPath error:nil] lastObject];
	CXMLElement * newNextFolioPath = [[xmlDocument nodesForXPath:folioNextXPath error:nil] lastObject];
	CXMLElement * newNext2FolioPath = [[xmlDocument nodesForXPath:folioNext2XPath error:nil] lastObject];
	CXMLElement * newNext3FolioPath = [[xmlDocument nodesForXPath:folioNext3XPath error:nil] lastObject];
	
	
	//We set the new variables to get the NEXT page when you click or turn the page 
	//UNIQUE INFORMATION
	[folio setString:[[[newCurrentFolioPath elementsForName:@"folio"] lastObject] stringValue]];
	//folioC = [[[[newCurrentFolioPath elementsForName:@"folio"] lastObject] stringValue] UTF8String];
	NSLog(@"NewFolio:%@",folio);
	////NSLog(@"NewFolio:%s",folioC);
	startLine = [[[newCurrentFolioPath elementsForName:@"start"] lastObject] stringValue];
	[book setString: [[[newCurrentFolioPath elementsForName:@"book"] lastObject] stringValue]];
	//[prevBook setString:[[[newPrevFolioPath elementsForName:@"book"] lastObject] stringValue]];
	prevStartLine = [[[newPrevFolioPath elementsForName:@"start"] lastObject] stringValue];
	stopBook = [[[newNextFolioPath elementsForName:@"book"] lastObject] stringValue];
	stopLine = [[[[newNextFolioPath elementsForName:@"start"] lastObject] stringValue] intValue];
	NSLog(@"STOP:%i", stopLine);
	stopLine--;
	/////////////stopLine= [NSString stringWithFormat:@"%i",[stopLine intValue]-1 ];
	nextStopLine= [[[[newNext2FolioPath elementsForName:@"start"] lastObject] stringValue] intValue];
	nextStopLine--;
	//////////nextStopLine= [NSString stringWithFormat:@"%i",[nextStopLine intValue]-1];
	NSLog(@"PREV");
	
	//Prev Information
	if([folio isEqualToString: [NSString stringWithFormat:@"12r"]]){}
	else{
	[prevFolio setString:[[[newPrevFolioPath elementsForName:@"folio"] lastObject] stringValue]];
		[prevBook setString:[[[newPrevFolioPath elementsForName:@"book"] lastObject] stringValue]];
		prevStartLine= [[[newPrevFolioPath elementsForName:@"start"] lastObject] stringValue];
	prevStopLine= [[[[newCurrentFolioPath elementsForName:@"start"] lastObject] stringValue] intValue];
		prevStopLine--;
	///////////prevStopLine= [NSString stringWithFormat:@"%i",[prevStopLine intValue]-1];
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
	nextStopLine= [[[[newNext2FolioPath elementsForName:@"start"] lastObject] stringValue] intValue];
		nextStopLine--;
	///////nextStopLine= [NSString stringWithFormat:@"%i",[nextStopLine intValue]-1];
	nextStopBook= [[[newNext2FolioPath elementsForName:@"book"] lastObject] stringValue];
	nextPrevStartLine= [[[newCurrentFolioPath elementsForName:@"start"] lastObject] stringValue];
	nextPrevBook= [[[newPrevFolioPath elementsForName:@"book"] lastObject] stringValue];
	next2StopLine=[[[[newNext3FolioPath elementsForName:@"start"] lastObject] stringValue] intValue];
		next2StopLine--;
		
	///////next2StopLine= [NSString stringWithFormat:@"%i",[next2StopLine intValue]-1];
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
	//[xmlDocument release];
	
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
	//[xmlDocument release];
	//NSLog(@"all done with currentParse3!");
	[self performSelectorOnMainThread:@selector(udpateLabels3) withObject:nil waitUntilDone:YES];
}

-(void) udpateLabels3 {
	//NSLog(@"Calling UpdateLabels");
	//NSLog(@"FolioUpdateLabels:%@", folio);
	//leftFolioImage = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:prevFolio ofType:@"jpg"]];
	//previousLeftText;
	//uniqueLeftText;

	//folioImage = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:folio ofType:@"jpg"]];
	//previousText;
	//uniqueText;
	
	//rightFolioImage = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:nextFolio ofType:@"jpg"]];
	//previousRightText;
	//uniqueRightText;
}

//////////////////////PARSE////////////////////////




-(bool) is:(NSString*)folio1 greaterThan:(NSString*)folio2{
    
    bool result;
    char folio1C;
    char folio2C;
    int tF1= [folio1 intValue];
    int tF2= [folio2 intValue];
    
    if(tF1<=99){
        folio1C=[folio1 characterAtIndex:2];
    }
    else{
        folio1C=[folio1 characterAtIndex:3];
		
    }
    if(tF2<=99){
        folio2C= [folio2 characterAtIndex:2];
    }
    else{
        folio2C= [folio2 characterAtIndex:3];
    }
	
    NSString *tempCharacter1= [NSString stringWithFormat:@"%c", folio1C];
    NSString *tempCharacter2= [NSString stringWithFormat:@"%c", folio2C];
    
    if( tF1 > tF2){
        result= YES;
    }
    else if(tF1<tF2){
        result= NO;
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
    
    return result;
}


- (void)dealloc {

	[leavesView release];
    [super dealloc];
}

#pragma mark -
#pragma mark LeavesViewDataSource methods

- (NSUInteger) numberOfPagesInLeavesView:(LeavesView*)leavesView {
	
	NSLog(@"viewsForAnimation count = %i", [viewsForAnimation count]);

	return [viewsForAnimation count];
}

- (void) renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
	
	NSLog(@"- (void) renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx { %i", [viewsForAnimation count]);
	
	UIView *tempview;

	tempview = [viewsForAnimation objectAtIndex:index];
	
	CGRect imageRect = tempview.frame;
	CGAffineTransform transform = aspectFit(imageRect,CGContextGetClipBoundingBox(ctx));
	CGContextConcatCTM(ctx, transform);
	
	UIGraphicsBeginImageContext(tempview.bounds.size);
	[tempview.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	CGContextDrawImage(ctx, imageRect, [viewImage CGImage]);			
}

#pragma mark -
#pragma mark  UIViewController methods

- (void)loadView {
	[super loadView];
	leavesView.frame = CGRectMake(16, 12, 992, 726);
	
	//Add Background Image
	UIImage *bgim = [UIImage imageNamed:@"book.png"];
	UIImageView *holder = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 748)];
	holder.image = bgim;
	[self.view addSubview:holder];
	
	[self.view addSubview:leavesView];
}

- (void) viewDidLoad {
	//folio=@"12r";
	////NSLog(@"VIEWDIDLOAD");
	[super viewDidLoad];
	leavesView.dataSource = self;
	leavesView.delegate = self;
	[leavesView reloadData];
}


#pragma mark -
#pragma mark Interface rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
		return NO;
	
	else
		return YES;
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
	leavesView.mode = LeavesViewModeFacingPages;
}

@end