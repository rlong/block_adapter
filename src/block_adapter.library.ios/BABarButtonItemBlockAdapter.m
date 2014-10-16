// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BABarButtonItemBlockAdapter.h"

#import "JBBlockJob.h"
#import "JBMemoryModel.h"

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
@property (nonatomic, copy) BABarButtonItemAdaptee adaptee;
//@synthesize adaptee = _adaptee;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -


@implementation BABarButtonItemBlockAdapter


-(void)adaptCall:(id)sender {
    
    if( nil == _adaptee ) {
        return;
    }

    id adapteeResponse = _adaptee( _client );
    
    if( nil != _asyncBlock ) {
        
        [JBBlockJob executeWithContext:adapteeResponse block:_asyncBlock onBlockDone:_asyncBlockDone onBlockFailed:_asyncBlockFailed];
    }
    
}


+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(BABarButtonItemAdaptee)adaptee {
    
    BABarButtonItemBlockAdapter* answer = [[BABarButtonItemBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    JBAutorelease(answer);
    //[answer autorelease];
    
    return answer;
}

+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(BABarButtonItemAdaptee)adaptee asyncTask:(jbBlock)asyncTask afterAsyncTaskDone:(jbBlockDone)asyncTaskDone afterAsyncTaskFailed:(jbBlockFailed)asyncTaskFailed {
    
    BABarButtonItemBlockAdapter* answer = [[BABarButtonItemBlockAdapter alloc] initWithClient:client
                                                                                      adaptee:adaptee
                                                                                   asyncBlock:asyncTask
                                                                               asyncBlockDone:asyncTaskDone
                                                                             asyncBlockFailed:asyncTaskFailed];
    JBAutorelease(answer);
    //[answer autorelease];
    
    
    return answer;
    
}


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithClient:(UIBarButtonItem*)client adaptee:(BABarButtonItemAdaptee)adaptee {
    
    BABarButtonItemBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
        
        [client setTarget:answer];
        [client setAction:@selector(adaptCall:)];

        
    }
    
    return answer;
    
}

-(id)initWithClient:(UIBarButtonItem*)client adaptee:(BABarButtonItemAdaptee)adaptee asyncBlock:(jbBlock)asyncTask asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncTaskFailed {
    
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

	
    JBSuperDealloc();
	
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
