using Plots

plot(1:10, seriestype = :path, label = "Series 1")

plot!(rand(1:10,10), seriestype = :scatter, label = "Series 2")