# `devcon-wm` - Graphical Development Container
A graphical development container that can be accessed via remote desktop (RDP).

Basically an extension of [devcon-core](https://github.com/alanmquach/devcon-core/) that adds:
* `i3`
* `tigervnc`
* `xrdp`
* `terminator`
* VS Code
* Google Chrome

## Usage
```
docker run -d \
	-p XXXXX:22 \
	-p 60000-60010:60000-60010/udp \
	alanmquach/devcon-wm:latest \
	/tmp/bootstrap.sh "developer" "public_key"
```
Launching this container
