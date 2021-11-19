#!/bin/bash
cd revision
pandoc README.md -o revision.pdf
pandoc README.md -o revision.docx
cd ..

