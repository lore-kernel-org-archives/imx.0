Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF03ED13C
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948892; cv=none; b=NIoYjWoxXBsCWBCE1PGnKzaehVhId6oCZOSXdievUN2VxMsH3koOKdkXvTVIKKnCm6Rn+ZK+SFC37nYTuFtOkxtLzXS9LRvjRkF2p2qYchJ3P2gzJnotLeTTcZwoZecGcTLzuY3r4tCENrpkHJ3+beFHbMjudA/8UdAwbz0rLHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948892; c=relaxed/simple;
	bh=v3wmLYmQg77QEc7sqHGbVbnyNA/JY333o7aiBU0y/XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKdqx7RWl4QjwmfD47mtdYknAjK8QSAwjhfeVYwI5IhX68t696nSlfgnL0Euesi7IUXzbPkAEQBaeOC00bo7eR9j0lhEWASQk1txXuBq08b1y3lCSUnw4JNWXFvHJpZcq5x1QCoWSHxsm2mZoFWjVDvreSCelm2+iP6V8AYpTMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFT0gMO0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFT0gMO0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb14227cso72135055e9.3
        for <imx@lists.linux.dev>; Tue, 31 Mar 2026 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774948889; x=1775553689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cE0PWmhtnEqQSnWYYYOuzSEl1gB3SuYtUjjS/Ucvahw=;
        b=aFT0gMO04+3cFJ8aNEkm6FHZs/4/w1tSxaiVXPnscVL3tccR/mfgy67kCvcvIFbPlK
         AEhgLhBuYyiqw0fZLZv4hpwcGaoZ8pzw94KhYeNv5uIM1u1r7pgBWltXqOKSoX6U6SFa
         G8tE/l5GCm+n4OYacgkZ69Mk1u0WcR8d3U3b7Fc5AKh2tQpcVBRv97Ci4Xh3L+vT16ro
         8ahlNpffWvkIrwxBGTbOoO73mXlKG3a2sMsFnP/gnhIPvfxvJbsUdXTyVdQlIDOEljK4
         afXujEfKp8AQVFDlrFy8w5qnYDb5BrqVcr2tMcw6kSQPeaL8OMlL48uM/uv4nEhs2fNj
         nwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948889; x=1775553689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE0PWmhtnEqQSnWYYYOuzSEl1gB3SuYtUjjS/Ucvahw=;
        b=bbSfgR7rmxTCm/v62ixjiL7o0L8uPFtJAs2AA+7VY4mmDjRSsLtch2p26o8CAI9tAz
         pYFtK04BmAd2iWw/TPXHMdd/lNVZ3ku2U2WTDBXd/ONW27WyrRoLC5adeIDG+wZTip72
         nUlVMW9aD8BA5T4XnJf0XaVjjfOv7SQb67Srum3pZ9veCX9jAgQEXsxy3jcTlVfdsCck
         CkHSwnLE8YFyDS2JcQWDlioZyEzp6+iQ6tW726WeVP7ktBMzyYNOrRrKoHdlOcV5TMwb
         hEPS9OXcrSqL5wX+rH0BXfr6xFkVR4lAqwoVH656rDR1668Dpr7eLvYpQ/BmwElszobO
         s0qA==
X-Forwarded-Encrypted: i=1; AJvYcCUeFCJ2p51qg8m1BQXscVKWjAgDA4ax+hjVtHCWN3SZx+mWc3hmSMo+xmk+1sAqx9oWUao=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgQ5p6cPQKCPSB29ufTuzWzcPIVNwP4J0o90MTYCx48LRQpsnu
	z0wTaadnwFRKMK26wTPxZ51f/UILVddd0EwGWmW2mAFzp+XTt/CQQBLC
X-Gm-Gg: ATEYQzwXhbo/9G375b64KG2uK73FWYU2ydc5P5IffuZtN07d4OXVEGJ/6tOy3GsAYfy
	yaKnyUpyLnTTGPekWnC51Y1c4nguXdUA94aqzHVx/L8eXY8lPZoAcMnBxDrvJkWcBEXEpuQaJQw
	HleNhg142unMZ1HdqicD3327jl3MwvsVS+6cpO8qe++NRnqohUh+RqOW4WV6p5xkFLO/j5qlO1Q
	fWyZPJMn4BKEaoih2uc6hBXsrR3qFVHGSmp4M1IwzlwHV+vg/7zjeOHDDULrxxPsCcPdesuHNIl
	IYYQt+U4wcY8a6Ew3UQzg5WPCvJcZuqyl5bHmBgfMdU3uZIS+9hVSCU6P7yVHgGseYFsI2xD8dA
	UVeIl1x65MCPbNvfbyEgKav0uGwFmw0Cz/dSPNl27dh25bmZZ+qroMk2fOaPyxcJs4yxMXhK1pr
	Ge2ea9GHd0/pv3cLa3EqPvXH6GE/VHqHNf9W47ucRXGEUxyn21z+3JhYwuA12cY9fiWwZIoxqyH
	G49TvHtCsTCrt9+xJbuZ8rm7+OxgNJ4FwIXMC6SmpAHtxM=
X-Received: by 2002:a05:600c:4744:b0:485:4278:2558 with SMTP id 5b1f17b1804b1-48727d5a313mr266045295e9.6.1774948888897;
        Tue, 31 Mar 2026 02:21:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e7e96fcsm25474495e9.2.2026.03.31.02.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:21:28 -0700 (PDT)
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
Subject: [PATCH v2 1/1] arm64: dts: imx91-var-dart-sonata: add RGB enable supply for PCA6408
Date: Tue, 31 Mar 2026 11:21:12 +0200
Message-ID: <20260331092112.7876-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

RGB enable pin, labeled as RGBSEL, is a board-level enable signal on
the Sonata carrier board.

The two PCA6408 GPIO expanders depend on this signal being asserted, so
model it as a fixed regulator and use it as their vcc-supply.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed commit message and RGB pin references.

 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index afa39dab240a..3f0fd321d95f 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -90,6 +90,13 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reg_rgb_sel: regulator-rgb-enable {
+		compatible = "regulator-fixed";
+		regulator-name = "RGBSEL";
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -195,6 +202,7 @@ pca6408_1: gpio@20 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca6408_2: gpio@21 {
@@ -204,6 +212,7 @@ pca6408_2: gpio@21 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca9534: gpio@22 {
-- 
2.47.3

