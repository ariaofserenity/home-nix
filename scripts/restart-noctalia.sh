#!/usr/bin/env bash
pgrep -f noctalia-shell | xargs kill
noctalia-shell &