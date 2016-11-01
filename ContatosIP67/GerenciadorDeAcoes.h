//
//  GerenciadorDeAcoes.h
//  ContatosIP67
//
//  Created by ios6281 on 11/1/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface GerenciadorDeAcoes : NSObject<UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property Contato *contato;
@property UIViewController *controller;
- (id)initWithContato:(Contato *) contato;
- (void)acoesDoController: (UIViewController *) controller;

@end
