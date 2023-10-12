import argparse, os, hashlib, csv, struct
from pathlib import Path


BIGFILE_GALLERY_DIRECTORY_PATH = Path(__file__).parent.parent / "bigfiles"

extension_to_endian = {
    "DPC": "<",
    "DUA": "<",
    "DMC": "<",
    "DBM": ">",
    "DPS": "<",
    "DP3": ">",
    "DPP": "<",
    "DXB": ">",
    "D36": ">",
    "DGC": ">",
    "DRV": ">",
    "DNX": "<",
    "DBC": "<",
    "DBR": ">",
    "BFPC": "<",
    "BFWii": ">",
}

def catalogue():
    hashes = {}
    versions = set()
    version_triples = {}
    for root, dirs, files in os.walk(BIGFILE_GALLERY_DIRECTORY_PATH):
        if (
            Path(root) == BIGFILE_GALLERY_DIRECTORY_PATH
            or BIGFILE_GALLERY_DIRECTORY_PATH / "Rubbish" in Path(root).parents
        ):
            continue
        for file in files:
            bigfile_path = Path(os.path.join(root, file))
            with open(bigfile_path, "rb") as f:
                buffer = f.read()
                sha256 = hashlib.sha256()
                sha256.update(buffer)
                sha256_value = sha256.hexdigest()
                bigfile_path_relative = bigfile_path.relative_to(
                    BIGFILE_GALLERY_DIRECTORY_PATH
                )
                versions.add(bigfile_path_relative.parts[2])
                hashes[bigfile_path_relative] = sha256_value
                if bigfile_path_relative.suffix[1:] in extension_to_endian:
                    f.seek(0x00000114)
                    endian = extension_to_endian[bigfile_path_relative.suffix[1:]]
                    x, y, z = struct.unpack(endian + "III", f.read(12))
                    version_triple = (x, y, z)
                    if bigfile_path_relative.parts[2] not in version_triples:
                        version_triples[bigfile_path_relative.parts[2]] = set()
                    version_triples[bigfile_path_relative.parts[2]].add(version_triple)
                
    with open("bigfile_hashes.csv", "w", newline="") as f:
        writer = csv.writer(f, dialect="excel")
        writer.writerow(["path", "sha256"])
        for key, value in sorted(hashes.items()):
            writer.writerow([key, value])
    print(f"Number of unique BigFiles: {len(set(hashes.values()))}")
    print(f"Number of unique versions: {len(versions)}")
    print("\n".join(sorted(versions)))
    print("\n".join(map(str, sorted(version_triples.items()))))


def main():
    parser = argparse.ArgumentParser(
        prog="BigFile Catalogue", description="Update the CSV with known BigFiles"
    )
    args = parser.parse_args()
    catalogue()


if __name__ == "__main__":
    main()
