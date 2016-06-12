cr_math.bundle: cr_math.cr
	crystal cr_math.cr --release --link-flags "-dynamic -bundle -Wl,-undefined,dynamic_lookup" -o cr_math.bundle

clean:
	rm -f cr_math.bundle