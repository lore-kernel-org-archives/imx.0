Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4874B253F13
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464213; cv=none; b=IuH7++t54rxBmn6xGb/XF8hldJJGevDS4oc14Eq+oALbDOTNFQvStH9N9Q+PfCbOiO9skc87jeI+/2FCnY5bKBaKssqhsUnqM97amfDpPc75MHK4sKJQ3aVGTy3hX8ZqWYmkyToLgXDaA5DGR9pBLWQhvgsvbU8Kyi8QYARghLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464213; c=relaxed/simple;
	bh=M6CQ0I9UViOibscaKvlBMNkGUpjdMfPDKx1zLd5FbSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqyedwDCvmsEs317efxv8zI31tsms8pjjJPl5Htfnsj5cZzI1yhdsB2B8EJP/uZENQ+25Y4E/Ezv18n992my8hb0wxk3VRGxe7NEQ4VYH9KOtZK+lGwdb19cAa3PboYGPJ+GND7JXWsYZ5hhUfuN+ScuqdPZTWv/eMoauZKHFm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rqpIuwHC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rqpIuwHC"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad89c32a7b5so663057166b.2
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464210; x=1750069010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrMVZ4aXgdDOQEK1eAuHJO+N5MnoZXBYEmVjCNmWh4k=;
        b=rqpIuwHCGGIpT4DI97sCF+0nyP5ek0YAZfjxjRLoYxFEzRzNDOuZvC0377YdSqf8TG
         OCxDhThHPoENNX05FRzR0lHQt9rEitIcNq1NIRT4ChwG9/5QOx0ixocz2Gu7d/KgX/PX
         1F4awFEeVUs5NS/aaEWvisBD51drRcEAV6QAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464210; x=1750069010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrMVZ4aXgdDOQEK1eAuHJO+N5MnoZXBYEmVjCNmWh4k=;
        b=UHTH7NWK0Vr80a1VzOhabfvltxzz90OCFCQ3+9YGJOiZbeu4K32S84k4yoAkfXGONi
         b9jlKNyTFuqFFFqyW3JVUMPzXMjnVWNAyAsUKTICHYAvw9u/bugrAZ7/ikZIt974/Xrc
         5tcQHaqtuVDa1gTxrjtpV+f2RKzVLQpMCuX4gnteTWMsJc7s0L1QKETtFkMHeRufEVWl
         Jjxd5diVVmWnQW0dzJc1QkcDpNytET5eY8xhHt3hbb966m1QzeKHVN5qK1XlHA01Mamj
         wy2n12fDxs7b8M62Bke//3Oh2OPer3xRunshOAUZuHR3uGGBmzZNCbjL2O8KlIGiGdqu
         dR3w==
X-Forwarded-Encrypted: i=1; AJvYcCUNQM9wDVITp7kjde/cluniIwUYgc6iGvlNQlzp2quRtF6JDiYggJ3VICrb8riuaMn3VWc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGSj22ttEmN8aVd6GG5wnOu5y6Tx9ewBDLPVJYfVCX0Lw8908t
	rUU/6xTB/I5/XUrbj6RFr9g+4HBfkxXsF/+K0afhANstYUoKkIqEZlYOKsEVXg5sA9o=
X-Gm-Gg: ASbGncsELsfPGNLmhxL1OSRRPptL4niBMaXkcrM1jq1Ughi+rxKmh9NuIKBUNYUDAiK
	E6S1yZ/yGVB8I42MAJ9eI+cugk8d498fG3Xktpul9t9NllpRXN3AhMebdHaIFk74tKOCmFkZIjW
	4c72ziyqjccOPNTqfj8x0snC2OlFsSOrQXcLYhKOAlsy0KWXccUwvfgI+AUk9rYcljvscCe/dOy
	MeONzU6O4L0zCSTRFd2w3MDDPNRyRS2EKh0ycM4LIxclNuEYvXP2H8Z68MP88EH5qWCAKl/x6Sk
	MevAj0dEI0yPKg7SKb7+jZbLkNseo2Fu25TciJmv/8RIkC9A5F048q5R+ZNMTFMfZjCpdDtVJIW
	+ZUzlUQHc/fW4HnEDjw8fu4I22DrMQvQrdsgQ0GcO
X-Google-Smtp-Source: AGHT+IFa7KGKGst3HxIjv2X6ems3Dy+qMzSZz2I7qhSoC+mrIPD6/xzPfvno9XBDMWS+Ay377+cKrg==
X-Received: by 2002:a17:907:1b16:b0:adb:469d:221f with SMTP id a640c23a62f3a-ade1aa15864mr1177864166b.31.1749464209509;
        Mon, 09 Jun 2025 03:16:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/10] ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
Date: Mon,  9 Jun 2025 12:15:37 +0200
Message-ID: <20250609101637.2322809-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generate imx_v6_v7_defconfig by doing:

make imx_v6_v7_defconfig
make savedefconfig
cp defconfig arch/arm/configs/imx_v6_v7_defconfig

No functional change. The goal here is to cleanup imx_v6_v7_defconfig
file to make easier and cleaner the addition of new entries.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 062c1eb8dd60..d40ca9edd264 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -12,6 +12,7 @@ CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
+CONFIG_KEXEC=y
 CONFIG_ARCH_MULTI_V6=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX31=y
@@ -32,7 +33,6 @@ CONFIG_ARM_PSCI=y
 CONFIG_HIGHMEM=y
 CONFIG_ARCH_FORCE_MAX_ORDER=13
 CONFIG_CMDLINE="noinitrd console=ttymxc0,115200"
-CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
@@ -129,7 +129,6 @@ CONFIG_CS89x0_PLATFORM=y
 CONFIG_QCA7000_SPI=m
 # CONFIG_NET_VENDOR_SEEQ is not set
 CONFIG_SMC91X=y
-CONFIG_SMC911X=y
 CONFIG_SMSC911X=y
 # CONFIG_NET_VENDOR_STMICRO is not set
 CONFIG_MICREL_PHY=y
@@ -153,9 +152,7 @@ CONFIG_MWIFIEX_PCIE=m
 CONFIG_WL12XX=m
 CONFIG_WL18XX=m
 CONFIG_WLCORE_SDIO=m
-# CONFIG_WILINK_PLATFORM_DATA is not set
 CONFIG_INPUT_EVDEV=y
-CONFIG_INPUT_EVBUG=m
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=y
 CONFIG_KEYBOARD_IMX=y
@@ -190,9 +187,7 @@ CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_FSL_LPUART=y
 CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_GPIO=y
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_I2C_ALGOPCF=m
@@ -204,14 +199,9 @@ CONFIG_SPI_FSL_QUADSPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_FSL_DSPI=y
-CONFIG_PINCTRL_IMX8MM=y
-CONFIG_PINCTRL_IMX8MN=y
-CONFIG_PINCTRL_IMX8MP=y
-CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_MXC=y
 CONFIG_GPIO_SIOX=m
-CONFIG_GPIO_VF610=y
 CONFIG_GPIO_MAX732X=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
@@ -225,7 +215,6 @@ CONFIG_W1_SLAVE_THERM=m
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_SYSCON=y
 CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-CONFIG_POWER_SUPPLY=y
 CONFIG_RN5T618_POWER=m
 CONFIG_SENSORS_MC13783_ADC=y
 CONFIG_SENSORS_GPIO_FAN=y
@@ -283,13 +272,13 @@ CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_ADV7180=m
 CONFIG_IMX_IPUV3_CORE=y
 CONFIG_DRM=y
-CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_MSM=y
 CONFIG_DRM_PANEL_LVDS=y
-CONFIG_DRM_PANEL_SIMPLE=y
-CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
+CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
+CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_LVDS_CODEC=m
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_TI_TFP410=y
@@ -310,7 +299,6 @@ CONFIG_LCD_PLATFORM=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_GPIO=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
@@ -380,11 +368,8 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
-CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_ONESHOT=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
@@ -453,7 +438,6 @@ CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
-# CONFIG_PRINT_QUOTA_WARNING is not set
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_ISO9660_FS=m
@@ -490,5 +474,4 @@ CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SLUB_DEBUG is not set
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
-- 
2.43.0

