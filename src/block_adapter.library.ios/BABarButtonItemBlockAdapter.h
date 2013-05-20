//
//  JBBarButtonItemBlockAdapter.h
//  jsonbroker
//
//  Created by rlong on 18/05/13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types

#import "BAAbstractAdapter.h"


typedef id(^JBBarButtonItemDelegate)(UIBarButtonItem* barButtonItem);

@interface BABarButtonItemBlockAdapter : BAAbstractAdapter {
 
    // client
    UIBarButtonItem* _client;
    //@property (nonatomic, retain) UIBarButtonItem* client;
    //@synthesize client = _client;

    // adaptee
    JBBarButtonItemDelegate _adaptee;
    //@property (nonatomic, copy) JBBarButtonItemDelegate adaptee;
    //@synthesize adaptee = _adaptee;

}

+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee;

+(BABarButtonItemBlockAdapter*)adapterWithClient:(UIBarButtonItem*)client adaptee:(JBBarButtonItemDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask afterAsyncTaskDone:(AsyncTaskDone)asyncTaskDone afterAsyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed;


@end
