// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAActionSheetBlockAdapter.h"

#import "JBBlockJob.h"
#import "JBObjectTracker.h"
#import "JBMemoryModel.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAActionSheetBlockAdapter ()

// client
//UIActionSheet* _client;
@property (nonatomic, retain) UIActionSheet* client;
//@synthesize client = _client;


// adaptee
//ActionSheetDelegate _adaptee;
@property (nonatomic, copy) BAActionSheetAdaptee adaptee;
//@synthesize adaptee = _adaptee;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -


@implementation BAActionSheetBlockAdapter


+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(BAActionSheetAdaptee)adaptee {
    
    
    BAActionSheetBlockAdapter* answer = [[BAActionSheetBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    JBAutorelease(answer);
    //[answer autorelease];
    
    
    return answer;
    
    
}


+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(BAActionSheetAdaptee)adaptee asyncBlock:(jbBlock)asyncTask afterAsyncBlockDone:(jbBlockDone)asyncTaskDone afterAsyncBlockFailed:(jbBlockFailed)asyncTaskFailed {
    
    BAActionSheetBlockAdapter* answer = [[BAActionSheetBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    JBAutorelease(answer);
    //[answer autorelease];
    
    
    return answer;
    
    
    
}

#pragma mark -
#pragma mark <UIActionSheetDelegate> implementation


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if( nil == _adaptee ) {
        return;
    }
    
    id adapteeResponse = _adaptee( actionSheet, buttonIndex );
    
    if( nil != _asyncBlock ) {
        
        [JBBlockJob executeWithContext:adapteeResponse block:_asyncBlock onBlockDone:_asyncBlockDone onBlockFailed:_asyncBlockFailed];

    }
    
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithClient:(UIActionSheet*)client adaptee:(BAActionSheetAdaptee)adaptee {

    BAActionSheetBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [JBObjectTracker allocated:answer];
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
        
        [client setDelegate:answer];

    }
    
    return answer;

}

-(id)initWithClient:(UIActionSheet*)client adaptee:(BAActionSheetAdaptee)adaptee asyncBlock:(jbBlock)asyncTask asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncTaskFailed {
    
    BAActionSheetBlockAdapter* answer = [super initWithAsyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    if( nil != answer ) {

        [JBObjectTracker allocated:answer];

        [answer setClient:client];
        [answer setAdaptee:adaptee];

        [client setDelegate:answer];
    }
    
    return answer;
}



-(void)dealloc {
	
    [JBObjectTracker deallocated:self];
    
	[self setClient:nil];
    [self setAdaptee:nil];
    
    JBSuperDealloc();
	
}



#pragma mark -
#pragma mark fields

// client
//UIActionSheet* _client;
//@property (nonatomic, retain) UIActionSheet* client;
@synthesize client = _client;


// adaptee
//ActionSheetDelegate _adaptee;
//@property (nonatomic, copy) ActionSheetDelegate adaptee;
@synthesize adaptee = _adaptee;



@end
