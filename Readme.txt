1. Run "BFS_ALGO_SOURCE_CODE.m" File
2. All other files(with extension of .m) are functions needed to run the source code
3. Program will ask input from user for target and goal points/nodes. 
4. Please allow 4-5 mins to run the code and give output of optimum path.
5. We can also check the nodeinfoset and Node output in "BFS_output.mat" file
6. Attached the image output of Start = (0,0) and target = (250,150).

                                       
                                       / \
  				      /   \
                                     /t2   \
			_________   /_______\       
			\	  /        /
			 \   t1  /  q1    /
			  \     /        /
			   \   /        / 
			    \ /________/
	Splitted the given non convex program like shown above,
	3 convex polygons are defined and half plane conceptis used
	for finding if point is inside polygons or outside.