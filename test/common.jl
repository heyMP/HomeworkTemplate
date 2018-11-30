import Pkg
using Test
if haskey(Pkg.installed(),"NBInclude")
   nbinclude_is_installed = true
   using NBInclude
else
   nbinclude_is_installed = false
   macro nbinclude(name)
         return :( @warn("NBInclude not installed, not parsing " * $name * "."); false )
   end  
end

function parse_responce_file(id::Integer; prefix::String = "resp", path::String = "..")
  nb_filename = string(joinpath(path,prefix * string(id) * ".ipynb"))
  jl_filename = string(joinpath(path,prefix * string(id) * ".jl"))
  if nbinclude_is_installed && isfile(nb_filename)
     println("# Parsing ",nb_filename, "..." )
     return @nbinclude(nb_filename) 
  elseif isfile(jl_filename)
     println("# Parsing ", jl_filename, "..." )
     return include(jl_filename)
  else
     println("# Can not parse either ", nb_filename, " or ", jl_filename )
     return false
  end
end

