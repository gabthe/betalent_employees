# Arquitetura do App

Este arquivo descreve a arquitetura do aplicativo **Desafio BeTalent**, como ele foi estruturado e as escolhas feitas no design da aplicação.

## Estrutura do Projeto

A estrutura do projeto segue as boas práticas de desenvolvimento Flutter, visando modularidade e escalabilidade. O aplicativo é baseado na arquitetura **MVC (Model-View-Controller)**, o que ajuda a separar a lógica de apresentação e de negócios.

### Pastas Principais:

- **`lib/src`**: Contém o código-fonte principal do aplicativo.
  - **`model/`**: Contém os modelos de dados utilizados no app (ex: `employee_model.dart`).
  - **`repository/`**: Contém a lógica de acesso aos dados, como APIs ou banco de dados local (ex: `employee_repo.dart`).
  - **`controller/`**: Contém os controladores que gerenciam o estado da aplicação (ex: `employee_controller.dart`).
  - **`view/`**: Contém os arquivos relacionados às telas do projeto.
  - **`utils/`**: Contém utilitários e funções auxiliares.
  - **`widgets/`**: Contém widgets utilizados para montagem das telas do app.

### Escolha da Arquitetura MVC

- **Model**: Representa a estrutura de dados e as regras de negócios. No nosso caso, um exemplo seria a classe `Employee`.
- **View**: É a interface com o usuário, composta por telas e widgets.
- **Controller**: Lógica que conecta o **Model** com a **View**, gerenciando o estado e controlando a interação do usuário.

### Fluxo de Dados

- Os dados são carregados de uma API simulada via `json-server` e são manipulados pelo repositório (`EmployeeRepo`).
- O controlador (`EmployeeController`) é responsável por buscar os dados e gerenciar o estado de carregamento e erro, o controller contém uma camada reponsável pelo estado da aplicação, fazendo uso do `State Pattern`.
- A **View** é atualizada automaticamente usando um **ValueNotifier** e o padrão de notificação de mudanças.

---

## Tecnologias Utilizadas

- **Flutter**: Framework para o desenvolvimento de aplicativos móveis.
- **json-server**: Para simular a API de backend durante o desenvolvimento.
- **Mockito**: Para os testes unitários e mocks dos repositórios.
- **http**: Para realizar as requisições à API simulada.
