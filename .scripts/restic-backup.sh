#!/bin/bash

export RESTIC_REPOSITORY=sftp:gadzhi.synology.me:/home/restic-backup
export RESTIC_PASSWORD_COMMAND='security find-generic-password -s backup-restic-repository -a restic_backup -w'

/usr/local/bin/restic backup --verbose --files-from ~/.config/restic/backup.txt
