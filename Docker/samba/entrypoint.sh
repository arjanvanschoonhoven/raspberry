#!/bin/sh

nmbd -D
exec ionice -c 3 smbd -FS