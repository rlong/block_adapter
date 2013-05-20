//
//  JBAbstractAdapter.h
//  jsonbroker
//
//  Created by rlong on 17/05/13.
//
//

#import <Foundation/Foundation.h>


#import "BABlockAdapter.h"


@interface BAAbstractAdapter : NSObject  {
    
    // asyncTask
    BAAsyncTask _asyncTask;
    //@property (nonatomic, copy) BAAsyncTask asyncTask;
    //@synthesize asyncTask = _asyncTask;

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

-(id)initWithAsyncTask:(BAAsyncTask)asyncTask asyncTaskDone:(AsyncTaskDone)asyncTaskDone asyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed;


@end
