import sys, os

def get_files(input_dir: str = "") -> str:
    files = os.listdir(input_dir)
    print(files)


def main():
    folder = sys.argv
    print(folder)
