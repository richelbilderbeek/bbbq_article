#!/bin/bash
zip bbbq_article_all.zip $(find . | egrep -v "\.zip$" | egrep -v "\.git" | egrep -v "downloads")
