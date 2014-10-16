// Copyright (c) 2013 Richard Long & HexBeerium
//
// Released under the MIT license ( http://opensource.org/licenses/MIT )
//


#import "BAPickerViewDataSource.h"

#import "JBMemoryModel.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

@interface BAPickerViewDataSource ()

// numberOfComponents
//baNumberOfComponents _numberOfComponents;
@property (nonatomic, copy) baNumberOfComponents numberOfComponents;
//@synthesize numberOfComponents = _numberOfComponents;


// numberOfRows
//baNumberOfRows _numberOfRows;
@property (nonatomic, copy) baNumberOfRows numberOfRows;
//@synthesize numberOfRows = _numberOfRows;


@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#pragma mark -

@implementation BAPickerViewDataSource

#pragma mark -
#pragma mark instance lifecycle


-(id)initWithNumberOfComponents:(baNumberOfComponents)numberOfComponents numberOfRows:(baNumberOfRows)numberOfRows {
    
    BAPickerViewDataSource* answer = [super init];
    
    if( nil != answer ) {
        
        [answer setNumberOfComponents:numberOfComponents];
        [answer setNumberOfRows:numberOfRows];
        
    }
    
    return answer;
}


-(void)dealloc {
	
	[self setNumberOfComponents:nil];
	[self setNumberOfRows:nil];

	JBSuperDealloc();
	
}

#pragma mark -


+(BAPickerViewDataSource*)buildWithNumberOfComponents:(baNumberOfComponents)numberOfComponents numberOfRows:(baNumberOfRows)numberOfRows {
    
    BAPickerViewDataSource* answer = [[BAPickerViewDataSource alloc] initWithNumberOfComponents:numberOfComponents numberOfRows:numberOfRows];
    
    JBAutorelease( answer );
    
    return answer;
}


#pragma mark -
#pragma mark <UIPickerViewDataSource> implementation

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return _numberOfComponents( pickerView );
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return _numberOfRows( pickerView, component );
    
}



#pragma mark -
#pragma mark fields

// numberOfComponents
//baNumberOfComponents _numberOfComponents;
//@property (nonatomic, copy) baNumberOfComponents numberOfComponents;
@synthesize numberOfComponents = _numberOfComponents;

// numberOfRows
//baNumberOfRows _numberOfRows;
//@property (nonatomic, copy) baNumberOfRows numberOfRows;
@synthesize numberOfRows = _numberOfRows;


@end
