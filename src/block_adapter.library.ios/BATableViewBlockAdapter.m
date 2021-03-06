// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BATableViewBlockAdapter.h"

#import "JBBlockJob.h"
#import "JBLog.h"
#import "JBMemoryModel.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BATableViewBlockAdapter ()

// client
//UITableView* _client;
@property (nonatomic, retain) UITableView* client;
//@synthesize client = _client;

// adaptee
//JBTableViewDelegate _adaptee;
@property (nonatomic, copy) BATableViewAdaptee adaptee;
//@synthesize adaptee = _adaptee;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BATableViewBlockAdapter



+(BATableViewBlockAdapter*)adapterWithClient:(UITableView *)client adaptee:(BATableViewAdaptee)adaptee {
    
    
    BATableViewBlockAdapter* answer = [[BATableViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    JBAutorelease(answer);
    //[answer autorelease];
    
    return answer;
    
    
}


+(BATableViewBlockAdapter*)adapterWithClient:(UITableView *)client adaptee:(BATableViewAdaptee)adaptee asyncTask:(jbBlock)asyncTask afterAsyncTaskDone:(jbBlockDone)asyncTaskDone afterAsyncTaskFailed:(jbBlockFailed)asyncTaskFailed {
    
    BATableViewBlockAdapter* answer = [[BATableViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    JBAutorelease(answer);
    //[answer autorelease];
    
    return answer;
    
}

#pragma mark -
#pragma mark <UITableViewDelegate> implementation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if( nil == _adaptee ) {
        return;
    }
    
    id adapteeResponse = _adaptee( tableView, indexPath );
    
    if( nil != _asyncBlock ) {
        
        [JBBlockJob executeWithContext:adapteeResponse block:_asyncBlock onBlockDone:_asyncBlockDone onBlockFailed:_asyncBlockFailed];
    }
    
    
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithClient:(UITableView*)client adaptee:(BATableViewAdaptee)adaptee  {
    
    BATableViewBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];

        [client setDelegate:answer];
    }
    
    return answer;
    
    
}


-(id)initWithClient:(UITableView*)client adaptee:(BATableViewAdaptee)adaptee asyncBlock:(jbBlock)asyncTask asyncBlockDone:(jbBlockDone)asyncTaskDone asyncBlockFailed:(jbBlockFailed)asyncTaskFailed {
    
    BATableViewBlockAdapter* answer = [super initWithAsyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    
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
//UITableView* _client;
//@property (nonatomic, retain) UITableView* client;
@synthesize client = _client;

// adaptee
//JBTableViewDelegate _adaptee;
//@property (nonatomic, copy) JBTableViewDelegate adaptee;
@synthesize adaptee = _adaptee;


@end
