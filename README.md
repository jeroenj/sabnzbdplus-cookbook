sabnzdplus Cookbook
===================
Installs [sabnzdplus](http://sabnzbd.org) and its required dependencies.

Requirements
------------
#### apt
It gets installed from an apt repository. The apt_repository lwrp is used to set it up.

Attributes
----------
#### sabnzdplus::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sabnzdplus']['user']</tt></td>
    <td>String</td>
    <td>User which sabnzdplus will be ran as</td>
    <td>sabnzdplus</td>
  </tr>
  <tr>
    <td><tt>['sabnzdplus']['config_directory']</tt></td>
    <td>String</td>
    <td>Configuration directory</td>
    <td>/etc/sabnzdplus</td>
  </tr>
  <tr>
    <td><tt>['sabnzdplus']['apt']['uri']</tt></td>
    <td>String</td>
    <td>The apt repository uri</td>
    <td>ppa:jcfp/ppa</td>
  </tr>
  <tr>
    <td><tt>['sabnzdplus']['apt']['distribution']</tt></td>
    <td>String</td>
    <td>Apt distribution that will be used to install sabnzbdplus</td>
    <td><tt>node[:lsb][:codename]</tt></td>
  </tr>
  <tr>
    <td><tt>['sabnzdplus']['preferences']</tt></td>
    <td>Hash</td>
    <td>Configuration options. Feel free to create a pull request for more custom options.</td>
    <td>
      <ul>
        <li><tt>port</tt></li>
        <li><tt>https</tt></li>
        <li><tt>https_port</tt></li>
        <li><tt>https_key</tt></li>
        <li><tt>https_cert</tt></li>
        <li><tt>schedule</tt></li>
        <li><tt>complete_dir</tt></li>
        <li><tt>download_dir</tt></li>
        <li><tt>dirscan_dir</tt></li>
        <li><tt>bandwidth_limit</tt></li>
        <li><tt>permissions</tt></li>
        <li><tt>username</tt></li>
        <li><tt>password</tt></li>
        <li><tt>api_key</tt></li>
        <li><tt>servers</tt></li>
      </ul>
    </td>
  </tr>
</table>

Usage
-----
#### sabnzdplus::default

It installs sabnzdplus by checking it out from source.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github
