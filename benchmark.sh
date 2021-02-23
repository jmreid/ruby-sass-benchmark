#!/bin/bash

hyperfine --warmup 3 --min-runs 100 --export-markdown report.md 'sass --style compressed theme.scss'
