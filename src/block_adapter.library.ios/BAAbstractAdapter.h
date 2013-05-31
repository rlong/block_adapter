// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>


#import "JBBlockJob.h"


@interface BAAbstractAdapter : NSObject  {
    
    // asyncBlock
    JBBlock _asyncBlock;
    //@property (nonatomic, copy) JBBlock asyncBlock;
    //@synthesize asyncBlock = _asyncBlock;

    // asyncBlockDone
    JBBlockDone _asyncBlockDone;
    //@property (nonatomic, copy) JBBlockDone asyncBlockDone;
    //@synthesize asyncBlockDone = _asyncBlockDone;

    
    // asyncBlockFailed
    JBBlockFailed _asyncBlockFailed;
    //@property (nonatomic, copy) JBBlockFailed asyncBlockFailed;
    //@synthesize asyncBlockFailed = _asyncBlockFailed;

    
}

#pragma mark -
#pragma mark instance lifecycle

-(id)initWithAsyncBlock:(JBBlock)asyncBlock asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncBlockFailed;


@end
