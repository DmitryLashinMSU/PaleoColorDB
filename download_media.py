import os
import gdown
import zipfile

FILE_ID = '16btYr1bv0-ZNAn47-5iBESweTR1LCv77'
URL = f'https://drive.google.com/uc?id={FILE_ID}'
OUTPUT_ZIP = 'media_archive.zip'
TARGET_DIR = 'app/static/media_archive'

def main():
    print("Загрузка архива...")
    gdown.download(URL, OUTPUT_ZIP, quiet=False)
    
    print(f"Распаковка в {TARGET_DIR}...")
    os.makedirs(TARGET_DIR, exist_ok=True)
    with zipfile.ZipFile(OUTPUT_ZIP, 'r') as zip_ref:
        zip_ref.extractall(TARGET_DIR)
        
    print("Удаление временного архива...")
    os.remove(OUTPUT_ZIP)
    print("Загрузка завершена!")

if __name__ == '__main__':
    main()