//
//  ListaContatoViewController.m
//  ContatosIP67
//
//  Created by ios6281 on 10/31/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ListaContatoViewController.h"
#import "FormularioContatoViewController.h"

@implementation ListaContatoViewController
- (id) init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Contatos";
        
        UIBarButtonItem *botaoExibirFormulario = [[UIBarButtonItem alloc]
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self
                                                  action:@selector(exibeFormulario)];
        
        self.navigationItem.rightBarButtonItem = botaoExibirFormulario;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        self.linhaDestaque = -1;
        self.dao = [ContatoDao contatoDaoInstance];
    }
    return self;
}

- (void) viewDidAppear:(BOOL)animated {
    if (self.linhaDestaque >= 0) {
        NSIndexPath *indexPath = [NSIndexPath
                                  indexPathForRow:self.linhaDestaque
                                  inSection:0];
        [self.tableView
         selectRowAtIndexPath:indexPath
         animated:YES
         scrollPosition:UITableViewScrollPositionMiddle];
        self.linhaDestaque = -1;
    }
    
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(exibeMaisAcoes:)];
    [self.tableView addGestureRecognizer:longPress];
}

- (void) exibeMaisAcoes:(UIGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint ponto = [gesture locationInView:self.tableView];
        NSIndexPath *index = [self.tableView indexPathForRowAtPoint:ponto];
        
        self.contatoSelecionado = [self.dao buscaContatoDaPosicao:index.row];
        _gerenciador = [[GerenciadorDeAcoes alloc] initWithContato:self.contatoSelecionado];
        
        [self.gerenciador acoesDoController:self];
    }
}

- (void) exibeFormulario {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormularioContatoViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"Form-Contato"];
    form.delegate = self;
    if(self.contatoSelecionado) {
        form.contato = self.contatoSelecionado;
    }
    
    [self.navigationController pushViewController:form animated:YES];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao.contatos count];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
       cell = [[UITableViewCell alloc]
               initWithStyle:UITableViewCellStyleDefault
               reuseIdentifier:cellIdentifier];
    }
    
    Contato *contato = [self.dao buscaContatoDaPosicao:indexPath.row];
    cell.textLabel.text = contato.nome;
    return cell;
}

- (void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void) tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dao removeContatoDaPosicao:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void) tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.contatoSelecionado = [self.dao buscaContatoDaPosicao:indexPath.row];
    [self exibeFormulario];
    self.contatoSelecionado = nil;
}

- (void) contatoAtualizado:(Contato *)contato {
    self.linhaDestaque = [self.dao buscaPosicaoDoContato:contato];
}

- (void) contatoAdicionado:(Contato *)contato {
    self.linhaDestaque = [self.dao buscaPosicaoDoContato:contato];
}

@end
