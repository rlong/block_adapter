//
//  BlockAdapterJob.h
//  jsonbroker
//
//  Created by rlong on 17/05/13.
//
//

#import <Foundation/Foundation.h>


#import "BABlockAdapter.h"
#import "JBJob.h"


@interface BABlockAdapterJob : NSObject <JBJob> {
    
    
    // adapteeResponse
    id _adapteeResponse;
    //@property (nonatomic, retain) id adapteeResponse;
    //@synthesize adapteeResponse = _adapteeResponse;

    // asyncTask
    BAAsyncTask _asyncTask;
    //@property (nonatomic, copy) BAAsyncTask asyncTask;
    //@synthesize asyncTask = _asyncTask;
    
    
    // asyncTaskResponse
    id _asyncTaskResponse;
    //@property (nonatomic, retain) id asyncTaskResponse;
    //@synthesize asyncTaskResponse = _asyncTaskResponse;

    
    // asyncTaskDone
    AsyncTaskDone _asyncTaskDone;
    //@property (nonatomic, copy) AsyncTaskDone asyncTaskDone;
    //@synthesize asyncTaskDone = _asyncTaskDone;
    
    
    // asyncTaskFailed
    AsyncTaskFailed _asyncTaskFailed;
    //@property (nonatomic, copy) AsyncTaskFailed asyncTaskFailed;
    //@synthesize asyncTaskFailed = _asyncTaskFailed;

    
}


#pragma mark -
#pragma mark instance lifecycle

-(id)initWithAdapteeResponse:(id)adapteeResponse asyncTask:(BAAsyncTask)asyncTask asyncTaskDone:(AsyncTaskDone)asyncTaskDone asyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed;


@end
