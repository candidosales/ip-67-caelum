//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios6281 on 10/31/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatoDao.h"

@interface FormularioContatoViewController : UIViewController

@property (weak) IBOutlet UITextField *nome;
@property (weak) IBOutlet UITextField *telefone;
@property (weak) IBOutlet UITextField *email;
@property (weak) IBOutlet UITextField *endereco;
@property (weak) IBOutlet UITextField *site;

@property (strong) ContatoDao *dao;
@property (strong) Contato *contato;

- (IBAction) pegaDadosDoFormulario;

@end

