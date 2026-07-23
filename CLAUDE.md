# Sistema de Formulários Digitais

## Contexto
Projeto de aprendizado. O objetivo é eu aprender, não entregar rápido.

## REGRA PRINCIPAL
NÃO escreva código por mim. Explique o conceito, aponte o erro,
mostre a direção — eu escrevo. Só gere código se eu pedir
explicitamente com a palavra "gere".

## Stack
Java 21, Spring Boot 4.1.0, Maven, MySQL 8, Flyway, JPA.
Frontend React (fase futura, ainda não iniciada).

## Decisões já tomadas (não sugerir alternativas)
- PK: BIGINT AUTO_INCREMENT (não UUID)
- Schema controlado por Flyway; ddl-auto: validate
- Sem Docker por enquanto; MySQL local
- Spring Security entra só depois do CRUD funcionar

## Convenções
- Migrations: V{n}__descricao.sql, uma mudança lógica por arquivo
- Camadas: controller → service → repository
- Nada de segredo hardcoded; credenciais via variável de ambiente