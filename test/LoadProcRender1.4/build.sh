# Remember to set up the environment before invoking this build. 
# source emsdk_set_env.sh 

emcc --bind -I ../../../vcglib/ open.cpp ../../../vcglib/wrap/ply/plylib.cpp -s TOTAL_MEMORY=268435456 -s EXPORTED_FUNCTIONS="['_getFileName','_openMesh','_getVertexNumber','_getVertexVector','_getFaceNumber','_getFaceVector']" -o open.js
