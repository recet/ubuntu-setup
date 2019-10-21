# vm-setup

Run the script on a vm before trying out.

* pre-req: installed vagrant

* create a directory at your choice and copy the vagrant file. Example:

```bash
mkdir -p ~/vms/recet-setup-test
```

* copy the vagrantfile to this dir

```bash
mkdir -p ~/vms/recet-setup-test
cp  test/vagrant/Vagrantfile ~/vms/recet-setup-test/Vagrantfile
```

* go to dir:

```bash
cd ~/vms/recet-setup-test
```

* Provision the vm

```bash
vagrant up --provision
```

* Log into the vm

```bash
vagrant ssh
```

* Start script

```bash
cd ubuntu-setup  && \
find scripts/ -type f -iname "*.sh" -exec chmod +x {} \; && \
./scripts/setup.sh
```
