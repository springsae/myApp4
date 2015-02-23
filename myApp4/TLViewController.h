//
//  TLViewController.h
//  myApp4
//
//  Created by Saeko Fuse on 2015/02/17.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface TLViewController : UIViewController
{
    ALAssetsLibrary *_library;  //ALAssetsLibraryのインスタンス
    int _img_x;
    int _img_y;
    int _counter;
}



@end
