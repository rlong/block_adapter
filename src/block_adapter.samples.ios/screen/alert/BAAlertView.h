//
//  JBAlertView.h
//  jsonbroker
//
//  Created by rlong on 16/05/13.
//
//

#import <Foundation/Foundation.h>

@interface BAAlertView : UIView {
    
    // blockAdapters
    NSMutableArray* _blockAdapters;
    //@property (nonatomic, retain) NSMutableArray* blockAdapters;
    //@synthesize blockAdapters = _blockAdapters;

    
    
    // blockAlert
    UIButton* _blockAlert;
    //@property (nonatomic, retain) IBOutlet UIButton* blockAlert;
    //@synthesize blockAlert = _blockAlert;


    // asyncBlockAlert
    UIButton* _asyncBlockAlert;
    //@property (nonatomic, retain) IBOutlet UIButton* asyncBlockAlert;
    //@synthesize asyncBlockAlert = _asyncBlockAlert;

    
}

-(void)addAdapter:(id)adapter;

#pragma mark -
#pragma mark fields

// blockAlert
//UIButton* _blockAlert;
@property (nonatomic, retain) IBOutlet UIButton* blockAlert;
//@synthesize blockAlert = _blockAlert;

// asyncBlockAlert
//UIButton* _asyncBlockAlert;
@property (nonatomic, retain) IBOutlet UIButton* asyncBlockAlert;
//@synthesize asyncBlockAlert = _asyncBlockAlert;


@end
