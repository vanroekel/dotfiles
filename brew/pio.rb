require "formula"

class Pio < Formula
  homepage "https://code.google.com/p/parallelio/"
  #url "https://parallelio.googlecode.com/files/pio1_6_3.tgz"
  #sha1 "44285d4b15cbd88d57f76c71fb38565b0cbc40a0"
  url 'http://parallelio.googlecode.com/svn/trunk_tags/pio1_7_2/', :using => :svn

  #depends_on :x11 # if your formula requires any X11/XQuartz components
  #depends_on "open-mpi"
  #depends_on "parallel-netcdf" 

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    ENV['NETCDF_PATH'] = "/usr/local"
    ENV['PNETCDF_PATH'] = "/usr/local"
    ENV['FC'] = "/usr/local/bin/gfortran"
    ENV['CC'] = #{ENV.cc}
    ENV['MPIFC'] = "/usr/local/bin/mpif90"
    puts ENV['PNETCDF_PATH']
    puts ENV['FC']
    puts ENV['CC']
    puts ENV['MPIFC']
    puts ENV['MPICC']
    puts ENV['NETCDF_PATH']
    Dir.chdir("pio") do
      system "./configure", "--prefix=#{prefix}"
      system "make"
      system "make install"
    end
    Dir.chdir("testpio") do
      system "make"
    end
  end

end
