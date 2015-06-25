---
title: MyHDL GSoC Update
tags: gsoc
layout: post
---
MyHDL has two major components -- core and conversion.
The core allows users to model and simulate concurrent, event driven systems(such as digital hardware) in Python.
A subset of MyHDL models can be converted to Verilog or VHDL.

Over the last couple of weeks, I've been working on improving MyHDL's test suite.
The core tests were written using unittest, and we used py.test as the test runner.
However, MyHDL's core relies on a few hacks such as global variables.
This did not play well with pytest and prevented us from automating boring test activities with tox.
Additionally, one core test relied on the behaviour of the garbage collector and could not be run with PyPy.
I've converted all the core tests to pytest, and PyPy can run our entire testsuite again.
Now, we can also use tox and pytest-xdist to rapidly verify that tests pass in all the platforms we support.

The conversion tests are a little trickier.
MyHDL uses external simulators such as iVerilog, GHDL and Modelsim to verify the correctness of converted designs.
The test suite currently uses global variables to pick the simulator, and the suite must be repeated for each simulator.
This is cumbersome and inefficient because MyHDL's conversion and simulation modules are re-run for every simulator.
I'm currently working on using a combination of auto detection and  pytest custom CLI options to simplify the process of testing against multiple simulators.
Furthermore, The test suite generates a number of converted Verilog/VHDL files and intermediate simulation results which are used for validation.
These files are clobbered every time the tests are run. 
This makes it harder to compare the conversion results of different branches or commits.
I've implemented a proof of concept using pytest's tmpfile fixture to isolate the results of each run.
Along the same lines, I've uploaded a [small utility](https://github.com/jck/myhdl-issues) which uses tox to help analyze the conversion results of different versions of MyHDL and Python.
I've also made a few minor improvements to the conversion test suite: A bug fix for Modelsim 10.4b, and support for the [nvc](https://github.com/nickg/nvc) VHDL simulator.


Finally, I've been exploring ways to reduce the redundancy in MyHDL's core decorators and conversion machinery.
After I finish improving the conversion tests, I will send a PR upstream and begin working on improving the robustness of Verilog/VHDL conversion.
