//
//  JBAlertViewBlockAdapter.m
//  jsonbroker
//
//  Created by rlong on 16/05/13.
//
//

#import "BAAlertViewBlockAdapter.h"
#import "BABlockAdapterJob.h"
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


    BAAlertViewBlockAdapter* answer = [[BAAlertViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncTask:nil asyncTaskDone:nil asyncTaskFailed:nil];
    
    
    [answer autorelease];
    
    [client setDelegate:answer];
    
    return answer;

    
}


+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(JBAlertViewDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask afterAsyncTaskDone:(AsyncTaskDone)asyncTaskDone afterAsyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed {
    
    BAAlertViewBlockAdapter* answer = [[BAAlertViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncTask:asyncTask asyncTaskDone:asyncTaskDone asyncTaskFailed:asyncTaskFailed];
    
    
    [answer autorelease];
    
    [client setDelegate:answer];
    
    return answer;
    
    
    
}


#pragma mark -
#pragma mark <UIAlertViewDelegate> implementation

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	
    Log_debugInt(buttonIndex);
    
    id adapteeResponse = _adaptee( alertView, buttonIndex );
    
    if( nil != _asyncTask ) {
        
        BABlockAdapterJob* job = [[BABlockAdapterJob alloc] initWithAdapteeResponse:adapteeResponse asyncTask:_asyncTask asyncTaskDone:_asyncTaskDone asyncTaskFailed:_asyncTaskFailed];
        {
            [JBWorkManager enqueue:job];
        }
        [job release];
    }
    
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithClient:(UIAlertView*)client adaptee:(JBAlertViewDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask asyncTaskDone:(AsyncTaskDone)asyncTaskDone asyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed {
    
    BAAlertViewBlockAdapter* answer = [super initWithAsyncTask:asyncTask asyncTaskDone:asyncTaskDone asyncTaskFailed:asyncTaskFailed];
    
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
//UIAlertView* _client;
//@property (nonatomic, retain) UIAlertView* client;
@synthesize client = _client;

// adaptee
//AlertViewDelegate _adaptee;
//@property (nonatomic, copy) AlertViewDelegate adaptee;
@synthesize adaptee = _adaptee;

@end
