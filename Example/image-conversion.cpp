#include "opencv2/highgui.hpp"
#include "opencv2/highgui/highgui_c.h"

int main( int argc, char** argv ) {
    IplImage* img = cvLoadImage( argv[1]);

    cvSaveImage( argv[2] , img);
    cvReleaseImage( &img );
    return 0;
}
