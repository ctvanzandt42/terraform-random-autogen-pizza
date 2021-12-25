<h1>Random Terraform Pizza Generator</h1>

<p>This is a project I'm using to build some Terraform chops, per say. The goal is to build a Terraform script that randomly orders a pizza using 
  the Domino's Terraform provider. The plan is pretty simple:</p>

<ul>
  <li>Connect with Terraform Cloud as my remote backend</li>
  <li>Generate a random number for every run of the script. This means that I can't use the random_int resource that Terraform provides, as it only
  generates the random number at resource creation and persists in state</li>
  <li>Using Key Vault tied up with some networking for safety, pull secrets into the script</li>
  <li>Use the random number in some way to determine if a pizza will be ordered. CC number and sensitive info will come in through Key Vault</li>
</ul>

<p>The goal is to make this a totally runnable script at any time, no special setup required. Possibly, I could modularize this workflow and add it to the Terraform
  Registry</p>
