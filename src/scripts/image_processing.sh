export LAMBDA_ROLE=""
# Zip file before uploading
zip --junk-paths /tmp/image_processing.zip src/lambdas/image_processing.py

# Create Lambda function
aws lambda create-function \
    --function-name image-processing \
    --runtime python3.12 \
    --role ${LAMBDA_ROLE} \
    --handler image_processing.lambda_handler \
    --zip-file fileb:///tmp/image_processing.zip

# Update Lambda function
aws lambda update-function-code \
   --function-name image-processing \
   --zip-file fileb:///tmp/image_processing.zip
