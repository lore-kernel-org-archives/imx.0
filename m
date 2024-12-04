Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D63320DD64
	for <imx@lists.linux.dev>; Wed,  4 Dec 2024 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327878; cv=none; b=S5FYSderyssAbu5e6wBvDaUO9FPUFyNvZH5Zcw3PrP9E7INuxIUqROxcuFIio3IkJjexDkpoNUPv9WGD9C5L7arlPkRz4uxGMg9tXXpJttGSOG9M3rkR/qhvPCOTXN06DdQIWcpfHS1HcXiLEEeqeNJO92rhxGo3q0FUued89FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327878; c=relaxed/simple;
	bh=HdpaVHroT6iC/mIuADXOnpTo/dSXbaiBN9gF6efkgy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJU4Q9v7KDLSlWBhHztemukgNtg9TxAPBv3AGaSeLbAd0pwcKBBhl/Crlgc06Y9f4Uwv+Hjf6NqdWqKV7PzwmYkYqrKABZNipArdTsqnd9+qXWhD3vlgMOLcCPa4Vc2u5VpInQjADPTgUdens2bk4kTAOIK+WadV01YlAmIVj14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+yuU8FN; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+yuU8FN"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e2121112eso53126e87.3
        for <imx@lists.linux.dev>; Wed, 04 Dec 2024 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327874; x=1733932674; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pE54ERLXzMFHOSVaFHGMF5JbmllGHfQ89Y0kI1gToQg=;
        b=b+yuU8FNIPcxUAgAWITU1UenN0u09k7g1ywSERcj44n1o8We3bu+jod/IQlUjtET6d
         ea+K9PgpZ6A+3r+b7T0jc4WYcynJ/GB8F/pjMKhK1cjPpPupmx/ywg8lSzdi7dGOtO6G
         Neig17xhydxKgksG7slzj82P+t8bWj+JwIy0YyAxC2rouBfiOsU5GSaFKWiRBCTtnNmh
         e+DVljwpa9wmPeV1oqTdlocpa5Fu/DfWJWmbWfWVcZKnQluHJIQ58A+tcclCgyTtWRGI
         u5IWWdZBlhZrzzhOcy/HwYan2dnU7zTO+Q8tYws3fHOXfzdSKO0Sc071ZpwehTO0zyIk
         O/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327874; x=1733932674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pE54ERLXzMFHOSVaFHGMF5JbmllGHfQ89Y0kI1gToQg=;
        b=JqaJOtICkst+lXIEJAIPfN0A/eCefpQWVgrUqy4G9Dz/6xhOepqXsjPelshg5aUPi2
         I4EqOvsZGbifUc/3kCp4m1a7kb1EvPC4HJqnLQz4zGjcMCae6Wrm/Jpd6lpBOXcjyca6
         ENL+cPfX3YvBgvEfqn2aT1UFbKJzgnAVH3BWmjybHPWmYVNN/92kUK+4t/I29AdnVHKH
         KqHZT/9+X20xfnyMbeFfvKxbC1H4cvM25Oer2rsGS4I8tCKWss+Q3dosXwDZlSDLONFk
         5qANz/N5Fx+XBvrPgR4AwBRrmP776HATIkDozbn+YF0KAaWDSMoyxiVg6/g0R/9ThHms
         qd5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsLMje030HpG9Dd8z02pDcLSSbklFu8teqvTulQUsAZhYSQDhzPpSqnMyybpqmJUafRDI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2lhrJ7glypR5vy1RtzevZ9V6LSMwWklYTYRIoJ4iCZp6RgTyh
	y6wYM0yt/gLctgZWfrVvz5SdCsEOhqPcUI5HWHc3BEScJyp+Q4fm
X-Gm-Gg: ASbGnct7uO32PWRLaTdP0FQeKqZ65Hh62IftUF2PaV5pWaNd4558ITGm9u511I+zdJ3
	XKaXeIjIQRDP3J6fR0cqiwcdJbLge+WmISUBbd8Ce68cb/URoLX9MEIoz+Lj650LZK0AwLfXoU/
	Lemwcjm8fQJy8FcXFIC5LNJar3QMlUl4IHRiHt6rO4ILMkaJtt8WdFHgQVlfj215E6zDoukvzTo
	jUikiZNV5QSRBQOfb71O6EGp48HqkVmlYW7/Kui4rMIlKpKfAxHexbX25YRlzmrKzaOtrOZRuFr
	rE8OZ9UrGvqG5CU=
X-Google-Smtp-Source: AGHT+IE9tM02DUH8MOCjzjoQQbTra+vnau6HGJnv0bJ8SHLzV3mdbCN08x9wN5NL4MZ4tHud9pXj/w==
X-Received: by 2002:a05:6512:3b1e:b0:53e:f38:60eb with SMTP id 2adb3069b0e04-53e129cd2f1mr3878419e87.10.1733327874359;
        Wed, 04 Dec 2024 07:57:54 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:52 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:45 +0100
Subject: [PATCH 3/9] ARM: dove_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-3-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=HdpaVHroT6iC/mIuADXOnpTo/dSXbaiBN9gF6efkgy0=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvTAsyCMOgmu7E7wO60y6tKwceJVxfi79/8L
 xMvNhX1cYyJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B70wAKCRCIgE5vWV1S
 MoSJD/9KbSQFCcwv99pqsWFQON7Uam7nPkP8bGmLJAjlaK+anFeRQOjNCs8z+ohJSol7YY3eFwG
 u3x8NtJ0vhmHurJkTv5jzI2UuAT0povAAGeUcZPtB0XWm2c4vo7wdu96TazEMlr1BItqO3xogVn
 wZfE7jIGaXkPYaMEcJr8fu+kgGAUq2Ie6yIj6pLI4Shj1Q5C8ObGzYJttVJwAZscK+USBJNt7cP
 Y5hBvNZpl3ObqbeyMGgntiDjeQGiXblr6Yknv0oXVDWHRR8V7YlV22DNLcTT+2JTivfjG3137RX
 Gnernb3VmE3Nk/VBJE1MfwInv6y41HakaQ+MNzq//n3Wj3zSAUfo149qMfmvxCMz7f+1W6tGdNU
 NtSCYuyA6+Yfp9PWKW9M9mlHxEIBIuUhtlJ7XXbpvPaGlEW5tv7pZLwSSnc8HIqYYqTy4OjEP0t
 MOgVy+BGu+hppz7NhMGfZ63FsnqTJTVjDq0mtez7zY+yzJ/buQS8L8BhZQ1Mq7GrjgD0HbmPPvB
 6KYr9rkhVwqUUS1xt1HZ118kwupanjZH7e1XLxLR1DryxkHDSAabhYDO3d4iwuSc2wrKsgvLc+9
 zYQdAx383LofbDG6NLIOJTyVBjH7/jCt29rzXvjUs0ay3ED2Y1QIjDSqHiHuTsVJ4EPGFaBdcZX
 gBi+mFXD/llylAA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm dove_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/dove_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index 2849d17f585660aa8ff6aad5d554c4bb2d794c60..c3e19e6aa6c9d8e40ecee7d97d185909db61b6c2 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -3,11 +3,8 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-# CONFIG_ARCH_MULTI_V6 is not set
-CONFIG_ARCH_MULTI_V7=y
 CONFIG_ARCH_DOVE=y
 CONFIG_MACH_CM_A510=y
-CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
@@ -40,7 +37,6 @@ CONFIG_MTD_CFI_GEOMETRY=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
@@ -53,7 +49,6 @@ CONFIG_ATA=y
 CONFIG_SATA_MV=y
 CONFIG_NETDEVICES=y
 CONFIG_MV643XX_ETH=y
-# CONFIG_INPUT_MOUSEDEV is not set
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_MOUSE_PS2 is not set
@@ -96,8 +91,6 @@ CONFIG_DMADEVICES=y
 CONFIG_MV_XOR=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-# CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_UDF_FS=m
@@ -112,12 +105,9 @@ CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_ISO8859_2=y
 CONFIG_NLS_UTF8=y
-CONFIG_TIMER_STATS=y
 CONFIG_CRYPTO_NULL=y
 CONFIG_CRYPTO_BLOWFISH=y
-CONFIG_CRYPTO_TEA=y
 CONFIG_CRYPTO_TWOFISH=y
-CONFIG_CRYPTO_ECB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD4=y
@@ -126,7 +116,6 @@ CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_SHA512=y
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_CRYPTO_DEV_MARVELL_CESA=y
 CONFIG_CRC_CCITT=y
 CONFIG_LIBCRC32C=y

-- 
2.47.0

