function plot_S(Te,s,graphics) 
% Te reprezinta perioada de esantionare in secunde 
% s este vectorul care contine esantioanele            
    N=max(size(s)); % se presupune ca este vb de un vector cu mai mult                         
                    % de 1 element                 
    fe=1/Te;    % frecventa de esantionare [Hz]          
    f=((-N/2):(N/2-1))*fe/N;  % vectorul de frecvente - acesta are                                   
                              % acelasi numar de componente la fel ca                                    
                              % semnalul.                                   
                              % - s-a cautat centrarea lui in origine                      
    S=fft(s);     % se calculeaza TFD cu FFT         
    S=fftshift(S);  % se deplaseaza spectru pentru a avea originea                       
                    % la mijlocul reprezentarii          
    S=abs(S);     % se reprezinta doar modulul TFD         
    plot(graphics,f,S);         
end 
 