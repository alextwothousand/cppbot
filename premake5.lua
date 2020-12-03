workspace "cppbot"
	configurations { "Release" }
	location "build"

project "ixwebsocket"
	kind "StaticLib"
	language "C++"

	cppdialect "C++17"
	files {
		"lib/IXWebSocket/ixbots/**.cpp",
		"lib/IXWebSocket/ixbots/**.h",
		"lib/IXWebSocket/ixcobra/**.cpp",
		"lib/IXWebSocket/ixcobra/**.h",
		"lib/IXWebSocket/ixcore/**.cpp",
		"lib/IXWebSocket/ixcore/**.h",
		"lib/IXWebSocket/ixcrypto/**.cpp",
		"lib/IXWebSocket/ixcrypto/**.h",
		"lib/IXWebSocket/ixredis/**.cpp",
		"lib/IXWebSocket/ixredis/**.h",
		"lib/IXWebSocket/ixsentry/**.cpp",
		"lib/IXWebSocket/ixsentry/**.h",
		"lib/IXWebSocket/ixsnake/**.cpp",
		"lib/IXWebSocket/ixsnake/**.h",
		"lib/IXWebSocket/ixwebsocket/**.cpp",
		"lib/IXWebSocket/ixwebsocket/**.h"
	}

	includedirs { 
		"lib/IXWebSocket",
		"lib/IXWebSocket/ixcrypto",
		"lib/IXWebSocket/ixcobra",
		"lib/IXWebSocket/ixcore",
		"lib/IXWebSocket/ixreader",
		"lib/IXWebSocket/ixredis",
		"lib/IXWebSocket/ixsentry",
		"lib/IXWebSocket/ixsnake",
		"lib/IXWebSocket/ixbots",
		"lib/IXWebSocket/third_party"
	}

project "discpp"
	kind "StaticLib"
	language "C++"

	cppdialect "C++17"
	files { "lib/discpp/src/**.cpp", "lib/discpp/include/**.h" }

	includedirs { "lib/rapidjson/include", "lib/cpr/include", "lib/discpp/include/discpp", "lib/IXWebSocket" }
	links { "ixwebsocket" }

project "cppbot"
    kind "ConsoleApp"
	language "C++"

	cppdialect "C++17"
    files { "src/**.hpp", "src/**.cpp" }

	links { "discpp" }

    filter { "configurations:Release" }
        defines { "NDEBUG" }
        optimize "On"