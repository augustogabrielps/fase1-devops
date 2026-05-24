# DevOps Fase 1 – Pipeline CI/CD com Spring Boot

Projeto desenvolvido para a disciplina de DevOps, cobrindo configuração de pipeline de Integração Contínua, provisionamento de infraestrutura como código e boas práticas de automação.

## Tecnologias

- Java 17 + Spring Boot 3.2
- Maven
- GitHub Actions (CI)
- Terraform (IaC)
- AWS EC2

## Estrutura
```
devops-fase1/
├── .github/workflows/ci.yml   # Pipeline CI
├── app/                       # Aplicação Spring Boot
└── terraform/                 # Scripts de infraestrutura
```
## Como executar localmente

```bash
cd app
mvn spring-boot:run
```

Acesse: `http://localhost:8080/api/hello`

## Infraestrutura

```bash
cd terraform
terraform init
terraform apply
```

