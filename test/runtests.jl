using Glob
if split(pwd(),'/')[end]!="test"
  try 
     cd("test")
  catch
     @error("Could not find test directory from " * pwd() )
  end 
end

test_files = glob("test*.jl")
println("test_files=",test_files)
for f in test_files
    println("# Including test file ",f,"...")  
    include(f)  
end

