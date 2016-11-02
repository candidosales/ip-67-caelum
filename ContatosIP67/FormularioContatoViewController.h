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
#import <CoreLocation/CoreLocation.h>

@protocol FormularioContatoViewControllerDelegate <NSObject>

- (void)contatoAtualizado:(Contato *) contato;
- (void)contatoAdicionado:(Contato *) contato;
// void (^CLGeocodeCompletionHandler) (NSArray *resultados, NSError *error);

@end


@interface FormularioContatoViewController : UIViewController<UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak) IBOutlet UITextField *nome;
@property (weak) IBOutlet UITextField *telefone;
@property (weak) IBOutlet UITextField *email;
@property (weak) IBOutlet UITextField *endereco;
@property (weak) IBOutlet UITextField *site;

@property (weak) IBOutlet UITextField *latitude;
@property (weak) IBOutlet UITextField *longitude;

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loading;

@property (strong) ContatoDao *dao;
@property (strong) Contato *contato;

@property (weak) id<FormularioContatoViewControllerDelegate> delegate;
@property NSInteger linhaDestaque;

@property (weak) IBOutlet UIButton *botaoFoto;

- (IBAction) pegaDadosDoFormulario;
- (IBAction) selecionaFoto:(id)sender;
- (IBAction) buscarCoordenadas:(id)sender;


@end

