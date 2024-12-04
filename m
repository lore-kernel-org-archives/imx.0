Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EF220E024
	for <imx@lists.linux.dev>; Wed,  4 Dec 2024 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327884; cv=none; b=Fi7azYCW+XC2A/2yeMDGpl39SdvmvMwmM31yIdchC283FbzMo5EfzjhtISA8VGLQlwsXRAwkiKRziJwHWa0iiSpd5Pdrq4gmQIbIVR3lqfhokRZrJRWplYtmjSL9jW76ndZ2PDdXetY2rjMQmEXeyN1uYdN+fQtrzAvaY1yRSrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327884; c=relaxed/simple;
	bh=XPKa8479dz0V5E5HAGWYwOAk2JntXJAee03QMzKRTSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qaiiQXToDLLIPT5GeVppxAAa5uDKTmnETDIqOUuALeaYmBkYvVbquy+1dnrzWoUYCJaKkg/rxWNNCTS8m6+6S2pkEhTj97FuB18zanPhUCpvTv9Nb1hTIFl8bUSHOWHx1nPFaKvNIwApVTcpSxq2Qu7aFl7KKnXXPA7Yj3Ch7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjTPVvZ6; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjTPVvZ6"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so68501731fa.3
        for <imx@lists.linux.dev>; Wed, 04 Dec 2024 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327880; x=1733932680; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfHYxP2GgtlUvSHoyxk9brlVRWIg2t+9FS/MzmulW6A=;
        b=fjTPVvZ6wOFdnO41WLILvaDjtWqIfWvfQlKU/o0ACCbsUK5nsubdtcULDhxNZqdGKd
         DTPGQQsc76MyUWU/rJAUs136q7Mi30RBMBkSKXXqJ9IIiG6TlNw+bghK+ZjkcOJUQZBa
         uBnDYwFMSJ/4OiAqGFtG5lTtDmbNIhrI1pt1UeL0JoJzzRR1dEoy9J17dGwXJk7DydzS
         El7xV0JFUPj/OM38qltI9A1VoBcZW20/CKL6FxSXhxRzucx2NKZryNuEnXn6S63MDTFg
         x9Xrvdrxj4eIdtv1en6mIoMreiNQYUIjQfL4YkK2kP2x0KQhLpy/Knv1nABzanhNzZBE
         4VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327880; x=1733932680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfHYxP2GgtlUvSHoyxk9brlVRWIg2t+9FS/MzmulW6A=;
        b=v5BFmj3zYJLOi8Gy1wbUHMee2VLMASnIEJCvIKhEXc+oC4d4trWfOhEZAIKQ9gpKUc
         817ffjevnh59j+u5M9RPceaF/cDuIzfSC1pgA4MqNAmJNr2IXdNd+SlioENUMbCdvrMH
         MycUXO45/yzl7dc764SBPp4aEe9OWP+yOVjoTovXWLm0bhtkExNQ3UVuzKCPaQ3U3AI2
         qQhh3OE0QnJ7YSWkPEG6LdcCLpz2uYSNy1BBE5rIsmWFKN8INqOteZQXXQIwKE+fhTL6
         ZUf3iwJYIHd57ZWQX0xz91WPENwFUdLbqmXeEVxjmjyYsEyRmkxNp1AsNpm04odEdJYQ
         BYNg==
X-Forwarded-Encrypted: i=1; AJvYcCURvtOqxHNI2s6viYrnSts8J2bRe3VIrSDyyvquOSXPhnegtpqeICC+GodxJfHye+cnfMs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1q4sxOsykM1USrF4FqriaHzzgoxfV7xCp+xYAiEauqK+Y1sPc
	t78uDr2thIvqxLay0kiuKHaElIyXd8s8/G7aJ5UshVIp7z88imKd
X-Gm-Gg: ASbGncs8RsmlROcxa2eiwZAGkRPuqORPIhzAUE9+rYd9x/NofqtfMtXw1uGHL+eIbSU
	kAgjhRJQeJYLHFJp6dxRj5lYJzmMj8Toae9O1xlUjEgpR6fW4t0PdHdMuJkxRi55XJtpX4VLLGP
	DJ65JdXucfeP/RzE4FESARcJ4vwV5V4z4mO+uz2JTwvfSoP4tnGVj3ebwDSmASgeLzpI4MrEGBa
	wH5vr30/E25dQabBcuh2mQ/ksW1STP39QjgLinJz5QLIMptLPDjGBOjLr4vgHOqTYFZQ8y9Hmx7
	rT5xPgTDWMxwbaA=
X-Google-Smtp-Source: AGHT+IEnG7rAIHbmYk1mvEg0ri78z0sWiaMH6QfOyp2+jXWu85eTrMU3PvGvXTghn3BBrs0fux21+w==
X-Received: by 2002:a05:6512:12cd:b0:53d:e5b0:1709 with SMTP id 2adb3069b0e04-53e12a22fc1mr5089410e87.38.1733327879786;
        Wed, 04 Dec 2024 07:57:59 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:58 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:47 +0100
Subject: [PATCH 5/9] ARM: mvebu_v5_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-5-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=XPKa8479dz0V5E5HAGWYwOAk2JntXJAee03QMzKRTSQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvch911bcazEE3clz1x9w8iZQmmDlX4uDR9z
 07T6Hpka4SJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B73AAKCRCIgE5vWV1S
 MgBKEACj7IXfw3FWzIMmgTNg4C/ssmHFA+VrYa1r+Ni1oPjhCk3fKvz5VL2/mwxOcpWriNPVkeW
 VPIdNAzyTkw/TXyFjLYdH5mtGO1cHP6U8l+lLm1qWWImSzXyTraAuIC8iFc69gAUYUh359rj7k5
 L9rNoGsHhAT4/wjcbSCOCEWbf6z3eUuCNXQ+I8Bd6whCTSyLTfq7keKpghzzPK1o30lf8GpDnIV
 bzVYkd71OtDyKkqNXZ0r/zQhOJ0xkuy17fxfKmUwDRXW6zPjEBwkMvGoAcKRDGG2lvrZNqg3L97
 FdLG/LlX1EMP000XJbUVui5oluOvAhF41THQKnHxKdqGON+IuHzD4H36lGMOg8+VpM1Ol7UwYa0
 TpUCbEvI83waD/2riwpFDHgVrgwV9WhJsLhXAyDME7+TJU/+eCg4rQsbqJUlZ5ihwRo4XguS5L2
 petdLHofkYcZKGFR9QtJNrbywhGbRNlz9GiawyoBsBesF6bLoDs0b41fVfltuGiPKihBUhqJNSH
 +vkBmT17upIxRjy+cX9mBTi5qflxTQZcUfq2sNOjc/K7zTfdgzxcjh9sEA8UQHJFxMI36AlWG/c
 vbuqPoDDm0n8i+EVwcG0tkYOkT69xi1V904+mHesdROU8xWDJ/t1zyXLY4oR3mARqwEWhdVYog3
 VH3Y0+T0lxBzxQw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm mvebu_v5_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/mvebu_v5_defconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index 2467afd32146ba7ba2bf4b71053a6747bc58d1cc..0e3da23baab417378afcbc40fca88ace5cd51e57 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -1,5 +1,4 @@
 CONFIG_SYSVIPC=y
-CONFIG_FHANDLE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -15,7 +14,6 @@ CONFIG_MACH_DNS323=y
 CONFIG_MACH_TS209=y
 CONFIG_MACH_TERASTATION_PRO2=y
 CONFIG_MACH_LINKSTATION_PRO=y
-CONFIG_MACH_LINKSTATION_LSCHL=y
 CONFIG_MACH_LINKSTATION_MINI=y
 CONFIG_MACH_TS409=y
 CONFIG_MACH_TS78XX=y
@@ -45,7 +43,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 # CONFIG_IPV6 is not set
 CONFIG_NET_DSA=y
-CONFIG_NET_SWITCHDEV=y
 CONFIG_NET_PKTGEN=m
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
@@ -63,7 +60,6 @@ CONFIG_MTD_CFI_GEOMETRY=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_ORION=y
 CONFIG_MTD_SPI_NOR=y
@@ -96,12 +92,10 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_SPI=y
 CONFIG_SPI_ORION=y
-CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_POWER_RESET_QNAP=y
@@ -166,7 +160,6 @@ CONFIG_RTC_DRV_MV=y
 CONFIG_DMADEVICES=y
 CONFIG_MV_XOR=y
 CONFIG_STAGING=y
-CONFIG_FB_XGI=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_ISO9660_FS=m
@@ -194,6 +187,5 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y

-- 
2.47.0

