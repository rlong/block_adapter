//
//  JBButtonView.h
//  jsonbroker
//
//  Created by rlong on 16/05/13.
//
//

#import <Foundation/Foundation.h>

@interface BAButtonView : UIView {


    // blockAdapters
    NSMutableArray* _blockAdapters;
    //@property (nonatomic, retain) NSMutableArray* blockAdapters;
    //@synthesize blockAdapters = _blockAdapters;

    
    // blockButton
    UIButton* _blockButton;
    //@property (nonatomic, retain) IBOutlet UIButton* blockButton;
    //@synthesize blockButton = _blockButton;
    
    // asyncBlockButton
    UIButton* _asyncBlockButton;
    //@property (nonatomic, retain) IBOutlet UIButton* asyncBlockButton;
    //@synthesize asyncBlockButton = _asyncBlockButton;

    

}



-(void)addAdapter:(id)adapter;

#pragma mark -
#pragma mark fields



// blockButton
//UIButton* _blockButton;
@property (nonatomic, retain) IBOutlet UIButton* blockButton;
//@synthesize blockButton = _blockButton;


// asyncBlockButton
//UIButton* _asyncBlockButton;
@property (nonatomic, retain) IBOutlet UIButton* asyncBlockButton;
//@synthesize asyncBlockButton = _asyncBlockButton;


@end
