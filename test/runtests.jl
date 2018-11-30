include("common.jl")

using Glob
test_files = glob("test*.jl")
foreach(include,test_files)

