import argparse, os, hashlib
from pathlib import Path
import yaml
from config import BIGFILE_GALLERY_DIRECTORY_PATH, BIGFILE_EXTENSIONS


def converge(file):
    hashes = set()
    paths = []
    
    for extension in BIGFILE_EXTENSIONS:
        for bigfile_path in Path(BIGFILE_GALLERY_DIRECTORY_PATH).rglob(f"*.{extension}"):
            with open(bigfile_path, "rb") as f:
                buffer = f.read()
                sha256 = hashlib.sha256()
                sha256.update(buffer)
                sha256_value = sha256.hexdigest()
                if sha256_value not in hashes:
                    paths.append(str(bigfile_path.absolute()))
                    hashes.add(sha256_value)
    
    with open(file, "w") as f:
        yaml.dump(paths, f)


def main():
    parser = argparse.ArgumentParser(
        prog="BigFile Converge",
        description="Copy all unique BigFile paths to a file",
    )
    parser.add_argument("file", help="File to copy BigFile paths to")
    args = parser.parse_args()
    converge(args.file)


if __name__ == "__main__":
    main()
