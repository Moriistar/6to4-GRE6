<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>اسکریپت نصب 6to4-GRE6</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vazirmatn@33.0.3/Vazirmatn-font-face.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/highlight.js@11.7.0/styles/atom-one-dark.css">
    <script src="https://cdn.jsdelivr.net/npm/highlight.js@11.7.0/lib/highlight.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/highlight.js@11.7.0/lib/languages/bash.min.js"></script>
    <style>
        body {
            font-family: 'Vazirmatn', sans-serif;
            background-color: #f8f9fa;
        }
        pre {
            direction: ltr;
            text-align: left;
            border-radius: 0.5rem;
            padding: 1rem;
            margin: 1rem 0;
            overflow-x: auto;
        }
        .copy-button {
            position: absolute;
            top: 0.5rem;
            right: 0.5rem;
            background-color: #4b5563;
            color: white;
            border: none;
            border-radius: 0.25rem;
            padding: 0.25rem 0.5rem;
            font-size: 0.75rem;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .copy-button:hover {
            background-color: #374151;
        }
        .section {
            background-color: white;
            border-radius: 0.5rem;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5rem;
            padding: 1.5rem;
            position: relative;
        }
        .tip {
            background-color: #f0fff4;
            border-right: 4px solid #48bb78;
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0.25rem;
        }
        .warning {
            background-color: #fffaf0;
            border-right: 4px solid #ed8936;
            padding: 1rem;
            margin: 1rem 0;
            border-radius: 0.25rem;
        }
    </style>
</head>
<body class="py-8 px-4 md:px-8 max-w-6xl mx-auto">
    <header class="text-center mb-8">
        <h1 class="text-3xl font-bold text-gray-800 mb-2">اسکریپت نصب تانل 6to4-GRE6</h1>
        <p class="text-gray-600">تانل برپایه IPv6 و IPv4 لوکال بین سرورهای ایران و خارج</p>
    </header>

    <section class="section">
        <h2 class="text-xl font-bold text-gray-800 mb-4">معرفی</h2>
        <p class="mb-4">
            این اسکریپت به شما کمک می‌کند تا به راحتی یک تانل 6to4-GRE6 بین سرورهای ایران و خارج ایجاد کنید. 
            این تانل از IPv6 برای ارتباط بین سرورها استفاده می‌کند و ترافیک IPv4 را از طریق آن منتقل می‌نماید.
        </p>
        <p class="mb-4">
            برای استفاده از این اسکریپت، شما نیاز به دسترسی به دو سرور دارید:
        </p>
        <ul class="list-disc list-inside mb-4 pr-4">
            <li>یک سرور در ایران</li>
            <li>یک سرور در خارج از ایران</li>
        </ul>
        <p>
            اسکریپت به صورت تعاملی از شما سؤالاتی می‌پرسد و بر اساس پاسخ‌های شما، دستورات لازم را برای راه‌اندازی تانل اجرا می‌کند.
        </p>
    </section>

    <section class="section">
        <h2 class="text-xl font-bold text-gray-800 mb-4">دانلود و استفاده از اسکریپت</h2>
        <p class="mb-4">
            برای استفاده از اسکریپت، ابتدا آن را دانلود کرده و سپس با دستور زیر اجرا کنید:
        </p>
        <div class="bg-gray-800 text-white p-4 rounded-lg mb-4 relative">
            <pre class="text-white"><code class="bash">curl -O https://raw.githubusercontent.com/yourusername/6to4-GRE6/main/6to4-gre6-installer.sh
chmod +x 6to4-gre6-installer.sh
./6to4-gre6-installer.sh</code></pre>
            <button class="copy-button" onclick="copyToClipboard(this.previousElementSibling.innerText)">کپی</button>
        </div>
        <div class="tip">
            <strong>نکته:</strong> برای اجرای کامل اسکریپت، هر دو سرور باید به اینترنت دسترسی داشته باشند و دسترسی root نیز نیاز است.
        </div>
    </section>

    <section class="section">
        <h2 class="text-xl font-bold text-gray-800 mb-4">متن کامل اسکریپت</h2>
        <p class="mb-4">
            در صورتی که می‌خواهید اسکریپت را قبل از استفاده بررسی کنید، متن کامل آن در زیر آمده است:
        </p>
        <div class="bg-gray-800 text-white p-4 rounded-lg relative">
            <pre class="text-white"><code class="bash">#!/bin/bash
# 6to4-GRE6 Tunnel Installer
# By: Your Name
# GitHub: https://github.com/yourusername/6to4-GRE6

# رنگ‌های مورد استفاده در اسکریپت
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# چک کردن اجرا با دسترسی روت
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}این اسکریپت باید با دسترسی روت اجرا شود!${NC}"
   exit 1
fi

# تابع نمایش بنر
show_banner() {
    clear
    echo -e "${CYAN}"
    echo "════════════════════════════════════════════════════════════"
    echo "          6to4-GRE6 Tunnel Installer Script                 "
    echo "     تانل برپایه IPv6 و IPv4 لوکال بین سرورهای ایران و خارج   "
    echo "════════════════════════════════════════════════════════════"
    echo -e "${NC}"
}

# تابع بررسی پیش‌نیازها
check_prerequisites() {
    echo -e "${YELLOW}در حال بررسی پیش‌نیازها...${NC}"
    
    # بررسی وجود ابزارهای لازم
    for cmd in ip ping curl wget; do
        if ! command -v $cmd &> /dev/null; then
            echo -e "${RED}$cmd یافت نشد! در حال نصب...${NC}"
            if command -v apt &> /dev/null; then
                apt update && apt install -y iproute2 iputils-ping curl wget
            elif command -v yum &> /dev/null; then
                yum update && yum install -y iproute iputils curl wget
            else
                echo -e "${RED}مدیر بسته سازگار یافت نشد. لطفاً $cmd را به صورت دستی نصب کنید.${NC}"
                exit 1
            fi
        fi
    done
    
    echo -e "${GREEN}تمام پیش‌نیازها با موفقیت بررسی شدند.${NC}"
}

# تابع دریافت اطلاعات از کاربر
get_user_info() {
    show_banner
    
    # پرسیدن موقعیت سرور (ایران یا خارج)
    echo -e "${YELLOW}آیا این سرور در ایران قرار دارد یا خارج از ایران؟${NC}"
    echo -e "1) ${CYAN}سرور خارج${NC}"
    echo -e "2) ${CYAN}سرور ایران${NC}"
    read -p "لطفاً گزینه خود را انتخاب کنید (1 یا 2): " server_location
    
    while [[ $server_location != "1" && $server_location != "2" ]]; do
        echo -e "${RED}ورودی نامعتبر! لطفاً 1 (برای سرور خارج) یا 2 (برای سرور ایران) وارد کنید.${NC}"
        read -p "لطفاً گزینه خود را انتخاب کنید (1 یا 2): " server_location
    done
    
    if [[ $server_location == "1" ]]; then
        server_type="kharej"
        echo -e "${GREEN}سرور خارج انتخاب شد.${NC}"
    else
        server_type="iran"
        echo -e "${GREEN}سرور ایران انتخاب شد.${NC}"
    fi
    
    # دریافت آدرس IP سرورها
    echo
    # تشخیص آدرس IP محلی
    local_ip=$(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v "127.0.0.1" | head -n 1)
    if [[ -z $local_ip ]]; then
        read -p "آدرس IP سرور فعلی را وارد کنید: " local_ip
    else
        read -p "آدرس IP سرور فعلی [$local_ip]: " temp_ip
        if [[ ! -z $temp_ip ]]; then
            local_ip=$temp_ip
        fi
    fi
    
    if [[ $server_type == "iran" ]]; then
        iran_ip=$local_ip
        read -p "آدرس IP سرور خارج را وارد کنید: " kharej_ip
    else
        kharej_ip=$local_ip
        read -p "آدرس IP سرور ایران را وارد کنید: " iran_ip
    fi
    
    # پرسیدن در مورد IPv6
    echo
    echo -e "${YELLOW}آیا می‌خواهید آدرس IPv6 را خودتان وارد کنید یا به صورت خودکار تولید شود؟${NC}"
    echo -e "1) ${CYAN}تولید خودکار${NC}"
    echo -e "2) ${CYAN}ورود دستی${NC}"
    read -p "لطفاً گزینه خود را انتخاب کنید (1 یا 2): " ipv6_choice
    
    while [[ $ipv6_choice != "1" && $ipv6_choice != "2" ]]; do
        echo -e "${RED}ورودی نامعتبر! لطفاً 1 (برای تولید خودکار) یا 2 (برای ورود دستی) وارد کنید.${NC}"
        read -p "لطفاً گزینه خود را انتخاب کنید (1 یا 2): " ipv6_choice
    done
    
    if [[ $ipv6_choice == "1" ]]; then
        # تولید خودکار آدرس IPv6
        local rand1=$(printf "%x" $((RANDOM % 256)))
        local rand2=$(printf "%x" $((RANDOM % 256)))
        local rand3=$(printf "%x" $((RANDOM % 256)))
        ipv6_prefix="fd${rand1}:${rand2}${rand3}:db86"
        ipv6_iran="${ipv6_prefix}::1"
        ipv6_kharej="${ipv6_prefix}::2"
        
        echo -e "${GREEN}آدرس IPv6 با موفقیت تولید شد:${NC}"
        echo -e "IPv6 سرور ایران: ${CYAN}${ipv6_iran}/64${NC}"
        echo -e "IPv6 سرور خارج: ${CYAN}${ipv6_kharej}/64${NC}"
    else
        # ورود دستی آدرس IPv6
        read -p "آدرس IPv6 سرور ایران را وارد کنید (مثال: fd12:3456:789a::1): " ipv6_iran
        read -p "آدرس IPv6 سرور خارج را وارد کنید (مثال: fd12:3456:789a::2): " ipv6_kharej
    fi
    
    # پرسیدن در مورد آدرس IPv4 لوکال
    echo
    echo -e "${YELLOW}آیا می‌خواهید آدرس IPv4 لوکال را خودتان وارد کنید یا از پیش‌فرض استفاده کنید؟${NC}"
    echo -e "1) ${CYAN}استفاده از پیش‌فرض (192.168.13.1/30 برای ایران و 192.168.13.2/30 برای خارج)${NC}"
    echo -e "2) ${CYAN}ورود دستی${NC}"
    read -p "لطفاً گزینه خود را انتخاب کنید (1 یا 2): " local_ip_choice
    
    while [[ $local_ip_choice != "1" && $local_ip_choice != "2" ]]; do
        echo -e "${RED}ورودی نامعتبر! لطفاً 1 (برای پیش‌فرض) یا 2 (برای ورود دستی) وارد کنید.${NC}"
        read -p "لطفاً گزینه خود را انتخاب کنید (1 یا 2): " local_ip_choice
    done
    
    if [[ $local_ip_choice == "1" ]]; then
        # استفاده از آدرس‌های پیش‌فرض
        local_ipv4_iran="192.168.13.1/30"
        local_ipv4_kharej="192.168.13.2/30"
        
        echo -e "${GREEN}از آدرس‌های IPv4 لوکال پیش‌فرض استفاده می‌شود:${NC}"
        echo -e "IPv4 لوکال سرور ایران: ${CYAN}${local_ipv4_iran}${NC}"
        echo -e "IPv4 لوکال سرور خارج: ${CYAN}${local_ipv4_kharej}${NC}"
    else
        # ورود دستی آدرس IPv4 لوکال
        read -p "آدرس IPv4 لوکال سرور ایران را وارد کنید (مثال: 192.168.13.1/30): " local_ipv4_iran
        read -p "آدرس IPv4 لوکال سرور خارج را وارد کنید (مثال: 192.168.13.2/30): " local_ipv4_kharej
    fi
    
    # تایید اطلاعات
    echo
    echo -e "${YELLOW}لطفاً اطلاعات وارد شده را تأیید کنید:${NC}"
    echo -e "نوع سرور: ${CYAN}$server_type${NC}"
    echo -e "IP سرور ایران: ${CYAN}$iran_ip${NC}"
    echo -e "IP سرور خارج: ${CYAN}$kharej_ip${NC}"
    echo -e "IPv6 سرور ایران: ${CYAN}$ipv6_iran${NC}"
    echo -e "IPv6 سرور خارج: ${CYAN}$ipv6_kharej${NC}"
    echo -e "IPv4 لوکال سرور ایران: ${CYAN}$local_ipv4_iran${NC}"
    echo -e "IPv4 لوکال سرور خارج: ${CYAN}$local_ipv4_kharej${NC}"
    
    echo
    read -p "آیا اطلاعات فوق صحیح است؟ (y/n): " confirm
    if [[ $confirm != "y" && $confirm != "Y" ]]; then
        echo -e "${YELLOW}اطلاعات تأیید نشد. لطفاً دوباره وارد کنید.${NC}"
        get_user_info
    fi
}

# تابع نصب تانل 6to4 در سرور ایران
setup_6to4_iran() {
    echo -e "${YELLOW}در حال راه‌اندازی تانل 6to4 در سرور ایران...${NC}"
    
    # حذف تانل‌های قبلی با همین نام (در صورت وجود)
    ip tunnel del 6to4_To_KH 2>/dev/null
    
    # ایجاد تانل 6to4
    ip tunnel add 6to4_To_KH mode sit remote $kharej_ip local $iran_ip
    ip -6 addr add ${ipv6_iran}/64 dev 6to4_To_KH
    ip link set 6to4_To_KH mtu 1480
    ip link set 6to4_To_KH up
    
    # بررسی اینکه آیا تانل ایجاد شده است
    if ip link show 6to4_To_KH &>/dev/null; then
        echo -e "${GREEN}تانل 6to4 با موفقیت در سرور ایران راه‌اندازی شد.${NC}"
    else
        echo -e "${RED}راه‌اندازی تانل 6to4 در سرور ایران با خطا مواجه شد!${NC}"
        exit 1
    fi
}

# تابع نصب تانل 6to4 در سرور خارج
setup_6to4_kharej() {
    echo -e "${YELLOW}در حال راه‌اندازی تانل 6to4 در سرور خارج...${NC}"
    
    # حذف تانل‌های قبلی با همین نام (در صورت وجود)
    ip tunnel del 6to4_To_IR 2>/dev/null
    
    # ایجاد تانل 6to4
    ip tunnel add 6to4_To_IR mode sit remote $iran_ip local $kharej_ip
    ip -6 addr add ${ipv6_kharej}/64 dev 6to4_To_IR
    ip link set 6to4_To_IR mtu 1480
    ip link set 6to4_To_IR up
    
    # بررسی اینکه آیا تانل ایجاد شده است
    if ip link show 6to4_To_IR &>/dev/null; then
        echo -e "${GREEN}تانل 6to4 با موفقیت در سرور خارج راه‌اندازی شد.${NC}"
    else
        echo -e "${RED}راه‌اندازی تانل 6to4 در سرور خارج با خطا مواجه شد!${NC}"
        exit 1
    fi
}

# تابع نصب تانل GRE6 در سرور ایران
setup_gre6_iran() {
    echo -e "${YELLOW}در حال راه‌اندازی تانل GRE6 در سرور ایران...${NC}"
    
    # حذف تانل‌های قبلی با همین نام (در صورت وجود)
    ip -6 tunnel del GRE6Tun_To_KH 2>/dev/null
    
    # ایجاد تانل GRE6
    ip -6 tunnel add GRE6Tun_To_KH mode ip6gre remote $ipv6_kharej local $ipv6_iran
    local ipv4_addr=$(echo $local_ipv4_iran | cut -d'/' -f1)
    local ipv4_cidr=$(echo $local_ipv4_iran | cut -d'/' -f2)
    ip addr add ${ipv4_addr}/${ipv4_cidr} dev GRE6Tun_To_KH
    ip link set GRE6Tun_To_KH mtu 1436
    ip link set GRE6Tun_To_KH up
    
    # بررسی اینکه آیا تانل ایجاد شده است
    if ip link show GRE6Tun_To_KH &>/dev/null; then
        echo -e "${GREEN}تانل GRE6 با موفقیت در سرور ایران راه‌اندازی شد.${NC}"
    else
        echo -e "${RED}راه‌اندازی تانل GRE6 در سرور ایران با خطا مواجه شد!${NC}"
        exit 1
    fi
}

# تابع نصب تانل GRE6 در سرور خارج
setup_gre6_kharej() {
    echo -e "${YELLOW}در حال راه‌اندازی تانل GRE6 در سرور خارج...${NC}"
    
    # حذف تانل‌های قبلی با همین نام (در صورت وجود)
    ip -6 tunnel del GRE6Tun_To_IR 2>/dev/null
    
    # ایجاد تانل GRE6
    ip -6 tunnel add GRE6Tun_To_IR mode ip6gre remote $ipv6_iran local $ipv6_kharej
    local ipv4_addr=$(echo $local_ipv4_kharej | cut -d'/' -f1)
    local ipv4_cidr=$(echo $local_ipv4_kharej | cut -d'/' -f2)
    ip addr add ${ipv4_addr}/${ipv4_cidr} dev GRE6Tun_To_IR
    ip link set GRE6Tun_To_IR mtu 1436
    ip link set GRE6Tun_To_IR up
    
    # بررسی اینکه آیا تانل ایجاد شده است
    if ip link show GRE6Tun_To_IR &>/dev/null; then
        echo -e "${GREEN}تانل GRE6 با موفقیت در سرور خارج راه‌اندازی شد.${NC}"
    else
        echo -e "${RED}راه‌اندازی تانل GRE6 در سرور خارج با خطا مواجه شد!${NC}"
        exit 1
    fi
}

# تابع تنظیم IP Forwarding در سرور ایران
setup_ip_forwarding_iran() {
    echo -e "${YELLOW}در حال تنظیم IP Forwarding در سرور ایران...${NC}"
    
    # فعال‌سازی IP Forwarding
    sysctl net.ipv4.ip_forward=1 &>/dev/null
    
    # اضافه کردن قوانین iptables
    iptables -t nat -A PREROUTING -p tcp --dport 22 -j DNAT --to-destination $(echo $local_ipv4_iran | cut -d'/' -f1)
    iptables -t nat -A PREROUTING -j DNAT --to-destination $(echo $local_ipv4_kharej | cut -d'/' -f1)
    iptables -t nat -A POSTROUTING -j MASQUERADE
    
    echo -e "${GREEN}IP Forwarding با موفقیت در سرور ایران تنظیم شد.${NC}"
}

# تابع ایجاد اسکریپت اجرا در هنگام بوت برای سرور ایران
create_boot_script_iran() {
    echo -e "${YELLOW}در حال ایجاد اسکریپت اجرا در هنگام بوت برای سرور ایران...${NC}"
    
    cat > /etc/rc.local << EOF
#!/bin/bash
ip tunnel add 6to4_To_KH mode sit remote $kharej_ip local $iran_ip
ip -6 addr add ${ipv6_iran}/64 dev 6to4_To_KH
ip link set 6to4_To_KH mtu 1480
ip link set 6to4_To_KH up

ip -6 tunnel add GRE6Tun_To_KH mode ip6gre remote $ipv6_kharej local $ipv6_iran
ip addr add $local_ipv4_iran dev GRE6Tun_To_KH
ip link set GRE6Tun_To_KH mtu 1436
ip link set GRE6Tun_To_KH up

sysctl net.ipv4.ip_forward=1
iptables -t nat -A PREROUTING -p tcp --dport 22 -j DNAT --to-destination $(echo $local_ipv4_iran | cut -d'/' -f1)
iptables -t nat -A PREROUTING -j DNAT --to-destination $(echo $local_ipv4_kharej | cut -d'/' -f1)
iptables -t nat -A POSTROUTING -j MASQUERADE 

exit 0
EOF
    
    chmod +x /etc/rc.local
    
    # اطمینان از اینکه سرویس rc-local فعال است
    if systemctl list-unit-files | grep -q rc-local.service; then
        systemctl enable rc-local.service &>/dev/null
        systemctl start rc-local.service &>/dev/null
    else
        cat > /etc/systemd/system/rc-local.service << EOF
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOF
        systemctl enable rc-local.service &>/dev/null
        systemctl start rc-local.service &>/dev/null
    fi
    
    echo -e "${GREEN}اسکریپت اجرا در هنگام بوت با موفقیت برای سرور ایران ایجاد شد.${NC}"
}

# تابع ایجاد اسکریپت اجرا در هنگام بوت برای سرور خارج
create_boot_script_kharej() {
    echo -e "${YELLOW}در حال ایجاد اسکریپت اجرا در هنگام بوت برای سرور خارج...${NC}"
    
    cat > /etc/rc.local << EOF
#!/bin/bash
ip tunnel add 6to4_To_IR mode sit remote $iran_ip local $kharej_ip
ip -6 addr add ${ipv6_kharej}/64 dev 6to4_To_IR
ip link set 6to4_To_IR mtu 1480
ip link set 6to4_To_IR up

ip -6 tunnel add GRE6Tun_To_IR mode ip6gre remote $ipv6_iran local $ipv6_kharej
ip addr add $local_ipv4_kharej dev GRE6Tun_To_IR
ip link set GRE6Tun_To_IR mtu 1436
ip link set GRE6Tun_To_IR up

exit 0
EOF
    
    chmod +x /etc/rc.local
    
    # اطمینان از اینکه سرویس rc-local فعال است
    if systemctl list-unit-files | grep -q rc-local.service; then
        systemctl enable rc-local.service &>/dev/null
        systemctl start rc-local.service &>/dev/null
    else
        cat > /etc/systemd/system/rc-local.service << EOF
[Unit]
Description=/etc/rc.local Compatibility
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
EOF
        systemctl enable rc-local.service &>/dev/null
        systemctl start rc-local.service &>/dev/null
    fi
    
    echo -e "${GREEN}اسکریپت اجرا در هنگام بوت با موفقیت برای سرور خارج ایجاد شد.${NC}"
}

# تابع تست اتصال
test_connection() {
    echo -e "${YELLOW}در حال تست اتصال...${NC}"
    
    if [[ $server_type == "iran" ]]; then
        # تست اتصال از سرور ایران
        echo -e "${CYAN}تست ping به IPv6 سرور خارج (${ipv6_kharej}):${NC}"
        ping6 -c 4 $ipv6_kharej
        
        echo -e "${CYAN}تست ping به IPv4 لوکال سرور خارج ($(echo $local_ipv4_kharej | cut -d'/' -f1)):${NC}"
        ping -c 4 $(echo $local_ipv4_kharej | cut -d'/' -f1)
    else
        # تست اتصال از سرور خارج
        echo -e "${CYAN}تست ping به IPv6 سرور ایران (${ipv6_iran}):${NC}"
        ping6 -c 4 $ipv6_iran
        
        echo -e "${CYAN}تست ping به IPv4 لوکال سرور ایران ($(echo $local_ipv4_iran | cut -d'/' -f1)):${NC}"
        ping -c 4 $(echo $local_ipv4_iran | cut -d'/' -f1)
    fi
}

# تابع اصلی
main() {
    show_banner
    check_prerequisites
    get_user_info
    
    if [[ $server_type == "iran" ]]; then
        setup_6to4_iran
        setup_gre6_iran
        setup_ip_forwarding_iran
        create_boot_script_iran
    else
        setup_6to4_kharej
        setup_gre6_kharej
        create_boot_script_kharej
    fi
    
    # تست اتصال
    test_connection
    
    echo
    echo -e "${GREEN}راه‌اندازی تانل 6to4-GRE6 با موفقیت انجام شد!${NC}"
    echo -e "${YELLOW}اطلاعات تانل:${NC}"
    echo -e "نوع سرور: ${CYAN}$server_type${NC}"
    echo -e "IP سرور ایران: ${CYAN}$iran_ip${NC}"
    echo -e "IP سرور خارج: ${CYAN}$kharej_ip${NC}"
    echo -e "IPv6 سرور ایران: ${CYAN}$ipv6_iran${NC}"
    echo -e "IPv6 سرور خارج: ${CYAN}$ipv6_kharej${NC}"
    echo -e "IPv4 لوکال سرور ایران: ${CYAN}$local_ipv4_iran${NC}"
    echo -e "IPv4 لوکال سرور خارج: ${CYAN}$local_ipv4_kharej${NC}"
    
    echo
    echo -e "${YELLOW}توجه:${NC} تنظیمات به گونه‌ای انجام شده است که پس از راه‌اندازی مجدد سرور، تانل به طور خودکار فعال می‌شود."
    echo -e "${YELLOW}برای استفاده از تانل در سرور خارج، کافی است ترافیک خود را به آدرس ${CYAN}$(echo $local_ipv4_iran | cut -d'/' -f1)${YELLOW} هدایت کنید.${NC}"
}

# اجرای تابع اصلی
main</code></pre>
            <button class="copy-button" onclick="copyToClipboard(this.previousElementSibling.innerText)">کپی</button>
        </div>
    </section>

    <section class="section">
        <h2 class="text-xl font-bold text-gray-800 mb-4">مراحل انجام شده توسط اسکریپت</h2>
        <ol class="list-decimal list-inside mb-4 pr-4">
            <li class="mb-2">بررسی پیش‌نیازها و نصب ابزارهای مورد نیاز</li>
            <li class="mb-2">دریافت اطلاعات از کاربر (موقعیت سرور، آدرس IP سرورها، آدرس IPv6 و آدرس IPv4 لوکال)</li>
            <li class="mb-2">راه‌اندازی تانل 6to4 بین سرورهای ایران و خارج</li>
            <li class="mb-2">راه‌اندازی تانل GRE6 بین سرورهای ایران و خارج</li>
            <li class="mb-2">تنظیم IP Forwarding در سرور ایران (در صورت نیاز)</li>
            <li class="mb-2">ایجاد اسکریپت اجرا در هنگام بوت برای حفظ تنظیمات پس از راه‌اندازی مجدد سرور</li>
            <li class="mb-2">تست اتصال بین سرورها</li>
        </ol>
    </section>

    <section class="section">
        <h2 class="text-xl font-bold text-gray-800 mb-4">راهنمای عیب‌یابی</h2>
        <div class="warning">
            <strong>توجه:</strong> در صورت بروز مشکل در اتصال، موارد زیر را بررسی کنید:
        </div>
        <ul class="list-disc list-inside mb-4 pr-4">
            <li class="mb-2">اطمینان حاصل کنید که فایروال سرورها امکان ارتباط بین سرورها را می‌دهد.</li>
            <li class="mb-2">بررسی کنید که پروتکل‌های IP-in-IP و GRE توسط سرویس‌دهنده سرور شما مسدود نشده باشند.</li>
            <li class="mb-2">مطمئن شوید که آدرس IP سرورها به درستی وارد شده باشند.</li>
            <li class="mb-2">برای تست اتصال، از دستور ping استفاده کنید:
                <pre class="bg-gray-100 text-gray-800 p-2 rounded-lg mt-2 text-sm">
# تست IPv6 (از سرور ایران)
ping6 fdd2:b0bb:f9d0::2

# تست IPv4 لوکال (از سرور ایران)
ping 192.168.13.2

# تست IPv6 (از سرور خارج)
ping6 fdd2:b0bb:f9d0::1

# تست IPv4 لوکال (از سرور خارج)
ping 192.168.13.1</pre>
            </li>
            <li class="mb-2">اگر پس از راه‌اندازی مجدد سرور، تانل به صورت خودکار فعال نشد، دستورات را به صورت دستی اجرا کنید یا بررسی کنید که فایل /etc/rc.local به درستی اجرا می‌شود.</li>
        </ul>
    </section>

    <section class="section">
        <h2 class="text-xl font-bold text-gray-800 mb-4">سوالات متداول</h2>
        <div class="mb-4">
            <h3 class="font-bold text-gray-700 mb-2">۱. آیا این تانل با همه سرویس‌دهنده‌های سرور کار می‌کند؟</h3>
            <p>بله، در اکثر موارد این تانل با اکثر سرویس‌دهنده‌ها کار می‌کند. اما برخی از سرویس‌دهنده‌ها ممکن است پروتکل‌های تانل را مسدود کرده باشند.</p>
        </div>
        <div class="mb-4">
            <h3 class="font-bold text-gray-700 mb-2">۲. آیا پس از راه‌اندازی مجدد سرور، تنظیمات تانل حفظ می‌شود؟</h3>
            <p>بله، اسکریپت یک فایل rc.local ایجاد می‌کند که پس از هر بار راه‌اندازی سرور، تنظیمات تانل را دوباره اعمال می‌کند.</p>
        </div>
        <div class="mb-4">
            <h3 class="font-bold text-gray-700 mb-2">۳. چگونه می‌توانم تانل را حذف کنم؟</h3>
            <p>برای حذف تانل، دستورات زیر را در سرور مربوطه اجرا کنید:</p>
            <pre class="bg-gray-100 text-gray-800 p-2 rounded-lg mt-2 text-sm">
# در سرور ایران
ip -6 tunnel del GRE6Tun_To_KH
ip tunnel del 6to4_To_KH

# در سرور خارج
ip -6 tunnel del GRE6Tun_To_IR
ip tunnel del 6to4_To_IR</pre>
        </div>
        <div class="mb-4">
            <h3 class="font-bold text-gray-700 mb-2">۴. چرا از تانل 6to4-GRE6 استفاده کنم؟</h3>
            <p>تانل 6to4-GRE6 یک راه مطمئن برای ایجاد ارتباط بین دو سرور است، به خصوص در شرایطی که ارتباط مستقیم با محدودیت‌هایی مواجه است. این تانل با استفاده از IPv6 برای ارتباط بین سرورها، امکان انتقال ترافیک IPv4 را فراهم می‌کند.</p>
        </div>
    </section>

    <footer class="text-center text-gray-600 mt-8 mb-4">
        <p>© 2023 - پروژه 6to4-GRE6 - تمامی حقوق محفوظ است.</p>
    </footer>

    <script>
        function copyToClipboard(text) {
            const textarea = document.createElement('textarea');
            textarea.value = text;
            document.body.appendChild(textarea);
            textarea.select();
            document.execCommand('copy');
            document.body.removeChild(textarea);
            
            const button = event.target;
            const originalText = button.innerText;
            button.innerText = 'کپی شد!';
            button.style.backgroundColor = '#48bb78';
            
            setTimeout(() => {
                button.innerText = originalText;
                button.style.backgroundColor = '#4b5563';
            }, 2000);
        }
        
        document.addEventListener('DOMContentLoaded', (event) => {
            hljs.highlightAll();
        });
    </script>
</body>
</html>
