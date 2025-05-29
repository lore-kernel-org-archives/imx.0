Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C90922D796
	for <imx@lists.linux.dev>; Thu, 29 May 2025 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529365; cv=none; b=cM7+WsMrIwy3o3UxPUHpqui3dE4otJblsVSwrfg1arc+jYafAQkZd3FCpV/A2fnXshuvO7dX5UDZ2HHWK57WLowdtIhmtXFsIU0y0ZjsfcQankB0IC1u4vtx3p6f/GEZXOtBBv6zTdKfHsUMopUelfehX2bWqvSJq+meOQe+ank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529365; c=relaxed/simple;
	bh=RpvvMj/K5uVzGiJH1mIG91vdZyDBkvd7mqNAf+vhWvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXTOIAP/SWrbZcZOhLCSEHFL5pUwXQsy12xHiiYUCdladf0s7WnIoT1SzOruSGPozonXL9v/qAlYQ93shU4/v5JUM0rICTQmCWWYqMKoJe56cNibQm9/CaaE16ICJ5u2BVFeC0lvIWFJ7Rd9aP2D/8N6O7aXD7+lZSACiHq3jS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FkpGm7CY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FkpGm7CY"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so161143666b.0
        for <imx@lists.linux.dev>; Thu, 29 May 2025 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529361; x=1749134161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=FkpGm7CYdqn0QnNJqn8HJNv2OYD/DUzWLDFTvuxoV3TMLYQCPDP4yly0td5UPs5hph
         /PSgeBu/wSpq7Ipcw9Qp51AHXNjIcXIBLk27kzNwTTIdPLsy+BfNSPrkvPckG62lqGnJ
         BF/UCulFiZCzsQyxBgAc9Eo8zw0Xl7Bm1dHeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529361; x=1749134161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=tzg80MVLGQCkMsrH41f3rq9SAQfTZFC7pca4EjeVHXnfSrGHSrfhE7L8TIhz/RCh/h
         K6W5Y1CW/sMc3XRwcX/REo/RMrD0r0+Y4xGqRCvcDvGycqY7bNkbQV4Xz+nLR+B+oaj1
         FLtmlofEzUDLBRnCNFUUYDDh164s1KD0HEiUrhcAYfO8+CU2Kh7FZBNpeQMgi2U0oR6P
         wVMH+JhKQJmaozafT5S9c+WVhkStdmmN4DutZDrFVYIoaT7wsuBDdmkK0ElwrOr+1TEv
         TGcnXhaC0TwIbV1VV7fPlYvagDO5Ceo09kttN7o+QUjmru69EVuhT6qNy02MzZsyCuPZ
         xBmg==
X-Forwarded-Encrypted: i=1; AJvYcCUxpbXWGwlJVjLIfSHnB3BBejUYyyAdkyfMrN7ht+KRM0lKUljA5/8lOJXU4xm9rK2fGOg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTdmphBVD7AvlfyZ/Jl5JDUhRafrRlQK6H3cyO+R2KcWww8Sia
	atGw9PHRFOe1aRzgVx8qQ7Rg0B6U6YW3YrDjJ7/ESr0ZDfgZSr7Zpl0oU2aOQB/6Cdw=
X-Gm-Gg: ASbGncsqt6mRUp3VTfDY9aJiHRkW7tAZYC56H7fswnfCNo8r6Qt8Z+/HlUkv/3ViVcJ
	FhGyB7aAxDk5OSpETUsMeONp/sJxXZqXal+9SPUyXQgLJV6OIZmRtQG2x9QP+066Oxjbxpajk38
	8SYwOQv1DXe0XeDq4jkhr9uqvsbMR5SKMO7/lEApJOea9IP1FKwqKx2V55i2zqX+QB6VGEloVUd
	uCao2Eisv3AEKlbrJLbcvaQwOs8vb72YTCOKNlGBREyOAd39I2sf+DyvffUvZJaezBq40+nAjUh
	f41lomWy73U+QfdEIx9FgQqmkGyxvFM3GOYoHJpiEnNaQgltfkND161B3GUBioeSLnVgGRMZMWT
	BUtz254m1kC0IT/tN
X-Google-Smtp-Source: AGHT+IHLbgs6cMrNEhnJZTad08BJDPcqxBNJSOsMwsYd7juFM8aU5XWIyBIRrYfe55LQYTGTKQIT4g==
X-Received: by 2002:a17:907:3f1f:b0:ad8:96d2:f42 with SMTP id a640c23a62f3a-ad896d21361mr957537266b.36.1748529361561;
        Thu, 29 May 2025 07:36:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:36:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/6] ARM: mxs_defconfig: Cleanup mxs_defconfig
Date: Thu, 29 May 2025 16:35:12 +0200
Message-ID: <20250529143544.2381031-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generate mxs_defconfig by doing:

make mxs_defconfig
make savedefconfig
cp defconfig arch/arm/configs/mxs_defconfig

No functional change. The goal here is to cleanup mxs_defconfig file to
make easier and cleaner the addition of new entries.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/mxs_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index c76d66135abb..91723fdd3c04 100644
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
2.43.0

