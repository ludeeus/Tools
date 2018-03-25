```bash
git clone git://github.com/ludeeus/hassbian-scripts.git /tmp/hassbian-scripts
cd /tmp/hassbian-scripts && git checkout cloud9-IDE
bash make_package.sh
sudo apt install ./hassbian*.deb --reinstall
sudo hassbian-config install cloud9
```
