//
//  JBActionSheetBlockAdapter.h
//  jsonbroker
//
//  Created by rlong on 17/05/13.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types

#import "BAAbstractAdapter.h"


typedef id(^ActionSheetDelegate)(UIActionSheet* actionSheet, NSInteger buttonIndex);

@interface BAActionSheetBlockAdapter : BAAbstractAdapter <UIActionSheetDelegate> {

    // client
    UIActionSheet* _client;
    //@property (nonatomic, retain) UIActionSheet* client;
    //@synthesize client = _client;
    
    
    // adaptee
    ActionSheetDelegate _adaptee;
    //@property (nonatomic, copy) ActionSheetDelegate adaptee;
    //@synthesize adaptee = _adaptee;
    
    
}


+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(ActionSheetDelegate)adaptee;

+(BAActionSheetBlockAdapter*)adapterWithClient:(UIActionSheet *)client adaptee:(ActionSheetDelegate)adaptee asyncTask:(BAAsyncTask)asyncTask afterAsyncTaskDone:(AsyncTaskDone)asyncTaskDone afterAsyncTaskFailed:(AsyncTaskFailed)asyncTaskFailed;


@end