Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C471ABED8
	for <imx@lists.linux.dev>; Tue, 26 Nov 2024 19:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732650114; cv=none; b=CvTqEnWlB8r6RAid/PYoG67JlarIzn1sQ/Uwu341y2HGVe9wjb3XmIHuu/HmoNaTxBEILGTLFICe47C7RwnCh/bA8o0NJIvBo0xycph5amPCIWrKKryWjnUw5AV4Pk3e1REbrn8wD86QXlFDIqqNuwukjCJSnrX/NqmZ57lIiqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732650114; c=relaxed/simple;
	bh=QYCrl8yMWx4+xNcX+5udHJinnbGAeuEVIiam0dp+egI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LMGqjuWeCTkjdUQ111xpZTnnlLOdx0PzDsXO6CJsP9ZRnX+xefiecl0DEY1JNya1Ha03axjf328H0vOKgNRKGoc+Y/4gbv6kl2mDox1iRN+dDpASbxeKozmW5b7bRv/J/XKOHWGvzKaBPiRkUz15XCJR6W6BRot5lppfCS6LghQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvUz/KqL; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvUz/KqL"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-71d5ef7daf1so509856a34.1
        for <imx@lists.linux.dev>; Tue, 26 Nov 2024 11:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732650112; x=1733254912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gdOpj6n/TpCW+M6qJNyMJAxTe9+Oh/jv0QhEZd/cyn4=;
        b=ZvUz/KqLUOirQmfw/UWt+d6CglUSotmUDpoaZz9+Y9Mb84rTS2G/RTRXYYvuyKax+m
         i16fQJjgdzmKDuOcvQISeIo0TiNLgNbBJUWZ+BF1tAN0RCiq9ZtqozAdC3sKI7OGDPEV
         zmmoXkQyBLoeRnOhWxUS5yD8lNZ+L4T3hsR78NbZKcqGs+hMgDc3VsWtcvcpETEud36Q
         zg2StCe2CoMMg4siiV9i1Uvzgl2qk0fGy24q9sE1SzRCFAqCSuQ7PlSsyaJukmgOT7B6
         hh4yNvylxNGYtQGVFqcPhcRjOs/OPIFIR7d1QBLI/yTEKlZfBoWsLGWcrPlJiFse7E8g
         G/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732650112; x=1733254912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdOpj6n/TpCW+M6qJNyMJAxTe9+Oh/jv0QhEZd/cyn4=;
        b=X2osKLKu4wkSykqRckEoEHRpIRK9TVH8malIx1jUomvw0XomzgmBZ1VakYCQylBoZD
         4UkgbAjVFrefbN3bIPO+D+UgjNSET1pYVhIVB/KYw5/0LeYdlfPAEULYX1soHwWsA9yZ
         xNfDRAi6eduoUEPIoq8tjO3ZWi6KTs9p5PzTU/Qbk9nNuxnopr1+RHP4ZJGa15rBpIlm
         gnikODFKFmFyL3u1tahZ/XFOD9Tb9QXURb0PkqFE6IsV9/PSArv3FqQ2Jg54xXvUGGRR
         hcTocLAg+B5oGSwBuC9h1edGDCXhs9M9rGF1wmgyZbiWek8vHujy1V0B/z5ReSivHj3y
         iCbA==
X-Forwarded-Encrypted: i=1; AJvYcCUr0a6aTjb/kCRYsxvLdvbK5KA20TMPxJHBj1wUTyCDlxRdNm/pgN3U8L5KAbDcbrxkVmA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrtsd5y/qJEioZtzkclSjIeNsbi0H6iCpBmALguzq3TiOhyIMD
	pZdf43Fsn6R2CNvZqac10WJjpGW61IR7xnnV4otyJxmYk/gILGGjJtsy3g==
X-Gm-Gg: ASbGncutxqnXe7z4ywAG/QIR1Iz4E5WBB0CSDTqibkc6hkUsZqoeoKz8GqSQ9AMUECt
	EkI/12jUXWItlRIg89ioLiMRtKv/4As2wuyqrSMYZtHXj+5x5pUPKCDvHRZGhh4C+F9DIUEPX75
	Ky2Zhm7nqypoGNhCeBCnvcAtwohc6l/lz3AdES6y4Sogw2cRKAWfUVbMhead1YJbw8agTfEiwjF
	Et+BtEIH7B0bAGbqr8JE2sB8al7L9x4Abo5RkixB9jOE4fCa1iiIPEJfpcS0rgc
X-Google-Smtp-Source: AGHT+IF+qleM6e28lbhrKv8SHeOCH/FuIj3K4jQgailnXQEBm51/BgQbfblpSw+RSONlWze7PTecwQ==
X-Received: by 2002:a05:6830:700e:b0:710:e61c:7a4c with SMTP id 46e09a7af769-71d65d05a85mr309535a34.29.1732650111959;
        Tue, 26 Nov 2024 11:41:51 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8a47:3216:e3cc:f1d9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e25cesm9147384a12.28.2024.11.26.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 11:41:51 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: esben@geanix.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux@roeck-us.net,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: imx: defconfig: Explicitly select CONFIG_PINCTRL
Date: Tue, 26 Nov 2024 16:41:46 -0300
Message-Id: <20241126194146.1193094-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
the CONFIG_PINCTRL option is no longer implicitly selected, causing
several i.MX SoC pinctrl drivers no longer getting selected by default.

This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
i.MX SoCs.

Fix it by selecting CONFIG_PINCTRL inside the affected defconfigs.

Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/configs/imx_v4_v5_defconfig | 1 +
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7..1af29d12129d 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -83,6 +83,7 @@ CONFIG_I2C_IMX=y
 CONFIG_SPI=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_SPIDEV=y
+CONFIG_PINCTRL=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_MXC=y
 CONFIG_W1=y
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 0beecdde55f5..73f7aa7e75f7 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -204,6 +204,7 @@ CONFIG_SPI_FSL_QUADSPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_FSL_DSPI=y
+CONFIG_PINCTRL=y
 CONFIG_PINCTRL_IMX8MM=y
 CONFIG_PINCTRL_IMX8MN=y
 CONFIG_PINCTRL_IMX8MP=y
-- 
2.34.1

