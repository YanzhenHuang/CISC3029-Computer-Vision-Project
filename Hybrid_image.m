% Hybrid Images
% By: Huang Yanzhen, DC126732, Chen Zirui, DC127901
close all;

% Params:
% size: Sizes of filter mask. Larger size, more blur;
% sigma: Sample variances of filter mask. Larger sigma, more details.
% degree: Degrees of filtering, i.e. number of iterations. More iterations,
% more information loss.

%% Example 1: True or False?
paths1 = ["test_hybrid/true_or_false/True.png", "test_hybrid/true_or_false/False.png"];
size1 = [31,13];    % Low, High
sigma1 = [29,13];
degree1 = [1,2];
HybridImage(paths1,size1,sigma1,degree1,"true_or_false");

%% Example 2: Skinny or Fat?
paths2 = ["test_hybrid/skinny_or_fat/Skinny.png", "test_hybrid/skinny_or_fat/Fat.png"];
size2 = [15,9];
sigma2 = [15,15];
degree2 = [4,1];
HybridImage(paths2,size2,sigma2,degree2,"skinny_or_fat");

%% Examle 3: CD or Phonogragh?
paths3 = ["test_hybrid/cd_or_phono/Phono.png", "test_hybrid/cd_or_phono/CD.png"];
size3 = [35,495];
sigma3 = [35,35];
degree3 = [4,1];
HybridImage(paths3,size3,sigma3, degree3,"cd_or_phono");



function HybridImage(paths,filter_size,filter_sigma,degree,file_name)

    % Resolve Parameters
    l_path = paths(1);
    h_path = paths(2);

    filter_size_low = filter_size(1);       % Mask sizes
    filter_size_high = filter_size(2);

    filter_sigma_low = filter_sigma(1);     % Mask sample variances
    filter_sigma_high = filter_sigma(2);

    low_deg = degree(1);                    % Mask degrees: num. of iterations
    high_deg = degree(2);    

    % Read two input images to be filtered
    low_freq_img = imread(l_path); % low frequency image
    high_freq_img = imread(h_path); % high frequency image

    
    
    % Convert to Grayscale
    low_freq_gray = rgb2gray(low_freq_img);
    high_freq_gray = rgb2gray(high_freq_img);
    
    % Low freq image filter
    %filter_size = 35; % filter size
    %filter_sigma = 35; % filter sample variance (larger, smoother)
    low_freq_filtered = imgaussfilt(low_freq_gray, filter_sigma_low, 'FilterSize', filter_size_low);
    for l = 1:low_deg
        low_freq_filtered = imgaussfilt(low_freq_filtered, filter_sigma_low, 'FilterSize', filter_size_low);
    end


    % High freq image filter
    high_freq_filtered = high_freq_gray - imgaussfilt(high_freq_gray, filter_sigma_high, 'FilterSize', filter_size_high);
    for l = 1:high_deg
        high_freq_filtered = high_freq_filtered - imgaussfilt(high_freq_filtered, filter_sigma_high, 'FilterSize', filter_size_high);
    end

    % Merge them together
    hybrid_image = low_freq_filtered + high_freq_filtered;
    
    % Show result
    figure;
    subplot(2, 3, 1); imshow(low_freq_img); title('Low Freq');
    subplot(2, 3, 2); imshow(high_freq_img); title('High Freq');
    subplot(2, 3, 3); imshow(low_freq_filtered); title('Low Freq Filtered');
    subplot(2, 3, 4); imshow(high_freq_filtered); title('High Freq Filtered');
    subplot(2, 3, 5); imshow(hybrid_image, []); title('Hybrid Image');

    % Save
    fig_name = "result_hybrid/" + file_name + ".png";
    saveas(gcf,fig_name, 'png');

end