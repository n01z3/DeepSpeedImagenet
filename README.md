docker:
```
make build
make run-dl0
make exec

```

run:
```
cd /DeepSpeedImagenet
deepspeed src/cifar10.py --deepspeed --deepspeed_config configs/imagenet_config.json
```

bench results on resnet50@224, 2x 1080ti

speed:
- pytroch-lightning = 395 samples/sec
- nvidia-apex = 448 samples/sec
- DeepSpeed = 398 samples/sec

memory:
- pytroch-lightning = 7632 MB per GPU
- nvidia-apex = 7650 MB per GPU
- DeepSpeed = 6930 MB per GPU