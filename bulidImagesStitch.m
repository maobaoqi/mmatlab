% load images
buildingDir = fullfile(toolboxdir('vision'), 'visiondata', 'building');
buildingScene = imageDatastore(buildingDir);

% display images to be stitched
montage(buildingScene.Files);