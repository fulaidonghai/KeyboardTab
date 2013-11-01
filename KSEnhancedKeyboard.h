//
//  KSEnhancedKeyboard.h
//  TextTabTest
//
//  Created by ksenno on 10/31/13.
//  Copyright (c) 2013 ksenno. All rights reserved.
//
//  based on http://zeroheroblog.com/ios/how-to-create-a-simple-keyboard-with-custom-navigation-buttons
//

#import <Foundation/Foundation.h>

@protocol KSEnhancedKeyboardDelegate

- (void)nextDidTouchDown;
- (void)previousDidTouchDown;
- (void)doneDidTouchDown;

@end

@interface KSEnhancedKeyboard : NSObject

@property (strong, nonatomic) id <KSEnhancedKeyboardDelegate> delegate;

- (UIToolbar*)getToolbarWithPrevEnabled:(BOOL)prevEnabled NextEnabled:(BOOL)nextEnabled DoneEnabled:(BOOL)doneEnabled;

@end


