# Largest Small Polygon (LSP)
Generate largest small $n$-polygons.

Largest Small Polygon (LSP) or largest small $n$-polygons or the biggest little polygon is the $n$-sided polygon that has diameter one (that is, every two of its points are within unit distance of each other) and that has the largest area among all diameter-one-$n$-gons. (from [wikipedia](https://en.wikipedia.org/wiki/Biggest_little_polygon))

# How to use
`main.m` is the main file. You can execute `main.m` in one of the following ways:
### Run from the Command Line
Execute the script using MATLAB's batch mode:
```
matlab -batch main
```
### Run in MATLAB
Open and run `main.m` directly in MATLAB, or use the following example in the MATLAB command window:
```MATLAB:
X = LSP(6); % Graham's Biggest Little Hexagon
plot([X(:,1); X(1,1)], [X(:,2);  X(1,2)], 'r-o');
```
This code will plot [Graham's Biggest Little Hexagon](https://mathworld.wolfram.com/GrahamsBiggestLittleHexagon.html) in red with circular markers.

### Requirements
To execute this script, the [Optimization Toolbox](https://www.mathworks.com/help/optim) is required.  

# Gallery
|![](image/LSP(3)-1.png)|![](image/LSP(4)-1.png)|![](image/LSP(5)-1.png)|
|:-:|:-:|:-:|
|LSP(3) $A=0.43301270$|LSP(4) $A=0.50000000$|LSP(5) $A=0.65716389$|
|![](image/LSP(6)-1.png)|![](image/LSP(7)-1.png)|![](image/LSP(8)-1.png)|
|LSP(6) $A=0.67498144$|LSP(7) $A=0.71974093$|LSP(8) $A=0.72686848$|
|![](image/LSP(3)-2.png)|![](image/LSP(4)-2.png)|![](image/LSP(5)-2.png)|
|LSP(3) with distance|LSP(4) with distance|LSP(5) with distance|
|![](image/LSP(6)-2.png)|![](image/LSP(7)-2.png)|![](image/LSP(8)-2.png)|
|LSP(6) with distance|LSP(7) with distance|LSP(8) with distance|

# Related articles
* [2点間の距離が1以下で面積が最大となる多角形 LSP]()
