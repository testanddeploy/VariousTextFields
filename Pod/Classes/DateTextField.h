//
//  DateTextField.h
//  GoodyHut
//
//  Created by Cristian Azov on 9/28/15.
//  Copyright (c) 2015 Cristian Azov. All rights reserved.
//

#import "VATextField.h"

@protocol DateTextFieldDelegate <VATextFieldDelegate>
@optional
- (void)vaTextField:(UITextField *)textField didSelectDate:(NSDate *)date;
@end

@interface DateTextField : VATextField

@property (nonatomic, strong) NSDateFormatter *dateFormater;

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSLocale *locale;

@property (nonatomic, assign) id<DateTextFieldDelegate>dateTextFieldDelegate;

@end
