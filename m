Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59094DD3D3
	for <imx@lists.linux.dev>; Mon, 28 Sep 2026 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607662; cv=none; b=ON4SpkyEn95CZR5zYZFLbU8mbFSSGuuxDIt0i533zdfmNh3jKDet/W8THPzU10+XUHS/HSQTYdociJTzsxLE6r7XGYU69xphQ98UT0nwOl6bbQaJoUwXjtnFtpgHoq6wy2Gq+WSWLA0z4mbomN8kFJHHvmJ485uKJz+eWRrnv/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607662; c=relaxed/simple;
	bh=GXO6lAFxoFQEwQkkMLCI0y+cMQX6YMSHGHt+/E1eEYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BCpFdmldTnGeJY5xAuI0ySGSCyM2aAWLqLSoMNWMadBXFECQwohxP/OuYQsNfNw8i1LiPIZaLTO0zyFf/dxAAlF0fNvJFaI+nATXgSEw9Blr89MNK8dTQPqnlMbFfEFiIV6sx0GxMv8BA2zhCwMr4dTDYy9hCq+lTHinD5vqB74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o81Y9MjZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o81Y9MjZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso9663055e9.3
        for <imx@lists.linux.dev>; Mon, 28 Sep 2026 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790607659; x=1791212459; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PNRLh31Iy3KvKfoOWiJ4SBBap26RwlK370O1RZcEP7U=;
        b=o81Y9MjZzin+HWY45dyKZm4c0e2QOBZwM8XJFnwOBn8KLhy04gcQmzf1YbvOouCFcO
         /B8iXcMkzcX9A8lt9nxaHnNlLQvcjLJ33DLJiNH1jJwnvhFyhp1MVqMreMqRANKdvYSC
         kPp3IN82cj5yThiOlEr+QN3jLXcYqjVsCC+Xt6xxWhCi6RTqzr0GmiBlUWHh8Iz1kuFr
         CfvWHzGsSlEmmaYeg4AwIjepoSRzwW26rkj8KdQV7DPRhhSibMR92ZSbSVzVYx0LP2ZH
         ROWrr5oWLmF+G6EhYYulzatrgMwLvJ06RPmJwo80fvN2bf9PlLMNsla7oJGq9aCUDtjr
         Q9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607659; x=1791212459;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PNRLh31Iy3KvKfoOWiJ4SBBap26RwlK370O1RZcEP7U=;
        b=Dhsj8TLk6WfjrJkxaf80swGlyq34PbHsR0jvaZp5qbgBt+LJFkMv3Eut7/7zvOKZFS
         44xSDCUDkoFh1s3R4ZYcon585aCPOByYWvksJ8C0Gr8gSgDPRHmt3ezgeNwKSdX7jfL9
         yrwafZcSjBXEXt4qUCUzDcBWOWKUY7spemtrXDPFbPq4PpxzbfBc6NFZqQ8F8O58utbf
         zGqSeeZP5bBqUtmVwkdffPWFmT1Mna2VFAuRKfZJQCC7XisuHuJskSexEoUl4CgieuAL
         l3dTXz4jeKicy+S2o2k+/cldD3bNzKDIl2X/bkE1kYSem1kcj5ut/HQoaAkrwcvMwtxd
         GcsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwZ4ikFDRmedADgXwaTzEaLWZqdHqch6C9V4e7kA3Z4j91WUmKkgMcl9Xl7YtjqEmnOv0k=@lists.linux.dev
X-Gm-Message-State: AFuF++mYYaJtT87MFlYZtPr8I4NXC2s/eirV3sYDdCR15HCRNhylQEQI
	ItI385QslBILOVMn+WwPgKi/RhVTzhBpcxMXDxzlI0j8eXrvsThknf2R
X-Gm-Gg: AYBFou3HEwG+tISEdE9DxIlQ63PGB3g8t6HGYvR9bIhOcE0tK7RT9ltFX9FG2a5fDOn
	Fa8ZIczh9Cpc3MuxFA63xEuSRdnPaM648CPAGKNNEqDHVSX5um5EGaTBKwMvMRQya7U3RgJIKLK
	uhj2BTF9+YMYOTWIS4vRRrmxrcBUyHHcz40pqLN+yBs39pjV4gbT4A1LYojXA9BBvhNUR6YDXBN
	5meKJWURPlqFF0eHf5hl/1SrTKadUEpslJAsC1Fr0F8SW6plwCeir4nshOgFl5TLBJDjduQig6s
	VoW9h+KjqXVK94B1NY9esHk7gqZZ1/wgXs7w/q+JT5J4kjC9D7LMNiVVFupG52zMozK3rI/S23o
	5mH0zbTZNKGOd/NWd1s5xuIft7MTFX2ZaDxf5I/zTBs+YVsPMJsohjnJuj34BmdUyYc/KdUiA9+
	L2ogiHYw9m5RXaWlVwpskZWFb882EZVnj6t9cvKcejV3jFcGZ5onU9yTBjwCNDEVw9PzEPRKLTv
	FejjeHtn1YzCLzxQptcNOag3seknwuAfEEEiDE2sGpSnaBBLc334WaZSWLKuCZg0OHTTzEuJy6U
	WMuHUrHfLm/ALAH8LEvAFSDesed4ni5LDQ8xnORNhv+YHSfg
X-Received: by 2002:a05:600c:3b05:b0:4a0:321:6ddd with SMTP id 5b1f17b1804b1-4a003217170mr61722025e9.34.1790607655941;
        Mon, 28 Sep 2026 08:00:55 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm151777245e9.15.2026.09.28.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:00:55 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 28 Sep 2026 17:00:46 +0200
Subject: [PATCH] arm64: dts: freescale: imx95-aquila: Enable I2C_3_DSI1 on
 Clover board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-imx95-aquila-clover-enable-lpi2c8-v1-1-9a9755acb8cf@toradex.com>
X-B4-Tracking: v=1; b=H4sIAB2BumoC/yXNQQ6CMBBG4auQWTsJHYNQr2JclPqrY2rBVggJ4
 e5WXX6b91bKSIpMx2qlhFmzDrHA7CrydxdvYL0Uk9RyqK10rM/FNuxekwbHPgwzEiO6PoDDqOI
 7RmvMvoE10gqVzphw1eX3OJ3/zlP/gH9/w7RtH2AAF+uFAAAA
X-Change-ID: 20260928-imx95-aquila-clover-enable-lpi2c8-e71135e91272
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

Enable lpi2c8, which is used for the I2C_3_DSI1 signals on the Clover
carrier board. It was left disabled by mistake in the initial commit.

Fixes: 3f519121e120 ("arm64: dts: freescale: imx95-aquila: Add Clover carrier board")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index 365bce73eddd3..07bf53240958b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -197,6 +197,11 @@ &lpi2c5 {
 	status = "okay";
 };
 
+/* Aquila I2C_3_DSI1 */
+&lpi2c8 {
+	status = "okay";
+};
+
 /* Aquila SPI_1 */
 &lpspi6 {
 	pinctrl-names = "default";

---
base-commit: bf184a29ad1b33bd8922029eb0ca3f2866007258
change-id: 20260928-imx95-aquila-clover-enable-lpi2c8-e71135e91272

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

