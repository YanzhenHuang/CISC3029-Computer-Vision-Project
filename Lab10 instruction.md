# Lab 10: **OpenCV**



## Objectives

​	Configure the OpenCV environment successfully on the computer.

​	Image processing using C++ and OpenCV functions.

​	A preliminary understanding of mex and mexopencv.



## Procedures

### Configure the OpenCV environment

​	If you need to use OpenCV for development on your own computer, it is highly recommended to use Microsoft Visual Studio (or other IDE) + Cmake to configure the environment.

​	Download link: https://opencv.org/releases/	

​	

​	The following tutorial uses Dev-C++ and MinGW-w64 compilers, which means that the source code needs to be recompiled, so the compiled files on Github are used. Relevant files will be uploaded to UMMoodle.

​	Link: https://github.com/huihut/OpenCV-MinGW-Build/tree/OpenCV-4.5.5-x64

​	Find "Compiler Options" and change the configuration based on the address of the OpenCV file.

<img src="https://raw.githubusercontent.com/12mango/tuchuang/master/img/202311251917919.png" alt="image-20231125191704770" style="zoom: 33%;" />

​	-lopencv_core455 -lopencv_highgui455 -lopencv_imgcodecs455 -lopencv_imgproc455 -lopencv_videoio455

<img src="https://raw.githubusercontent.com/12mango/tuchuang/master/img/202311251918266.png" alt="image-20231125191809223" style="zoom:33%;" />

<img src="https://raw.githubusercontent.com/12mango/tuchuang/master/img/202311251918635.png" alt="image-20231125191827600" style="zoom:33%;" />

<img src="https://raw.githubusercontent.com/12mango/tuchuang/master/img/202311251919789.png" alt="image-20231125191937757" style="zoom:33%;" />



### Writing C++ code using OpenCV functions

​	From the official documentation of OpenCV, we can see that there are many modules with different functions. Next, try to display the image.

​	link: https://docs.opencv.org/4.8.0/

​	We use **`imread()`** to load images from files, **`imshow()`** to display images, and **`waitKey(0)`** to keep the window stuck.

​	If the environment is configured correctly, the image can be displayed.



```c++
#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/highgui.hpp>
//#include<opencv2/opencv.hpp>

int main(){

	cv::Mat img=cv::imread("Lenna.jpg");
	cv::imshow("Example1",img);
	cv::waitKey(0);

	return 0;
}
```



<img src="https://raw.githubusercontent.com/12mango/tuchuang/master/img/202311261032427.png" alt="image-20231126103229099" style="zoom: 33%;" />



### Mex and mexopencv



​	If you want to have the beautiful visualization results of matlab and the operating efficiency of C++ at the same time, you can consider mex and mexopencv. Code written in C++ can be easily called by matlab. Interested students can learn more about it and write it after class.



Relevant information:

https://ww2.mathworks.cn/discovery/matlab-opencv.html

https://ww2.mathworks.cn/videos/using-opencv-with-matlab-97710.html



![image-20231126174106387](https://raw.githubusercontent.com/12mango/tuchuang/master/img/202311261742805.png)



<img src="https://raw.githubusercontent.com/12mango/tuchuang/master/img/202311261751469.png" alt="image-20231126175125364" style="zoom:50%;" />



## Exercise

​	Following the official example, the Canny operator is used to detect the edge of the video image.	

​	link: https://docs.opencv.org/4.x/d1/dfb/intro.html

​	It should be noted that the video source in the example is a camera and can be changed to the file name of the video file.

```matlab
cv::VideoCapture cap("../baby.mp4");
```



<img src="https://raw.githubusercontent.com/12mango/tuchuang/master/img/202311261742458.png" alt="image-20231126113515918" style="zoom:50%;" />

