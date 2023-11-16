from pathlib import Path


IMZOUNA_DIR = Path(__file__).parent.parent.absolute()

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
    "BFPS2",
]

EXTENSION_TO_ENDIAN = {
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
    "BFPS2": "<",
}
