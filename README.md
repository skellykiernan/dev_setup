# My Develop platform
*
* Uses vundle to install my plugins, see wiki 
* tmux 
* clang-format

# WLS2

Late have started playing with Ubuntu 20.04 using WSL2, not bad (even for Microsoft)

## Good
  - can asscess home directory with `File Explorer` via `\\wsl$\Ubuntu-20.04\${USER}\`

## Bad 

  - _${PATH}_ shows windows directories, where a lot of windows executable reside
  - Do not like the command line interface, access linux via a windows command window does not feel natural [MobaXterm](https://mobaxterm.mobatek.net/) gives a more natural experience


```mermaid
---
title: test flow
---
flowchart TD
A <--> B & C
B --> D
C --> D
B --> E
E --> F & H
E --> E
```

```mermaid
sequenceDiagram
participant En1
participant En2
participant En3
participant En4
participant En5
participant En6
participant En7

En1 ->> En2: Test

En3 ->> En1: look here

```



