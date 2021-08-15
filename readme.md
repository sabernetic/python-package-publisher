

From your terminal, check in your action.yml file.
````
git add action.yml
git commit -m "Add action"
git push
````

From your terminal, add a tag. This example uses a tag called v1. For more information, see "About actions."

````
git tag -a -m "Description of this release" v1
git push --follow-tags
````
