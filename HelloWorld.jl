#INTRO TO Julia - exploring Julia using some beginner guides to get a feel for it

# https://www.juliafordatascience.com/quickstart/
# https://www.juliafordatascience.com/first-steps-3-primer-on-plots/

mymessage = "Hello World"
println(mymessage)

using Plots

plot(randn(10), title="My First Plot")

plot(1:10, seriestype = :path, label = "Series 1")

plot!(rand(1:10,10), seriestype = :scatter, label = "Series 2")

# create 10 x 2 array
x = randn(10, 2)
println(x)
# Series 1 --> :scatter & :line
# Series 2 --> :scatter & :line
p1 = plot(x, st=[:scatter, :line])  

# Series 1 --> :scatter
# Series 2 --> :line
p2 = plot(x, st=[:scatter :line]) 

plot(p1, p2)

using RDatasets, OnlineStats

df = dataset("ggplot2", "diamonds")

o = CountMap(String)

fit!(o, string.(df.Cut))

plot(o, title="Woah")

# A vector
x = [1, 11, 12, 99]

# To turn a range into a vector:
y = collect(1:4)
println(y)

# Range with step size
z = 1:2:100 # start at 1, next step +2, until 100
println(z)

# Matrix
x = [1 11 ; 12 99]

# Indexing is 1-based (NOT 0) which I'm sure upsets some people
x = randn(50,2)
x[3,2] # Row 3 col 2
# Arrays are column major so
x[3,2] == x[53]

# STRINGS
# Perhaps weirdest part of Julia " and ' aren't the same
# For full STRINGS
mystring = "This is my string"
# For a character
mychar = 'c'
# For Concat
hw = "Hello" * " " * "World"
println(hw)
# Printing a string variable
println("This is my string: $mystring")

# Multiple Dispatch
# Specific types in functions can have a large impact
f(x::Int) = 1
f(x::Float64) = 2

println("f(an integer)", f(1))
println("f(a float)",f(1.0))

# Macros
# Functions of expressions using the @

