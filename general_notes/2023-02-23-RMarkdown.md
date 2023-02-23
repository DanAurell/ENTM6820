---
title: "RMarkdown notes"
author: "Dan Aurell"
date: "2023-02-23"
output:   
  html_document: 
    keep_md: yes
---

## YAML headers
Say we want to save a .Md file (the in between RMd and HTML)
- Then we edit the output up top
- Because we want to push the .Md file up to GitHub

can also have output: github_document

Can include "word_document: default" but it wasn't outputting a Word doc for me


Make a plot

```r
plot(x=cars$dist, y=cars$speed)
```

![](2023-02-23-RMarkdown_files/figure-html/unnamed-chunk-1-1.png)<!-- -->


*italics* or _italics_

**bold**

> emphasized
emphasized

> We hold these thruths to be
> self-evident

> emphasized

> emphasized


```r
x = 2
```


This calls r code inline, for example three times x equals 6.

#### Unordered lists
* one item
* two
* three
  * one more

#### Ordered lists
  
  
1. The first item
2. Second
    * Second subitem
    - Subitem


[This is a hyperlink](https://github.com)

https://github.com