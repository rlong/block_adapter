// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // explicit import of UI* types


typedef NSInteger(^baNumberOfComponents)(UIPickerView* pickerView);
typedef NSInteger(^baNumberOfRows)(UIPickerView* pickerView, NSInteger component );


@interface BAPickerViewDataSource : NSObject <UIPickerViewDataSource> {
    
    // numberOfComponents
    baNumberOfComponents _numberOfComponents;
    //@property (nonatomic, copy) baNumberOfComponents numberOfComponents;
    //@synthesize numberOfComponents = _numberOfComponents;

    // numberOfRows
    baNumberOfRows _numberOfRows;
    //@property (nonatomic, copy) baNumberOfRows numberOfRows;
    //@synthesize numberOfRows = _numberOfRows;
    
    


}

+(BAPickerViewDataSource*)buildWithNumberOfComponents:(baNumberOfComponents)numberOfComponents numberOfRows:(baNumberOfRows)numberOfRows;



@end
