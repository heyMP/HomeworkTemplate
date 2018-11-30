if VERSION >= v"0.7-"
   using Pkg
end

function install_required_packages()
  lines = readlines("REQUIRE")
  lines_no_comments = strip.(map(l->split(l,"#")[1],lines))
  package_list = map(l->split(l," ")[1],lines_no_comments)
  package_list = package_list[.!(isempty.(package_list))]
  #println("Packages to install: ",package_list)

  num_packages_installed = 0
  for p in package_list
    if !haskey(Pkg.installed(),string(p))
      println("Installing package: ",p)
      try 
         Pkg.add(string(p))
         num_packaged_installed += 1
      catch
         @warn ("# Failed to install package " * p)
      end
    end
  end
  println("# Installed ", num_packages_installed, " pacakges.")
end

install_required_packages()

