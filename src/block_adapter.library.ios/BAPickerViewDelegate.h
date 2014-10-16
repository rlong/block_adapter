// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types


typedef NSString*(^baTitleForPicker)(UIPickerView* pickerView, NSInteger row, NSInteger component);
typedef void(^baPickerSelectedRow)(UIPickerView* pickerView, NSInteger selectedRow, NSInteger component);


@interface BAPickerViewDelegate : NSObject <UIPickerViewDelegate> {
    
    // titleForPicker
    baTitleForPicker _titleForPicker;
    //@property (nonatomic, copy) baTitleForPicker titleForPicker;
    //@synthesize titleForPicker = _titleForPicker;

    
    // pickerSelectedRow
    baPickerSelectedRow _pickerSelectedRow;
    //@property (nonatomic, copy) baPickerSelectedRow pickerSelectedRow;
    //@synthesize pickerSelectedRow = _pickerSelectedRow;

}


+(BAPickerViewDelegate*)buildWithTitleForPicker:(baTitleForPicker)titleForPicker pickerSelectedRow:(baPickerSelectedRow)pickerSelectedRow;


@end
