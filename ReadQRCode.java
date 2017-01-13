package com.imooc.zxing;

import com.google.zxing.*;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;

/**
 * Created by yangshuangpeng on 17-1-13.
 */
public class ReadQRCode {
    public static void main(String[] args)
    {
        MultiFormatReader formatReader = new MultiFormatReader();
        File file = new File("zxing.png");
        BufferedImage image = null;
        try {
            image = ImageIO.read(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image)));
        HashMap hints = new HashMap();
        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
        try {
            Result result = formatReader.decode(binaryBitmap, hints);
            System.out.println(result.toString());
            System.out.println(result.getBarcodeFormat());
            System.out.println(result.getText());
        } catch (NotFoundException e) {
            e.printStackTrace();
        }
    }
}
