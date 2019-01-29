//
//  VATextField.m
//  VariousTextFields
//
//  Created by Cristian Azov on 10/9/15.
//  Copyright (c) 2015 Cristian Azov. All rights reserved.
//

#import "VATextField.h"

@implementation VATextField

- (instancetype)init
{
  self = [super init];
  if (self) {
    self.delegate = self;
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    self.delegate = self;
  }
  return self;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  
  if ([_vaTextFieldDelegate respondsToSelector:@selector(vaTextField:shouldChangeCharactersInRange:replacementString:)]) {
    return [_vaTextFieldDelegate vaTextField:textField shouldChangeCharactersInRange:range replacementString:string];
  }
  return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
  if ([_vaTextFieldDelegate respondsToSelector:@selector(vaTextFieldDidBeginEditing:)]) {
    return [_vaTextFieldDelegate vaTextFieldShouldBeginEditing:textField];
  }
  return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
  if ([_vaTextFieldDelegate respondsToSelector:@selector(vaTextFieldDidBeginEditing:)]) {
    [_vaTextFieldDelegate vaTextFieldDidBeginEditing:textField];
  }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
  if ([_vaTextFieldDelegate respondsToSelector:@selector(vaTextFieldShouldEndEditing:)]) {
    return [_vaTextFieldDelegate vaTextFieldShouldEndEditing:textField];
  }
  return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
  if ([_vaTextFieldDelegate respondsToSelector:@selector(vaTextFieldDidEndEditing:)]) {
    [_vaTextFieldDelegate vaTextFieldDidEndEditing:textField];
  }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
  if ([_vaTextFieldDelegate respondsToSelector:@selector(vaTextFieldShouldClear:)]) {
    return [_vaTextFieldDelegate vaTextFieldShouldClear:textField];
  }
  return YES;
}

#pragma mark - UIResponder 

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
  UIMenuController *menuController = [UIMenuController sharedMenuController];
  if (menuController) {
    [UIMenuController sharedMenuController].menuVisible = NO; // disable copy
  }
  return NO; // disable paste
}

@end
