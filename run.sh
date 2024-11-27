#!/bin/bash

cleanup() {
  echo ">> Encerrando a API simulada..."
  kill $API_PID
  exit
}

trap cleanup SIGINT SIGTERM

echo "==== Iniciando configuração do projeto ===="

if [ -d "api" ]; then
  echo ">> Instalando dependências da API simulada..."
  cd api || exit
  npm install
  echo ">> Dependências instaladas."

  echo ">> Iniciando a API simulada..."
  npx json-server --watch db.json --port 3000 &
  API_PID=$!
  echo ">> API simulada rodando no PID $API_PID."

  cd ..
else
  echo ">> Pasta 'api' não encontrada. Certifique-se de que ela existe no diretório do projeto."
  exit 1
fi

if [ -f "pubspec.yaml" ]; then
  echo ">> Instalando dependências do Flutter..."
  flutter pub get
  echo ">> Dependências instaladas."

  echo ">> Rodando o aplicativo Flutter..."
  flutter run
else
  echo ">> Arquivo 'pubspec.yaml' não encontrado. Certifique-se de que você está na raiz do projeto Flutter."
  cleanup
fi

cleanup
