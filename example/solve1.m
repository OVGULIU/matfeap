% Example of FEAP / Matlab interface: 
%  Run a simple small-deformation static displacement problem.

%@t
% The {\tt Iblock2} input deck in the example subdirectory describes a
% square mesh with {\tt n} elements on a side, where the parameter {\tt n}
% is not defined in the input deck.  We start a FEAP simulation with
% {\tt n = 10}, get the tangent stiffness and residual into MATLAB,
% solve the linear system and write the results back to FEAP, and then
% use FEAP's X11 graphics to show the displaced shape.  Once the user
% has finished admiring our deformed block, he can press a key (at which
% point the FEAP simulation will exit and the graphics will disappear).
%
%@c
param.n       = 10;  % Parameter to the FEAP input deck
param.verbose = 1;   % See everything that FEAP sends

p  = feapstart('Iblock2', param);  % Start FEAP simulation

K  = feaptang(p);    % Form the tangent matrix
R  = feapresid(p);   % Form the residual force vector
du = K\R;            % Compute a Newton update
feapsetu(p, du);     % Set the displacement vector

% Plot the results
feapcmd(p, 'plot', 'defo', 'mesh', 'boun', 'load', 'end');

% Quit
disp('Press any key to exit');
pause;
feapquit(p);

