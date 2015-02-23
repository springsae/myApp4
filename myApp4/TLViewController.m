//
//  TLViewController.m
//  myApp4
//
//  Created by Saeko Fuse on 2015/02/17.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import "TLViewController.h"

@interface TLViewController ()

@end

@implementation TLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //UserDefaultObjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //一旦配列に取り出す
    NSArray *assetsURLs = [defaults objectForKey:@"assetsURLs"];
    
    _counter = 0;
    
    for (NSString *assetsURL in assetsURLs)
    {
        [self showPhoto:assetsURL];

    }
    
}


-(void)showPhoto:(NSString *)url
{
    
    //URLからALAssetを取得
    [_library assetForURL:[NSURL URLWithString:url]
              resultBlock:^(ALAsset *asset) {
                  
                  //画像があればYES、無ければNOを返す
                  if(asset){
                      NSLog(@"データがあります");
                      //ALAssetRepresentationクラスのインスタンスの作成
                      ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
                      
                      //ALAssetRepresentationを使用して、フルスクリーン用の画像をUIImageに変換
                      //fullScreenImageで元画像と同じ解像度の写真を取得する。
                      
                      _img_x = 0;
                      _img_y = 40;
                      
//                      if (_counter % 2 == 1) {
//                          _img_x = 160;
//                      }
//                      
//                      _img_y = 160 * (_counter / 2);
//                      
                      UIImage *fullscreenImage = [UIImage imageWithCGImage:[assetRepresentation fullResolutionImage]];
                      
                      UIImageView *imagev = [[UIImageView alloc]initWithFrame:CGRectMake(_img_x, _img_y, 160, 160)];
                      imagev.image = fullscreenImage;
                      
                      [self.view addSubview:imagev];
                      _counter++;
                      
                  }else{
                      NSLog(@"データがありません");
                  }
                  
              } failureBlock: nil];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
