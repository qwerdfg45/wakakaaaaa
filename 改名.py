import os

folder = r"./"

for root, dirs, files in os.walk(folder):
    for file in files:
        if "TexCoord" in file:
            old_path = os.path.join(root, file)

            new_file = file.replace("TexCoord", "Texcoord")
            new_path = os.path.join(root, new_file)

            os.rename(old_path, new_path)
            print(f"{file} -> {new_file}")