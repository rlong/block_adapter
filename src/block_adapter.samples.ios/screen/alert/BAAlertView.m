// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAAlertView.h"
#import "JBLog.h"
#import "JBMemoryModel.h"




////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAAlertView ()

// blockAdapters
//NSMutableArray* _blockAdapters;
@property (nonatomic, retain) NSMutableArray* blockAdapters;
//@synthesize blockAdapters = _blockAdapters;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -



@implementation BAAlertView

-(void)addAdapter:(id)adapter {
    
    [_blockAdapters addObject:adapter];
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithCoder:(NSCoder *)aDecoder {
    
    Log_enteredMethod();
    
    BAAlertView* answer = [super initWithCoder:aDecoder];
    if( nil != answer ) {
        _blockAdapters = [[NSMutableArray alloc] init];
        
    }
    
    return answer;
    
}


-(void)dealloc {
	
    [self setBlockAdapters:nil];
    [self setBlockAlert:nil];
	[self setAsyncBlockAlert:nil];

    JBSuperDealloc();
	
}


#pragma mark -
#pragma mark fields


// blockAdapters
//NSMutableArray* _blockAdapters;
//@property (nonatomic, retain) NSMutableArray* blockAdapters;
@synthesize blockAdapters = _blockAdapters;

// blockAlert
//UIButton* _blockAlert;
//@property (nonatomic, retain) UIButton* blockAlert;
@synthesize blockAlert = _blockAlert;


// asyncBlockAlert
//UIButton* _asyncBlockAlert;
//@property (nonatomic, retain) IBOutlet UIButton* asyncBlockAlert;
@synthesize asyncBlockAlert = _asyncBlockAlert;


@end
