---
title: MyHDL GSoC Update
tags: gsoc
layout: post
---

After a long winding road, MyHDL v0.9.0 has been released with [many new features!](http://docs.myhdl.org/en/stable/whatsnew/0.9.html)
Since the release, I've been focusing on major, potentially breaking changes to MyHDL's core for v1.0
I've submitted a [PR]( https://github.com/jandecaluwe/myhdl/pull/113) which lays the groundwork for streamlined AST parsing by centralizing AST accesses and reusing ast.NodeVisitor s across the core decorators.
While this PR is being revieiwed, I'm carefully examining MyHDL's conversion modules in order to centralize symbol table access.
I have also been working on improving MyHDL's conversion tests using pytest fixtures to enable isolation and parallelization.
