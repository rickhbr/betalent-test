
# BeTalent Flutter Challenge

Este repositório contém o projeto desenvolvido para o desafio técnico BeTalent. O objetivo é exibir uma tabela de funcionários cujos dados são obtidos de uma **API simulada**. O projeto foi desenvolvido em **Flutter** utilizando **MobX** como gerenciador de estado.

---

## 📋 Requisitos do Projeto

### Funcionalidades:
- Exibe uma tabela com as seguintes colunas:
  - Imagem (thumbnail do funcionário);
  - Nome;
  - Cargo;
  - Data de admissão (formatada);
  - Telefone (formatado).
- Pesquisa na tabela com filtro por:
  - Nome;
  - Cargo;
  - Telefone.

### Extras:
- Splash Screen com animações (utilizando Flutter Animations).
- Design responsivo e bem organizado.
- API simulada para fornecer os dados do projeto.

---

## 🛠 Pré-requisitos para Rodar o Projeto

Antes de começar, você precisa ter as ferramentas abaixo instaladas em sua máquina:

1. **Flutter SDK**:
   - Instale o Flutter seguindo [essas instruções](https://flutter.dev/docs/get-started/install).
   - Certifique-se de que `flutter doctor` retorna todos os itens configurados corretamente.

2. **Node.js**:
   - Instale o Node.js seguindo [essas instruções](https://nodejs.org/).

3. **Git**:
   - Verifique se o Git está instalado. Caso contrário, siga [essas instruções](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

---

## 🚀 Como Configurar o Projeto

### 1. Clone o Repositório

Abra o terminal e execute os comandos:
```bash
git clone [https://github.com/seu-usuario/seu-repositorio.git](https://github.com/rickhbr/betalent-test)
cd seu-repositorio
```

---

### 2. Execute o Script de Automação

Com o script `run.sh`, você pode rodar todo o projeto automaticamente:
```bash
./run.sh
```

O script fará:
1. Instalação das dependências da API.
2. Início da API simulada (`json-server`).
3. Instalação das dependências do Flutter.
4. Execução do aplicativo Flutter.

> **Nota:** Para encerrar a API simulada, basta sair do aplicativo Flutter (o script finalizará o processo automaticamente).

---

## 🌟 Estrutura do Projeto

O projeto segue uma arquitetura modularizada para facilitar a escalabilidade e a organização:

```plaintext
lib/
├── core/
│   ├── constants/       # Constantes globais (cores, estilos, strings)
│   ├── utils/           # Funções utilitárias (formatadores, validadores)
│   ├── widgets/         # Widgets reutilizáveis
│   └── services/        # Serviços globais (ex: ApiService)
├── modules/
│   ├── splash/          # Tela de Splash Screen
│   ├── employees/       # Tela de Tabela de Funcionários
├── app.dart             # Configuração das rotas
└── main.dart            # Ponto de entrada da aplicação
```

---

## 📦 Estrutura da API

O arquivo `db.json` contém os dados simulados para o projeto:
```json
{
  "employees": [
    {
      "id": 1,
      "name": "João",
      "job": "Back-end",
      "admission_date": "2019-12-02T00:00:00.000Z",
      "phone": "5551234567890",
      "image": "https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg"
    },
    ...
  ]
}
```

Endpoint disponível:
- **GET** `/employees`: Retorna a lista completa de funcionários.

---

## 📖 Observações

- **Emulador Android**: Use o IP `http://10.0.2.2:3000` para acessar a API.
- **Dispositivo físico**: Certifique-se de que o dispositivo e o servidor estão na mesma rede Wi-Fi.
- **iOS Simulator**: O endereço `http://localhost:3000` funciona diretamente.

---

## 🤝 Contribuição

Se houver dúvidas ou problemas ao rodar o projeto, entre em contato via GitHub Issues.

---

Com este README e o script `run.sh`, o avaliador terá tudo o que precisa para rodar o projeto de forma simples e prática. Certifique-se de testar o script antes de enviar! 🚀

### Permissão para o script
Antes de rodar o script pela primeira vez, garanta que ele tem permissão de execução:
```bash
chmod +x run.sh
```
Depois disso, execute normalmente:
```bash
./run.sh
```

### Passo para obter o IP local
Se você estiver testando em um dispositivo físico, o dispositivo e o computador devem estar na mesma rede Wi-Fi.
- Para obter o IP local do computador:
  No terminal, execute:
  ```bash
  ifconfig | grep inet
  ```
  Procure o endereço `inet` da interface ativa (geralmente `en0` para Wi-Fi). Use este IP em vez de `localhost` no código do Flutter.

### Possíveis Erros e Soluções
- **Erro de Permissão ao Rodar o Script**:
  Certifique-se de dar permissão de execução:
  ```bash
  chmod +x run.sh
  ```

- **API não conecta no emulador Android**:
  Use `http://10.0.2.2:3000` para substituir `localhost`.

- **API não conecta no dispositivo físico**:
  Garanta que o dispositivo e o computador estão na mesma rede e use o IP correto do computador.

### Formato e Validação de Dados da API
- O aplicativo espera que os dados recebidos da API estejam no formato correto, como definido na estrutura do backend.
- Certifique-se de que o arquivo `db.json` da API simulada está configurado adequadamente.
