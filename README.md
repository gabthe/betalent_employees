# Desafio BeTalent

Este é um projeto Flutter criado para participar do processo seletivo BeTalent, desenvolvido para ser executado em emuladores Android ou iOS. Siga as instruções abaixo para clonar e executar o projeto localmente. Para mais detalhes sobre como a arquitetura foi organizada, confira o arquivo [Arquitetura do App](ARCHITECTURE.md).

## Pré-requisitos

Antes de rodar o projeto, certifique-se de que você tem as seguintes ferramentas instaladas:

1. **Flutter**: O framework para desenvolvimento de apps móveis.
   - Instruções de instalação: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

2. **Android Studio** ou **VS Code**:
   - **Android Studio**: [Download Android Studio](https://developer.android.com/studio)
   - **VS Code**: [Download VS Code](https://code.visualstudio.com/)

3. **Xcode** (para rodar em emuladores iOS, se você estiver usando macOS):
   - Instruções de instalação: [Xcode Installation Guide](https://developer.apple.com/xcode/)

4. **Emulador Android ou iOS**
   - Instruções para configurar emuladores Android: [Set up an Android Emulator](https://developer.android.com/studio/run/emulator)
   - Instruções para configurar emuladores iOS (somente macOS): [Running Flutter on iOS](https://flutter.dev/docs/get-started/install/macos)

## Passos para rodar o projeto

### 1. Clonar o repositório

Clone o repositório para sua máquina local utilizando o Git:

```bash
git clone https://github.com/gabthe/betalent_employees_app.git
```

### 2. Navegar e atualizar as dependencias

Navegue até a pasta do projeto e atualize as dependencias:

```bash
cd betalent_employee_app
flutter pub get
```

### 3. Configuração do JSON Server (Dados Simulados)

Os dados utilizados pelo aplicativo são simulados via uma API local usando json-server. Para configurar o servidor e disponibilizar os dados para o aplicativo, siga os seguintes passos:

#### 1. Instalar o `json-server`: Se ainda não tiver o `json-server` instalado, instale-o globalmente utilizando o seguinte comando:

```bash
npm install -g json-server
```

#### 2. Clonar o repositório de dados simulados: Clone o repositório que contém o arquivo db.json com os dados da API:

```bash
git clone https://github.com/BeMobile/desafio-mobile.git
```

#### 3. Iniciar o `json-server`: Entre na pasta do repositório clonado e execute o servidor para simular a API:

```bash
cd desafio-mobile
json-server --watch database.json
```

### 4. Rodar o projeto no emulador Android

Se você tiver um emulador Android configurado, basta executar o comando:

```bash
flutter run
```

Isso irá compilar o projeto e abrir o aplicativo no emulador Android.

### 5. Rodar o projeto no emulador iOS

Caso esteja utilizando macOS e queira rodar o aplicativo em um emulador iOS, execute o comando:

```bash
flutter run
```

O Flutter irá detectar automaticamente o emulador iOS e iniciar o aplicativo nele.

### 6. Rodar os testes

O projeto contém testes automatizados, você pode rodá-los utilizando o comando:

```bash
flutter test
```

