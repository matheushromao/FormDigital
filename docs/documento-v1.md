# DOCUMENTAÇÃO DE PROJETO

Sistema de Formulários Digitais

Pedras de Fogo/PB

2026

# DOCUMENTAÇÃO DE PROJETO

Sistema de Formulários Digitais

Documento técnico de especificação e entrega referente à primeira versão (MVP) do sistema web de formulários digitais, 
elaborado para orientar o desenvolvimento, a implantação e a manutenção da aplicação.

Versão 1.0

Pedras de Fogo/PB

2026

## SUMÁRIO

## 1 INTRODUÇÃO	4

## 2 OBJETIVOS DA PRIMEIRA VERSÃO	5

## 3 STACK TECNOLÓGICA	6

## 4 ARQUITETURA DO SISTEMA	7

## 5 MÓDULOS FUNCIONAIS	8

### 5.1 Autenticação e Cadastro de Usuários	8

### 5.2 Navegação por Abas	9

### 5.3 Formulário de Solicitação de Item	9

### 5.4 Formulário de Solicitação de Saída	10

### 5.5 Geração de PDF	10

## 6 MODELAGEM DE DADOS	11

## 7 ESTRUTURA DE PASTAS	13

## 8 REQUISITOS NÃO FUNCIONAIS	14

## 9 ROADMAP FUTURO	15

## 10 PRÓXIMOS PASSOS	16

## REFERÊNCIAS	17

## 1 INTRODUÇÃO

O Sistema de Formulários Digitais é uma aplicação web desenvolvida para digitalizar e centralizar o preenchimento, 
a geração e a emissão de formulários internos de empresas, eliminando o uso de planilhas e documentos manuais 
preenchidos à mão.

Cada usuário autenticado poderá acessar abas específicas de acordo com as funcionalidades disponíveis, 
preencher os formulários necessários e gerar automaticamente um arquivo em formato PDF, pronto para ser salvo ou impresso.

Este documento descreve o escopo, a arquitetura, os módulos funcionais e os requisitos técnicos da 
primeira versão (MVP) do sistema, servindo como referência para a equipe de desenvolvimento e 
para as partes interessadas do projeto.

## 2 OBJETIVOS DA PRIMEIRA VERSÃO

A primeira versão do sistema tem como objetivo entregar um conjunto mínimo de funcionalidades que viabilizem o uso do 
sistema em ambiente de produção, contemplando:

Cadastro e autenticação de usuários (login e senha);

Disponibilização de abas de navegação para cada tipo de formulário;

Implementação dos formulários iniciais de Solicitação de Item e de Solicitação de Saída;

Geração automática de arquivo PDF após a submissão de cada formulário;

Possibilidade de salvar ou imprimir o PDF gerado.

## 3 STACK TECNOLÓGICA

A tabela a seguir apresenta as tecnologias definidas para o desenvolvimento do sistema.

Tabela 1 – Stack tecnológica do projeto

Fonte: elaborado pelos autores (2026).

A escolha entre gerar o PDF no backend (Java) ou no frontend (React) impacta diretamente a arquitetura da aplicação. 
Recomenda-se a geração no backend, pois garante maior consistência dos dados, 
permite o armazenamento do arquivo para fins de auditoria e reduz a dependência de bibliotecas no navegador do usuário.

## 4 ARQUITETURA DO SISTEMA

A aplicação segue uma arquitetura cliente-servidor, na qual o frontend consome uma API REST exposta pelo backend, 
que por sua vez se comunica com o banco de dados relacional. O fluxo geral é apresentado a seguir.

[ React (Frontend) ]  <-- REST API (JSON) -->  [ Spring Boot (Backend) ]  <-->  [ MySQL ]
|
v
[ Geracao de PDF ]

O Frontend, desenvolvido em React, é responsável pela interface do usuário, 
pelos formulários e pela autenticação (telas de login e cadastro), 
além da navegação por abas.

O Backend, desenvolvido em Spring Boot, concentra as regras de negócio, a autenticação e autorização dos usuários, 
a persistência dos dados, a geração dos arquivos PDF e a exposição da API REST consumida pelo frontend.

O Banco de Dados MySQL é responsável pelo armazenamento dos usuários cadastrados, 
dos formulários preenchidos e do histórico de utilização do sistema.

## 5 MÓDULOS FUNCIONAIS

### 5.1 Autenticação e Cadastro de Usuários

O módulo de autenticação é responsável por controlar o acesso dos usuários ao sistema, 
contemplando as seguintes funcionalidades:

Cadastro de novo usuário (nome, e-mail, login e senha);

Login com login e senha;

Armazenamento da senha com hash (por exemplo, BCrypt);

Autenticação por meio de token JWT;

(Evolução futura) Perfis de acesso, como administrador e operador.

A tabela a seguir apresenta os endpoints sugeridos para o módulo de autenticação.

Tabela 2 – Endpoints do módulo de autenticação

Fonte: elaborado pelos autores (2026).

### 5.2 Navegação por Abas

Após a autenticação, o usuário acessa um painel (dashboard) organizado em abas, 
cada uma correspondendo a uma funcionalidade ou tipo de formulário disponível. 
Na primeira versão, estão previstas as seguintes abas:

Solicitação de Item;

Solicitação de Saída.

A estrutura de navegação foi projetada para ser extensível, permitindo que novas abas e formulários sejam adicionados 
sem a necessidade de reestruturação do sistema.

### 5.3 Formulário de Solicitação de Item

O formulário de Solicitação de Item permite o registro de pedidos internos de materiais ou insumos. 
Os campos sugeridos, a serem validados junto aos usuários finais, são:

Nome do solicitante;

Setor ou departamento;

Item solicitado;

Quantidade;

Justificativa;

Data da solicitação.

### 5.4 Formulário de Solicitação de Saída

O formulário de Solicitação de Saída permite o registro das informações referentes à emissão de solicitações de saída 
de materiais. Os campos sugeridos, a serem validados junto aos usuários finais, são:

Destinatário;

Data de emissão;

Itens (descrição, quantidade e valor unitário);

Valor total;

Observações.

### 5.5 Geração de PDF

Ao submeter qualquer um dos formulários, o sistema gera automaticamente um arquivo em formato PDF contendo os dados 
preenchidos. O documento segue um layout padronizado, contendo o logotipo da usina, o título do formulário, 
os dados informados e a data e a hora de geração.

O usuário poderá realizar o download (salvar) do arquivo ou enviá-lo diretamente para impressão. Recomenda-se, 
ainda, que o PDF gerado seja armazenado no backend ou no banco de dados, possibilitando consulta futura por meio 
de um histórico de formulários.

## 6 MODELAGEM DE DADOS

Esta seção apresenta as principais entidades previstas no modelo de dados da primeira versão do sistema.

Tabela 3 – Entidade Usuário (usuario)

Fonte: elaborado pelos autores (2026).

Tabela 4 – Entidade Solicitação de Item (solicitacao_item)

Fonte: elaborado pelos autores (2026).

Tabela 5 – Entidade Solicitação de Saída (solicitacao_saida)

Fonte: elaborado pelos autores (2026).

## 7 ESTRUTURA DE PASTAS

A seguir são apresentadas as estruturas de pastas sugeridas para o backend e para o frontend do projeto.

### 7.1 Backend (Spring Boot)

src/main/java/com/giasa/formularios/
├── config/       # Configuracoes (seguranca, CORS, etc.)
├── controller/   # Controllers REST
├── dto/          # Objetos de transferencia de dados
├── model/        # Entidades JPA
├── repository/   # Interfaces JPA Repository
├── service/      # Regras de negocio
├── pdf/          # Geracao de PDF
└── FormulariosApplication.java

### 7.2 Frontend (React)

src/
├── components/   # Componentes reutilizaveis
├── pages/        # Paginas (Login, Cadastro, Dashboard, Formularios)
├── services/     # Chamadas a API (axios/fetch)
├── context/      # Contexto de autenticacao
├── routes/       # Rotas da aplicacao
└── App.jsx

## 8 REQUISITOS NÃO FUNCIONAIS

Aplicação responsiva, acessível tanto por desktop quanto por dispositivos móveis;

Comunicação entre frontend e backend realizada via HTTPS;

Senhas nunca armazenadas em texto puro;

Tempo de resposta na geração do PDF inferior a poucos segundos;

Código-fonte organizado em camadas (controller, service, repository) para facilitar a manutenção.

## 9 ROADMAP FUTURO

As funcionalidades a seguir estão previstas para versões futuras do sistema, não fazendo parte do escopo da 
primeira versão:

Perfis de usuário com permissões diferenciadas (administrador, operador, etc.);

Histórico e busca de formulários já gerados;

Assinatura digital nos PDFs;

Notificações por e-mail ao gerar formulário;

Painel administrativo com relatórios e indicadores;

Novas abas e formulários conforme necessidade da empresa.

## 10 PRÓXIMOS PASSOS

Validar os campos exatos de cada formulário;

Definir a biblioteca de geração de PDF (backend ou frontend);

Modelar o banco de dados definitivo (diagrama entidade-relacionamento);

Definir a identidade visual do PDF (logotipo, cabeçalho e rodapé);

Configurar o ambiente de desenvolvimento (Docker para backend e MySQL, se desejado).

## REFERÊNCIAS

ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. NBR 14724: informação e documentação — trabalhos acadêmicos — apresentação. 
Rio de Janeiro: ABNT, 2011.

SPRING. Spring Boot Reference Documentation. Disponível em: https://spring.io/projects/spring-boot. Acesso em: 20 jul. 2026.

REACT. React Documentation. Disponível em: https://react.dev. Acesso em: 20 jul. 2026.



| Camada | Tecnologia |

| --- | --- |

| Backend | Java + Spring Boot |

| Banco de dados | MySQL |

| Frontend | React |

| Geração de PDF | Biblioteca a definir (ex.: iText/OpenPDF no backend ou jsPDF no frontend) |

| Autenticação | Spring Security + JWT |

| Build (backend) | Maven ou Gradle |

| Gerenciador de pacotes (frontend) | npm ou yarn |

| Versionamento | Git / GitHub ou GitLab |



| Método | Rota | Descrição |

| --- | --- | --- |

| POST | /api/auth/registrar | Cria um novo usuário |

| POST | /api/auth/login | Autentica o usuário e retorna o token JWT |



| Campo | Tipo |

| --- | --- |

| id | UUID / Long |

| nome | String |

| email | String |

| login | String |

| senha_hash | String |

| data_criacao | Timestamp |



| Campo | Tipo |

| --- | --- |

| id | UUID / Long |

| usuario_id | FK -> usuario |

| item | String |

| quantidade | Integer |

| justificativa | Text |

| data_solicitacao | Timestamp |

| pdf_gerado | String (caminho/URL do arquivo) |



| Campo | Tipo |

| --- | --- |

| id | UUID / Long |

| usuario_id | FK -> usuario |

| destinatario | String |

| data_emissao | Date |

| valor_total | Decimal |

| pdf_gerado | String (caminho/URL do arquivo) |
