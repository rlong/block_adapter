// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BABarButtonItemBlockAdapter.h"

#import "JBBlockJob.h"
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
        
        JBBlockJob* job = [[JBBlockJob alloc] initWithContext:adapteeResponse block:_asyncTask onBlockDone:_asyncTaskDone onBlockFailed:_asyncTaskFailed];
        {
            [JBWorkManager enqueue:job];
        }
        [job release];
    }
    
}


+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee {
    
    BABarButtonItemBlockAdapter* answer = [[BABarButtonItemBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    [answer autorelease];
    
    return answer;
}

+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed {
    
    BABarButtonItemBlockAdapter* answer = [[BABarButtonItemBlockAdapter alloc] initWithClient:client
                                                                        adaptee:adaptee
                                                                      asyncBlock:asyncTask
                                                                  asyncBlockDone:asyncTaskDone
                                                                asyncBlockFailed:asyncTaskFailed];
    [answer autorelease];
    
    
    return answer;
    
}


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee {
    
    BABarButtonItemBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
        
        [client setTarget:answer];
        [client setAction:@selector(adaptCall:)];

        
    }
    
    return answer;
    
}

-(id)initWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
    BABarButtonItemBlockAdapter* answer = [super initWithAsyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
        
        [client setTarget:answer];
        [client setAction:@selector(adaptCall:)];

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
