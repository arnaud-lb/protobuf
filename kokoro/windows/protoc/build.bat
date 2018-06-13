set PATH=C:\Program Files (x86)\MSBuild\14.0\bin\;%PATH%
set generator=Visual Studio 14 Win64
set vcplatform=x64
set configuration=Release
set BUILD_DLL=ON
set UNICODE=ON

echo Building protoc
cd github\protobuf
mkdir build_msvc
cd build_msvc
cmake -G "%generator%" -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_SHARED_LIBS=%BUILD_DLL% -Dprotobuf_UNICODE=%UNICODE% ../cmake
msbuild protobuf.sln /p:Platform=%vcplatform% || goto error
cd %configuration%
goto :EOF

:error
echo Failed!
exit /b %ERRORLEVEL%
