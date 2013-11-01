//
//  ViewController.h
//  TextTabTest
//
//  Created by ksenno on 10/31/13.
//  Copyright (c) 2013 ksenno. All rights reserved.
//
//  based on http://zeroheroblog.com/ios/how-to-create-a-simple-keyboard-with-custom-navigation-buttons
//

#import <UIKit/UIKit.h>
#import "KSEnhancedKeyboard.h"

@interface ViewController : UIViewController <UITextFieldDelegate, KSEnhancedKeyboardDelegate>

@property (weak, nonatomic) IBOutlet UITextField *field1;
@property (weak, nonatomic) IBOutlet UITextField *field2;

@end
