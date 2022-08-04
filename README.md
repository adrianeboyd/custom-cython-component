# A minimal custom Cython spaCy pipeline component

This package demonstrates how to create a registered custom component in
Cython for use with spaCy v3.

## Install

```bash
pip install -U pip setuptools wheel
pip install .
```

Or from the repo URL:

```bash
pip install -U pip setuptools wheel
pip install https://github.com/adrianeboyd/custom-cython-component/archive/master.zip
```

## Usage

Once this package is installed, the custom component is registered under the
entry point `spacy_factories`, so you can add it to your pipeline config with:

```bash
spacy init config -p custom_component config.cfg
```

Or in python:

```python
import spacy

nlp = spacy.blank("en")
nlp.add_pipe("custom_component")
```

For demo purposes, the custom component assigns the lowercase form of each
token as its lemma.

## Packaging a pipeline

If your packaged spaCy pipeline requires this package, specify it in
`meta.json` under `requirements` before calling [`spacy
package`](https://spacy.io/api/cli#package):

```json
  "requirements":[
    "custom-component>=0.0.1,<0.1.0"
  ]
```
