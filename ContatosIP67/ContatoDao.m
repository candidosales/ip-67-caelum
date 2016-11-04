//
//  ContatoDao.m
//  ContatosIP67
//
//  Created by ios6281 on 10/31/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import "ContatoDao.h"

@implementation ContatoDao

static ContatoDao *defaultDao = nil;
static CoreDataInfra *coreDataInfra = nil;

- (id) initWithCoreData: (CoreDataInfra *) infra {
    self = [ super init ];
    if (self) {
        coreDataInfra = infra;
        _contatos = [NSMutableArray new];
        [self inserirDadosIniciais];
        [self carregarContatos];
    }
    return self;
}

- (void) adicionaContato:(Contato *)contato {
    [self.contatos addObject:contato];
    [coreDataInfra saveContext];
    
    NSLog(@"Contatos: %@", self.contatos);
}

- (void) removeContatoDaPosicao:(NSInteger)posicao {
    [self.contatos removeObjectAtIndex:posicao];
}

+ (id) contatoDaoInstance {
    if(!defaultDao) {
        defaultDao = [[ContatoDao alloc] initWithCoreData:[CoreDataInfra new]];
    }
    return defaultDao;
}

- (Contato *) buscaContatoDaPosicao: (NSInteger)posicao {
    return self.contatos[posicao];
}

- (NSInteger) buscaPosicaoDoContato:(Contato *) contato {
    return [self.contatos indexOfObject:contato];
}
- (void) inserirDadosIniciais {
    NSUserDefaults *configuracoes = [NSUserDefaults standardUserDefaults];
    BOOL dadosInseridos = [configuracoes boolForKey:@"dados_inseridos"];
    if (!dadosInseridos) {
        Contato *caelumSP = [NSEntityDescription insertNewObjectForEntityForName:@"Contato"
                                                          inManagedObjectContext:coreDataInfra.managedObjectContext];
        
        caelumSP.nome = @"Caelum Unidade SP";
        caelumSP.email = @"caelum@gamil.com";
        caelumSP.endereco = @"Sao Paulo, SP, Rua Vergueiro, 3185";
        caelumSP.telefone = @"01155712751";
        caelumSP.site = @"http://www.caelum.com.br";
        caelumSP.latitude = [NSNumber numberWithDouble:-23.5883034];
        caelumSP.longitude = [NSNumber numberWithDouble:-46.632369];
        
        [coreDataInfra saveContext];
        [configuracoes setBool:YES forKey:@"dados_inseridos"];
        [configuracoes synchronize];
    }
}

- (void)carregarContatos {
    NSFetchRequest *buscaContatos = [NSFetchRequest fetchRequestWithEntityName:@"Contato"];
    NSSortDescriptor *ordernarPorNome = [NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES];
    
    buscaContatos.sortDescriptors = @[ordernarPorNome];
    NSArray *contatosImutaveis = [coreDataInfra.managedObjectContext executeFetchRequest:buscaContatos error:nil];
    _contatos = [contatosImutaveis mutableCopy];
}

-(Contato *)novoContato {
    return [NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:coreDataInfra.managedObjectContext];
}

@end
