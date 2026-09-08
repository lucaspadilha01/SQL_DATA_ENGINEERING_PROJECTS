# Análise exploratória de dados : Job Market Analysis


![Parte 1  - Visão geral](../1-EDA\Imagens\1_1_Project1_EDA.png)

Análise do Mercado de Trabalho de Engenharia de Dados com SQLg

Este porjeto, é uma análise exploratória de dados utilizando dados reais de vagas de emprego para mapear tendências de mercado, competências mais demandadas e faixas salariais. O projeto demonstra a aplicação de SQL analítico avançado na construção de consultas performáticas e na conversão de perguntas de negócios em insights estratégicos baseados em dados. 

##  Sumário
- ✅ **Escopo do projeto**: Construção de 3 consultas analíticas que respondem a perguntas-chave sobre o mercado de trabalho para engenharia de dados

- ✅ **Modelagem de dados**: Uso de junções entre múltiplas tabelas (multi-table joins) em tabelas fato e dimensão para extrair insights

- ✅ **Análise de dados**: Aplicação de agregações, filtragens e ordenação para identificar as principais habilidades por demanda, salário e valor geral

- ✅ **Resultados**: Entrega de insights práticos sobre a dominância de SQL/Python, tendências de nuvem e padrões salariais




## Problema e Contexto

Analistas do mercado de trabalho precisam responder a perguntas como:

- 🎯 **Mais procuradas**: Quais habilidades são mais demandadas para engenheiros de dados?
- 💰 **Mais bem pagas**: Quais habilidades garantem os maiores salários?
- ⚖️ **Melhor relação custo-benefício**: Qual é o conjunto ideal de habilidades para equilibrar demanda e remuneração?

Este projeto analisa um data warehouse construído com um design de esquema em estrela (star schema). A estrutura do data warehouse consiste em:

![Parte 1  - Esquema de dados](../1-EDA\Imagens\1_2_Data_Warehouse.png)


## Tecnologias Utilizadas

- 🐤 Mecanismo de consulta (Query Engine): DuckDB para consultas analíticas rápidas no estilo OLAP
- 🧮 Linguagem: SQL (estilo ANSI com funções analíticas)
- 📊 Modelo de dados: Esquema em estrela (Star schema) com tabelas fato + dimensão + ponte (bridge)
- 🛠️ Desenvolvimento: VS Code para edição de SQL + Terminal para CLI do DuckDB
- 📦 Controle de versão: Git/GitHub para scripts SQL versionados


## Análises SQL
- [Top  Habilidades Mais Demandadas](01_top_demanded_skills.sql)
- [Top  Habilidades Mais Bem Pagas](02_top_paying_skills.sql)
- [Top  Habilidades com Melhor Relação Custo-Benefício](03_optimal_skills.sql)

### Principais Insights 

- 🧠 Linguagens principais: SQL e Python aparecem, cada uma, em aproximadamente 29.000 ofertas de emprego, tornando-as as habilidades mais demandadas.

- ☁️ Plataformas em nuvem: AWS e Azure são cruciais para cargos modernos de engenharia de dados.

- 🧱 Infraestrutura e ferramentas: Kubernetes, Docker e Terraform estão associados a salários mais altos (premium).

- 🔥 Ferramentas de Big Data: Apache Spark apresenta forte demanda acompanhada de remuneração competitiva.

## Estrutura do repositório
```
1_EDA/
├── 01_top_demanded_skills.sql    # Análise das skills
├── 02_top_paying_skills.sql      # Análise dos salários
├── 03_optimal_skills.sql         # Combinação de  demand/salary optimization
└── README.md                     # Você está aqui
```
## SQL Skills

- **Design e Otimização de Consultas** (Query Design & Optimization)
- **Junções Complexas** (Complex Joins): Operações de INNER JOIN em múltiplas tabelas cobrindo job_postings_fact, skills_job_dim e skills_dim
- **Agregações** (Aggregations): Uso de COUNT(), MEDIAN() e ROUND() para análise estatística
- **Filtragem** (Filtering): Lógica booleana com cláusulas WHERE e múltiplas condições (job_title_short, job_work_from_home, salary_year_avg IS NOT NULL)
- **Ordenação e Limitação** (Sorting & Limiting): Uso de ORDER BY com DESC e LIMIT para análises do tipo top-N
- **Técnicas de Análise de Dados** (Data Analysis Techniques)
- **Agrupamento (Grouping)**: Uso de GROUP BY para análise categórica por habilidade
- **Funções Matemáticas (Mathematical Functions)**: Uso de LN() para transformação por logaritmo natural a fim de normalizar métricas de demanda
- **Métricas Calculadas (Calculated Metrics)**: Pontuação ideal derivada combinando a demanda transformada em logaritmo com o salário mediano
- **Cláusula HAVING (HAVING Clause)**: Filtragem de resultados agregados (habilidades com >= 100 publicações de vagas)
- **Tratamento de Valoração Nula (NULL Handling)**: Filtragem adequada de registros incompletos (salary_year_avg IS NOT NULL)
