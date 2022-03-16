function BuildForWindows($platform, $build_type) {
    $build_dir = "build"
    mkdir $build_dir -Force -ErrorAction Stop | Out-Null
    cd $build_dir
    ls

    if ($platform -eq "x64") {
        $msbuild_platform = "x64"
    }
    else {
        $msbuild_platform = "Win32"
    }


    cmake -G "Visual Studio 16 2019" `
    -A $msbuild_platform `
    -D CMAKE_BUILD_TYPE=${build_type} `
    -D CMAKE_INSTALL_PREFIX=install ../zlib

    msbuild INSTALL.vcxproj /t:build /p:configuration=$build_type /p:platform=$msbuild_platform -maxcpucount
    ls
    cd ..
}