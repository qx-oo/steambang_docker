#!/bin/bash
cd /var/www/steambang && gunicorn -b 0.0.0.0:8080 -c /var/www/steambang/deployconf/gunicorn.conf.py zqb_website.wsgi
