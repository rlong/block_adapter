// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAAbstractAdapter.h"

#import "JBLog.h"
#import "JBMemoryModel.h"


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAAbstractAdapter ()


// asyncTask
//JBBlock _asyncTask;
@property (nonatomic, copy) JBBlock asyncTask;
//@synthesize asyncTask = _asyncTask;

// asyncTaskDone
//JBBlockDone _asyncTaskDone;
@property (nonatomic, copy) JBBlockDone asyncTaskDone;
//@synthesize asyncTaskDone = _asyncTaskDone;


// asyncTaskFailed
//JBBlockFailed _asyncTaskFailed;
@property (nonatomic, copy) JBBlockFailed asyncTaskFailed;
//@synthesize asyncTaskFailed = _asyncTaskFailed;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BAAbstractAdapter


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithAsyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
    
    BAAbstractAdapter* answer = [super init];
    
    if( nil != answer ) {
        [answer setAsyncTask:asyncTask];
        [answer setAsyncTaskDone:asyncTaskDone];
        [answer setAsyncTaskFailed:asyncTaskFailed];
    }
    
    return answer;
    
    
}


-(void)dealloc {
	
    [self setAsyncTask:nil];
    [self setAsyncTaskDone:nil];
	[self setAsyncTaskFailed:nil];
	
    JBSuperDealloc();
	
}

#pragma mark -
#pragma mark fields

// asyncTask
//JBBlock _asyncTask;
//@property (nonatomic, copy) JBBlock asyncTask;
@synthesize asyncTask = _asyncTask;

// asyncTaskDone
//JBBlockDone _asyncTaskDone;
//@property (nonatomic, copy) JBBlockDone asyncTaskDone;
@synthesize asyncTaskDone = _asyncTaskDone;

// asyncTaskFailed
//JBBlockFailed _asyncTaskFailed;
//@property (nonatomic, copy) JBBlockFailed asyncTaskFailed;
@synthesize asyncTaskFailed = _asyncTaskFailed;

@end
