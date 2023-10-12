import argparse, shutil
from pathlib import Path

BIGFILE_GALLERY_DIRECTORY_PATH = Path(__file__).parent.parent / "bigfiles"

BIGFILE_EXTENSIONS = [
    "DPC",
    "DMC",
    "DBM",
    "DPS",
    "DP3",
    "DPP",
    "DXB",
    "D36",
    "DGC",
    "DRV",
    "DUA",
    "DNX",
    "DBC",
    "DBR",
    "BFPC",
    "BFWii",
]

def get_jpg_file_path(bigfile_path):
    return bigfile_path.with_suffix(".JPG")


def get_iwr_file_path(bigfile_path):
    return bigfile_path.with_suffix(".IWR")


def get_name_file_path(bigfile_path):
    return bigfile_path.with_suffix(".N" + bigfile_path.suffix[2:])


def get_layout_file_path(bigfile_path):
    return bigfile_path.with_suffix(bigfile_path.suffix + ".LAYOUT")


def get_new_layout_file_path(bigfile_path):
    return bigfile_path.with_suffix(".L" + bigfile_path.suffix[2:])


GET_ASSOCIATED_FILE_PATHS = [
    get_jpg_file_path,
    get_iwr_file_path,
    get_name_file_path,
    get_layout_file_path,
    get_new_layout_file_path,
]


def read_bigfile_version_string(bigfile_path):
    with open(bigfile_path, "rb") as f:
        version_string_buffer = f.read(256)
        return version_string_buffer.decode("ascii", errors="ignore").strip("\0")


def read_bigfile_version_number_normalized(bigfile_path):
    bigfile_version_string = read_bigfile_version_string(bigfile_path)
    if  bigfile_version_string.endswith(" - Asobo Studio - Internal Cross Technology"):
        return bigfile_version_string.split(" ", maxsplit=1)[0].replace(".", "_")
    if  bigfile_version_string.startswith(("TotemTech Data", "Bigfile Data")):
        return bigfile_version_string.split(" ", maxsplit=3)[2].replace(".", "_")
    if  bigfile_version_string.startswith("Opal"):
        return "v" + bigfile_version_string.split(" ", maxsplit=2)[1].replace(".", "_")
    for char in ["(", ")", "[", "]", "{", "}", ":", ";", ",", ".", "'", '"', " "]:
        bigfile_version_string = bigfile_version_string.replace(char, "_")
    return bigfile_version_string


def submit_associated_files(
    bigfile_path,
    bigfile_directory_path_in_gallery,
    bigfile_gallery_directory_path,
):
    for get_associated_file_path in GET_ASSOCIATED_FILE_PATHS:
        associated_file_path = get_associated_file_path(bigfile_path)
        if associated_file_path.exists():
            associated_file_path_in_gallery = (
                bigfile_directory_path_in_gallery / associated_file_path.name
            )
            shutil.copy2(
                associated_file_path,
                associated_file_path_in_gallery,
                follow_symlinks=True,
            )
            print(
                f"{associated_file_path_in_gallery.relative_to(bigfile_gallery_directory_path)}"
            )


def submit(game_directory, game_name, release_name, bigfile_gallery_directory_path):
    for extension in BIGFILE_EXTENSIONS:
        for bigfile_path in Path(game_directory).rglob(f"*.{extension}"):
            bigfile_version_number_normalized = read_bigfile_version_number_normalized(
                bigfile_path
            )
            bigfile_directory_path_in_gallery = (
                bigfile_gallery_directory_path
                / game_name
                / release_name
                / bigfile_version_number_normalized
                / bigfile_path.relative_to(game_directory)
            ).parent
            bigfile_path_in_gallery = (
                bigfile_directory_path_in_gallery / bigfile_path.name
            )
            bigfile_directory_path_in_gallery.mkdir(parents=True, exist_ok=True)
            shutil.copy2(bigfile_path, bigfile_path_in_gallery, follow_symlinks=True)
            print(
                f"{bigfile_path_in_gallery.relative_to(bigfile_gallery_directory_path)}"
            )
            submit_associated_files(
                bigfile_path,
                bigfile_directory_path_in_gallery,
                bigfile_gallery_directory_path,
            )


def main():
    parser = argparse.ArgumentParser(
        prog="BigFile Submit", description="Submit a bigfile to the gallery"
    )
    parser.add_argument("game_directory", help="The root game directory")
    parser.add_argument("game_name", help="The name to use for the game")
    parser.add_argument("release_name", help="The name to use for the release")
    parser.add_argument(
        "--bigfiles",
        help="The path to the bigfiles directory",
        required=False,
        default=BIGFILE_GALLERY_DIRECTORY_PATH,
    )
    args = parser.parse_args()
    submit(args.game_directory, args.game_name, args.release_name, args.bigfiles)


if __name__ == "__main__":
    main()
