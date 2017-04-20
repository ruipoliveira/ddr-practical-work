function [b_s b_h]= simulator2(lambda,p,invmiu,S, W, Ms, Mh, R, N)
	%lambda = movies request rate (in requests/hour)
	%p = percentage of requests for high-definition movies (in %)
	%invmiu= average duration of movies (in minutes)
	%S = number of servers (each server with a capacity of 100 Mbps)
	%W = resource reservation for high-definition movies (in Mbps)
	%Ms = throughput of movies in standard definition (2 Mbps)
	%Mh = throughput of movies in high definition (5 Mbps)
	%R = number of movie requests to stop simulation
	%N = movie request number to start updating the statistical counters

	C = S * 100; 

	invlambda=60/lambda; %average time between requests (in minutes)	

	%Events definition:
	ARRIVAL_S = 0; 
	ARRIVAL_H = 0; 

	DEPARTURE_S = ones(1,S);
	DEPARTURE_H = ones(1,S);
	
	%State variables initialization:
	STATE= zeros(1,S);
	STATE_S = 0;

	%Statistical counters initialization:
	LOAD= 0;
	NARRIVALS= 0;
	NARRIVALS_S = 0; 
	NARRIVALS_H = 0; 

	BLOCKED_H= 0;
	BLOCKED_S = 0; 

	%Simulation Clock and initial List of Events:
	Clock= 0;
	EventList= [ARRIVAL_S exprnd(invlambda); ARRIVAL_H exprnd(invlambda)];
	EventList= sortrows(EventList,2);


	NARRIVALS = ARRIVAL_S + ARRIVAL_S; 


	while NARRIVALS < R
		event= EventList(1,1);
		Clock= EventList(1,2);
		server_id = EventList(1,3); 
		Previous_Clock= Clock;

		EventList(1,:)= [];

		LOAD= LOAD + STATE*(Clock-Previous_Clock);
		

		% in standard
		if event == ARRIVAL_S
			EventList= [EventList; ARRIVAL Clock+exprnd(invlambda) 0];
			NARRIVALS= NARRIVALS+1;

			min_state_id = find(STATE==min(STATE))

			if STATE + M <= C % verificar condicoes pdf 
				STATE= STATE+M;
				EventList= [EventList; DEPARTURE Clock+exprnd(invmiu) server_id];
			else
				BLOCKED= BLOCKED+1;
			end 
			
		% in high-definition
		elseif event == ARRIVAL_H
			EventList= [EventList; ARRIVAL Clock+exprnd(invlambda)];
			NARRIVALS= NARRIVALS+1;
			if STATE + M <= C % verificar 
				STATE= STATE+M;
				EventList= [EventList; DEPARTURE Clock+exprnd(invmiu)];
			else
				BLOCKED= BLOCKED+1;
			end

		else
			if STATE== DEPARTURE_H 
		end
		EventList= sortrows(EventList,2);

	end
	
	b_s = BLOCKED_S/NARRIVALS_S;
	b_h = BLOCKED_H/NARRIVALS_H;
end