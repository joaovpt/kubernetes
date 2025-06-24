echo "Criando as imagens.........."

docker build -t joaovpt/projeto-backend:1.0 backend/.
docker build -t joaovpt/projeto-database:1.0 database/.

echo "Realizando o push das imagens.........."

docker push joaovpt/projeto-backend:1.0
docker push joaovpt/projeto-database:1.0

echo "Criando serviços no cluster kubernates..........."

kubectl apply -f ./services.yml

echo "Criando os deployments.........."

kubectl apply -f ./deployment.yml