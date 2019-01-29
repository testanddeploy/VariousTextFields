//
//  DateTextField.m
//  GoodyHut
//
//  Created by Cristian Azov on 9/28/15.
//  Copyright (c) 2015 Cristian Azov. All rights reserved.
//

#import "DateTextField.h"

@interface DateTextField () {
  UIDatePicker *picker;
}
@end

@implementation DateTextField

@synthesize date = _date;

- (void)awakeFromNib {

  _locale = [NSLocale currentLocale];
  
  picker = [[UIDatePicker alloc] init];
  picker.datePickerMode = UIDatePickerModeDate;
  picker.locale = _locale;
  [picker addTarget:self action:@selector(datePickerDateChanged:) forControlEvents:UIControlEventValueChanged];
  
  self.inputView = picker;
  
  _dateFormater = [[NSDateFormatter alloc] init];
  _dateFormater.dateStyle = NSDateFormatterFullStyle;
  _dateFormater.locale = _locale;
  _dateFormater.doesRelativeDateFormatting = YES;
  
  [self setDate:[NSDate date]];
}

- (void)setLocale:(NSLocale *)locale {
  _locale = locale;
  picker.locale = _locale;
  _dateFormater.locale = _locale;
  [self updateTextField];
}

- (void)datePickerDateChanged:(UIDatePicker *)datePicker {
  _date = datePicker.date;
  NSString *formattedDate = [_dateFormater stringFromDate:_date];
  self.text = formattedDate;
  if ([_dateTextFieldDelegate respondsToSelector:@selector(vaTextField:didSelectDate:)]) {
    [_dateTextFieldDelegate vaTextField:self didSelectDate:_date];
  }
}

- (NSDate *)date {
  return _date;
}

- (void)setDate:(NSDate *)date {
  _date = date;
  [picker setDate:date animated:NO];
  [self updateTextField];
}

- (void)updateTextField {
  self.text = [_dateFormater stringFromDate:_date];
  self.placeholder = [_dateFormater stringFromDate:_date];
}

@end
