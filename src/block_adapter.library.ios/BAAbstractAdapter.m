// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAAbstractAdapter.h"

#import "JBLog.h"
#import "JBMemoryModel.h"
#import "JBObjectTracker.h"


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAAbstractAdapter ()


// asyncBlock
//JBBlock _asyncBlock;
@property (nonatomic, copy) JBBlock asyncBlock;
//@synthesize asyncBlock = _asyncBlock;

// asyncBlockDone
//JBBlockDone _asyncBlockDone;
@property (nonatomic, copy) JBBlockDone asyncBlockDone;
//@synthesize asyncBlockDone = _asyncBlockDone;


// asyncBlockFailed
//JBBlockFailed _asyncBlockFailed;
@property (nonatomic, copy) JBBlockFailed asyncBlockFailed;
//@synthesize asyncBlockFailed = _asyncBlockFailed;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BAAbstractAdapter


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithAsyncBlock:(JBBlock)asyncBlock asyncBlockDone:(JBBlockDone)asyncBlockDone asyncBlockFailed:(JBBlockFailed)asyncBlockFailed {
    
    BAAbstractAdapter* answer = [super init];
    
    if( nil != answer ) {
        
        [JBObjectTracker allocated:answer];
        
        [answer setAsyncBlock:asyncBlock];
        [answer setAsyncBlockDone:asyncBlockDone];
        [answer setAsyncBlockFailed:asyncBlockFailed];
    }
    
    return answer;
    
}


-(void)dealloc {
    
    [JBObjectTracker deallocated:self];
	
	[self setAsyncBlock:nil];
	[self setAsyncBlockDone:nil];
	[self setAsyncBlockFailed:nil];
	
    JBSuperDealloc();
	
}

#pragma mark -
#pragma mark fields

// asyncBlock
//JBBlock _asyncBlock;
//@property (nonatomic, copy) JBBlock asyncBlock;
@synthesize asyncBlock = _asyncBlock;

// asyncBlockDone
//JBBlockDone _asyncBlockDone;
//@property (nonatomic, copy) JBBlockDone asyncBlockDone;
@synthesize asyncBlockDone = _asyncBlockDone;

// asyncBlockFailed
//JBBlockFailed _asyncBlockFailed;
//@property (nonatomic, copy) JBBlockFailed asyncBlockFailed;
@synthesize asyncBlockFailed = _asyncBlockFailed;

@end
