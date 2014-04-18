require "formula"

class ParallelNetcdf < Formula
  homepage "https://trac.mcs.anl.gov/projects/parallel-netcdf"
  url "http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/parallel-netcdf-1.4.1.tar.bz2"
  sha1 "0839b9789266f8c2be3656d7287f0776b797626f"

  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "netcdf" => "enable-fortran"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install" 
  end

end
