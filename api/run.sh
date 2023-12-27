#!/bin/bash

docker run -p 3000:3000 --network notes_network -v /home/francois/perso/react-fullstack-sticky-notes/api:/api --name notes_api notes_backend:0.1 npm start