@echo off
:test1
set var1=50
echo This should be 50: %var1%
echo This should be nothing: %var2%
set var2=100
echo This should now be 100: %var2%