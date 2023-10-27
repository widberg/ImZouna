import argparse

def cps(input, output):
    with open(input, "rb") as f:
        data = bytearray(f.read())
    
    if data[0] != 0x4F:
        seed = 0x4F
        for i in range(len(data)):
            data[i] ^= seed
            seed =  (seed + 37) & 0xFF
    
    with open(output, "wb") as f:
        f.write(data)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input", help="input file")
    parser.add_argument("output", help="output file")
    args = parser.parse_args()
    cps(args.input, args.output)

if __name__ == "__main__":
    main()
