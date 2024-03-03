name: dev Docker Images

on:
  push:
    branches:
      - dev

jobs:
  build-and-push:
    runs-on: ubuntu-latest

    env:
      WORDPRESS_DB_HOST: database-1.crw0iyascsde.us-east-1.rds.amazonaws.com
      WORDPRESS_DB_USER: chakri
      WORDPRESS_DB_PASSWORD: chakradhar
      WORDPRESS_DB_NAME: chakri

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v1

    - name: Login to AWS ECR
      run: |
        aws configure set aws_access_key_id ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws configure set aws_secret_access_key ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        aws configure set default.region us-east-1
        aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/y5i3n5q3

    - name: Build and Push WordPress Docker image
      run: |
        docker buildx create --use
        docker buildx inspect

        docker buildx build --platform linux/amd64 -t public.ecr.aws/y5i3n5q3/test:newwordpress -f word.dockerfile --build-arg WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST} --build-arg WORDPRESS_DB_USER=${WORDPRESS_DB_USER} --build-arg WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD} --build-arg WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME} .
        
        docker push public.ecr.aws/y5i3n5q3/test:newwordpress
