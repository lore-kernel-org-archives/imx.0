Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5166F21B9E0
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 19:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905190; cv=none; b=PJjP8eT6dyTeG6+34aH5r7v5OPPf6PIQzz3Xof9GNcmJL82bZaTwALOXyGLXKM0oVWnl18t0y/UHwI/7sGXVXt+w/Grgk+NddvuwDwVPbDj27fyF1GwLpV5FPZszFQitwCvy0BnppNhUUzCX2FP6kzQ4xf6uVjsImWNiZ3OBXWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905190; c=relaxed/simple;
	bh=68r7hd0pYMiUK/yXAM7DDOhRILor97PK5YEExmDMI9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7K/ouaoglI9HxkAPRJA9fC0ZOgSrz3xuozO6w3kYReeciIDMfXJIsvKIEzo++Fqun1AAw0EKJsx/6pFKRsJQDMpl1ISybHxP97WdTFm+CfY+GmwnOKaTrGDqYMjDwSK5I2imotVLGINrPET8tCoxIqHSMVBTBnQHbwNxZNrzJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6edkvyp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6edkvyp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b783d851e6so186451f8f.0
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905186; x=1754509986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbQUcocXM6VHyJ4FeiW0D1YCdpoLynB31hIqBFpFpXo=;
        b=h6edkvyppmOuNKMBIf9yfhamKNdLRwoB0squo2i+jVf8L3t3voyBegy7i+DviHr+Hl
         1EAmHlFVtPgNW8hv/uXFvcrMnOHpuZ+I+KDVGKPR8P/bM1Ar8Q64s+c82kqQNX6M3N9o
         jFRhrZaNIVsFGtMlsZYtQI41pSyspVtTSXa8cDLSoDVdoL4spTjzD+MlveYZZL4MR+di
         +O9efsTOYjSjqsjUCAqF1UvpZRtFK+8qOD/Zo290zJ8ZklzWJRAusa2xcMx9go3e+yCu
         2g5Y1OjIfW8z2v76DYRZslSEg0n1PNeEZ7iGGw414h5r4ZGFBWRtRpg3D7JQV0kCz5gH
         p7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905186; x=1754509986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbQUcocXM6VHyJ4FeiW0D1YCdpoLynB31hIqBFpFpXo=;
        b=hb0OIXQXmNFbBcvcMn+QuvqneHjxdyWMSv+5dpZUiSbqDdNUkE/OfjjlUcv17VmJ1M
         xpK9YaCjTar1wL0cUtK+n0LjKPTYVqrGTzdlZw7wATQgGOMqUDkcxj8MOf4QlZEBzUfp
         25v3JP5HuwYlrR9ipA6+yjJUYOGwEEj7ukYm/w8/cPB5c3THB4snSEht0aUFTYSOiGJg
         RfZnvM5KYmfJsXJ0GBpYdl2F24cj7p4mM7KgzuzERjjK9eoy7GM7drNvq0hYu+b7De/I
         IOHxDljcNURYu4Rf8Pq5TUGBn/o91pmTCrp9PkCAWA26WI13mYLo7yWoMB4V5HaF06kz
         rzuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwhS9kTX2T7WSXkbSlgfeeGcbtVM8PG5xaPJAoMdagj51Fd9bANjQA22d9zLDIMxT3sSY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrxQa613nONWYA534ZS5dskzgkqJfPz7upXIL8hMNeftoG3xeB
	41UwlpxxY/8GUOb4yf1RcqUASM/3eKcsHaSDjasEnX0r5vb5pzcS0DEtOSpc569cnXU=
X-Gm-Gg: ASbGncswC8L7B4JAkjU2y2PTTrVrZXH7Y0NBuirJBkSKIhFmUeSnuE6uvj+GY2R/1fs
	RnG4EAF7lnolsJ/lTgmRNKHBVRGYfcrISZ20NlhyYbKvN+gfkF0M9h1JhuL+PnXR5BbcrgTnsn/
	iZ5gn1M7TwB/65dI+v/xIsA7XwR/QB6etiYjvNUEazLoATmWhagZ/UeQD/MlYXYbdThKDH8RWKY
	bu3UvpJls+ZLKOVpE/60qxvNZZwXHS6Wwtd2zfrtT5WV0ai2gcQqd6+VB1w4ssEFqw3BGHKXVDf
	c19XAHDWI5B9lrCZ1HEEl4Pb+w6WVI86pqJob0JLR/IPVQZNsTohI8f2N3WFxuA5hVa+2QwhnXx
	6Z4nsq7cTUjf94fygdMpM6Lr1/2KE+oixYD298VyMXUuXTrie
X-Google-Smtp-Source: AGHT+IFWuBrLIEbeUtZdtLqTw+hW1a9tpEUu4JPcNe6Bb4qKpFMMypY6fb8mghVdvzohIsDDM0+1fQ==
X-Received: by 2002:a05:6000:1a88:b0:3b7:8832:fdcc with SMTP id ffacd0b85a97d-3b7950093b6mr4274596f8f.38.1753905186428;
        Wed, 30 Jul 2025 12:53:06 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:05 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 4/8] arm64: dts: s32g399a-rdb3: Enable the STM timers
Date: Wed, 30 Jul 2025 21:50:17 +0200
Message-ID: <20250730195022.449894-5-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the timers STM0 -> STM6, STM8 on the s32g399a-rdb3.

The platform has 8 CPUs and the Linux STM timer driver is per
CPU. Enable 8 timers which will be used, other timers are useless for
the Linux kernel and there is no benefit to enable them.

The STM7 is skipped as it is slightly different and needs an extra
property to be handled by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 .../boot/dts/freescale/s32g399a-rdb3.dts      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 802f543cae4a..467e0c105c3f 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -40,6 +40,38 @@ &uart1 {
 	status = "okay";
 };
 
+&stm0 {
+	status = "okay";
+};
+
+&stm1 {
+	status = "okay";
+};
+
+&stm2 {
+	status = "okay";
+};
+
+&stm3 {
+	status = "okay";
+};
+
+&stm4 {
+	status = "okay";
+};
+
+&stm5 {
+	status = "okay";
+};
+
+&stm6 {
+	status = "okay";
+};
+
+&stm8 {
+	status = "okay";
+};
+
 &i2c4 {
 	current-sensor@40 {
 		compatible = "ti,ina231";
-- 
2.43.0

