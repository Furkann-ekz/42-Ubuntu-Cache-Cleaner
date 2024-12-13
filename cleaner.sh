clear
# Temizlenecek dizinlerin listesi
directories=(
    "$HOME/.var/app/com.visualstudio.code/cache"
    "$HOME/.var/app/org.mozilla.firefox/cache"
    "$HOME/.var/app/com.slack.Slack/cache"
    "$HOME/.var/app/com.slack.Slack/config/Slack/Cache"
    "$HOME/.var/app/com.slack.Slack/config/Slack/Service Worker/CacheStorage"
    "$HOME/.var/app/com.visualstudio.code/config/Code/Cache"
    "$HOME/snap/firefox/common/.cache"
    "$HOME/snap/snap-store/common/.cache"
    "$HOME/.var/app/com.brave.Browser/cache"
    "$HOME/.var/app/com.discordapp.Discord/cache"
    "$HOME/.var/app/com.discordapp.Discord/config/discord/Cache"
    "$HOME/.var/app/com.google.AndroidStudio/cache"
    "$HOME/.var/app/com.google.Chrome/cache"
    "$HOME/.var/app/com.opera.Opera/cache"
    "$HOME/.cache"
)

# Dizileri sırayla temizleme aşaması
for target_dir in "${directories[@]}";
do
    if [ -d "$target_dir" ];
        then
        # Dizindeki tüm dosyaları ve alt klasörleri siler
        rm -rf "$target_dir"/*
    else
    	echo
        echo "Hata: $target_dir dizini bulunamadı!"
    fi
done

# Temizleme işleminden önce depolama hesaplaması
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
	Storage="0B"
fi
echo -e "\033[33m\n -- Available Storage Before Cleaning : || $Storage || --\033[0m"

sleep 0.5

echo -e "\033[31m\n -- Cleaning ...\n\033[0m "

# Temizleme işleminden sonra depolama hesaplaması
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
	Storage="0B"
fi
sleep 1
echo -e "\033[32m -- Available Storage After Cleaning : || $Storage || --\n\033[0m"
