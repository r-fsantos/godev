import UIKit

/*
 POP - Prog oriented to Protocols...
 
    esquema de metodos e propriedades agrupados que são
    requisitos para uma implementação concreta.
    base para uma boa aplicação de SOLID.
 
 Antes havia o MVC
 Depois veio o VIPER; 5 arquivos, bom pra equipes grandes
 ...MVVM: Model View ViewModel
 ...MVP: Model View Presenter
 
 Arquitetura: Separação e organização de Páginas
 
 Conheçam: AEDs... Algoritmos e Estruturas de Dados!
 
 Apple usa MVC, mas com POP!
 
 Não existe a melhor a arquitetura, existe a que funciona
 para o seu contexto.
*/

protocol SomeProtocol {
    
}

protocol ReformarCampo {
    
    func plantarNovaGrama()
    func pintarNovasLinhas()
}

class EmpresaA: ReformarCampo {
    func plantarNovaGrama() {
        // contratarVariosEmpregados()
        // delegarParaEmpregadosPlantarGrama()
    }
    
    func pintarNovasLinhas() {
        // contratarVariosEmpregados()
        // delegarParaEmpregadosPintaremAsLinhas()
    }
}


class EmpresaB: ReformarCampo {
    func plantarNovaGrama() {
        // comprarMaquinas()
        // delegarMaquinasParaPintarGrama()
    }
    
    func pintarNovasLinhas() {
        // comprarMaquinas()
        // delegarMaquinasParaPintarNovasLinhas()
    }
}
