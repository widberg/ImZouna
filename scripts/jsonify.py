import argparse
from pathlib import Path
import subprocess
import os

ImFUELdir = Path(__file__).parent.parent.absolute()


def main():
    global imhex_path
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--binary", help="Name of file to JSONify", type=str, required=True
    )
    parser.add_argument(
        "--json", help="Name of output JSON file", type=str, required=True
    )
    parser.add_argument(
        "--imhex", help="Path to ImHex executable", type=str, default="imhex"
    )
    args = parser.parse_args()
    imhex_path = args.imhex
    binary_path = Path(args.binary)
    json_path = Path(args.json)
    process = subprocess.Popen(
        [
            imhex_path,
            "--pl",
            "format",
            "-v",
            "-I",
            ImFUELdir / "includes",
            "-i",
            binary_path.absolute(),
            "-o",
            json_path.absolute(),
            "-p",
            ImFUELdir / f"patterns/fuel/{os.path.splitext(binary_path)[1][1:]}.hexpat",
        ],
        stderr=subprocess.PIPE,
        stdout=subprocess.PIPE,
    )
    stdout, stderr = process.communicate()
    exit_code = process.wait()
    if exit_code != 0:
        print(binary_path.absolute(), stdout, stderr, exit_code)


if __name__ == "__main__":
    try:
        main()
    except (KeyboardInterrupt, SystemExit):
        os._exit(0)
