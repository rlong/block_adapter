// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAAlertViewBlockAdapter.h"

#import "JBBlockJob.h"
#import "JBLog.h"
#import "JBWorkManager.h"


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
@property (nonatomic, copy) JBAlertViewDelegate adaptee;
//@synthesize adaptee = _adaptee;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -


@implementation BAAlertViewBlockAdapter


+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(JBAlertViewDelegate)adaptee {


    BAAlertViewBlockAdapter* answer = [[BAAlertViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    
    [answer autorelease];
    
    return answer;

    
}


+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(JBAlertViewDelegate)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAAlertViewBlockAdapter* answer = [[BAAlertViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    
    [answer autorelease];
    
    return answer;
    
    
    
}


#pragma mark -
#pragma mark <UIAlertViewDelegate> implementation

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	
    Log_debugInt(buttonIndex);
    
    id adapteeResponse = _adaptee( alertView, buttonIndex );
    
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


-(id)initWithClient:(UIAlertView*)client adaptee:(JBAlertViewDelegate)adaptee {
    
    BAAlertViewBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];

        [client setDelegate:answer];

    }
    
    return answer;
}

-(id)initWithClient:(UIAlertView*)client adaptee:(JBAlertViewDelegate)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
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

	[super dealloc];
	
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
