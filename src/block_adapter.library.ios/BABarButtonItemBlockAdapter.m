//
//  JBBarButtonItemBlockAdapter.m
//  jsonbroker
//
//  Created by rlong on 18/05/13.
//
//

#import "BABarButtonItemBlockAdapter.h"
#import "BABlockAdapterJob.h"
#import "JBWorkManager.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BABarButtonItemBlockAdapter ()

// client
//UIBarButtonItem* _client;
@property (nonatomic, retain) UIBarButtonItem* client;
//@synthesize client = _client;

// adaptee
//JBBarButtonItemDelegate _adaptee;
@property (nonatomic, copy) JBBarButtonItemDelegate adaptee;
//@synthesize adaptee = _adaptee;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -


@implementation BABarButtonItemBlockAdapter


-(void)adaptCall:(id)sender {
    
    id adapteeResponse = _adaptee( _client );
    
    if( nil != _asyncTask ) {
        
        BABlockAdapterJob* job = [[BABlockAdapterJob alloc] initWithAdapteeResponse:adapteeResponse asyncTask:_asyncTask asyncTaskDone:_asyncTaskDone asyncTaskFailed:_asyncTaskFailed];
        {
            [JBWorkManager enqueue:job];
        }
        [job release];
    }
    
}


+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee {
    
    BABarButtonItemBlockAdapter* answer = [[BABarButtonItemBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncTask:nil asyncTaskDone:nil asyncTaskFailed:nil];
    [answer autorelease];
    
    [client setTarget:answer];
    [client setAction:@selector(adaptCall:)];
    
    return answer;
}

+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask afterAsyncTaskDone:(AsyncTaskDone)asyncTaskDone afterAsyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed {
    
    BABarButtonItemBlockAdapter* answer = [[BABarButtonItemBlockAdapter alloc] initWithClient:client
                                                                        adaptee:adaptee
                                                                      asyncTask:asyncTask
                                                                  asyncTaskDone:asyncTaskDone
                                                                asyncTaskFailed:asyncTaskFailed];
    [answer autorelease];
    
    [client setTarget:answer];
    [client setAction:@selector(adaptCall:)];
    
    return answer;
    
}


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask asyncTaskDone:(AsyncTaskDone)asyncTaskDone asyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed {
    
    BABarButtonItemBlockAdapter* answer = [super initWithAsyncTask:asyncTask asyncTaskDone:asyncTaskDone asyncTaskFailed:asyncTaskFailed];
    
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
//UIBarButtonItem* _client;
//@property (nonatomic, retain) UIBarButtonItem* client;
@synthesize client = _client;

// adaptee
//JBBarButtonItemDelegate _adaptee;
//@property (nonatomic, copy) JBBarButtonItemDelegate adaptee;
@synthesize adaptee = _adaptee;


@end
