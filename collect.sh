#!/bin/bash

git log --format='%an <%ae>%n%cn <%ce>' | sort | uniq
