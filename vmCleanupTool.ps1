# author: Joshua Bähler
# company: BWZ Lyss
# technical school: gibb (Gewerblich-Industrielle Berufsfachschule Bern)
# department: iet
# class: INF2017.C
# email (business): jbaehler@bwzlyss.ch

#
# start of code
#

# var is an array for all names from the smartlearn / gibbix vm enviroment
$vm = @(
        "bmLP1",    #vmNet0 Ubuntu Linux 16.04 LTS Desktop VM
        "bmWP1",    #vmNet0 Windows 7 VM
        "bmWP2",    #vmNet0 Windows 10 VM
        "vmKL1",    #vmNet1 Kali Linux VM
        "vmLF1",    #def. IPFire Firewall (vmNet0 (red0, WAN), vmNet1 (green0, LAN), vmNet8 (orange0, DMZ))
        "vmLP1",    #vmNet1 Ubuntu Linux 16.04 LTS Desktop VM
        "vmLR1",    #vmNet1 vyOS Router 1
        "vmLR2",    #vmNet1 vyOS Router 2
        "vmLS1",    #vmNet8 Ubuntu Linux 16.04 LTS Server VM 1
        "vmLS2",    #vmNet8 Ubuntu Linux 16.04 LTS Server VM 2 
        "vmLS3",    #vmNet8 Ubuntu Linux 16.04 LTS Server VM 3
        "vmLS4",    #vmNet1 Ubuntu Linux 16.04 LTS Server VM 1
        "vmLS5",    #vmNet2 Ubuntu Linux 16.04 LTS Server VM 2
        "vmWP1",    #vmNet1 Windows 7 VM
        "vmWP2",    #vmNet1 Windows 10 VM
        "vmWPX",    #vmNet1 Windows XP VM
        "vmWS1",    #vmNet1 Windows Server 2012 R2 Datacenter VM
        "vmWS2",    #vmNet1 Windows Server 2016 Datacenter VM
        "vmWS3"     #vmNet1 Windows Server 2016 Core VM
       )


# welcome screen
echo "-------------------------------------------------------------------------"
echo "                  welcome to the vmCleanup-tool                          "
echo "-------------------------------------------------------------------------"
echo " "

$DriveLetter = Read-Host "Attach the drive letter (ex.: 'D:')"
$vmLocation = Read-Host "Attach the folder, where all vms are stored (ex.: '1_work')"


# iteration of the vm array that deletes all files with a specific type and temporary generated folders
foreach ($currentVM in $vm)
    Get-ChildItem "$DriveLetter\1_vms\$currentVM" -Recurse -Force -Include *.nvram, *.vmsd, *.vmxf, *.log | Remove-Item -Recurse -Force
    Remove-Item -Recurse -Force $DriveLetter\$vmLocation\$currentVM\$currentVM.vmx.lck
    Remove-Item -Recurse -Force $DriveLetter\$vmLocation\$currentVM\$currentVM.vmdk.lck
    echo "$currentVM is clean"
}

# optional: Clear Recycle-Bin from smartlearn
Clear-RecycleBin -DriveLetter $DriveLetter

echo " "
echo "---------------------------------------------------------------------------"
echo " "
echo "Thank you for using my ps1-script"
echo " "
echo "It would be helpful if you give a contribution of using this script."
echo "All you need to do is to send me a minimum amount of 1-USD to following paypal"
echo " "
echo "URL: https://paypal.me/joshuabaehler"
echo " "
echo "and if you want to get in contact with me check out the source code itself"
echo "my business mail is in on line 6 :)"
echo " "
echo "---------------------------------------------------------------------------"
echo " "
pause

#
# end of code
#