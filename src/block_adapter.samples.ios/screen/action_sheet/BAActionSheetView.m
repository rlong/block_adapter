// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//



#import "BAActionSheetView.h"
#import "JBLog.h"
#import "JBMemoryModel.h"



////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAActionSheetView ()

// blockAdapters
//NSMutableArray* _blockAdapters;
@property (nonatomic, retain) NSMutableArray* blockAdapters;
//@synthesize blockAdapters = _blockAdapters;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -




@implementation BAActionSheetView


-(void)addAdapter:(id)adapter {
    
    [_blockAdapters addObject:adapter];
}



#pragma mark -
#pragma mark instance lifecycle



-(id)initWithCoder:(NSCoder *)aDecoder {
    
    Log_enteredMethod();
    
    BAActionSheetView* answer = [super initWithCoder:aDecoder];
    if( nil != answer ) {
        _blockAdapters = [[NSMutableArray alloc] init];
        
    }
    
    return answer;
    
}


-(void)dealloc {
	
    [self setBlockAdapters:nil];
	[self setToolbar:nil];
    [self setBlockActionSheet:nil];
	[self setAsyncBlockActionSheet:nil];

    JBSuperDealloc();
	//[super dealloc];
	
}

#pragma mark -
#pragma mark fields


// blockAdapters
//NSMutableArray* _blockAdapters;
//@property (nonatomic, retain) NSMutableArray* blockAdapters;
@synthesize blockAdapters = _blockAdapters;

// toolbar
//UIToolbar* _toolbar;
//@property (nonatomic, retain) IBOutlet UIToolbar* toolbar;
@synthesize toolbar = _toolbar;

// blockActionSheet
//UIButton* _blockActionSheet;
//@property (nonatomic, retain) IBOutlet UIButton* blockActionSheet;
@synthesize blockActionSheet = _blockActionSheet;

// asyncBlockActionSheet
//UIButton* _asyncBlockActionSheet;
//@property (nonatomic, retain) IBOutlet UIButton* asyncBlockActionSheet;
@synthesize asyncBlockActionSheet = _asyncBlockActionSheet;


@end
