// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BATableViewBlockAdapter.h"

#import "JBBlockJob.h"
#import "JBLog.h"
#import "JBWorkManager.h"
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
@property (nonatomic, copy) JBTableViewDelegate adaptee;
//@synthesize adaptee = _adaptee;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BATableViewBlockAdapter



+(BATableViewBlockAdapter*)adapterWithClient:(UITableView *)client adaptee:(JBTableViewDelegate)adaptee {
    
    
    BATableViewBlockAdapter* answer = [[BATableViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    JBAutorelease(answer);
    //[answer autorelease];
    
    return answer;
    
    
}


+(BATableViewBlockAdapter*)adapterWithClient:(UITableView *)client adaptee:(JBTableViewDelegate)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed {
    
    BATableViewBlockAdapter* answer = [[BATableViewBlockAdapter alloc] initWithClient:client adaptee:adaptee asyncBlock:asyncTask asyncBlockDone:asyncTaskDone asyncBlockFailed:asyncTaskFailed];
    JBAutorelease(answer);
    //[answer autorelease];
    
    return answer;
    
}

#pragma mark -
#pragma mark <UITableViewDelegate> implementation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Log_enteredMethod();
    
    id adapteeResponse = _adaptee( tableView, indexPath );
    
    if( nil != _asyncTask ) {
        
        JBBlockJob* job = [[JBBlockJob alloc] initWithContext:adapteeResponse block:_asyncTask onBlockDone:_asyncTaskDone onBlockFailed:_asyncTaskFailed];
        {
            [JBWorkManager enqueue:job];
        }
        JBRelease(job);
        //[job release];
    }
    
    
}


#pragma mark -
#pragma mark instance lifecycle


-(id)initWithClient:(UITableView*)client adaptee:(JBTableViewDelegate)adaptee  {
    
    BATableViewBlockAdapter* answer = [super initWithAsyncBlock:nil asyncBlockDone:nil asyncBlockFailed:nil];
    
    if( nil != answer ) {
        
        [answer setClient:client];
        [answer setAdaptee:adaptee];

        [client setDelegate:answer];
    }
    
    return answer;
    
    
}


-(id)initWithClient:(UITableView*)client adaptee:(JBTableViewDelegate)adaptee asyncBlock:(JBBlock)asyncTask asyncBlockDone:(JBBlockDone)asyncTaskDone asyncBlockFailed:(JBBlockFailed)asyncTaskFailed {
    
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
