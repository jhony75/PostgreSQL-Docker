docker build --build-arg POSTGRES_USER=your_username --build-arg POSTGRES_PASSWORD=your_password -t my-postgres-container -f Dockerfile-postgres .
docker build --build-arg POSTGRES_USER=your_username --build-arg POSTGRES_PASSWORD=your_password -t my-postgres-container -f Dockerfile-postgres .


docker build -t my-pgadmin-container -f Dockerfile-pgadmin .

docker network create my-pg-network

docker-compose up -d

echo "Database setup complete! Access PgAdmin at http://localhost:5050"