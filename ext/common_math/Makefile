install: common_math.cr
	crystal common_math.cr --release --link-flags "-dynamic -bundle -Wl,-undefined,dynamic_lookup" -o common_math.bundle

clean:
	rm -f common_math.bundle
