# Projetos de Automação com n8n

Repositório destinado ao desenvolvimento de projetos de automação utilizando o **n8n**, integrações com APIs, serviços em nuvem, bancos de dados e aplicações backend.

O objetivo é reunir automações que solucionam problemas reais, reduzem atividades manuais e demonstram diferentes possibilidades de integração entre sistemas.

## Sobre o repositório

Cada projeto está organizado em sua própria pasta e possui:

- Workflow exportado do n8n;
- README com explicação detalhada;
- Imagens do funcionamento;
- Instruções para configuração;
- Tecnologias e integrações utilizadas;
- Possíveis melhorias.

As automações deste repositório exploram conceitos como:

- Integração entre APIs;
- Automação de processos;
- Manipulação de dados JSON;
- Webhooks e formulários;
- Envio automatizado de e-mails;
- Integração com serviços do Google;
- Bancos de dados;
- Mensageria;
- Aplicações backend;
- Tratamento de erros;
- Monitoramento de execuções.

## Projetos

| Projeto | Descrição | Integrações | Status |
|---|---|---|---|
| [Projeto 01 — Envio automatizado de documentos](Projeto_01/) | Recebe informações por formulário, registra os dados em uma planilha, baixa um documento e realiza o envio por e-mail. | n8n, Google Sheets, Google Drive e Gmail | Concluído |
| Projeto 02 | Em desenvolvimento | A definir | Planejado |
| Projeto 03 | Em desenvolvimento | A definir | Planejado |

Esta tabela será atualizada conforme novos projetos forem desenvolvidos.

## Estrutura do repositório

```text
Projetos_automacao_n8n/
├── Projeto_01/
│   ├── images/
│   │   ├── formulario.png
│   │   └── workflow_completo.png
│   ├── Workflow/
│   │   └── Workflow Conexão.json
│   └── README.md
├── Projeto_02/
│   ├── images/
│   ├── Workflow/
│   └── README.md
├── LICENSE
└── README.md
```

Cada projeto é independente e contém a documentação necessária para entender e importar seu workflow.

## Projeto 01 — Envio automatizado de documentos

O primeiro projeto automatiza o envio de um documento a partir das informações fornecidas em um formulário.

O workflow executa as seguintes etapas:

1. Recebe os dados pelo formulário do n8n;
2. Registra as informações no Google Sheets;
3. Baixa um documento armazenado no Google Drive;
4. Envia o documento por e-mail usando o Gmail;
5. Atualiza a planilha com o status `SENT`.

A documentação completa está disponível na pasta:

[Ver Projeto 01](Projeto_01/)

## Como importar um workflow

1. Abra a pasta do projeto desejado;
2. Acesse a pasta `Workflow`;
3. Faça o download do arquivo `.json`;
4. Abra o n8n;
5. Crie um novo workflow;
6. Selecione **Import from File**;
7. Escolha o arquivo JSON;
8. Configure suas próprias credenciais;
9. Ajuste os documentos, planilhas e demais recursos;
10. Execute os testes antes de ativar o workflow.

## Tecnologias e serviços

As principais tecnologias utilizadas nos projetos incluem:

- [n8n](https://n8n.io/)
- APIs REST
- Webhooks
- Google Sheets
- Google Drive
- Gmail
- OAuth 2.0
- JavaScript
- JSON
- HTML
- Python
- Bancos de dados
- Serviços em nuvem

As tecnologias podem variar de acordo com cada projeto.

## Segurança

Os workflows disponibilizados neste repositório não devem conter informações confidenciais.

Antes de publicar ou utilizar qualquer workflow, verifique se foram removidos:

- Senhas;
- Tokens de acesso;
- Chaves de API;
- Client ID e Client Secret;
- Credenciais do n8n;
- E-mails e telefones usados em testes;
- Dados pessoais reais;
- IDs privados de arquivos e planilhas;
- URLs internas;
- Dados fixados de execuções.

Cada usuário deve configurar suas próprias credenciais após importar o workflow.

## Objetivos

Este repositório foi criado com os objetivos de:

- Praticar automação de processos;
- Desenvolver integrações entre diferentes sistemas;
- Criar soluções aplicáveis a situações reais;
- Explorar recursos avançados do n8n;
- Documentar os aprendizados obtidos;
- Construir um portfólio técnico;
- Compartilhar conhecimento com a comunidade.

## Próximos passos

Entre as evoluções planejadas estão:

- Novas automações integradas com APIs;
- Projetos envolvendo aplicações backend;
- Integrações com bancos de dados;
- Processamento orientado a eventos;
- Tratamento centralizado de erros;
- Notificações e monitoramento;
- Automações com inteligência artificial;
- Deploy de serviços complementares em nuvem.

## Autor

**Henry Gabriel Santos Silva**

Estudante de Engenharia da Computação e desenvolvedor com foco em Engenharia de Dados, automação de processos e integração de sistemas.

- [LinkedIn](https://www.linkedin.com/in/henry-gabriel-santos-silva-6ba776209/)
- [GitHub](https://github.com/Henry-Gbriel)

## Licença

Este repositório está disponível sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para mais informações.