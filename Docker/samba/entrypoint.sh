#!/bin/sh

sleep infinity &
child=$!
wait "$child"