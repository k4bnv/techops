from PIL import Image
import os

files = ["logo.png", "logo-icon.png", "logo-email.png", "favicon-32.png"]

for file in files:
    if os.path.exists(file):
        print(f"Processing {file}")
        try:
            img = Image.open(file).convert("RGBA")
            datas = img.getdata()
            
            # Get the color of the top-left pixel (assumed background)
            bg_color = datas[0]
            print(f"Background color is: {bg_color}")
            
            new_data = []
            for item in datas:
                # change all pixels that match the background color to transparent
                # Using a small tolerance just in case
                if (abs(item[0] - bg_color[0]) < 10 and 
                    abs(item[1] - bg_color[1]) < 10 and 
                    abs(item[2] - bg_color[2]) < 10):
                    new_data.append((255, 255, 255, 0)) # transparent
                else:
                    new_data.append(item)
                    
            img.putdata(new_data)
            
            # crop to bounding box to remove excess transparent space
            bbox = img.getbbox()
            if bbox:
                img = img.crop(bbox)
                
            img.save(file, "PNG")
            print(f"Successfully saved {file}")
        except Exception as e:
            print(f"Error processing {file}: {e}")

print("Done")
