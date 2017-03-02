//
//  ViewController.m
//  LCalculator
//
//  Created by lsm on 17/2/19.
//  Copyright © 2017年 L. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    double firstNumber;
    int operationType;//1,add;2,min;3,multiply;4,divide.
    BOOL changeTextFlag;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.textField setText:@"0"];
    changeTextFlag = 0;
}
- (IBAction)button1Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"1"];
}
- (IBAction)button2Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"2"];
}
- (IBAction)button3Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"3"];
}
- (IBAction)button4Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"4"];
}
- (IBAction)button5Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"5"];
}
- (IBAction)button6Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"6"];
}
- (IBAction)button7Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"7"];
}
- (IBAction)button8Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"8"];
}
- (IBAction)button9Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"9"];
}
- (IBAction)button0Clicked:(id)sender {
    [self refureshNumberByAppendingString:@"0"];
}
- (IBAction)addButtonClicked:(id)sender {
    firstNumber = [self.textField.text doubleValue];
    operationType = 1;
    changeTextFlag = 1;
    
}
- (IBAction)minButtonClicked:(id)sender {
    firstNumber = [self.textField.text doubleValue];
    operationType = 2;
    changeTextFlag = 1;
}
- (IBAction)multiplyButtonClicked:(id)sender {
    firstNumber = [self.textField.text doubleValue];
    operationType = 3;
    changeTextFlag = 1;
}
- (IBAction)divideButtonClicked:(id)sender {
    firstNumber = [self.textField.text doubleValue];
    operationType = 4;
    changeTextFlag = 1;
}
- (IBAction)resultButtonClicked:(id)sender {
    switch (operationType) {
        case 1:
        {
            double secondNumber = [self.textField.text doubleValue];
            secondNumber = firstNumber + secondNumber;
            NSString * textString = [NSString stringWithFormat:@"%f",secondNumber];
            [self.textField setText:textString];
        }
            break;
        case 2:
        {
            double secondNumber = [self.textField.text doubleValue];
            secondNumber = firstNumber - secondNumber;
            NSString * textString = [NSString stringWithFormat:@"%f",secondNumber];
            [self.textField setText:textString];
        }
            break;
        case 3:
        {
            double secondNumber = [self.textField.text doubleValue];
            secondNumber = firstNumber * secondNumber;
            NSString * textString = [NSString stringWithFormat:@"%f",secondNumber];
            [self.textField setText:textString];
        }
            break;
        case 4:
        {
            double secondNumber = [self.textField.text doubleValue];
            secondNumber = firstNumber / secondNumber;
            NSString * textString = [NSString stringWithFormat:@"%f",secondNumber];
            [self.textField setText:textString];
        }
            break;
            
        default:
            break;
    }
    
    changeTextFlag = 0;
}
- (IBAction)clearButtonClicked:(id)sender {
    NSString * textString = @"0";
    [self.textField setText:textString];
    firstNumber = [self.textField.text doubleValue];
    operationType = 0;
}

#pragma - mark custom method
- (void)refureshNumberByAppendingString:(NSString *)string
{
    if (operationType == 0) {
        if ([self.textField.text doubleValue] != 0) {
            NSString * textString = [NSString stringWithFormat:@"%lld",[self.textField.text longLongValue]];
            textString = [textString stringByAppendingString:string];
            if ([textString longLongValue] < 9223372036854775807) {
                [self.textField setText:textString];
            }else{
                //不变
            }
            
        }else{
            NSString * textString = string;
            [self.textField setText:textString];
        }
    }else{
        
        if (changeTextFlag == 0) {
            if ([self.textField.text doubleValue] != 0) {
                NSString * textString = [NSString stringWithFormat:@"%lld",[self.textField.text longLongValue]];
                textString = [textString stringByAppendingString:string];
                if ([textString longLongValue] < 9223372036854775807) {
                    [self.textField setText:textString];
                }else{
                    //不变
                }
                
            }else{
                NSString * textString = string;
                [self.textField setText:textString];
            }
        }else{
            NSString * textString = string;
            [self.textField setText:textString];
            changeTextFlag = 0;
        }
        
        
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
