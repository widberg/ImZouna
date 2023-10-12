import argparse, os, hashlib
from pathlib import Path
import shutil


BIGFILE_GALLERY_DIRECTORY_PATH = Path(__file__).parent.parent / "bigfiles"


def converge(directory):
    hashes = set()
    for root, dirs, files in os.walk(BIGFILE_GALLERY_DIRECTORY_PATH):
        if (
            Path(root) == BIGFILE_GALLERY_DIRECTORY_PATH
            or BIGFILE_GALLERY_DIRECTORY_PATH / "Rubbish" in Path(root).parents
        ):
            continue
        for file in files:
            bigfile_path = Path(os.path.join(root, file))
            if bigfile_path.suffix[1].upper() == "D":
                with open(bigfile_path, "rb") as f:
                    buffer = f.read()
                    sha256 = hashlib.sha256()
                    sha256.update(buffer)
                    sha256_value = sha256.hexdigest()
                    if sha256_value not in hashes:
                        bigfile_path_in_directory = Path(
                            directory
                        ) / bigfile_path.relative_to(BIGFILE_GALLERY_DIRECTORY_PATH)
                        bigfile_path_in_directory.parent.mkdir(
                            parents=True, exist_ok=True
                        )
                        shutil.copy2(bigfile_path, bigfile_path_in_directory)
                        hashes.add(sha256_value)


def main():
    parser = argparse.ArgumentParser(
        prog="BigFile Converge",
        description="Copy all unique BigFiles to a single directory",
    )
    parser.add_argument("directory", help="Directory to copy BigFiles to")
    args = parser.parse_args()
    converge(args.directory)


if __name__ == "__main__":
    main()
