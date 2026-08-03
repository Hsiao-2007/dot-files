return {
	init_options = {
		clang = {
			excludeArgs = { "-frounding-math" },
			extraArgs = { "--gcc-toolchain=/usr" },
		},
	}
}
