using Test
using NBInclude

function parse_responce_file(id::Integer; prefix::String = "resp", path::String = "..")
  nb_filename = joinpath(path,prefix * string(id) * ".ipynb")
  jl_filename = joinpath(path,prefix * string(id) * ".jl")
  if isfile(nb_filename)
     println("# Parsing " * nb_filename )
     return @nbinclude(nb_filename)
  elseif isfile(jl_filename)
     println("# Parsing " * jl_filename )
     return include(jl_filename)
  else
     println("# Can not parse either ", nb_filename, " or ", jl_filename )
     return false
  end
end

