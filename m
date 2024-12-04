Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0408320E03F
	for <imx@lists.linux.dev>; Wed,  4 Dec 2024 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327885; cv=none; b=K6dpOAElo32O/oQz+JPsA9qFK6l+15AQu6vigLvsqETVI+UfOF4u5Ui5io51MO7Ap1HmtFHEbwFwm7oCyZ7sWYISu5IAYTxwEJ+6WFjjk5owNjF5g3nF7LRoQo/LFXWNSUiHcwkKDRX3KGcNjLNAu1R9icRYbT04BHemlPhsEe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327885; c=relaxed/simple;
	bh=ajy+2nCoY0jRWJ/Q5MIKS0ER7X03c4YJ6hvrLukAy44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSEE/Pjho+aMq1ziECfCs6XfhAyfxtFMnYuPsPZPlEdMYrmV3JPzApNS6w4oAsptC5srPmf65OlEaHUvjfmA0sByz23mUY5rh82lJ3e4UuZKx6tm5LDqU6VqXTBJs2c1FzTqa7SZ9pnDsWFkiVf6dReGSH/WZTMxOCpPMx2v+6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyTSeL8c; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyTSeL8c"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df1e0641fso7595068e87.1
        for <imx@lists.linux.dev>; Wed, 04 Dec 2024 07:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327882; x=1733932682; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itezlPYWNMkC0urTxQzlWsd9ErHvjjwDgsS8k4F3P/U=;
        b=GyTSeL8ccTBAK58RH1WMmHuiS/wA7HlTfb77U+EVWKZ8Ha3GHPYnn8nHKEwL8OpAG9
         PkDH9wWdehKh9u3XN0o7Ql6sR8A5CIwagb50utsv/WmvdGG2L2sbn/JRFQ7CAVXir3C7
         F10+6GCN502UGK4futPon7p39tC+f7uEiVRIc/IrSj3W+0UrRcpuZ46ivAfxCS6xyU0e
         7/vjFltHYghOOidh/mgGLXgHTI5IC83/pFEzKgSVBUnkk6nebay0Nli+BM5qzDOT5f09
         KnFnk9KNJMycGOuFS1liFdNB6+8UIQHsktyaRb84Wlk2o8CItZlwBsbIHH8eAihSvead
         KcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327882; x=1733932682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itezlPYWNMkC0urTxQzlWsd9ErHvjjwDgsS8k4F3P/U=;
        b=R9LeYetdmHWaH/xIkuRxTxbalmCRHYAKTjS/Zq/YHIZoimYxAR8OPVKim0Y6RsFLaQ
         p4w1aoI+gPPk5um+DhdbVxQPGa2pgmelq66+QRzGPNjuC0rwJwu1AHjL+IHX74uybvod
         QWnsM3vjMz+nCds4SHalog+FVh5cW7zMIaTtAn7DoOlm9W0xJHH7Wl6vMfYjKrMadXY0
         uZZLzW92MPx1PfOLcfI56ybLaj6rlqLPt67I+crwYzNNf31otrS21EpR0+wUgMxer2Tq
         uwKURjJKesQF7dVOf747GMcCvrozuWBnkXkP8Rr4dkSPMSSuLPCRQdJK4ia5l2/mpNcm
         GqWA==
X-Forwarded-Encrypted: i=1; AJvYcCXoKxW5Lzawt6gaig89zixNF9tjK8V7AWg5FCxv2hQMkQ4Ovc3T9yrCrXacyLh/yC2y6Ao=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQhDZCXxD+VAVPfhOiHg1JHT+1gQFM3QbA8aFFV0Jm5jVKqEji
	LqS8pHI+DpIoGcGLoTNQlKoo/tJYCZTBkBlyQ0FZ/LfdF4Iuq4/B
X-Gm-Gg: ASbGncvSxGmpt28O+d3SP746zczmrdgFTC1cN3iViQFoMDtm69zULEoIh2g9LceU+Dg
	X7dIa43C/1dnsEWq8LiRi89HlmQoJEsJB1aiOmFocFlNYQuj28kyfbtc1Fv69CXxRdbpdy6SbvX
	IHwY4pxrkl+ruth9e+Jau/fxeKQMSU/pqPFY0sgMfEOTmKceF4Mho/hImytF+q+5BgMD4xIrOfO
	BdHMZXwq8FebS/WI3z+TBFI5vIyj7nYJFde7u3oFo2nCMmT9ktesZ8FAHQyU0maSjKaqo7sRonC
	S3hZaFDjxnZfRWs=
X-Google-Smtp-Source: AGHT+IGlGfDEsLcZJyCzWffbXy66rLrrA/A5XMM3tlpdjuHEhy8pE4BtS8IqEvBnXzldcs47eI0LSA==
X-Received: by 2002:a05:6512:e8a:b0:53d:e5fd:a445 with SMTP id 2adb3069b0e04-53e12a06e21mr3757767e87.32.1733327881991;
        Wed, 04 Dec 2024 07:58:01 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:01 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:48 +0100
Subject: [PATCH 6/9] ARM: mxs_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-6-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ajy+2nCoY0jRWJ/Q5MIKS0ER7X03c4YJ6hvrLukAy44=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvhynCLEQYuXH5PnR++kC2KxmLUbqcle8Eoq
 qUMUAZbFfmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B74QAKCRCIgE5vWV1S
 MjC4D/9948E/ZGupe0JL9qz/HV+vq88mwiMZfy5bYuiLi0mawPEdE2uesGekyVhJlUUn3u5fkHH
 23CCFWd79I360dPFYEuE8Pr5SaXEFO9Yy5CF2HTmuqGs9LjOoN6ZAt/dbH2pd0/teY6mKsMOdrp
 bBdbxn5o3R2QXMVh9MhuIG35bq5lq75RdxZlfPE6w/DEVxuO9cu8loeetlAAjvBg+ElOViZXnTa
 uo/QdfGDXKeL0FrVHWOrTFwhxlCsHpVxf9g/Sl5KcpF80f4YmDymMQzGZxZL1/cvHo97aBMy2Gy
 Uija49yz1R/kX3N+koyGQQEWZ5zrg6Gtay/hmGh9MMvVFkCaJXBVpjTSayD17D7ueVO3leJzLCv
 /TVEzz3K2PNKo8xMO3Bf1H8Cj7ffX3ZM+oZf5yVXHg4XGYYDU5/nH2QScUkz5bYi29vLrZi93rs
 etEkCa2JbLpnRGQsiiBs4ekKzqyJ3jhDm/F0lmT0PWLgYCfngpabuwsFJ7VVwKT0D4KYrHjHnj6
 W2/dbCTgkvYcji04jo6WP2r1k+nLDsPPuEqtjK731LANzG2uDxRFLFu/Kpn7Xew6eqsXOhg6B6H
 Bx2MYz3m1z4bTIwQViP5Ust1uAgH9scAprUt8I+fGVbYuXjHJgi1SQs7zB4mk0+cU8tSXmt063s
 NGxSS/YDCnB9WzA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm mxs_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/mxs_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 43bc1255a5db9f4ed8f65a98a69284e1439e44d2..946f508ad62c326a0651c8a5da0626ee33c9bfd3 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -32,9 +32,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_CAN=m
@@ -45,7 +42,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
@@ -60,7 +56,6 @@ CONFIG_ENC28J60=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
-CONFIG_SMSC_PHY=y
 CONFIG_CAN_FLEXCAN=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC95XX=y
@@ -77,13 +72,11 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_MXS_AUART=y
 # CONFIG_HW_RANDOM is not set
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MXS=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=m
 CONFIG_SPI_MXS=y
-CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_STMP3XXX_RTC_WATCHDOG=y
@@ -138,10 +131,6 @@ CONFIG_PWM_MXS=y
 CONFIG_NVMEM_MXS_OCOTP=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
-CONFIG_NETFS_SUPPORT=m
-CONFIG_FSCACHE=y
-CONFIG_FSCACHE_STATS=y
-CONFIG_CACHEFILES=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y

-- 
2.47.0

