if VERSION >= v"0.7-"
   using Pkg
end

function install_required_packages()
  # Add my version of this first to prevent registered version from being installed

  if !haskey(Pkg.installed(),"NBInclude")
     Pkg.add(PackageSpec(url="https://github.com/eford/NBInclude.jl.git", rev="testing-travis"))
  end

  lines = readlines("REQUIRE")
  lines_no_comments = strip.(map(l->split(l,"#")[1],lines))
  package_list = map(l->split(l," ")[1],lines_no_comments)
  package_list = package_list[.!(isempty.(package_list))]
  #println("Packages to install: ",package_list)

  num_packages_installed = 0
  for p in package_list
    occursin("NBInclude",string(p)) && continue
    if !haskey(Pkg.installed(),string(p))
      println("Installing package: ",p)
      try 
         Pkg.add(string(p))
         num_packaged_installed += 1
      catch
         #@warn ("# Failed to install package " * p)
      end
    end
  end
  println("# Installed ", num_packages_installed, " pacakges.")
  Pkg.resolve()
  println("# Resolved any problems.")
end

install_required_packages()

