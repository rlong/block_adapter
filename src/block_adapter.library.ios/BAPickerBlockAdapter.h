// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types

#import "BAAbstractAdapter.h"

typedef NSString*(^BAPickerTitleProvider)(UIPickerView* pickerView, NSInteger row, NSInteger component);
typedef UIView*(^BAPickerViewProvider)(UIPickerView* pickerView, NSInteger row, NSInteger component, UIView* reuseView);

typedef id(^BAPickerAdaptee)(UIPickerView* pickerView, NSInteger selectedRow, NSInteger component);

@interface BAPickerBlockAdapter : BAAbstractAdapter <UIPickerViewDelegate> {
    
    // client
    UIPickerView* _client;
    //@property (nonatomic, retain) UIPickerView* client;
    //@synthesize client = _client;

    
    // adaptee
    BAPickerAdaptee _adaptee;
    //@property (nonatomic, copy) BAPickerAdaptee adaptee;
    //@synthesize adaptee = _adaptee;


}


+(BAPickerBlockAdapter*)adapterWithClient:(UIPickerView *)client titleProvider:(BAPickerTitleProvider)titleProvider adaptee:(BAPickerAdaptee)adaptee;
+(BAPickerBlockAdapter*)adapterWithClient:(UIPickerView *)client viewProvider:(BAPickerViewProvider)viewProvider adaptee:(BAPickerAdaptee)adaptee;

+(BAPickerBlockAdapter*)adapterWithClient:(UIPickerView *)client titleProvider:(BAPickerTitleProvider)titleProvider adaptee:(BAPickerAdaptee)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed;
+(BAPickerBlockAdapter*)adapterWithClient:(UIPickerView *)client viewProvider:(BAPickerViewProvider)viewProvider adaptee:(BAPickerAdaptee)adaptee asyncTask:(JBBlock)asyncTask afterAsyncTaskDone:(JBBlockDone)asyncTaskDone afterAsyncTaskFailed:(JBBlockFailed)asyncTaskFailed;

@end
