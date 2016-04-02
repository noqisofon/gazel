

debug-build:
	if [[ ! -d ./target/debug/ ]]; then mkdir -p ./target/debug/ ; fi
	crystal build ./bin/gazel.cr -o ./target/debug/gazel

release-build:
	if [[ ! -d ./release/debug/ ]]; then mkdir -p ./target/release/ ; fi
	crystal build ./bin/gazel.cr -o ./target/release/gazel
