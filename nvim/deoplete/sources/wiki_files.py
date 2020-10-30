import os
from pathlib import Path

from deoplete.base.source import Base

class Source(Base):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.name = "wiki_files"
        self.mark = "[KB]"
        self.min_pattern_length = 0
        self.rank = 500
        self.filetypes = ["markdown"]

    def get_complete_position(self, context):
        # trigger completion if we"re currently in the [[link]] syntax
        pos = context["input"].rfind("[[")
        return pos if pos < 0 else pos + 2

    def gather_candidates(self, context):
        NOTES_DIR = os.path.join(Path.home(), "kb")
        contents = []
        for file_name in filter(
            lambda x: x.endswith(".md"),
            sorted(os.listdir(NOTES_DIR))
        ):
            base_file_name = file_name[:-3]
            contents.append({
                "word": base_file_name + "]]",
                "abbr": base_file_name
            })

        return contents

