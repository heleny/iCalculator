//
//  ViewController.m
//  iCalculator
//
//  Created by Helen Yang on 2015-06-14.
//  Copyright © 2015 Helen Yang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _isDecimal = false;
    _result = 0;
    self.resultLabel.adjustsFontSizeToFitWidth = TRUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ac:(id)sender {
    _result = 0;
    _display = 0;
    _isDecimal = false;
    self.resultLabel.text = @"0";
}

- (IBAction)plusMinus:(id)sender {
    _display = _display * (-1);
    if (_display < 0) {
        self.resultLabel.text = [@"-" stringByAppendingString:self.resultLabel.text];
    } else {
        if ([self.resultLabel.text hasPrefix:@"-"]) {
            self.resultLabel.text = [self.resultLabel.text substringFromIndex:1];
        }
    }
}

- (IBAction)divide:(id)sender {
    if (_result != 0) {
        [self numberWithOperation:_operation];
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", _result];
        _display = [self.resultLabel.text floatValue];
        _result = 0;
    }
    
    [self numberWithOperation:Divide];
}

- (IBAction)multiply:(id)sender {
    if (_result != 0) {
        [self numberWithOperation:_operation];
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", _result];
        _display = [self.resultLabel.text floatValue];
        _result = 0;
    }
    
    [self numberWithOperation:Multiply];}

- (IBAction)substract:(id)sender {
    if (_result != 0) {
        [self numberWithOperation:_operation];
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", _result];
        _display = [self.resultLabel.text floatValue];
        _result = 0;
    }
    
    [self numberWithOperation:Substract];
}

- (IBAction)add:(id)sender {
    if (_result != 0) {
        [self numberWithOperation:_operation];
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", _result];
        _display = [self.resultLabel.text floatValue];
        _result = 0;
    }
    
    [self numberWithOperation:Add];
}

- (IBAction)equal:(id)sender {
    [self numberWithOperation:_operation];
    self.resultLabel.text = [NSString stringWithFormat:@"%.2f", _result];
    _display = [self.resultLabel.text floatValue];
    _result = 0;
}

- (IBAction)dot:(id)sender {
    _isDecimal = TRUE;
    NSRange range = [self.resultLabel.text rangeOfString:@"."];
    if (range.location == NSNotFound) {
        self.resultLabel.text = [self.resultLabel.text stringByAppendingString:@"."];
    }
}

- (IBAction)seven:(id)sender {
    [self setResultWithNumber:7];
}

- (IBAction)eight:(id)sender {
    [self setResultWithNumber:8];
}

- (IBAction)nine:(id)sender {
    [self setResultWithNumber:9];
}

- (IBAction)six:(id)sender {
    [self setResultWithNumber:6];
}

- (IBAction)five:(id)sender {
    [self setResultWithNumber:5];
}

- (IBAction)four:(id)sender {
    [self setResultWithNumber:4];
}

- (IBAction)three:(id)sender {
    [self setResultWithNumber:3];
}

- (IBAction)two:(id)sender {
    [self setResultWithNumber:2];
}

- (IBAction)one:(id)sender {
    [self setResultWithNumber:1];
}

- (IBAction)zero:(id)sender {
    [self setResultWithNumber:0];
}

- (void)setResultWithNumber:(int)number {
    if (!_isDecimal) {
        _display *= 10;
        _display += number;
        self.resultLabel.text = [NSString stringWithFormat:@"%.0f", _display];
    } else {
        self.resultLabel.text = _display == 0 ? [NSString stringWithFormat:@"%d", number] : ([self.resultLabel.text stringByAppendingString:[NSString stringWithFormat:@"%d", number]]);
    }
    
    _display = [self.resultLabel.text floatValue];
}

- (void)numberWithOperation:(Operation)operation {
    if (_result == 0) {
        _result = _display;
    } else {
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", _result];
        switch (operation) {
            case Add:
                _result += _display;
                break;
            case Substract:
                _result -= _display;
                break;
            case Multiply:
                _result *= _display;
                break;
            case Divide:
                _result /= _display;
                break;
                
            default:
                break;
        }
    }
    
    _operation = operation;
    _display = 0;
}
@end
