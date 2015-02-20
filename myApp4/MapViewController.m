//
//  MapViewController.m
//  myApp4
//
//  Created by Saeko Fuse on 2015/02/17.
//  Copyright (c) 2015年 Saeko Fuse. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //MapViewオブジェクトを作成
    MKMapView *mapView = [[MKMapView alloc] init];
    
    //delegate設定
    mapView.delegate = self;
    
    //大きさ、位置を設定
    mapView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);
    
    //表示位置の中心を設定
    CLLocationCoordinate2D co;
    
    //アヤラの位置を設定
    co.latitude = 10.317347; //緯度
    co.longitude = 123.905759; //経度
    
    [mapView setCenterCoordinate:co];
    
    //縮尺を設定
    MKCoordinateRegion cr = mapView.region;
    cr.span.latitudeDelta = 0.08; //数字を小さくすると、詳細な地図（範囲が狭い）になる
    cr.span.longitudeDelta = 0.08;
    cr.center = co;
    [mapView setRegion:cr];
    
    //地図の表示種類設定
    mapView.mapType = MKMapTypeStandard;
    //現在地を表示
    mapView.showsUserLocation = YES;
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
