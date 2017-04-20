function [b_s b_h]= simulator1(lambda,p,invmiu,S, W, Ms, Mh, R, N)
	%lambda = movies request rate (in requests/hour)
	%p = percentage of requests for high-definition movies (in %)
	%invmiu= average duration of movies (in minutes)
	%S = number of servers (each server with a capacity of 100 Mbps)
	%W = resource reservation for high-definition movies (in Mbps)
	%Ms = throughput of movies in standard definition (2 Mbps)
	%Mh = throughput of movies in high definition (5 Mbps)
	%R = number of movie requests to stop simulation
	%N = movie request number to start updating the statistical counters

	invlambda=60/lambda; %average time between requests (in minutes)
	
	%Events definition:
	ARRIVAL= 0; %movie request
	DEPARTURE= 1; 	%termination of a movie transmission
	
	%State variables initialization:
	STATE= 0;
	
	%Statistical counters initialization:
	LOAD= 0;
	NARRIVALS= 0;
	BLOCKED= 0;
	
	%Simulation Clock and initial List of Events:
	Clock= 0;
	EventList= [ARRIVAL exprnd(invlambda)];
	
	while NARRIVALS < R
		event= EventList(1,1);
		Previous_Clock= Clock;
		Clock= EventList(1,2);
		EventList(1,:)= [];

		LOAD= LOAD + STATE*(Clock-Previous_Clock);
		
		if event == ARRIVAL
			EventList= [EventList; ARRIVAL Clock+exprnd(invlambda)];
			NARRIVALS= NARRIVALS+1;
			if STATE + M <= C
				STATE= STATE+M;
				EventList= [EventList; DEPARTURE Clock+exprnd(invmiu)];
			else
				BLOCKED= BLOCKED+1;
			end
		else
			STATE= STATE-M;
		end
		EventList= sortrows(EventList,2);
	end
	
	b= BLOCKED/NARRIVALS;
	o= LOAD/Clock;

end