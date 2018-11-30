if VERSION >= v"0.7-"
   using Pkg
end

function install_required_packages()
  lines = readlines("../REQUIRE")
  lines_no_comments = strip.(map(l->split(l,"#")[1],lines))
  package_list = map(l->split(l," ")[1],lines_no_comments)
  package_list = package_list[.!(isempty.(package_list))]
  #println("Packages to install: ",package_list)

  for p in package_list
    println("Installing package: ",p)
    Pkg.add(p)
  end
end

install_required_packages()

