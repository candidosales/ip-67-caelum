//
//  Contato.h
//  ContatosIP67
//
//  Created by ios6281 on 10/31/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MKAnnotation.h>
#import <CoreData/CoreData.h>

@interface Contato : NSManagedObject<MKAnnotation>

@property(strong) NSString *nome;
@property(strong) NSString *telefone;
@property(strong) NSString *email;
@property(strong) NSString *endereco;
@property(strong) NSString *site;
@property(strong) UIImage *foto;

@property(strong) NSNumber *latitude;
@property(strong) NSNumber *longitude;

@end
