function [wavefield_border] = fixborder(wavefield,nx,nz,nx_border,nz_border,nshot,mode)
% fixborder(wavefield,nx,nz,nx_border,nz_border,nshot,mode)
% add or clear the border of the wavefield generated by Tim's Helmholtz.
% if mode = 1, clear the border
% if mode = 2, add border with zeros.
% 
% wavefield: input wavefield with border which also must be a vectory.
% nx_border, nz_border: border length in lateral and depth direction.
% 
if (mode == 1)
    wavefield    = reshape(wavefield,(nz+2*nz_border),(nx+2*nx_border),nshot);
    wavefield([1:nz_border nz_border+nz+1:end],:,:) = [];
    wavefield(:,[1:nx_border nx_border+nx+1:end],:) = [];
    wavefield_border           = reshape(wavefield,nx*nz,nshot);
elseif (mode == 2) 
    wavefield_border           = zeros(nz+2*nz_border,nx+2*nx_border,nshot);
    wavefield                  = reshape(wavefield,nz,nx,nshot);
    wavefield_border(nz_border+1:nz_border+nz,nx_border+1:nx_border+nx,:) = wavefield;
    wavefield_border           = reshape(wavefield_border,(nz+2*nz_border)*(nx+2*nx_border),nshot);
end    