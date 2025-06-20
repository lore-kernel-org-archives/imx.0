Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D1B23507E
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406801; cv=none; b=I0mI9ENIIRnZqHeqYJ2otBEYKoxLqXEwALAdYNkf3vvyUGzq0vCiBjCV6AQcDjwYSx6stYUdlog2O7KZRCRUCkwpO4gap/j5MeE0gs7a4BURfgJeUmkympvUopwNKWPQCUu+ZCRNueRcKBs3gF5VzhJHm/hV4bZN0NHIgWXIe2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406801; c=relaxed/simple;
	bh=RpvvMj/K5uVzGiJH1mIG91vdZyDBkvd7mqNAf+vhWvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7OmomlRJjSxpf/wgpvfoQHusNLv9n4ItOc79B0MHVFrHDJtDdrP8NbIAL+N4vm9W3vQ6hjr+UnOHPjj3wZeiQzB3XFzncqYxrhLIOjQqmF9FRjibW2xwcRsTk6sO4HQOsHdZfI/h2MpIl5NW7r1ZkFo34tnz3oxX1WVRYeqwh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=CC7wmM2A; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="CC7wmM2A"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so8967945e9.2
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406798; x=1751011598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=CC7wmM2A40xlbMwfEW1tkm5txo0T8qLeNpeVr51m9gZrbtw6M/9d99xzKHBNSA7Mbt
         Zm0hCWkP0QqSNnhCQGBcXA6RrQ0ynZq/2QSku/00RNEpKCBsBzBByhwfRjxTqxzG/3dS
         LePCMf3AIP8/UdMQBTCTx88kMNlrPzDf5SM0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406798; x=1751011598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=ULvt2MdlwjwCMwhyRZ/cQnE39gAGzZwzHuMHnvs+U/8aT3ulKuUMBy0NUqziG46vHf
         QmjZwXiO6Jk+wUDRSUOKqApI/nzxGFb5HBj5SeAeURjxxHY8koh2auTePX5F91+w147d
         NHr6pe92k+bRx760A2usRUFlsOE8eSeWleMKI28m1F1qOgkePYN3zH70LfV/hWnene0k
         4Ep+eorEtYGzONRBPnzLm9LR5gWIzHZdRb+jzYlzyZmbp0nI9IVkTSAsCkZpDRHTQ/DH
         QpR/+zI6QoNMT3Z2KTC09/E1yanyO+y5CMWOp9XWZLGwCf6uMO654UtvoYt9ELMSlQ7e
         iwaw==
X-Forwarded-Encrypted: i=1; AJvYcCXqzDSGEDQN38Nbvx0jUgFGYyI5XUpiLa0OlEadrUQaE7ahBNZhDWukbJQWLt6PKbqEcsY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxP6LxONGwaa6EBwnVC/qBWyXDSeXej7Lv61Y3jy/q38C13Ge21
	Xj1z5QuQdhWcn+LW3d1h+zJ7DtYoj8vBVOkYOmq20ORq/W+PwcF9Q+pAO9W8AcM+nPY=
X-Gm-Gg: ASbGncv7vBcVzzdKgyksGjf7qa5lzAcE7umHykmn8W5p/RwrOhpADDP0Saz1GMoe7u8
	ldSu40NpZk09KoGkAn2Ic1IBLp2S35Sa7X2qVGYza81+dkh1TFNWaFFBcYiQB9t9xffJ4GmEkdv
	lzaKa1y15na7571hTsrp6ajQgE5wxmVgcw1N4PqkUmfYCg7z+ryF5gONQZxLQ09tTDcBbnLhRnW
	PH0+bSQragSB7UOZ7hMZAHlPKfM9scKC6HX3fDZ9ohHE+9ZUc/t5Fb7Axjqh648jFbFlqL2aYP8
	qqlUyUk+T+j2DPRQkSbgGvWD5dIoe5T3kUS1flX38TcOQ8j43ptuoRAJCJaNI0J2Az/gr9XoT9Q
	wyBNDi9InNvdoVDYaUowbBZiAsuOpM9agpq+K0Dd+bRaKCc925Q5S
X-Google-Smtp-Source: AGHT+IGb4WTKjAgplBaJ43AcvLwV9rDMcYvZ4FV3Nqt1/QYZAA9vX0TgK6mvlDJ83u+kYk4oGRTS0A==
X-Received: by 2002:a05:600c:3542:b0:451:e394:8920 with SMTP id 5b1f17b1804b1-453659edd18mr14377475e9.27.1750406797641;
        Fri, 20 Jun 2025 01:06:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 4/5] ARM: mxs_defconfig: Cleanup mxs_defconfig
Date: Fri, 20 Jun 2025 10:06:20 +0200
Message-ID: <20250620080626.3580397-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
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

