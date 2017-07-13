# Sudoku-Solver-via-Ruby-Command-Line
Sudoku Solver - via Ruby Command Line

Ruby version 2.4.0

My previous sudoku solver made use of both iteration and recursion. Hence, this is a fun project intended to convert recursion to full iteration. Also was curious how fast could a solver solve a given sudoku. 

With this in mind, I set out converting my previous code into a full iteration solver. 

In the end though, the code got pretty messy. In hindsight, there were alot of premature optimization. I realised that there was no need to optimize every single line of code or every single loop. A computer could easily loop through a loop 1,000 or 10,000 times quite quickly. A simple sudoku board, which is just 81 cells, can be solved by a computer in under a second, no matter how inefficient the code is.
