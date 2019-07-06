#include<iostream>
#include<bits/stdc++.h>
#include<Eigen/Dense>
#include<Eigen/SVD>
#include<fstream>
#include<opencv2/opencv.hpp>
#include<cmath>



std::vector<Eigen::Matrix<double, 4, 2>> get_video_points(std::string filename, int no_frames)
{
	std::ifstream myfile(filename);

	std::vector<Eigen::Matrix<double, 4, 2>> video_pts(no_frames);

	if(myfile.is_open())
	{
		std::string line;
		int line_no = 0;
		while(std::getline(myfile, line))
		{
			std::stringstream linestream(line);
			std::string val;
			int i=0;
			while(std::getline(linestream, val, ','))
			{
				video_pts[i](line_no, 0) = stod(val);
				std::getline(linestream, val, ',');
				video_pts[i](line_no, 1) = stod(val);
				i+=1;
			}

			line_no+=1;
		}

	}

	return video_pts;
} 

Eigen::Matrix<double, 3, 3> get_homography(Eigen::Matrix<double, 4, 2> video_pts, Eigen::Matrix<double, 4, 2> logo_pts)
{
	Eigen::Matrix<double, 8, 9> A;
	
	for(int i=0; i<4; i++)
	{
		Eigen::Matrix<double, 9, 1> ax;
		Eigen::Matrix<double, 9, 1> ay;

		ax << video_pts(i,0), video_pts(i,1), 1., 0., 0., 0., -1*video_pts(i,0)*logo_pts(i,0), -1*video_pts(i,1)*logo_pts(i,0), -1*logo_pts(i,0);
		ay << 0., 0., 0., -1*video_pts(i,0), -1*video_pts(i,1), -1, video_pts(i,0)*logo_pts(i,1), video_pts(i,1)*logo_pts(i,1), logo_pts(i,1);

		A.row(2*i) = ax;
		A.row(2*i+1) = ay;

	}



	Eigen::JacobiSVD<Eigen::Matrix<double, 8, 9>> svd(A, Eigen::ComputeFullU | Eigen::ComputeFullV);

	Eigen::Matrix<double, 9, 9> V = svd.matrixV();
	Eigen::Matrix<double, 9, 1> h = V.col(8);

	Eigen::Matrix<double, 3, 3> homography;
	homography << h(0,0), h(1,0), h(2,0),
				  h(3,0), h(4,0), h(5,0),
				  h(6,0), h(7,0), h(8,0);

	return homography;

}


std::vector<std::vector<int>> get_points_inside_poly(const Eigen::Matrix<double, Eigen::Dynamic, 2> &poly, 
															 const std::vector<std::vector<int>>& X,
															 const std::vector<std::vector<int>>& Y,
															 int image_rows, int image_cols
															)
{

	std::vector<std::vector<int>> points;

	for(int cur_row=0; cur_row < image_rows; cur_row++)
	{
		for(int cur_col=0; cur_col < image_cols; cur_col++)
		{

			double x = (double)X[cur_row][cur_col];
			double y = (double)Y[cur_row][cur_col];

			// If we never cross any lines we're inside.
		    bool inside = false;

		    // Loop through all the edges.
		    for (int i = 0; i < poly.rows(); ++i)
		    {
		        // i is the index of the first vertex, j is the next one.
		        int j = (i + 1) % poly.rows();

		        // The vertices of the edge we are checking.
		        double xp0 = poly(i, 0);
		        double yp0 = poly(i, 1);
		        double xp1 = poly(j, 0);
		        double yp1 = poly(j, 1);

		        // Check whether the edge intersects a line from (-inf,y) to (x,y).

		        // First check if the line crosses the horizontal line at y in either direction.
		        if ((yp0 <= y) && (yp1 > y) || (yp1 <= y) && (yp0 > y))
		        {
		            // If so, get the point where it crosses that line. This is a simple solution
		            // to a linear equation. Note that we can't get a division by zero here -
		            // if yp1 == yp0 then the above if be false.
		            double cross = (xp1 - xp0) * (y - yp0) / (yp1 - yp0) + xp0;

		            // Finally check if it crosses to the left of our test point. You could equally
		            // do right and it should give the same result.
		            if (cross < x)
		                inside = !inside;
		        }
		    }

		    if(inside)
		    {
		    	std::vector<int> point{(int)ceil(x), (int)ceil(y)};
		    	points.push_back(point);
		    }
		}

	}
    

    return points;
}


std::vector<std::vector<int>> get_image_interior_points(Eigen::Matrix<double, 4, 2> video_pts, cv::Size video_img_size)
{
	//Getting a meshgrid
	std::vector<std::vector<int>> X;
	std::vector<std::vector<int>> Y;

	std::vector<int> v1;
	for(int i=0; i<video_img_size.width; i++)
	{
		v1.push_back(i);
		
	}


	for(int i=0; i<video_img_size.height; i++)
	{
		std::vector<int> v(video_img_size.width);
		std::fill(v.begin(), v.end(), i);
		
		X.push_back(v);
		Y.push_back(v1);
	}
	


	
	std::vector<std::vector<int>> int_points = get_points_inside_poly(video_pts, X, Y, video_img_size.height, video_img_size.width);

	return int_points;
}


std::vector<Eigen::Matrix<int, 1, 2>> wrap_points(Eigen::Matrix<double, 3, 3> homography, std::vector<std::vector<int>> &int_points,
													 int no_points)
{

	std::vector<Eigen::Matrix<int, 1, 2>> logo_points;
	for(int i=0; i<no_points; i++)
	{
		Eigen::Matrix<double, 3, 1> point;
		point << (double)int_points[i][0], (double)int_points[i][1], 1.0;

		Eigen::Matrix<double, 3, 1> un_normalized_logo_point = homography*point;

		Eigen::Matrix<int, 1, 2> normalized_logo_point;
		normalized_logo_point << ceil(un_normalized_logo_point(0, 0)/un_normalized_logo_point(2,0)),ceil(un_normalized_logo_point(1,0)/un_normalized_logo_point(2,0));

		logo_points.push_back(normalized_logo_point);
	}

	return logo_points;
}


cv::Mat inverse_wrapping(cv::Mat video_image, cv::Mat logo_image, std::vector<Eigen::Matrix<int,1,2>> mapped_logo_points, 
						std::vector<std::vector<int>> interior_points_video)
{
	cv::Mat projected_image = video_image;
	for(int i=0; i<mapped_logo_points.size(); i++)
	{
		cv::Vec3b pixel_logo = logo_image.at<cv::Vec3b>(cv::Point(mapped_logo_points[i](0,0), mapped_logo_points[i](0,1)));
		cv::Vec3b pixel_video = video_image.at<cv::Vec3b>(cv::Point(interior_points_video[i][0], interior_points_video[i][1]));

		cv::Vec3b pixel_proj = projected_image.at<cv::Vec3b>(cv::Point(interior_points_video[i][0], interior_points_video[i][1]));

		pixel_proj.val[0] = pixel_logo.val[0]*.7 + pixel_video.val[0]*0.3;
		pixel_proj.val[1] = pixel_logo.val[1]*.7 + pixel_video.val[1]*0.3;
		pixel_proj.val[2] = pixel_logo.val[2]*.7 + pixel_video.val[1]*0.3;

		projected_image.at<cv::Vec3b>(cv::Point(interior_points_video[i][0], interior_points_video[i][1])) = pixel_proj;
	}
	
	return projected_image;
}

void display_image(cv::Mat image)
{

	cv::namedWindow( "Display window", cv::WINDOW_AUTOSIZE );// Create a window for display.
	cv::imshow( "Display window", image ); 

	cv::waitKey(0);

}
int main()
{
	//load logo image and calculate the logo points
	std::string logo_image_file("../images/logos/gt-logo-gold.png");
	cv::Mat logo_image;
	logo_image = cv::imread(logo_image_file.c_str(), cv::IMREAD_COLOR);

	cv::Size logo_size = logo_image.size();
	Eigen::Matrix<double, 4, 2> logo_pts;
	logo_pts << 0, 0,
			    logo_size.width, 0,
				logo_size.width, logo_size.height,
				0, logo_size.height;



	//Getting file names of images of the video
	char buffer[100];
	std::vector<std::string> image_file_names;
	for(int i=1; i<=129; i++)
	{
		sprintf(buffer, "../images/barcaReal/BarcaReal%03d.jpg", i);
		std::string cur_image_path = buffer;
		image_file_names.push_back(cur_image_path);
	}
	int count = image_file_names.size();
	

	std::cout << count << std::endl;
	// reding the data for video points
	std::string filename = "../data/video_pts.csv";
	std::vector<Eigen::Matrix<double, 4, 2>> video_pts = get_video_points(filename, count);
	
	for(int i=0; i<count; i++)
	{

		//calculating the homography
		Eigen::Matrix<double, 3, 3> homography = get_homography(video_pts[i],logo_pts);

		//Reading the image
		cv::Mat video_image = cv::imread(image_file_names[i], cv::IMREAD_COLOR);

		//Get interior points within the given points for the image
		std::vector<std::vector<int>> int_points = get_image_interior_points(video_pts[i], video_image.size());

		//Wrapping the interior points using homography to get correspoinding logo points
		std::vector<Eigen::Matrix<int, 1, 2>> mapped_logo_points = wrap_points(homography, int_points, int_points.size());
		
		//Inverse wrap to get the projected image
		cv::Mat projected_image = inverse_wrapping(video_image, logo_image, mapped_logo_points, int_points);

		// display_image(projected_image);                                          // Wait for a keystroke in the window
		char buffer[100];
		sprintf(buffer, "../images/wrapped_images/gt_image%03d.jpg", i);
		std::string write_file_name = buffer;
		cv::imwrite(write_file_name, projected_image);

	}
	
	return 0;
}