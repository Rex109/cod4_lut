# Call of Duty 4 - LUT PostProcess Shader

A Call of Duty 4 shader used to apply LUT tables onto a player's view
A LUT (or Lookup Table) is a technique to map a table of colors and match them on an image (or in this case a 3D Enviroment)

This is an example of how a lookup table influences the colors (top is the original LUT, bottom is the modified):

![Preview](https://i.imgur.com/xIzuJDT.jpeg)

#Creating a LUT

To create a lut you need a default LUT strip (256x16), you can find it online or you can use this one:

![LUT](https://i.imgur.com/irhbUGC.png)

- Take a screenshot in game and open it up on photoshop, overlay the LUT somewhere in the screenshot (be careful to not resize it!).
- Modify the image as you please, keep in mind that this will be what you will see ingame.
- Once done, remove all of the image so you have only the processed LUT.
- Export it as TGA so the image will not compress

#Compiling the shader

To compile the shader you will need the xoxor's shader compiler wich you can get by [clicking here](https://xoxor4d.github.io/projects/cod4-compileTools/).
Without xoxor this wouldn't be possible, go and check out his site by [clicking here](https://xoxor4d.github.io).

#Creating the material

Once the shader is correctly compiled hop on the asset manager and create a material.

Those are the settings you MUST use to make a working LUT PostProcess:

- Material type: Custom
- Surface type: <none>
- Template: shadergen_2d_single_image
- String: lut_postprocess
- Colormap: <Pick your TGA here>
  - Tiling: No tile
  - Filter: nomip nearest
  - Compression: Uncompressed

#Importing and applying the effect

You need to import your material in your map's csv or in your mod's csv.
The next thing to do is to precache the shader in your main script using: preCacheShader("<material name>");

Finally to apply the shader you need to create a fullscreen clienthud item witht the material applied.
If you want it to apply fastly you can use the provided gsc to apply it using:

self postprocess::applyPostProcess(shader);

and to remove it using:

postprocess::removePostProcess();
