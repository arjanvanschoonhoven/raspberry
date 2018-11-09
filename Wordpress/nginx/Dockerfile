#GET the base default nginx image from docker hub
FROM arm32v7/nginx
 
#Delete the Existing default.conf
RUN rm /etc/nginx/conf.d/default.conf 
 
#Copy the custom default.conf to the nginx configuration
COPY default.conf /etc/nginx/conf.d

COPY nginx.conf /etc/nginx