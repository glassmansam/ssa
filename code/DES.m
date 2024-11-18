function [avgWaitingTime, avgQueueLength] = DES()
   % Initialize DES
    serverStatus = 0;
    clock = 0;
    numberInQueue = 0;
    timesOfArrivals = [];
    timeOfLastEvent = 0;
    
    numberDelayed = 0;
    totalDelay = 0;
    areaUnderQ = 0;
    areaUnderB = 0;

    nextArrival = inf;
    nxtDeparture = inf;

    serviceTime = service(); % Example of drawing a service time
    interArrivalTime = arrival(); % Example of drawing an inter-arrival time 
    breakdownTime = breakdown(); % Example of drawing a breakdown time
    repairTime = repair(); % Example of drawing a repair time
end