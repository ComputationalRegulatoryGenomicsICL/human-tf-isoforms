# nextflow-example
A minimal Nextflow project compatible with nf-core

Run this example pipeline with:

```
nextflow run main.nf -profile docker
```

To install additional modules, use the [nf-core tools](https://github.com/nf-core/tools), for example:

```
nf-core modules install star/align
```

To create your own module, also use the [nf-core tools](https://github.com/nf-core/tools):

```
nf-core modules create
```

It will ask you for the module name and other parameters.
