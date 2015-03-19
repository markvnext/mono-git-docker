# mono-git-docker
Docker image based on debian:jessie with Mono 4.1 built from http://github.com/mono/mono master

## Rationale

The latest DNX (ASP.NET vNext) bits require Mono 4.1. The "current" release version of Mono is 3.12.1, against which DNX MVC applications will not run due to the absence of certain attribute classes.

## Caveat

Because this image builds from a Git repository, it is not considered stable and you should probably not use it in production, at least not without extensively testing your application.