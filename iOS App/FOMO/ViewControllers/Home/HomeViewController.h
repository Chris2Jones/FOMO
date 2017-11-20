//
//  HomeViewController.h
//  FOMO
//
//  Created by admin on 10/24/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QRCodeReaderViewController.h>

@interface HomeViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, QRCodeReaderDelegate, NSURLConnectionDelegate>

@end

