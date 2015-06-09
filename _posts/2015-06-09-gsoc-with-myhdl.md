---
title: GSOC 2015 with MyHDL
tags: gsoc
layout: post
---

[MyHDL](www.myhdl.org) is a Python library for hardware description and verification.
The goal of the MyHDL project is to empower hardware designers with the elegance and simplicity of Python.
Designers can use the full power of Python and elegantly model and simulate hardware.
Additionally, MyHDL designs which satisfy certain restrictions can be converted to Verilog or VHDL.
This feature can be used to integrate MyHDL designs with conventional EDA flows.

I started exploring alternative hardware description languages while working on a research project which involved designing an FPGA based network intrusion detection system (NIDS).
During the initial stages of the project, we were using System Verilog for designing hardware and writing tests.
However, seemingly simple tasks such as generating network packets for testing felt cumbersome. 
On the other hand, Python is a concise and dynamic language, and a great choice for creating quick prototypes.
I decided to try MyHDL because I was already comfortable with Python.
MyHDL greatly simplified the process of generating test data and validating results since I was able to use existing python modules in simulation code.
MyHDL also enabled me to rapidly iterate on both the hardware and software components of the NIDS.

Over the course of the project, I got involved in MyHDL's development and started contributing code.
Most notably, I implemented interface conversion support and helped make MyHDL compatible with Python 3. 
This summer, I have the opportunity to spend a considerable amount of time working on MyHDL since my proposal to the Python Software Foundation has been accepted for Google Summer of Code 2015!

My agenda for the first few weeks is to clean up the code base and the test suite before I focus on the business logic.
MyHDL was first released in 2003. Over the years, it has gathered lots of duplicated and dead code.
I think that refactoring the code will make it easier for me and other contributors to extend MyHDL's functionality.

After the initial refactoring, I'm going to simplify the core modules.
MyHDL relies heavily on parsing the abstract syntax tree (AST) of various code objects.
AST parsing code is hard to debug, and sometimes causes incomprehensible errors.
I plan to explore various ways to reduce MyHDL's reliance on AST parsing.
My eventual goal is to increase the robustness of MyHDL's conversion modules and improve MyHDL's maintainability.

I'm currently working on squashing interface conversion bugs and finishing documentation for a stable release before I start making big changes to the code.

I'll be writing periodically with status updates and technical details.
Thanks for reading!
