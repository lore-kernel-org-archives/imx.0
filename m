Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C2840962E
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 08:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475112; cv=none; b=j9y7+J3PEqcUv1gi7A832FyrkUvjt3J3Y5ZkFhr0CKW/hocXICJ1aG+OzN96UVGexMqJ9a7w15DHXGRX3kXtmkpvvcar0pd/kVd8RYeDopAV7dMcPoTZk9rerQJ+2PtDnqDQt5bg5mFlv34SYV5mJqx506w+Ohf2FqtDoWHhI1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475112; c=relaxed/simple;
	bh=sd0V4niM58Am9WGtW7yTYh/KrAJ6uZarN8BiStmlIDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8blldcoCYC/dGBppkz4vhWj+GWbIRb6zVa/mld6WPmyrQxdYvcusaoI0I5O0EQ3gEDTLGW5mdfSvqShMsBCuTgFefiI0dngXWaV1nldXeuSRTc/CVLX/IEKudlzN84Vpvd5Oik1qlOjlPc8sET2HHY5LeHRbelZlxcltvT7lGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lX9hoWnN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lX9hoWnN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ac10e337so17844075e9.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475108; x=1781079908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tkvod7hGaP12ovakGTLdAVDUjFqJVukCmyxNpLyjWHA=;
        b=lX9hoWnN79aM81FmVp9r71kq6WHKeDcq1/yMx5xU+8MTVmaLILdnTjojtVa7JiEX0H
         gqWpMSYwYM/WiCYWWCvMnebQfeInY9kzOVc/Ij6xh4XAFeQUcrM80MOEvUqTBXhrikFV
         DrYyfhnsUNFpz76Bf6Oq8IOvl7SX3y5DN0nVNIwvbh5EU+x0hneiK2QZbliacmqufmS2
         YNWkPbAFf3FD+XUR9q6ZMXUcTcnrQn/f2nolEGKPAgsFqgNRz7S/WPvcau1ZRL1TuTUl
         uNlK9m/TIZGaSkTg/LUQ9IUOSeN+X0scKXTAwDRVOvTO9gFMu9Ixlrg4ahSkSmWHW8AL
         lBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475108; x=1781079908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tkvod7hGaP12ovakGTLdAVDUjFqJVukCmyxNpLyjWHA=;
        b=IVyp6QqumvoMqe0+pdGHyBlpv65h4l0rcM7GqlOgMm/NJpz73AcGY6r51olYXqS0KG
         FeFEqwikktPEBp/GTHKdUBWgUJkNYa2YWBCb/UFTsOMDiHr37xo/ZZ5XVOjrv4ovQMjX
         QqIRx8N4PaS+Hd1o42Q63iylFA4Mmy3EWMxknhDW23SR0pL21sDN4tiJVeWkI4nxQTDs
         hx8DiLVY8M1YvO2TYhHE0fwNvAWGOof111rAxLOEqE1vf8RpVAw3K7kVfmxpHlQs6MGz
         KdBsf3Mrh5cWjFTrGOWVMw50Yu1juUDHoGXsfbYuJoCWkQNw6TG8PfSFwA9uWFUWM74C
         Z2iQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Dm9f5lQy4co+MKZWSvZHpFAwRVe7e7DUKuNNQeAqAPBA3hkN1Gr4yE2JC9Xlwp4/v2b0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyD7JIkQ7FiWlT5mDIeYho60mc1egG1o1JP2gkVNWdN4DQm5+u8
	qFVw2hVGt3heC5VibMmQ14zWytK+ZZGo0iKETnQdW0gVW+Vi7owPXWu5
X-Gm-Gg: Acq92OFAO9iUQpnw9KGh0Rbo1YzsZY2Qb+XQQs70ljmy2R8AoUozxm3xVf3hEneaO9P
	JEtRQCXYpUr9EtJNX7PZowphH3/HFMse3ivDrqey+6wcD7uYKxBhw1jG949P+NMH2G5B0H5Ge0A
	gsVa0qBcBC7q5aD3KgDh+qjCfTJQ1KaoPIQVrsM6V0w3PKzxLImBgF6k0z1j+jn1jZvVDwts6fL
	kJpXa5z+Z4feP3CRW0Wew/PaH3WfuBdcr7xBwkQAcJ6/JqwUZ5j1JQ2wTfH447tJzufwUPbkB1B
	+svOem9L4Zwzr2xLRfXsBBfxTamYbzIpBnbGZ3EsW9FI5knyr/ST3/NP/9VHFuiVIxMe47tEfYc
	BxwQVYMjuH3wakcYnXFaE6GQTrvpquGA/Z0CuFJ8nc04ZjfMY3ef308CWBysBs9kV+N6sk0ALUI
	qnv+2O5a79Z/ojosvixWxsikCDPSZg5TjrCIDBxS3Jtps1Z7+BcJ46z5DwYeAJU+T2ARx37XtMH
	GY1NUc0Z5u+s/c8J1UGL/7qU+ukN2DM0+lrOmorBbz8vSPJ
X-Received: by 2002:a05:600c:8184:b0:490:b3f1:e41b with SMTP id 5b1f17b1804b1-490b60e20b2mr36144035e9.26.1780475108116;
        Wed, 03 Jun 2026 01:25:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:07 -0700 (PDT)
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
Subject: [PATCH v3 1/5] arm64: dts: imx93-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 10:25:00 +0200
Message-ID: <0018706953ce5c0ab87d1e9f361973429bf0457f.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM reset line is driven through a PCAL6408 GPIO expander, so add
the expander on the I2C bus and describe the TPM reset GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Use reset-gpios for the TPM instead of a GPIO hog

v1->v2:
 - Rename pca6408 label to pcal6408 to match the compatible
 - Clarify that the TPM enable line is a board-level GPIO hog

 .../boot/dts/freescale/imx93-var-som-symphony.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c0842fb3cfa3..c736127c7115 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,21 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3

