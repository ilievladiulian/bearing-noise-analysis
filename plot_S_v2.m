function [orbitOK, ballOK, f, S, x] = plot_S_v2(Te,s,graphics,orbitalRotation,ballRotation) 
% Te reprezinta perioada de esantionare in secunde 
% s este vectorul care contine esantioanele            
    N=max(size(s)); % se presupune ca este vb de un vector cu mai mult                         
                    % de 1 element                 
    fe=1/Te;    % frecventa de esantionare [Hz]          
    f = (0:N-1)*(fe/N);  % vectorul de frecvente - acesta are                                   
                              % acelasi numar de componente la fel ca                                    
                              % semnalul.                                   
                              % - s-a cautat centrarea lui in origine                      
    %S=fft(s);     % se calculeaza TFD cu FFT              
    S=abs(s);     % se reprezinta doar modulul TFD    
    S=10*log10(S);
    x = zeros(N,1);
    minDifOrbit = abs(orbitalRotation - f(1));
    minDifBall = abs(ballRotation - f(1));
    indexOfOrbitalRotation = 1;
    indexOfBallRotation = 1;
    for i = 2 : N
        if minDifOrbit > abs(orbitalRotation - f(i))
           minDifOrbit = abs(orbitalRotation - f(i));
           indexOfOrbitalRotation = i;
        end
        if minDifBall > abs(ballRotation - f(i))
            minDifBall = abs(ballRotation - f(i));
            indexOfBallRotation = i;
        end
    end
    orbitLow = orbitalRotation - 3.5;
    orbitHigh = orbitalRotation + 3.5;
    ballLow = ballRotation - 3.5;
    ballHigh = ballRotation + 3.5;
    maxFrequencyShown = 100;
    indexOfMaxFreqShown = findIndexOfValue(f, maxFrequencyShown);
    
    [pks,locs] = findpeaks(S(1:indexOfMaxFreqShown));
    indexOfOrbitLow = findIndexOfValue(f, orbitLow);
    indexOfOrbitHigh = findIndexOfValue(f, orbitHigh);
    indexOfBallLow = findIndexOfValue(f, ballLow);
    indexOfBallHigh = findIndexOfValue(f, ballHigh);
    M = mean(S(1:indexOfMaxFreqShown));
    
    n = max(size(locs));
    orbitOK = false;
    ballOK = false;
    for i = 1 : n
        if locs(i) <= indexOfOrbitHigh && locs(i) >= indexOfOrbitLow
            if pks(i) > M + 7.5
                orbitOK = true;
            end
        end
        if locs(i) <= indexOfBallHigh && locs(i) >= indexOfBallLow
            if pks(i) > M + 7.5
                ballOK = true;
            end
        end
    end
    
    x(indexOfOrbitalRotation) = 50;
    x(indexOfBallRotation) = 50;
    plot(graphics,f,S);
    hold(graphics, 'on');
    plot(graphics,f,x);
    graphics.XLim = [0 100];
end 
 