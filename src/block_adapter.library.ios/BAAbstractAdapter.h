// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>


#import "JBBlockJob.h"


@interface BAAbstractAdapter : NSObject  {
    
    // asyncTask
    JBBlock _asyncTask;
    //@property (nonatomic, copy) JBBlock asyncTask;
    //@synthesize asyncTask = _asyncTask;

    // asyncTaskDone
    JBBlockDone _asyncTaskDone;
    //@property (nonatomic, copy) JBBlockDone asyncTaskDone;
    //@synthesize asyncTaskDone = _asyncTaskDone;

    
    // asyncTaskFailed
    JBBlockFailed _asyncTaskFailed;
    //@property (nonatomic, copy) JBBlockFailed asyncTaskFailed;
    //@synthesize asyncTaskFailed = _asyncTaskFailed;

    
}

#pragma mark -
#pragma mark instance lifecycle

-(id)initWithAsyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed;


@end
