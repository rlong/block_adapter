// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//




#import "BATabBarBlockAdapter.h"

#import "JBBlockJob.h"
#import "JBLog.h"
#import "JBMemoryModel.h"


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BATabBarBlockAdapter ()

// client
//UITabBar* _client;
@property (nonatomic, retain) UITabBar* client;
//@synthesize client = _client;

// adaptee
//JBTabBarDelegate _adaptee;
@property (nonatomic, copy) BATabBarAdaptee adaptee;
//@synthesize adaptee = _adaptee;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BATabBarBlockAdapter


+(BATabBarBlockAdapter*)adapterWithClient:(UITabBar *)client adaptee:(BATabBarAdaptee)adaptee {
    
    
    BATabBarBlockAdapter* answer = [[BATabBarBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    JBAutorelease(answer);
    //[answer autorelease];
    
    
    return answer;
    
    
}


+(BATabBarBlockAdapter*)adapterWithClient:(UITabBar *)client adaptee:(BATabBarAdaptee)adaptee asyncTask:(jbBlock)asyncTask afterAsyncTaskDone:(jbBlockDone)asyncTaskDone afterAsyncTaskFailed:(jbBlockFailed)asyncTaskFailed {
    
    BATabBarBlockAdapter* answer = [[BATabBarBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    JBAutorelease(answer);
    //[answer autorelease];
    
    return answer;
    
}


#pragma mark - 
#pragma mark <UITabBarDelegate> implementation

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    
    if( nil == _adaptee ) {
        return;
    }

    
    id adapteeResponse = _adaptee( tabBar, item );
    
    if( nil != _asyncBlock ) {
        
        [JBBlockJob executeWithContext:adapteeResponse block:_asyncBlock onBlockDone:_asyncBlockDone onBlockFailed:_asyncBlockFailed];
    }
    
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithClient:(UITabBar*)client adaptee:(BATabBarAdaptee)adaptee {
    
    BATabBarBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];
     
        [client setDelegate:answer];

    }
    
    return answer;
    
}

-(id)initWithClient:(UITabBar*)client adaptee:(BATabBarAdaptee)adaptee asyncBlock:(jbBlock)asyncTask asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncTaskFailed {
    
    BATabBarBlockAdapter* answer = [super initWithAsyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
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
//UITabBar* _client;
//@property (nonatomic, retain) UITabBar* client;
@synthesize client = _client;

// adaptee
//JBTabBarDelegate _adaptee;
//@property (nonatomic, copy) JBTabBarDelegate adaptee;
@synthesize adaptee = _adaptee;



@end
