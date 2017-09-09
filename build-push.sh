#!/usr/bin/env bash
docker build -t mofesola/bitbucket-ecs-deploy .
docker push mofesola/bitbucket-ecs-deploy
