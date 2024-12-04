Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6AC20E00E
	for <imx@lists.linux.dev>; Wed,  4 Dec 2024 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327881; cv=none; b=JUoGcCLMiJNOtFOokONX06A1tZl8BTwIvEeXa2bmea3Lq/yv/5Q/A+Qv3XdDiK1jTKc7ST0ZqgEtZuDh5froaqcn7mwJVso/4PMTlF623qwH7ltaZdU6J97mNkL6tIAQp/Qx1neMgCqMa2X8CzEGxM+Fu6N60NbKwjn53jSM910=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327881; c=relaxed/simple;
	bh=oC5WpfuhGcDDhe0hfhnhh6bRD144vLn7vRt/q3XD9H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=boc5CPtG0j52vSFqIO5HWWBf7AK+mPkewIsTwcnkoO1EqmdcKQdNsubnaesbnYrW2SNhokemOAEKbiFKNJbsnVFZ/JXNJMUR2LoVzI7ruIikjsWVuQJAEqgdnFxHQsUcqc6vXDYJkm5n6wmtLl6mPLHDQ2oK6ylzOr7IL0/jFGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mu8Iw0d+; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mu8Iw0d+"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e1f673ca8so568083e87.3
        for <imx@lists.linux.dev>; Wed, 04 Dec 2024 07:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327878; x=1733932678; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvkL+iGL9dXyN4VynI/wPtrLJWQRP5/GbBl00TeCCOM=;
        b=mu8Iw0d+CCQAReGejoTeXVS+uEaLQBzXPQIXHsTfdLroWL9Rjs6wmJUlcwsoKzWOX9
         8ywESlr4z6T7Qpd4LSLCtWKrkgZAA1m5npkAdXKKTS3iCffbIKUPkga0id30FxBqGFSL
         Q7gvX/auBq5FRbNVTjAFUXh4mAVhwHbBIpk7yoXTCDY1p0KjYxg9v0wc1CxslILDQ5oR
         fJWd4l/Nhzv//jYi1YO+xCSqZLNzki2zTLSbiBk0mgBZaKzy0ggGQDMvESW2zl0eCdSR
         gKXdZYOSmCK1C/0eTXNogMokFTNam/j+eCukX+LrnTEcjNceBQ8Y4RCGw9fiZdD2O7mU
         Dm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327878; x=1733932678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvkL+iGL9dXyN4VynI/wPtrLJWQRP5/GbBl00TeCCOM=;
        b=xLvw0St7Edct+/nR9zvYqSwXG8fFNPI3HcB0DS+ixqjtENdGn5ovo1vn+BJtZKELXD
         Zx1gRwNikEUWlYXhlDbRjjzEcJOVXJ12qMazbA8gq6cK8X4dogW9PVrZvTKEe2JQX6Be
         2SyROiolR1wweCitdZniluVGazpWxks6tOprv7HQwuxptFxQ8eB2d2CNLqafLcYgOlpN
         svxYDB59y+vjNG2VW2MbxM/BontRl8QEhQZsrevDhc7HXI7iP4MR+nO5V0SkTlz35/z0
         OZq/z4arr56F4eRfgn9xM7uREEWHx1UZY7Cn5SLryUf3J7UU5xybhjG7cPlRk+F+kZ7S
         B0RA==
X-Forwarded-Encrypted: i=1; AJvYcCXRBKPPIiNAwRA2AG2juxqs0SAaGI5FqSVfczswHxYOiQ+6YHVfWh9tqszIWddSDTQM9/k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6rt0tzjFME0v8KCep1RiOFiF1xgVg21GRX09WxtY5k5Jwpl8B
	RBTWRpRhhwMs21iQIF9o9ocUIoAWl34thO/bSCHYVLp0kZJBpYY9
X-Gm-Gg: ASbGncs4btybHTc3vLCap5YRVdcMqjnAH4psxyCQLDRZkChHry9vCDoRFQsIF6G/H29
	hHd73v3cf50AGH5iLjqdZW9jjvf+E4iULSWqggZQYdzstMBviNGTKQjwDuDzdNpJ/qR7vk1GTZb
	dTPkYN+kTCO8LgOStvNvCoCryYqGuVzGzP5wxY2NoIivaXw6DVRZjXcE/T2+fGzJLRi8pp105xE
	ImN/jjaGf7swSmGTxnWiBcvURl/YPwDVkrgL3wTmh33hwPLZiDwUv6nvjjzfkg4Lw1NrQehcHky
	dzJB6lsK0tgfOzc=
X-Google-Smtp-Source: AGHT+IE67J6k3HvkHJRG20ocHCZ9O3WvIIZUThbSEm9x3FYTGNUFEeEanYYSp5FF2xnbedolSUZgiA==
X-Received: by 2002:a05:6512:4028:b0:53d:dbb9:f3e8 with SMTP id 2adb3069b0e04-53e1b878e31mr1822141e87.4.1733327877559;
        Wed, 04 Dec 2024 07:57:57 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:55 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:46 +0100
Subject: [PATCH 4/9] ARM: keystone_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-4-86587652d37a@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
In-Reply-To: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=oC5WpfuhGcDDhe0hfhnhh6bRD144vLn7vRt/q3XD9H4=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvX6+Vxmycmjnq4bO+MBXpUvKvu6jheX/FrG
 jK4MKR7/uiJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B71wAKCRCIgE5vWV1S
 MuvkEACuj0rtF9LabF7AJ6GXYrD+sFMrZqOK2SkVUNMfkMAAd0t2TS4AYvVLU3zaQbSVi8xoE6Q
 wOcpY9OvrnIWBmCV5rcQoJRDx14H6ry5LcaVrLWmvPvWqb2aoSIpxKpngH0Z1uQY/9Kk3UBc0PQ
 33t1VSiln8g1/S/L6xKTfuPTMMVQrd+R6vjMHBCS2RccCBxqb39sDZwA1dq91KiWNVG+Ca/8l7z
 iH3fGxtldUH+0is757NpjHKBqqu/OvLcWqojSSYVK9lGCuelYDIuBywqGpHpK06WJ8pCcbQgJHF
 S2tVUvEfP2oRFWGeKhVB5Ud96MbfzBIkPtHICuMAGBIPd8gD6+mTiLE8gQwDDDmjAYs2ja124X4
 bY4pqWVlQsgX4WvPgdN5tvwXFaDTgTfFQy1jYCpKU6MFVBlSFHtrmYoGe8/2wwdB3qZ/N2IujuD
 Y9gSW6MSLrQqlzy5twUNQQ+oQJU2PZ6T4LlRh3kw3hknel9e1tWahXUXwUxatTgKZAz1UKQBh6K
 UxVJebrcNHapNTNoInzydLPmtGunnInrR0EzfwF3VPrGC4qU38FBJ98BA0JS3KuusiZO4s7LGX3
 Q+AUnU9h70Rbumki0AY1Vy20+/obpZOb0XIJozYuIHvYIQVOEsmF6E3M+4VeZQIcCs+EFER7jYg
 96GgoPbronYdj2A==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm keystone_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/keystone_defconfig | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index c1291ca290b23c7519a0c34ac5951fc0942c45bf..c5682f2728a176c054313f351186f6e548cff8e0 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -11,18 +11,16 @@ CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
 CONFIG_BASE_SMALL=y
 CONFIG_KALLSYMS_ALL=y
-CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_KEYSTONE=y
 CONFIG_ARM_LPAE=y
-CONFIG_PCI_KEYSTONE=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_ARM_PSCI=y
-CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_VFP=y
 CONFIG_NEON=y
@@ -62,9 +60,6 @@ CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
 CONFIG_IP_PIMSM_V2=y
 CONFIG_INET_AH=y
 CONFIG_INET_IPCOMP=y
-CONFIG_INET6_XFRM_MODE_TRANSPORT=m
-CONFIG_INET6_XFRM_MODE_TUNNEL=m
-CONFIG_INET6_XFRM_MODE_BEET=m
 CONFIG_IPV6_SIT=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
 CONFIG_IPV6_SUBTREES=y
@@ -90,7 +85,6 @@ CONFIG_NETFILTER_XT_MATCH_MARK=y
 CONFIG_NETFILTER_XT_MATCH_MULTIPORT=y
 CONFIG_NETFILTER_XT_MATCH_PKTTYPE=y
 CONFIG_NETFILTER_XT_MATCH_STATE=y
-CONFIG_NF_CONNTRACK_IPV4=y
 CONFIG_IP_NF_IPTABLES=y
 CONFIG_IP_NF_MATCH_AH=y
 CONFIG_IP_NF_MATCH_ECN=y
@@ -101,7 +95,6 @@ CONFIG_IP_NF_MANGLE=y
 CONFIG_IP_NF_TARGET_ECN=y
 CONFIG_IP_NF_TARGET_TTL=y
 CONFIG_IP_NF_RAW=y
-CONFIG_IP_NF_ARPTABLES=y
 CONFIG_IP_NF_ARPFILTER=y
 CONFIG_IP_NF_ARP_MANGLE=y
 CONFIG_IP6_NF_IPTABLES=m
@@ -117,7 +110,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PLATRAM=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_DAVINCI=y
 CONFIG_MTD_SPI_NOR=y
@@ -144,7 +136,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_DAVINCI=y
 CONFIG_SPI=y
@@ -189,7 +180,6 @@ CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_ACTIVITY=y
 CONFIG_LEDS_TRIGGER_GPIO=y
 CONFIG_DMADEVICES=y
-CONFIG_TI_EDMA=y
 CONFIG_MAILBOX=y
 CONFIG_TI_MESSAGE_MANAGER=y
 CONFIG_SOC_TI=y

-- 
2.47.0

