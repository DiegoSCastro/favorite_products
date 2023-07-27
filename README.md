# Favorite Products App

Este é um projeto de exemplo do aplicativo "Favorite Products" que demonstra a utilização da Clean Architecture (Arquitetura Limpa) em um aplicativo Flutter.

## Características Implementadas:
Listagem de Produtos (Products List): O aplicativo permite que os usuários visualizem uma lista de produtos com informações detalhadas.

Detalhes do Produto (Product Details): Ao tocar em um produto na lista, o usuário é direcionado para a tela de detalhes do produto, onde pode ver informações mais detalhadas e adicioná-lo à lista de favoritos.

Favoritos (Favorites): O aplicativo possui uma tela dedicada para exibir todos os produtos marcados como favoritos pelo usuário.

Testes Unitários e de Widget: Implementamos testes unitários e de widget para garantir a qualidade do aplicativo. Utilizamos as bibliotecas flutter_test e mockito para criar e executar testes automatizados. Atualmente temos mais de 70% de cobertura de testes neste projeto.

Injeção de Dependência: Implementamos a injeção de dependência no aplicativo usando o pacote get_it. Isso permite a separação das dependências e torna o código mais modular e fácil de testar.

Salvamento Local: Neste projeto, utilizamos o pacote shared_preferences para armazenar os dados localmente.

Gestão de Estado: Utilizamos o gerenciamento de estado do Flutter para atualizar a interface do usuário de forma reativa quando os dados são modificados. Para isso, utilizamos ValueNotifier e ValueListenableBuilder para refletir as mudanças na UI.

# Sobre Arquitetura Limpa (Clean Architecture):

Camada de Domínio (Domain Layer): Nesta camada, definimos as regras de negócio e a lógica central do aplicativo. Aqui, criamos as entidades que representam os conceitos fundamentais do aplicativo e também os casos de uso, que são as ações que o usuário pode executar. Essa camada é independente de qualquer framework ou tecnologia externa, o que torna o código mais limpo e facilmente testável.

Camada de Apresentação (MVC - Model-View-Controller): Na camada de apresentação, utilizamos o padrão MVC (Model-View-Controller) para organizar a interface do usuário e a lógica de apresentação. O Modelo (Model) representa os dados e regras de negócio da aplicação. A Visão (View) é a interface do usuário que mostra os dados ao usuário. O Controlador (Controller) é responsável por intermediar a comunicação entre o Modelo e a Visão e responder às ações do usuário.

Camada de Dados (Data Layer): A camada de dados é responsável por lidar com a implementação de detalhes técnicos, como acesso à internet, banco de dados e serviços externos. Aqui, implementamos as interfaces de repositório definidas na camada de domínio, que permitem ao aplicativo acessar e armazenar dados de forma transparente. Essa separação de responsabilidades torna o código mais flexível e facilita a troca de fontes de dados sem afetar o restante do aplicativo.