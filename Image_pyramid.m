% Image Pyramid: Gaussian Pyramid and Laplacian Pyramid
% By: Huang Yanzhen, DC126732, Chen Zirui, DC127901

% Load the input image
image = imread('test_pyramid/smiley.png');
image = rgb2gray(image);

% Specify the number of pyramid levels
levels = 5;

% Specify the sample steps of gaussian filter. 
% Larger steps, image goes blur faster.
sample_steps = 2;

% Specify the pyamid steps.
% Larger steps, pyramid goes smaller faster.
pyramid_steps = 2;

% Build the Gaussian pyramid
gaussian_pyramid = GaussianPyramid(image, levels, sample_steps, pyramid_steps);
laplasian_pyramid = LaplacianPyramid(image, levels, sample_steps, pyramid_steps);

% Display the pyramid images
figure;
for i = 1:levels
    subplot(1, levels, i);
    imshow(gaussian_pyramid{i});
    title(['Level ', num2str(i)]);
end

saveas(gcf, 'result_pyramid/gaussian.png', 'png');


figure;
for i = 1:levels
    subplot(1, levels, i);
    imshow(laplasian_pyramid{i});
    title(['Level ', num2str(i)]);
end

saveas(gcf, 'result_pyramid/laplasian.png', 'png');


function pyramid = GaussianPyramid(image,levels,sample_steps,pyramid_steps)
    % Initialize the pyramid cell array
    pyramid = cell(levels, 1);
    
    % Add the original image at the highest level
    pyramid{1} = image;
    
    % Build the remaining levels
    for i = 2:levels
        % Downsample the image using Gaussian filter
        filteredImage = imgaussfilt(pyramid{i-1}, sample_steps);
        downsampledImage = filteredImage(1:pyramid_steps:end, 1:pyramid_steps:end);
        
        % Store the downsampled image in the pyramid
        pyramid{i} = downsampledImage;
    end
end

function pyramid = LaplacianPyramid(image, levels, sample_steps, pyramid_steps)
    % Initialize the pyramid cell array
    pyramid = cell(levels, 1);
    
    % Array of Gaussian pyramid
    gaussianPyramid = GaussianPyramid(image, levels, sample_steps, pyramid_steps);
    
    % Assign the highest level of the Laplacian pyramid
    pyramid{levels} = gaussianPyramid{levels};
    
    % Reconstruct the remaining levels of the Laplacian pyramid
    for i = levels-1:-1:1
        % Upsample the next level Gaussian image
        upsampledImage = imresize(gaussianPyramid{i+1}, size(gaussianPyramid{i}), 'nearest');
        
        % Calculate the difference between the upsampled image and the current level Gaussian image
        pyramid{i} = gaussianPyramid{i} - upsampledImage;
    end
end