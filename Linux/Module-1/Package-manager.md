---
tags: 
- linux
- programming
- course/devops

course:
- devops
- module1

date: 2022-06-30
---

# Package-manager


APT
-----------
*   apt package manager is used to install packages/programs in linux.

*   apt install the program with its dependencies

*   it downloads those packages from the internet from hosted repositories, and those repositories can be found in `/etc/apt/sources.list`
    [![](Package-manager-images/Untitled.png)](Package-manager-images/Untitled.png)

Snap
------------
*   some applications are not in apt, an alternative is `snap`

*   snap snaps all the dependencies in one package and downloads it, this means if tow apps have some shared dependencies it will download them two times one for each app. But apt will only download them once.

*   so if an app is available in both apt and snap, it’s better to download it from apt (less space)



PPA Repository
---------------------------------------
*   some applications are not in apt and snap, an alternative is adding a `PPA repository`

*   Personal Package Archive (PPA) are provided by the community, usually used by developers to provide updates more quickly than in the official Ubuntu repositories.

*   because it’s personal (any one can create it) be aware of possible risks before adding a PPA.

*   after adding the PPA (it will be added to the sources.list) and when installing an app the apt toll will now search in the PPA added repo too to fetch the package from that repo.

[![](Package-manager-images/Untitled%201.png)](Package-manager-images/Untitled%201.png)

Different source based distributions have different package mangers
------------------------------------------------------------------------------------------------------------------------------------------------------

*   Debian based: - Ubuntu - Debian - Mint Have APT and APT-GET

*   Red Had based: - RHEL - CentOS - Fedora Have Yum

The concepts of APT and YUM are the same with some differences in the repos, some will have more or newer versions of packages.

And when choosing a distribution for the server the above factors will determine which distro to install.