import argparse
from pathlib import Path

import yaml
from config import BIGFILE_EXTENSIONS, BIGFILE_GALLERY_DIRECTORY_PATH
from submit import read_bigfile_version_string


def versions(file):
    version_strings = set()

    for extension in BIGFILE_EXTENSIONS:
        for bigfile_path in Path(BIGFILE_GALLERY_DIRECTORY_PATH).rglob(f"*.{extension}"):
            version_strings.add(read_bigfile_version_string(bigfile_path))

    with open(file, "w") as f:
        yaml.safe_dump(sorted(version_strings), f)


def main():
    parser = argparse.ArgumentParser(
        prog="BigFile Versions",
        description="Copy all unique BigFile version strings to a file",
    )
    parser.add_argument("file", help="File to copy BigFile version strings to")
    args = parser.parse_args()
    versions(args.file)


if __name__ == "__main__":
    main()
