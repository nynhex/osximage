# osximage

This is a repo for building an NBI (never-booted image) of an OS X (pron: oh ess **ten**) root partition, which can be easily and quickly (&lt;10m) imaged onto a Mac with the `asr` utility readily available on OSX boot media.

# HOWTO: Creating the NBI

## Prerequisites

Per AutoDMG, you have to be on the same OS as you're building.  To build a 10.12 image, the build system must be running Sierra.

* Install the following to /Applications:
    * `Xcode.app`
        * pkg offline non-app-store version available [here](https://developer.apple.com/download/more/)] (requires appleId but does not developer membership)
    * `Install macOS Sierra.app`
        * [free download via App Store](https://itunes.apple.com/us/app/macos-sierra/id1127487414)
    * `AutoDMG.app`
        * [GitHub Download](https://github.com/MagerValp/AutoDMG/releases)
    * `CreateUserPkg.app`
        * [GitHub Pages Download](http://magervalp.github.io/CreateUserPkg/)

* create `~/Documents/packages.10.12`
    * put in all those apple printer driver `pkg`s you can download
    * the "enhanced dictation" offline speech recognition 800mb `pkg` that system preferences will download if you ask it
        * run [this](https://gist.github.com/sneak/958df7165ce5b9e4dd4c89da5764a8e1) while it's downloading to find the temp file, then hardlink it to `whatever.pkg`
    * any other packages you want preinstalled on the root but not:
        * Virtualbox (won't work unless installed from inside the running OS for some reason)
        
## My `packages.10.12`

https://ipfs.io/ipfs/QmTvcpFitKXsNTLdVRWk6PHvFWUfddZH47umm1xZvJApts/packages.10.12

```
48516a7b6e5286cc44ab30ff3c5aa171e0888519  200.BrotherPrinterDrivers.pkg
ebf0abac1483fd6de9262e92b047dcc80ceabeab  200.CanonPrinterDrivers.pkg
b8442185bfa0e182b84a7f6f5f298deb04d81a74  200.EPSONPrinterDrivers.pkg
2cd5d3bfc434226125d068bb09e90cbb2157a7ba  200.FujiXeroxPrinterDrivers.pkg
f44f5769579f3be7a771f54690de221e04f496cf  200.HewlettPackardPrinterDrivers.pkg
9c303c08e76aaef2fc9d1599aeea9ff15e8bce2b  200.InfoPrintPrinterDrivers.pkg
c45d3616f5995846313b9afc159ca6793b00ed08  200.LanierPrinterDrivers.pkg
9bcdb8492b00b0d7079dde23e1db4ac8da4fe0c0  200.LexmarkPrinterDrivers.pkg
c6218afb33b68fe6fab803d5b327e4f628857039  200.RicohPrinterDrivers.pkg
1ef9a998e680df23ca0cf8ba1426ed7673a2c37a  200.SamsungPrinterDrivers.pkg
df267df6198781d3fae736112a66a4a150c46b67  200.SavinPrinterDrivers.pkg
59b0306fe33693a73dc709641262f0ed2d63285a  200.XeroxPrinterDrivers.pkg
b77920f32f36f3229611ea0e10c01f2dad157ceb  20161003.EnhancedDictation.pkg
```

## Build Image

Finally, just run `make` in the cloned repo to build the NBI.  You will need to enter your sudo password up front, **but don't go get coffee yet**... AutoDMG will ask for it again about 30-60 seconds later.  *Then* go and kill an hour.

The OSX Installer .app, AutoDMG, CreateUserPkg, and Xcode (for `make`) will all be included in the built image, so if you're *using* the image so built it will have everything you need to make further images later.

If you aren't installing any extra packages, edit the `Makefile` to remove the `~/packages.10.12/*.pkg` part.

It writes the image as it's building to /tmp (to leverage fast internal SSD in case your `osximage` clone is on removable media) then moves it to the repo directory in the last step.

# HOWTO: Imaging A Mac

## Before You Begin

Get all data to be saved *off* of target system.  Recommended: install Google Drive and log in to your Google account and put everything to be saved in there.  Wait for sync (upload) to complete.

## Create bootable USB media

* Install OS installer .app bundle to /Applications
* Insert USB3 media.  64GB or larger to store OS installer and image.

e.g. USB disk named "Untitled":

    sudo /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia \
      --volume /Volumes/Untitled \
      --applicationpath "/Applications/Install macOS Sierra.app"

## Copy image to USB

Copy the never-booted disk image (nbi) ending with `.dmg` to the root of the newly-imaged bootable USB disk, alongside the installer `.app` the `createinstallmedia` tool placed on the disk.

## Image Mac

* Insert the bootable USB drive into the machine to be imaged and boot holding the Option key on a wired keyboard.  (Alt on a PC keyboard.)
* Select `Terminal` from the `Utilities` menu.
* Run the following commands:

### Repartition and Reformat disk0

⚠️⚠️ **This will delete all data on the internal disk. Proceed with caution.** ⚠️⚠️

`diskutil partitionDisk /dev/disk0 1 GPT jhfs+ root R`

### Write OS NBI to disk0

`asr restore --source file:///Volumes/Image\ Volume/nbi.dmg --target /Volumes/root --erase`

# HOWTO: Using the Custom Image

## 1/5 Initial Password

* The password for the `admin` user is `admin`.  Log in as admin.

## 2/5 Create User Accounts

The example user in this document is John P Smith, username `jps`.  Replace the name and username with your own.

* Create an administrator user account for yourself.
    * Username: `jpsadmin`
    * Real Name: `John Smith (admin)`
* Create a second non-administrator local user account for daily job tasks.
    * Username: `jps`
    * Real Name: `John Smith`
* Create a third non-administrator local user account `personal` for personal use.

## 3/5 Set Up Systemwide Configuration

* Log out of `admin` and into `jpsadmin`.
* Delete the `admin` user in `System Preferences > Users & Groups`. Choose to delete the user's home folder.
* Open `System Preferences > Sharing` and set the machine hostname.
* Connect machine to network (potentially entering wifi password).
* Open a terminal and run `new-system-setup`.  Enter the `jpsadmin` password when initially prompted.
    * When prompted to "Enter the user name:", enter your normal username (e.g. `jps`)
        * This is for FileVault (FDE) to enable the specified user from the encrypted disk.
* Wait for the script to finish, then enter `sudo reboot`.

## 4/5 Set Up User-specific Configuration

* Log in with your normal user. (e.g. `jps`)
* You may log in to your personal iCloud account/Apple ID, however, **make sure you disable iCloud Drive as soon as you log in**.
    * Uncheck `Store files from Documents and Desktop in iCloud Drive` when prompted!
* Disable iCloud Drive and Mail in `System Preferences > iCloud` if you logged in to iCloud.
* Open a terminal, and run `new-user-setup`.
    * This will take a while, as it will be downloading and installing a full set of apps.
* Log out, and log back in again with the same user so that changed preferences will take effect.
* Log in to Google Drive (already installed under ~/Applications) with your Google Apps account.
* Avoid installing any additional software to the machine unless strictly necessary.  Prefer web applications and built-in apps.
* Do not install third-party software to `/Applications` except via the App Store.

## 5/5 Finally, Systemwide Security Software

* Little Snitch
* Little Flocker

## 6/5 Optional Manual Configs

* Enable pretty native OS notifications for Chrome: `chrome://flags/#enable-native-notifications`
* Re-enable Location Services

# Credits

* `DefaultDesktop.jpg`
    * rotated version of [space](http://simpledesktops.com/browse/desktops/2012/feb/19/space-2/) by [Nané](http://www.smplz.com/)
* other desktops
    * a whole bunch of 5120px wide (5K Retina iMac res) images from [InterfaceLIFT](https://interfacelift.com/wallpaper/downloads/date/wide_16:9/5120x2880/)
 
