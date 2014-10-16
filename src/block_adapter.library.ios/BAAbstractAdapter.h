// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>


#import "JBBlockJob.h"

@interface BAAbstractAdapter : NSObject  {
    
    // asyncBlock
    jbBlock _asyncBlock;
    //@property (nonatomic, copy) jbBlock asyncBlock;
    //@synthesize asyncBlock = _asyncBlock;
    

    // asyncBlockDone
    jbBlockDone _asyncBlockDone;
    //@property (nonatomic, copy) jbBlockDone asyncBlockDone;
    //@synthesize asyncBlockDone = _asyncBlockDone;

    
    // asyncBlockFailed
    jbBlockFailed _asyncBlockFailed;
    //@property (nonatomic, copy) jbBlockFailed asyncBlockFailed;
    //@synthesize asyncBlockFailed = _asyncBlockFailed;

    
}

#pragma mark -
#pragma mark instance lifecycle

-(id)initWithAsyncBlock:(jbBlock)asyncBlock asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncBlockFailed;

#pragma mark -
#pragma mark fields

// asyncBlock
//jbBlock _asyncBlock;
@property (nonatomic, copy) jbBlock asyncBlock;
//@synthesize asyncBlock = _asyncBlock;

// asyncBlockDone
//jbBlockDone _asyncBlockDone;
@property (nonatomic, copy) jbBlockDone asyncBlockDone;
//@synthesize asyncBlockDone = _asyncBlockDone;

// asyncBlockFailed
//jbBlockFailed _asyncBlockFailed;
@property (nonatomic, copy) jbBlockFailed asyncBlockFailed;
//@synthesize asyncBlockFailed = _asyncBlockFailed;

@end
