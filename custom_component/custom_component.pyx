# cython: infer_types=True, embedsignature=True, profile=True, binding=True
from spacy.pipeline.pipe cimport Pipe
from spacy.tokens.doc cimport Doc

from typing import Callable
from spacy.language import Language


@Language.factory(
    "custom_component",
    assigns=[],
    default_config={},
    default_score_weights={},
)
def make_custom_component(
        nlp: Language,
        name: str,
    ) -> Callable[[Language], "CustomComponent"]:
    return CustomComponent(name)


cdef class CustomComponent(Pipe):
    def __init__(self, name):
        self.name = name

    def __call__(self, Doc doc):
        for j in range(doc.length):
            doc.c[j].lemma = doc.c[j].lex.lower
        return doc
