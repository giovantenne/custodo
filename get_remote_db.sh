#!/bin/bash
heroku pg:backups capture
curl -o latest.dump `heroku pg:backups public-url | cat`
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d custodello_development latest.dump
rm latest.dump
