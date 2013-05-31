// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAButtonBlockAdapter.h"

#import "JBBlockJob.h"
#import "JBLog.h"
#import "JBMemoryModel.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAButtonBlockAdapter ()


// client
//UIButton* _client;
@property (nonatomic, retain) UIButton* client;
//@synthesize client = _client;


// adaptee
//ButtonDelegate _adaptee;
@property (nonatomic, copy) BAButtonAdaptee adaptee;
//@synthesize adaptee = _adaptee;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BAButtonBlockAdapter



#pragma mark -



-(void)adaptCall:(id)sender {

    id adapteeResponse = _adaptee( _client );

    if( nil != _asyncBlock ) {
        
        [JBBlockJob executeWithContext:adapteeResponse block:_asyncBlock onBlockDone:_asyncBlockDone onBlockFailed:_asyncBlockFailed];
    }

}



+(BAButtonBlockAdapter*)onTouchUpInside:(UIButton*)button adaptee:(BAButtonAdaptee)adaptee {
    
    BAButtonBlockAdapter* answer = [[BAButtonBlockAdapter alloc] initWithClient:button adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    JBAutorelease(answer);
    //[answer autorelease];
    
    
    return answer;
}

+(BAButtonBlockAdapter*)onTouchUpInside:(UIButton*)button adaptee:(BAButtonAdaptee)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed {

    BAButtonBlockAdapter* answer = [[BAButtonBlockAdapter alloc] initWithClient:button
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

-(id)initWithClient:(UIButton*)client adaptee:(BAButtonAdaptee)adaptee {
    
    BAButtonBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
        
        [client addTarget:answer action:@selector(adaptCall:) forControlEvents:UIControlEventTouchUpInside];

    }
    
    return answer;
    
}

-(id)initWithClient:(UIButton*)client adaptee:(BAButtonAdaptee)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
    BAButtonBlockAdapter* answer = [super initWithAsyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];

        [client addTarget:answer action:@selector(adaptCall:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return answer;
    
    
}


-(void)dealloc {
	
    Log_enteredMethod();

    [_client removeTarget:self action:@selector(callDelegate:) forControlEvents:UIControlEventTouchUpInside];
    [self setClient:nil];
    [self setAdaptee:nil];


    JBSuperDealloc();
	
}


#pragma mark -
#pragma mark fields

// client
//UIButton* _client;
//@property (nonatomic, retain) UIButton* client;
@synthesize client = _client;

// adaptee
//ButtonDelegate _adaptee;
//@property (nonatomic, copy) ButtonDelegate adaptee;
@synthesize adaptee = _adaptee;


@end
