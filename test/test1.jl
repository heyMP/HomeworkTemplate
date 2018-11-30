include("common.jl")
parse_responce_file(1)

@testset "Testing solution to Exercise 1" begin

@testset "Testing identify_function_int" begin
   @test hasmethod(identity_function_int,(Int64,))
   @test hasmethod(identity_function_int,(Int32,))
   @test identity_function_int(1) == 1
   @test identity_function_int(10) == 10
   @test identity_function_int(1) != 2
   @test !hasmethod(identity_function_int,(Float64,))
end;

@testset "Testing identify_function_float64" begin
   @test hasmethod(identity_function_float64,(Float64,))
   @test identity_function_float64(1.0) == 1.0
   @test identity_function_float64(10.0) == 10.0
   @test identity_function_float64(1.0) != 2.0
   @test !hasmethod(identity_function_float64,(Int64,))
   @test !hasmethod(identity_function_float64,(Float32,))
end;

@testset "Testing identify_function_real" begin
   @test hasmethod(identity_function_real,(Int64,))
   @test hasmethod(identity_function_real,(Int32,))
   @test hasmethod(identity_function_real,(Float64,))
   @test hasmethod(identity_function_real,(Float32,))
   @test identity_function_real(1) == 1
   @test identity_function_real(10) == 10
   @test identity_function_real(1.0) == 1.0
   @test identity_function_real(10.0) == 10.0
   @test !hasmethod(identity_function_real,(ComplexF64,))
   @test !hasmethod(identity_function_real,(Float64,Float64,))
end;

end; # Exercise 1

