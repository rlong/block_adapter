// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAInitialView.h"
#import "JBLog.h"
#import "JBMemoryModel.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAInitialView ()

// blockAdapters
//NSMutableArray* _blockAdapters;
@property (nonatomic, retain) NSMutableArray* blockAdapters;
//@synthesize blockAdapters = _blockAdapters;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -


@implementation BAInitialView



-(void)addAdapter:(id)adapter {
    
    [_blockAdapters addObject:adapter];
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithCoder:(NSCoder *)aDecoder {
    
    Log_enteredMethod();
    
    BAInitialView* answer = [super initWithCoder:aDecoder];
    if( nil != answer ) {
        _blockAdapters = [[NSMutableArray alloc] init];
        
    }
    
    return answer;
    
}


-(void)dealloc {
	
    [self setBlockAdapters:nil];
    
    [self setButtons:nil];
	[self setAlerts:nil];
	[self setActionSheets:nil];
	[self setTableViewDelegate:nil];
	[self setBarButtonItem:nil];
	[self setPicker:nil];

    JBSuperDealloc();
	//[super dealloc];
	
}


#pragma mark -
#pragma mark fields

// blockAdapters
//NSMutableArray* _blockAdapters;
//@property (nonatomic, retain) NSMutableArray* blockAdapters;
@synthesize blockAdapters = _blockAdapters;


// buttons
//UIButton* _buttons;
//@property (nonatomic, retain) IBOutlet UIButton* buttons;
@synthesize buttons = _buttons;

// alerts
//UIButton* _alerts;
//@property (nonatomic, retain) IBOutlet UIButton* alerts;
@synthesize alerts = _alerts;


// actionSheets
//UIButton* _actionSheets;
//@property (nonatomic, retain) IBOutlet UIButton* actionSheets;
@synthesize actionSheets = _actionSheets;

// tableViewDelegate
//UIButton* _tableViewDelegate;
//@property (nonatomic, retain) IBOutlet UIButton* tableViewDelegate;
@synthesize tableViewDelegate = _tableViewDelegate;

// barButtonItem
//UIButton* _barButtonItem;
//@property (nonatomic, retain) IBOutlet UIButton* barButtonItem;
@synthesize barButtonItem = _barButtonItem;


// picker
//UIButton* _picker;
//@property (nonatomic, retain) IBOutlet UIButton* picker;
@synthesize picker = _picker;


@end
