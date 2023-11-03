import dendropy
from dendropy.calculate import treemeasure
from dendropy.calculate import statistics

tree = dendropy.Tree.get(
    path='phy.nex',
    schema='nexus')
print (tree)

x = treemeasure.colless_tree_imbalance(tree)
# y = treemeasure.pybus_harvey_gamma(tree)
z =treemeasure.sackin_index(tree)
a = treemeasure.treeness(tree)


print(x)
# print(y)
print(z)
print(a)
tree.print_plot()