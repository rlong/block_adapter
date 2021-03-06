// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//

#import "BABarButtonItemView.h"

#import "JBMemoryModel.h"



////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BABarButtonItemView ()

// blockAdapters
//NSMutableArray* _blockAdapters;
@property (nonatomic, retain) NSMutableArray* blockAdapters;
//@synthesize blockAdapters = _blockAdapters;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -


@implementation BABarButtonItemView


-(void)addAdapter:(id)adapter {
    
    [_blockAdapters addObject:adapter];
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithCoder:(NSCoder *)aDecoder {
    
    
    BABarButtonItemView* answer = [super initWithCoder:aDecoder];
    if( nil != answer ) {
        _blockAdapters = [[NSMutableArray alloc] init];
        
    }
    
    return answer;
    
}


-(void)dealloc {
    
    [self setBlockAdapters:nil];
	[self setStandard:nil];
    [self setBlock:nil];
	[self setAsyncBlock:nil];

    JBSuperDealloc();
	
}

#pragma mark -
#pragma mark fields


// blockAdapters
//NSMutableArray* _blockAdapters;
//@property (nonatomic, retain) NSMutableArray* blockAdapters;
@synthesize blockAdapters = _blockAdapters;

// standard
//UIBarButtonItem* _standard;
//@property (nonatomic, retain) IBOutlet UIBarButtonItem* standard;
@synthesize standard = _standard;

// block
//UIBarButtonItem* _block;
//@property (nonatomic, retain) IBOutlet UIBarButtonItem* block;
@synthesize block = _block;

// asyncBlock
//UIBarButtonItem* _asyncBlock;
//@property (nonatomic, retain) IBOutlet UIBarButtonItem* asyncBlock;
@synthesize asyncBlock = _asyncBlock;

@end
