# 🌐 Formulário com PHP + MySQL + Kubernetes

Este projeto faz parte de um **desafio prático** com foco em **deploy de aplicações web** utilizando containers Docker e orquestração com Kubernetes.  
A aplicação base (frontend e backend) já foi fornecida no desafio, e este repositório apresenta toda a parte de infraestrutura desenvolvida para realizar o deploy.

---

## 📦 O que está incluso

- 🖥️ **Frontend** em HTML, CSS e JavaScript (já fornecido)
- ⚙️ **Backend PHP** com conexão MySQL (já fornecido)
- 🐬 Banco de dados MySQL 5.7
- 🐳 **Docker** para empacotamento das imagens
- ☸️ **Kubernetes** (via Minikube) para orquestração dos serviços
- 🛠 Scripts para automação de deploy

---

## 📁 Estrutura do Projeto

```bash
.
├── backend/              # Fornecido no desafio
│   ├── conexao.php
│   ├── index.php
│   └── Dockerfile        # Empacotado para rodar em container PHP
├── database/             # Criado para iniciar o banco MySQL com estrutura da tabela
│   ├── sql.sql
│   └── Dockerfile
├── frontend/             # Fornecido no desafio
│   ├── index.html
│   ├── css.css
│   └── js.js
├── services.yml          # Serviços Kubernetes
├── deployment.yml        # Deployments Kubernetes + PVC
└── script.bat            # Script automatizado de build, push e deploy
```
---

## ⚙️ Pré-requisitos

- Docker
- Minikube
- kubectl
- Conta no Docker Hub

## 🚀 Como executar
1. Inicie o Minikube
```

minikube start

```
- Se estiver usando Windows + VirtualBox e estiver dando esse erro: "_This computer doesn't have VT-X/AMD-v enabled. Enabling it in the BIOS is mandatory_"
- Execute dessa forma:
- ```

  minikube start --vm-driver=virtualbox

  ```

2. (IMPORTANTE) Execute o túnel do Minikube
Abra um terminal como administrador e rode:
```

minikube tunnel

```
Isso permitirá acessar o serviço LoadBalancer.

3. Execute o script de deploy
No diretório do projeto:
```

script.bat

```
Esse script realiza:
- 🔨 Build das imagens Docker (backend e database)
- 📤 Push das imagens para o Docker Hub
- ☸️ Aplicação dos services e deployments no cluster Kubernetes

4. Acesse o formulário
Pegue o IP externo com:
```

kubectl get service php

```
5. Adicione no arquivo frontend js.js:
```

$.ajax({
        url: "http://<EXTERNAL_IP>",

```
6. Acesse no navegador via arquivo:
```

frontend/index.html

```

Preencha e envie o formulário. Os dados são enviados ao backend e salvos no banco MySQL.

🧪 Consultando o banco de dados

Conecte-se ao pod MySQL:
```

kubectl get pods
kubectl exec -it <nome-do-pod-mysql> -- mysql -u root -p
Senha: Senha123

```

Depois:
```

USE meubanco;
SELECT * FROM mensagens;

```
