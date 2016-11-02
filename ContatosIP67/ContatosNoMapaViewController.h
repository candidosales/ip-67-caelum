//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios6281 on 11/1/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ContatoDao.h"

@interface ContatosNoMapaViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView *mapa;
@property (nonatomic, weak) NSMutableArray *contatos;

@property CLLocationManager *manager;

@property (strong) ContatoDao *dao;

@end
