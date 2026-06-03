Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753E7481A97
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497454; cv=none; b=fQaGM7nTWgksa86i7qoReTPI51fmixhkJ/0JtK3Q4wYlCVPc4AyBMyzWoqYluB3zlbG33t60SAcnB18vco+fvNobXWK9lUemmPXcmLEvzOlUgwclOQJymUZCht7pOKrRbeUI0NsAKIYFVGOXRUTHBzg/U8tyXo3CYd2EjEAXCl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497454; c=relaxed/simple;
	bh=PsnoS8jV5ypMZlSsSe5qNmVHEBcbuKb5Cl/F5V0ZrFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avoxEJ6j4P9BaLxCQbFYw6I2b03C9ebiwG84igHgnCzYHJI1Xjc4dAS5pHV0QcxWAqSxeRxWfzWL0GKZSA0xhfq0+NdKT+igjlDglS5I1nXs9GEv8Q1dRbwPlhhc7feUOGQavHW9a65MeXG8pyMEs41PnWTlZdOhczSppGDKOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gv/KbT8g; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv/KbT8g"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b64c8311so12275715e9.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497451; x=1781102251; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaiAmYFlpvqj20dmoy65KKCZhRIv0Jj8RmELXA9gRCA=;
        b=Gv/KbT8gPu7otwALyikMt1KCyPXkBCAhlLcfiFmL/Dn4b1/VnyUqAzMh9vw1rB86zO
         LRPC2ftwyMiCMHDju6cWpwKDOcFrwiIJyQ91C4t8lhBBr4feMNqh1XQu/AGN28tOzvgI
         AVAgYw2I1ncOKX/nTOZqisEirDNzyXROu1XEXYPa9xi9Vlmrx86c0O6qJTntHmd6K0se
         KX0b8vnARp0t2kfUpg/PSFpsaRihZtjEbHKdgnMrh9LkpcfJAy5hXB2/m7M6ngoPXfu3
         KU1bXt4kZJ3b0Vofqy1214rnPYZEgULFhZxajAhpbu5AgwUBv4EwvdMlWwdyt32+lpUT
         601Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497451; x=1781102251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iaiAmYFlpvqj20dmoy65KKCZhRIv0Jj8RmELXA9gRCA=;
        b=Ntbh8eR/7yuvS0q0kn8xVhlFUfBYtbgcZsfQcw89SqXqhUntVbiT5PudTzFcuLl5tn
         pD2NMGlihUM78kTo2aOng2b+c10BkQpyrgOPI9qy8x0xmDZaw60Qz/VnU+M154gyhqLG
         mxrDQ7dzniQFypanWERADlMDL2MnEcgRofwVYoDJ+qh9pCAtffjoRgHp4nWUgIxnacSC
         pFuHZJH4vwWe78tkriLv1jjWxvJgz+1CvKAU3GkegzxzZapC5qJw+3xFJU00BvwXyIFC
         qNAhtvY82bFjhs0odtbW/PwIWU5dnxhmaoIJTbpFOMaeaw1JlU472kDHkxxAqsJwL5nU
         U3Nw==
X-Forwarded-Encrypted: i=1; AFNElJ88njfmvSR46zF1wx9tYn/8TiL7Rd+pf1WLLasC2sf5YjDdaR1WqCHN8/cKpHs8WbZ5YKU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNG5yP+79ePSb4uTvMVxCpm5bcKqCTMV1UAwXOOKyxSeF4C5Yh
	zAZi7hURSHE4/791G1Y0fAA7QYXnX7EXIU6Mb4Pl/6KsdYURvzkdlWJ5
X-Gm-Gg: Acq92OHJche4TIB+qs/wIoFoufj5cZJ/Saf3fdv1yrFslMC5ZjdngMCuT7FpPOlrgim
	myLszgyHFaMBn8ixS7C3eXTdY9wH4UxyqteJRtxKKT1A7QFiSSPitx4UvGxmrvn9jGpRfNFveOy
	iE57wb8z9V0i44OVPer2QlFwaqHMoRzQupUdOjy32bAxJx7RLe+wmTiZGdMuPma3J42RBNaPGos
	xSfPgsDF9z/0p6HSB7xrMcVkALdFo2x9m4nc/wrhVdwGyY/kTnc32tgvJMAchN8y4XqMQOdV4ne
	IpFJvLZPfsfp4ADa6u2YEM7UstY+W/2umkblZerKpH6WpAagyHP/Af+w3avhstKmR20sDWwbOxl
	7nCvi+7hR9pKTb1JReCvlVCKqqZHNxvalszRZTy45KZxRLmeDnYUvYpsV5OK8WFCntC7a7bDLhP
	tt1VW2apy8lDmJT1C8SbN2oQJDm0eNd3y97FoocMTWvA72lfbAVFybbUTYXtdId0nPpN7AKCaOA
	C5fUbk06egNuYgBJW5yDq/Gg8e3b9Wx6oI0Q9RG+/3Zjyq+
X-Received: by 2002:a05:600c:4586:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490b5fda716mr63616595e9.27.1780497450787;
        Wed, 03 Jun 2026 07:37:30 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:30 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 04/14] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Wed,  3 Jun 2026 16:37:11 +0200
Message-ID: <7758fd3b241c8e09e8b0f4b3224220325f8a069a.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6c19a63ce405..b15ca44b9a92 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3

