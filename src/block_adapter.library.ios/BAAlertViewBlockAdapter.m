// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAAlertViewBlockAdapter.h"

#import "JBBlockJob.h"
#import "JBLog.h"
#import "JBMemoryModel.h"


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAAlertViewBlockAdapter ()

// client
//UIAlertView* _client;
@property (nonatomic, retain) UIAlertView* client;
//@synthesize client = _client;

// adaptee
//AlertViewDelegate _adaptee;
@property (nonatomic, copy) BAAlertViewAdaptee adaptee;
//@synthesize adaptee = _adaptee;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -


@implementation BAAlertViewBlockAdapter


+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(BAAlertViewAdaptee)adaptee {


    BAAlertViewBlockAdapter* answer = [[BAAlertViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    JBAutorelease(answer);
    //[answer autorelease];
    
    return answer;

    
}


+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(BAAlertViewAdaptee)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAAlertViewBlockAdapter* answer = [[BAAlertViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    JBAutorelease(answer);
    //[answer autorelease];
    
    return answer;
    
    
    
}


#pragma mark -
#pragma mark <UIAlertViewDelegate> implementation

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	
    Log_debugInt(buttonIndex);
    
    id adapteeResponse = _adaptee( alertView, buttonIndex );
    
    if( nil != _asyncBlock ) {
        
        [JBBlockJob executeWithContext:adapteeResponse block:_asyncBlock onBlockDone:_asyncBlockDone onBlockFailed:_asyncBlockFailed];
    }
    
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithClient:(UIAlertView*)client adaptee:(BAAlertViewAdaptee)adaptee {
    
    BAAlertViewBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];

        [client setDelegate:answer];

    }
    
    return answer;
}

-(id)initWithClient:(UIAlertView*)client adaptee:(BAAlertViewAdaptee)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAAlertViewBlockAdapter* answer = [super initWithAsyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
    
        [client setDelegate:answer];
    }
    
    return answer;
}


-(void)dealloc {
	
	[self setClient:nil];
    [self setAdaptee:nil];

    JBSuperDealloc();
	
}



#pragma mark -
#pragma mark fields

// client
//UIAlertView* _client;
//@property (nonatomic, retain) UIAlertView* client;
@synthesize client = _client;

// adaptee
//AlertViewDelegate _adaptee;
//@property (nonatomic, copy) AlertViewDelegate adaptee;
@synthesize adaptee = _adaptee;

@end
