%% Define all the obstacles areawise
%plot circle 
xcentre=180;
ycentre = 120;
t = 0:0.01:2*pi;
x = 15*cos(t)+ xcentre;
y = 15*sin(t) + ycentre;
drawnow
plot(x,y), hold on
fill(x,y,'r');

%%plot two polygons 
xp1 = [ 55,105,105,55,55];
yp1 = [ 67.5,67.5,112.5,112.5,67.5] ;
drawnow
plot(xp1,yp1);
fill(xp1,yp1,'b');

xp2 = [145,168,188,165,158,120,145];
yp2 = [14,14,51,89,51,55,14];
drawnow
plot(xp2,yp2);
fill(xp2,yp2,'r');

xp3 = [0 ,250, 250, 0 ,0];
yp3 = [0 ,0, 150 ,150 ,0];
drawnow
plot(xp3,yp3);
alpha(0.3);
% hold off

%% Define Goal and Target points 

% start_node = [xg,yg];
% target_node = [xt,yt];
start_node =[54,68];
drawnow
plot(start_node(1),start_node(2),'--gs',...
    'LineWidth',2,...
    'MarkerSize',20,...
    'MarkerEdgeColor','b');
target_node =[106,120];
drawnow
plot(target_node(1),target_node(2),'--gs',...
    'LineWidth',2,...
    'MarkerSize',20,...
    'MarkerEdgeColor','g' );
%% Check if points are inside obstacles 

[inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(start_node);
if inside_obstacle || onobstacle_boundary
     say = 'Starting point is not in Free workspace';
     disp(say)
     return
end

[inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(target_node);
if inside_obstacle || onobstacle_boundary
    
     say = 'Target point is not in workspace, cannot be reached' ;
     disp(say)
     return
     
end

%% Intializing nodes

Node = [];%saves unique nodes, visited nodes 
NodeInfo = [];% NodeInfor = [N,ParentNodeNumber,costtocome];
CurrentNode= start_node;
Node(:,:,1) = CurrentNode; 
CurrentNodenumber=size(CurrentNode,3);
ParentNodeNumber =1 ;
costtocome= 0;
N = 1; % Number of visited Nodes
CurrentNode = Node(:,:,ParentNodeNumber);

%% Functions for moving in 8 directions and adding unvisited nodes to Node
while ~isequal(CurrentNode,target_node)
    
NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];

%% For Right
[NewNode,status] = moveright(CurrentNode);
    if (status == 1) 
        [inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(NewNode);
            if ~(inside_obstacle || onobstacle_boundary)
                
                if ~(any(all(bsxfun(@eq,Node,NewNode))))
                    N=N+1; 
                    Node(:,:,N)=NewNode;
                    NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];
                end
            end
    end
    
    %% For Up Right
[NewNode,status] = moveupright(CurrentNode);
    if (status == 1) 
        [inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(NewNode);
            if ~(inside_obstacle || onobstacle_boundary)
                
                if ~(any(all(bsxfun(@eq,Node,NewNode))))
                    N=N+1; 
                    Node(:,:,N)=NewNode;
                    NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];
                end
            end
    end
    
        %% For Up
[NewNode,status] = moveup(CurrentNode);
    if (status == 1) 
        [inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(NewNode);
            if ~(inside_obstacle || onobstacle_boundary)
                
                if ~(any(all(bsxfun(@eq,Node,NewNode))))
                    N=N+1; 
                    Node(:,:,N)=NewNode;
                    NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];
                end
            end
    end
        
         %% For Up Left
[NewNode,status] = moveupleft(CurrentNode);
    if (status == 1) 
        [inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(NewNode);
            if ~(inside_obstacle || onobstacle_boundary)
                
                if ~(any(all(bsxfun(@eq,Node,NewNode))))
                    N=N+1; 
                    Node(:,:,N)=NewNode;
                    NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];
                end
            end
    end

 %% For left
[NewNode,status] = moveleft(CurrentNode);
    if (status == 1) 
        [inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(NewNode);
            if ~(inside_obstacle || onobstacle_boundary)
                
                if ~(any(all(bsxfun(@eq,Node,NewNode))))
                    N=N+1; 
                    Node(:,:,N)=NewNode;
                    NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];
                end
            end
    end
    
     %% For Down Left 
[NewNode,status] = movedownleft(CurrentNode);
    if (status == 1) 
        [inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(NewNode);
            if ~(inside_obstacle || onobstacle_boundary)
                
                if ~(any(all(bsxfun(@eq,Node,NewNode))))
                    N=N+1; 
                    Node(:,:,N)=NewNode;
                    NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];
                end
            end
    end

     %% For down
[NewNode,status] = movedown(CurrentNode);
    if (status == 1) 
        [inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(NewNode);
            if ~(inside_obstacle || onobstacle_boundary)
                
                if ~(any(all(bsxfun(@eq,Node,NewNode))))
                    N=N+1; 
                    Node(:,:,N)=NewNode;
                    NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];
                end
            end
    end
    
     %% For DownRight
[NewNode,status] = movedownright(CurrentNode);
    if (status == 1) 
        [inside_obstacle, onworkspace_boundry,onobstacle_boundary] = obstacle_check(NewNode);
            if ~(inside_obstacle || onobstacle_boundary)
                
                if ~(any(all(bsxfun(@eq,Node,NewNode))))
                    N=N+1; 
                    Node(:,:,N)=NewNode;
                    NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];
                end
            end
    end
    
%     currentx = Node(1,1,ParentNodeNumber);
%     currenty = Node(1,2,ParentNodeNumber);
%     drawnow
%     plot(currentx,currenty,'*');
    ParentNodeNumber = ParentNodeNumber+1;
    CurrentNode = Node(:,:,ParentNodeNumber);
    
    
    
end
i =2;path(:,:,1) = CurrentNode;
Number = ParentNodeNumber
 while  ~isequal(CurrentNode,start_node)
    
%      Node(:,:,N)=NewNode;
%      NodeInfo(:,:,N) = [N,ParentNodeNumber,costtocome];
     P = NodeInfo(1,2,Number);
     path(:,:,i) = Node(:,:,P);
     Number = NodeInfo(1,2,P);
     
 end
 
 
 Pathx = path(1,1,:);
 Pathy = path(1,2,:);
 Plot(Pathx,Pathy);
 hold off