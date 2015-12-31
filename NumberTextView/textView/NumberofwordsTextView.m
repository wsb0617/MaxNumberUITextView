//
//  NumberofwordsTextView.m
//  Orimuse
//
//  Created by weijohn on 15/12/25.
//  Copyright © 2015年 Bingjie. All rights reserved.
//

#import "NumberofwordsTextView.h"


@interface NumberofwordsTextView()
<UITextViewDelegate>

@property(strong ,nonatomic)UILabel       *numberLabel;
@property(strong ,nonatomic)UITextView    *textView;
@property(assign ,nonatomic)NSInteger     inputWordNumber; //输入text的长度
@property(assign ,nonatomic)NSInteger     subWordNumber;  //截取text的长度（最大值）
@property(assign ,nonatomic)NSInteger     emojiNumer;

@end

@implementation NumberofwordsTextView


-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setDefault];
        [self setupSubviews];
    }
    return self;
}

- (void)setDefault{
    self.isHideNumberLabel = NO;
    self.wordsMaxNumer = 48;
    self.textFont = [UIFont systemFontOfSize:12];
}

#pragma mark SET GET
- (void)setWordsMaxNumer:(NSInteger)wordsMaxNumer{
    
    _wordsMaxNumer = wordsMaxNumer;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld/%ld",_inputWordNumber,_wordsMaxNumer];
   
    
}


//       默认提示最大长度是16
- (void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder = placeHolder;
    if (_placeHolder.length > 16 ) {
        placeHolder = [placeHolder substringToIndex:16];
        placeHolder = [[placeHolder stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] stringByAppendingFormat:@"..."];
    }
    _textView.placeholder = _placeHolder;
    
}

- (void)setIsHideNumberLabel:(BOOL)isHideNumberLabel{
    _isHideNumberLabel = isHideNumberLabel;
    self.numberLabel.hidden = isHideNumberLabel;
}

- (void)setText:(NSString *)text{
    _text = text;

    self.emojiNumer = [_text emojiNumberOfSting];
    self.inputWordNumber = [_text convertToInt] - self.emojiNumer;
    
    self.textView.text = text;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld/%ld",_inputWordNumber,_wordsMaxNumer];
}



- (void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    _textView.font = textFont;
    
    _numberLabel.font = [UIFont systemFontOfSize:textFont.pointSize - 2.0f];
    
}

#pragma mark UI
-(void)setupSubviews{
    
    self.layer.cornerRadius = 12;
    self.backgroundColor = RGB_COLOR(240, 240, 240);
    self.layer.borderWidth = 0.65f;
    self.layer.borderColor = RGB_COLOR(220, 220, 220).CGColor;
    
    
    
    _textView = [[UITextView alloc] init];
    _textView.backgroundColor = [UIColor clearColor];
    _textView.textColor = [UIColor blackColor];
    _textView.scrollEnabled = YES;
    _textView.returnKeyType = UIReturnKeySend;
    _textView.enablesReturnKeyAutomatically = YES;
    _textView.delegate = self;
    [self addSubview:_textView];
    
    _numberLabel = [[UILabel alloc] init];
    _numberLabel.textAlignment = NSTextAlignmentRight;
    _numberLabel.textColor = [UIColor grayColor];
    _numberLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_numberLabel];
    
    
    [self setAutoLayout];
    
    [self textViewControl];
}



- (void)setAutoLayout{
    [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(@(20));
        make.height.equalTo(@(20));
        make.right.equalTo(_textView.mas_right).offset(-2);
        make.bottom.equalTo(_textView.mas_bottom);
    }];
}

#pragma mark Control

- (void)textViewControl{
    
    
    [_textView.rac_textSignal subscribeNext:^(NSString *text) {
        _text = text;
        self.emojiNumer = [text emojiNumberOfSting];
        self.inputWordNumber = [text convertToInt] - self.emojiNumer;
        self.numberLabel.text = [NSString stringWithFormat:@"%ld/%ld",_inputWordNumber,_wordsMaxNumer];
//                NSLog(@"text is %@", text);
//                 NSLog(@"emojiNumer is ---- %ld", self.emojiNumer);
//                NSLog(@"inputWordNumber is %ld", self.inputWordNumber);
//                NSLog(@"subWordNumber is ---- %ld", self.subWordNumber);        
        if (![self isCanInput]) {
            if (self.textView.text.length >= self.subWordNumber) {
                _text = [text substringToIndex:self.subWordNumber];
                self.textView.text = _text;
            }
            self.numberLabel.text = [NSString stringWithFormat:@"%ld/%ld",_wordsMaxNumer,_wordsMaxNumer];
        }
       
    }];
    
}

- (BOOL)isCanInput{
    
    BOOL isCan = YES;
    
    
    if (self.inputWordNumber < self.wordsMaxNumer){
        isCan = YES;
    }else if (self.inputWordNumber == self.wordsMaxNumer) {
        self.subWordNumber = self.textView.text.length;
        isCan = NO;
    }else if(self.inputWordNumber == self.wordsMaxNumer - 1){
        self.subWordNumber = self.textView.text.length + 1;
        isCan = NO;
    }
    else if(self.inputWordNumber == self.wordsMaxNumer + 1){
//        self.subWordNumber = self.textView.text.length - 1;
        isCan = NO;
    }else{
        isCan = NO;
    }
    return isCan;
    
}

#pragma mark UITextViewDelegate

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
