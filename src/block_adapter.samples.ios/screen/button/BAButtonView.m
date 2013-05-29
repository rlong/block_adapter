// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//

#import "BAButtonView.h"
#import "JBLog.h"
#import "JBMemoryModel.h"


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAButtonView ()

// blockAdapters
//NSMutableArray* _blockAdapters;
@property (nonatomic, retain) NSMutableArray* blockAdapters;
//@synthesize blockAdapters = _blockAdapters;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -


@implementation BAButtonView



-(void)addAdapter:(id)adapter {
    
    [_blockAdapters addObject:adapter];
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithCoder:(NSCoder *)aDecoder {

    Log_enteredMethod();
    
    BAButtonView* answer = [super initWithCoder:aDecoder];
    if( nil != answer ) {
        _blockAdapters = [[NSMutableArray alloc] init];
        
    }
    
    return answer;

}


-(void)dealloc {
	
    [self setBlockAdapters:nil];
	[self setBlockButton:nil];
    [self setAsyncBlockButton:nil];

	
    JBSuperDealloc();
	
}


#pragma mark -
#pragma mark fields


// blockAdapters
//NSMutableArray* _blockAdapters;
//@property (nonatomic, retain) NSMutableArray* blockAdapters;
@synthesize blockAdapters = _blockAdapters;


// blockButton
//UIButton* _blockButton;
//@property (nonatomic, retain) IBOutlet UIButton* blockButton;
@synthesize blockButton = _blockButton;

// asyncBlockButton
//UIButton* _asyncBlockButton;
//@property (nonatomic, retain) IBOutlet UIButton* asyncBlockButton;
@synthesize asyncBlockButton = _asyncBlockButton;



@end
