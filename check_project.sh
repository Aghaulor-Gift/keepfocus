#!/bin/bash

echo "Checking your project..."

# Required files
test -f index.html && echo "PASS: index.html exists" || echo "FAIL: index.html missing"
test -f style.css && echo "PASS: style.css exists" || echo "FAIL: style.css missing"

# CSS linked
grep -q 'style.css' index.html && echo "PASS: style.css linked" || echo "FAIL: style.css not linked"

# Semantic tags
grep -Eiq '<header|<nav|<main|<section|<footer' index.html \
&& echo "PASS: semantic HTML tags found" \
|| echo "FAIL: semantic HTML tags missing"

# Required sections
grep -Eiq 'class="hero"|id="hero"' index.html \
&& echo "PASS: Hero section found" \
|| echo "FAIL: Hero section missing"

grep -Eiq 'class="features"|id="features"' index.html \
&& echo "PASS: Features section found" \
|| echo "FAIL: Features section missing"

grep -Eiq 'class="cta"|id="cta"' index.html \
&& echo "PASS: CTA section found" \
|| echo "FAIL: CTA section missing"

grep -Eiq '<footer' index.html \
&& echo "PASS: Footer found" \
|| echo "FAIL: Footer missing"

# Layout
grep -Eiq 'display:[[:space:]]*flex|display:[[:space:]]*grid' style.css \
&& echo "PASS: Flexbox/Grid used" \
|| echo "FAIL: No Flexbox/Grid found"

# Responsive
grep -Eiq '@media' style.css \
&& echo "PASS: Responsive media query found" \
|| echo "FAIL: No media query found"

echo "Check complete."