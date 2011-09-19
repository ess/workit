As a developer
In order to keep track of my time easily and reliably
I want to be able to do so in a terminal

## What is it?

Workit is a command-line time tracker.

## Current features

* Start a task

## Upcoming features

* Finish a task
* Restart a task
* List tasks
* Push tasks to harvestapp

## Requirements

* Ruby and RubyGems
* sqlite3

## Usage

    workit [OPTIONS] SUBCOMMAND [ARGS] ...

## Subcommands

* start description of task

Workit allows you to start a task, provided that there is not currently an
unfinished task. Everything after the "start" subcommand is considered the
description of the task.
