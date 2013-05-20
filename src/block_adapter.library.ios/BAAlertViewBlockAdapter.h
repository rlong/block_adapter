//
//  JBAlertViewBlockAdapter.h
//  jsonbroker
//
//  Created by rlong on 16/05/13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types


#import "BAAbstractAdapter.h"



typedef id(^JBAlertViewDelegate)(UIAlertView* alertView, NSInteger buttonIndex);


@interface BAAlertViewBlockAdapter : BAAbstractAdapter {
    
    
    // client
    UIAlertView* _client;
    //@property (nonatomic, retain) UIAlertView* client;
    //@synthesize client = _client;
    
    
    // adaptee
    JBAlertViewDelegate _adaptee;
    //@property (nonatomic, copy) AlertViewDelegate adaptee;
    //@synthesize adaptee = _adaptee;

    
    
}

+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(JBAlertViewDelegate)adaptee;

+(BAAlertViewBlockAdapter*)adapterWithClient:(UIAlertView *)client adaptee:(JBAlertViewDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask afterAsyncTaskDone:(AsyncTaskDone)asyncTaskDone afterAsyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed;
    

@end
