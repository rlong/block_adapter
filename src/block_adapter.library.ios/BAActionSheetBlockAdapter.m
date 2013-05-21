// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAActionSheetBlockAdapter.h"

#import "JBBlockJob.h"
#import "JBWorkManager.h"

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
@property (nonatomic, copy) ActionSheetDelegate adaptee;
//@synthesize adaptee = _adaptee;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -


@implementation BAActionSheetBlockAdapter


+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(ActionSheetDelegate)adaptee {
    
    
    BAActionSheetBlockAdapter* answer = [[BAActionSheetBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    
    [answer autorelease];
    
    [client setDelegate:answer];
    
    return answer;
    
    
}


+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(ActionSheetDelegate)adaptee asyncBlock:(JBBlock)asyncTask afterAsyncBlockDone:(JBBlockDone)asyncTaskDone afterAsyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAActionSheetBlockAdapter* answer = [[BAActionSheetBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    
    [answer autorelease];
    
    [client setDelegate:answer];
    
    return answer;
    
    
    
}

#pragma mark -
#pragma mark <UIActionSheetDelegate> implementation


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    id adapteeResponse = _adaptee( actionSheet, buttonIndex );
    
    if( nil != _asyncTask ) {
        
        JBBlockJob* job = [[JBBlockJob alloc] initWithContext:adapteeResponse block:_asyncTask onBlockDone:_asyncTaskDone onBlockFailed:_asyncTaskFailed];
        {
            [JBWorkManager enqueue:job];            
        }
        [job release];
    }
    
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithClient:(UIActionSheet*)client adaptee:(ActionSheetDelegate)adaptee {

    BAActionSheetBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
    }
    
    return answer;

}

-(id)initWithClient:(UIActionSheet*)client adaptee:(ActionSheetDelegate)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAActionSheetBlockAdapter* answer = [super initWithAsyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
    }
    
    return answer;
}



-(void)dealloc {
	
	[self setClient:nil];
    [self setAdaptee:nil];
    
	[super dealloc];
	
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
