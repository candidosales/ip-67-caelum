//
//  ListaContatoViewController.h
//  ContatosIP67
//
//  Created by ios6281 on 10/31/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@interface ListaContatoViewController : UITableViewController

@property ContatoDao *dao;
@property Contato *contatoSelecionado;

@end
