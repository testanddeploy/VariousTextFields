//
//  OptionsTextField.m
//  GoodyHut
//
//  Created by Cristian Azov on 10/7/15.
//  Copyright (c) 2015 Cristian Azov. All rights reserved.
//

#import "OptionsTextField.h"

@interface OptionsTextField () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
  UIPickerView *picker;
}

@end

@implementation OptionsTextField

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    self.delegate = self;
    picker = [[UIPickerView alloc] init];
    picker.delegate = self;
    self.inputView = picker;
    _dismissUponSelection = NO;
  }
  return self;
}

- (void)preselectOptionAtRow:(NSUInteger)index inColumn:(NSUInteger)column animated:(BOOL)animated{
  if ([_options[column] count] > index) {
    [picker selectRow:index inComponent:0 animated:animated];
  }
}

#pragma mark - Setters, getters

- (void)setOptions:(NSArray *)options {
  _options = options;
  [picker reloadAllComponents];
}

#pragma mark - UIPickerView Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return _options.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return [_options[component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  return _options[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  if (_dismissUponSelection) {
    [self resignFirstResponder];
  }
  self.text = _options[component][row];
  if ([_optionsTextFieldDelegate respondsToSelector:@selector(vaTextField:didSelectRow:inComponent:)]) {
    [_optionsTextFieldDelegate vaTextField:self didSelectRow:row inComponent:component];
  }
}

@end
