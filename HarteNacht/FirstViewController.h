//
//  FirstViewController.h
//  HarteNacht
//
//  Created by Matthias Steinböck on 09.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstViewController : UIViewController<UITextFieldDelegate> {
    UITextField *textInput;
    UILabel *label;
    NSString *name;
}

@property (nonatomic, retain) IBOutlet UITextField *textInput;
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, copy) NSString *name;

- (IBAction)buttonPressed:(id)sender;

@end
