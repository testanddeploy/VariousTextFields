//
//  VariousTextField.h
//  VariousTextFields
//
//  Created by Cristian Azov on 10/9/15.
//  Copyright (c) 2015 Cristian Azov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VATextFieldDelegate <NSObject>
@optional
- (BOOL)vaTextFieldShouldBeginEditing:(UITextField *)textField;
- (void)vaTextFieldDidBeginEditing:(UITextField *)textField;
- (BOOL)vaTextFieldShouldEndEditing:(UITextField *)textField;
- (void)vaTextFieldDidEndEditing:(UITextField *)textField;
- (BOOL)vaTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (BOOL)vaTextFieldShouldClear:(UITextField *)textField;
- (BOOL)vaTextFieldShouldReturn:(UITextField *)textField;
@end

@interface VATextField : UITextField <UITextFieldDelegate>

@property (nonatomic, assign) id<VATextFieldDelegate>vaTextFieldDelegate;

@end
