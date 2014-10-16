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



@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BAAbstractAdapter


#pragma mark -
#pragma mark instance lifecycle


-(id)init  {

    BAAbstractAdapter* answer = [super init];
    
    if( nil != answer ) {
        
        [JBObjectTracker allocated:answer];
    }
    
    return answer;
    
}


-(id)initWithAsyncBlock:(jbBlock)asyncBlock asyncBlockDone:(jbBlockDone)asyncBlockDone asyncBlockFailed:(jbBlockFailed)asyncBlockFailed {
    
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
//jbBlock _asyncBlock;
//@property (nonatomic, copy) jbBlock asyncBlock;
@synthesize asyncBlock = _asyncBlock;

// asyncBlockDone
//jbBlockDone _asyncBlockDone;
//@property (nonatomic, copy) jbBlockDone asyncBlockDone;
@synthesize asyncBlockDone = _asyncBlockDone;

// asyncBlockFailed
//jbBlockFailed _asyncBlockFailed;
//@property (nonatomic, copy) jbBlockFailed asyncBlockFailed;
@synthesize asyncBlockFailed = _asyncBlockFailed;

@end
