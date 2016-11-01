//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios6281 on 10/31/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.navigationItem.title = @"Cadastro";
        UIBarButtonItem *adiciona = [[UIBarButtonItem alloc]
                                     initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = adiciona;
        
        self.dao = [ContatoDao contatoDaoInstance];
    }
    return self;
}

- (void)viewDidLoad {
    if (self.contato) {
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc]
                                      initWithTitle:@"Confirmar"
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(atualizaContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
        
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) criaContato {
    [self pegaDadosDoFormulario];
    [self.dao adicionaContato:self.contato];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) pegaDadosDoFormulario {
    if (!self.contato) {
        self.contato = [Contato new];
    }
    self.contato.nome = self.nome.text;
    self.contato.telefone = self.telefone.text;
    self.contato.email = self.email.text;
    self.contato.endereco = self.endereco.text;
    self.contato.site = self.site.text;
    NSLog(@"Dados: %@", self.contato);
}

- (void) atualizaContato {
    [self pegaDadosDoFormulario];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
