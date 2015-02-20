//
//  imageViewController.m
//  myApp4
//
//  Created by Saeko Fuse on 2015/02/17.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import "imageViewController.h"
#import "HomeViewController.h"
#import "commentViewController.h"

@interface imageViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation imageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        if (_library ==nil)
        {
            _library = [[ALAssetsLibrary alloc]init];
        }
        
        [self showPhoto:self.assetsurl];
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //カメラライブラリから選んだ写真のURLを取得。
    _assetsurl = [(NSURL *)[info objectForKey:@"UIImagePickerControllerReferenceURL"] absoluteString];
    
    [self showPhoto:_assetsurl];
    
    if (!_assetsurl)
    {
        UIImage *originalImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
        self.showImage.image = originalImage;
    }
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];  //元の画面に戻る
}

//assetsから取得した画像を表示する
-(void)showPhoto:(NSString *)url
{
    //URLからALAssetを取得
    [_library assetForURL:[NSURL URLWithString:url]
              resultBlock:^(ALAsset *asset)
     {
         
         //画像があればYES、無ければNOを返す
         if(asset)
         {
             NSLog(@"データがあります");
             //ALAssetRepresentationクラスのインスタンスの作成
             ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
             
             //ALAssetRepresentationを使用して、フルスクリーン用の画像をUIImageに変換
             //fullScreenImageで元画像と同じ解像度の写真を取得する。
             UIImage *fullscreenImage = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage]];
             self.showImage.image = fullscreenImage; //イメージをセット
         }else
         {
             NSLog(@"データがありません");
         }
         
     } failureBlock: nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)viewWillAppear:(BOOL)animated
{
    if (_library ==nil)
    {
        _library = [[ALAssetsLibrary alloc]init];
    }
    
    [self showPhoto:self.assetsurl];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tapBackCamera:(id)sender
{
    
    [self.inputViewController dismissViewControllerAnimated:YES completion:nil];
    
    //    [[self.inputViewController navigationController] popViewControllerAnimated:YES];
    //    [self dismissViewControllerAnimated:YES completion:nil];
    
    UIImagePickerControllerSourceType sourceType;
    
    UIImagePickerController *ipc;
    
    sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if (![UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"エラー" message:@"カメラを起動できません" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    ipc = [[UIImagePickerController alloc] init];
    
    [ipc setSourceType:sourceType];
    
    [ipc setDelegate:self];
    
    ipc.allowsEditing = YES;
    
    [self presentViewController:ipc animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"キャンセル");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"showComment"]){
        commentViewController *cVC = [segue destinationViewController];
        cVC.assetsurl = self.assetsurl;
    }
    
}


@end
