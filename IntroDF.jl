# Some DataFrame Practice based off Julia for DS Intros:
# https://www.juliafordatascience.com/first-steps-4-dataframes/

using DataFrames, RDatasets, Statistics, StatsPlots

df = dataset("ggplot2", "diamonds")

# Columns can be referenced by "string" or :symbol
df[:, :Cut]
# or
df[:, "Cut"]

# df.col_name or df[!, :col_name] will extract the exact data from a df
# any changes are saved to the original frame unlike in pandas where overwrite needs to be said
df[!, :Cut]

# Can select a subset as well
df[:, ["Cut", "Color"]]

# Filtering a subset of rows
# The syntax x -> do something with x is an anonymous function (sometimes called lambda expression). 
# The filter function will apply a function to each row and return back a DataFrame for the rows that returned true.
filter(row -> row.Carat > 1, df)
# Or similarly
df[df.Carat .>1, :]

# Group By and Combine Aggregators
df_cut = groupby(df, "Cut")

combine(df_cut, "Price"=>mean)

# Plot
# Notes
# The @ allows for replacing symbols with associated df columns
# Have to convert to Cut to string because for speed Julia stores the data as a 'CategoricalArray'
# the ! after the boxplot indicates that it wants to append on top of the previous Plot
@df df violin(string.(:Cut), :Price, lab="")
@df df boxplot!(string.(:Cut), :Price, alpha=0.25, lab="")