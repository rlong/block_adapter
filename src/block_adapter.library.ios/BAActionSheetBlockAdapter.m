//
//  JBActionSheetBlockAdapter.m
//  jsonbroker
//
//  Created by rlong on 17/05/13.
//
//

#import "BAActionSheetBlockAdapter.h"
#import "BABlockAdapterJob.h"
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
    
    
    BAActionSheetBlockAdapter* answer = [[BAActionSheetBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncTask:nil asyncTaskDone:nil asyncTaskFailed:nil];
    
    
    [answer autorelease];
    
    [client setDelegate:answer];
    
    return answer;
    
    
}


+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(ActionSheetDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask afterAsyncTaskDone:(AsyncTaskDone)asyncTaskDone afterAsyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed {
    
    BAActionSheetBlockAdapter* answer = [[BAActionSheetBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncTask:asyncTask asyncTaskDone:asyncTaskDone asyncTaskFailed:asyncTaskFailed];
    
    
    [answer autorelease];
    
    [client setDelegate:answer];
    
    return answer;
    
    
    
}

#pragma mark -
#pragma mark <UIActionSheetDelegate> implementation


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    id adapteeResponse = _adaptee( actionSheet, buttonIndex );
    
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



-(id)initWithClient:(UIActionSheet*)client adaptee:(ActionSheetDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask asyncTaskDone:(AsyncTaskDone)asyncTaskDone asyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed {
    
    BAActionSheetBlockAdapter* answer = [super initWithAsyncTask:asyncTask asyncTaskDone:asyncTaskDone asyncTaskFailed:asyncTaskFailed];
    
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
