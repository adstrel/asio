project "asio"
    kind "None"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    files
    {
        "asio/include/**.hpp",
    }
    
    includedirs
    {
        "asio/include"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        defines 
        {
        }
        optimize "Off"
        symbols "On"

    filter "configurations:Release"
        runtime "Debug"
        defines 
        {
        }
        optimize "Speed"
        vectorextensions "AVX2"
        symbols "On"
        flags
        {
            "LinkTimeOptimization"
        }

    filter "configurations:Dist"
        runtime "Release"
        defines 
        {
        }
        optimize "Speed"
        vectorextensions "AVX2"
        symbols "Off"
        flags
        {
            "LinkTimeOptimization",
            "FatalWarnings"
        }
