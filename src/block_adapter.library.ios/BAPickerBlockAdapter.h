// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types

#import "BAAbstractAdapter.h"



typedef NSString*(^BAPickerTitleProvider)(UIPickerView* pickerView, NSInteger row, NSInteger component);
//typedef UIView*(^BAPickerViewProvider)(UIPickerView* pickerView, NSInteger row, NSInteger component, UIView* reuseView);

typedef id(^BAPickerAdaptee)(UIPickerView* pickerView, NSInteger selectedRow, NSInteger component);

@interface BAPickerBlockAdapter : BAAbstractAdapter <UIPickerViewDelegate> {
    
    
    // pickerViewDataSource
    id<UIPickerViewDataSource> _pickerViewDataSource;
    //@property (nonatomic, retain) id<UIPickerViewDataSource> pickerViewDataSource;
    //@synthesize pickerViewDataSource = _pickerViewDataSource;
    
    
    // pickerViewDelegate
    id<UIPickerViewDelegate> _pickerViewDelegate;
    //@property (nonatomic, retain) id<UIPickerViewDelegate> pickerViewDelegate;
    //@synthesize pickerViewDelegate = _pickerViewDelegate;



}


-(void)setupWithPickerView:(UIPickerView*)pickerView;

// 'pickerViewDataSource' and 'pickerViewDelegate' can be nil
-(id)initWithPickerViewDataSource:(id<UIPickerViewDataSource>)pickerViewDataSource pickerViewDelegate:(id<UIPickerViewDelegate>)pickerViewDelegate;


#pragma mark -
#pragma mark fields

// pickerViewDataSource
//id<UIPickerViewDataSource> _pickerViewDataSource;
@property (nonatomic, retain) id<UIPickerViewDataSource> pickerViewDataSource;
//@synthesize pickerViewDataSource = _pickerViewDataSource;


// pickerViewDelegate
//id<UIPickerViewDelegate> _pickerViewDelegate;
@property (nonatomic, retain) id<UIPickerViewDelegate> pickerViewDelegate;
//@synthesize pickerViewDelegate = _pickerViewDelegate;


@end
