# Author: SilentNightSound#7430
# Modified: Process all Texcoord.buf files

import os
import argparse

def get_stride(ini_content, texcoord_file):
    try:
        section = ini_content.split(texcoord_file)[0]
        stride = int(
            section.split("\n")[-2]
            .split("=")[1]
            .strip()
        )
        return stride
    except Exception:
        return None

def main():

    parser = argparse.ArgumentParser(description="Set outline thickness")
    parser.add_argument(
        "--thickness",
        type=int,
        default=0,
        help="Thickness of outline (0 - no outline, 255 - maximum outline)"
    )
    args = parser.parse_args()

    args.thickness = max(0, min(255, args.thickness))

    texcoord_files = [
        x for x in os.listdir(".")
        if x.endswith("Texcoord.buf")
    ]

    if len(texcoord_files) == 0:
        print("ERROR: No Texcoord.buf files found.")
        return

    ini_files = [x for x in os.listdir(".") if x.endswith(".ini")]

    if len(ini_files) == 0:
        print("ERROR: No ini file found.")
        return

    if len(ini_files) > 1:
        print(f"WARNING: Multiple ini files found: {ini_files}")
        print(f"Using: {ini_files[0]}")

    ini_file = ini_files[0]

    with open(ini_file, "r", encoding="utf-8", errors="ignore") as f:
        ini_content = f.read()

    print(f"INI: {ini_file}")
    print(f"Outline thickness: {args.thickness}")
    print()

    processed = 0

    for texcoord_file in texcoord_files:

        stride = get_stride(ini_content, texcoord_file)

        if stride is None:
            print(f"[SKIP] Unable to determine stride for {texcoord_file}")
            continue

        print(f"[PROCESS] {texcoord_file}")
        print(f"Stride = {stride}")

        with open(texcoord_file, "rb+") as f:
            data = bytearray(f.read())

            for i in range(0, len(data), stride):
                if i + 3 < len(data):
                    data[i + 3] = args.thickness

            f.seek(0)
            f.write(data)
            f.truncate()

        processed += 1

    print()
    print(f"Completed. Modified {processed} Texcoord files.")

if __name__ == "__main__":
    main()