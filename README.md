# ECS Fargate PV 1.4 SYS_PTRACE Demo

Based on https://github.com/kris-nova/falco-trace

1. Task Definition Name: `ecs-ptrace-falcoserver`
2. Image: `registry.hub.docker.com/paavanmistry/ecs-ptrace-falcoserver:latest`
3. Add json
```
 "linuxParameters": {
                "capabilities": {
                    "add": [
                        "SYS_PTRACE"
                    ],
                    "drop": null
                }
	},
```
4. Run `curl ifconfig.me`
5. Connect and run `touch /usr/bin/1`, `cat /etc/shadow`, and `touch /etc/backdoor`
