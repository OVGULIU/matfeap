%@c
% matfeap_init.m
% Initializes paths used by the MATFEAP interface

addpath([pwd, '/mlab']);
cd mlab/csock
if exist('csockmex')
  fprintf('Using C socket bindings\n');
  cd ../..
  addpath([pwd, '/mlab/csock']);
  feaps_unix;
else
  fprintf('Using Java socket bindings\n');
  cd ../..
  addpath([pwd, '/mlab/jsock']);
  javaaddpath([pwd, '/mlab/jsock']);
  feaps_pipe;
end
