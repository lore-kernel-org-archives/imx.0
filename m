Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308363;
	b=Oa6JO9YME+po0KS1KWxKDS1Re/dLxtFXG00C6+aZyq33F6lnVjGAEm5+4twrVa/1xMXI
	 0YSAzTcGbmL0jR93zc6nb7t6hhgEsJnu6fwHleDuJPROoP+ZrTx9k2HrPNoGy2N7T0lr4
	 +XUVmUjTzrMwe/P69fQjMVWBoWJ9YqXjUKblJtpk+6C1rA+lbfajbY34ZSV2ofHDi9fHt
	 T7o2f7Knr2rnlZ3VjSoPXrJZpTJdYM/2xJEWhiZlHOHIP9LrU+ihemOSQuLKnZOLaWIzA
	 yTNbZ5/bmAyV44OBKtmocNSO7GROSeJ5GDpSStoKVqD7fYjRLnEJnaFfOrrnu3vJkeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
	b=tFqb7B8EosRmN21SV6OJRd6uX2HyV0zZap3kw6hn45M7+MRlDdKU8Ezt+xLtyRisusZR
	 DZ45q+2H2tluzaSNQ3T/avkB26pIVPOLs5zVkrZHp97b7PROzBsmRuYigzkxz7RQqsV2J
	 q31JyXpdrEoHm6EauBFXt2GfD1rbHhRcKWnBEz0dbapvglet1fTDYf2EDxHelkpzpJawh
	 WjJuCstBKWOPP6ELo4sGh0adOfWjPxWuj8wv9ZusiZFu4IUJ3tE4YeeX6x1ek4iAyCWYG
	 qhucR29NlJwXD4tDRu8Dgg8AVD/Ec5VHG4HKUbEauUIewhgTvPhxTGDrnlt+XjgwA0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeCGUNBV;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459A860A3806
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 459A860A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZeCGUNBV
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso797678f8f.2
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308361; x=1794913161; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
        b=ZeCGUNBVLGnB8TqAz4ult7wqs5PePbwDj+0iVYJNzlgz4J1WBphBPkzdk99j0buZP4
         E12lvTM7vr1jthRWuEEwHgTgDmoJLcPVjtq2o4Y5ImxXaLsAkceutgpGg1FHRc/78KcH
         OAhhG0hkqj/g2xm6TypwsMK0+M75bhPjCwO8yFJC7APOCHry4pWRLr5+fvABmjLP2+iq
         jMH7941fTnG5y1Ct4vPkjojr8N/p3Vk0EqKWchJ+hRLOQApkLMDa8sf2tkQR2pSXujHd
         nOTwM00xc9lttujUn9g2E4B4e34mbw7zM0rNGoXWvrdMMjAELgsAgnT7RANYBwmdsXWi
         NuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308361; x=1794913161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38DpxKNBFRv9O6F0NQQ3cpvR3/Umf/+Ahhp81L3VJd8=;
        b=dzHDGRozXHO6U8SCBTgjmLD7eU+GxmA3tiwElSrbZtc6hO6y/AP1lYNvb25Io9t80D
         cV9M26r6qwOLcmWRIh6OrcxtNc0ndtlYnsxmZCePDQJqdQI10mFtx4nO8j6wVdVx+4xM
         joZsBjWdwL3Z1e+qVyyxY3pEIpBAC7/JVZGU/iu2N0l+EHi0TnMnf3b87ajyhOZYEGxn
         f4k4HN5vYtA+AZH7B/5IjwKjPZiZSb8C4Ehv9sje3bg/rgT0r2gc509pWRInSa/NpeEk
         jbT+h/cx/Nxx7c1Pfj/uyctPiDHp7OPmhyeevXz2cLSJtEmReG3455iVy2lb3EvyFOMM
         b1JQ==
X-Forwarded-Encrypted: i=1; AL+hErFPBbSfyKSF9Ny+PR39fS5qQWip2odHGeshp46U8ZimHU1KPrskJT1gJWlTIwP39HRs3kA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Lk436yl4MYUyWjSK97KJHA91Lt/zjj8viWJcMqe2DwROEimkf
	j5vDF01lmQzUFIoXkwVVRRwBEvx/FcGuys4nD3QnCjjxqC+d5UhA44Wp
X-Gm-Gg: AYBFou0WL7Sk/6BIFc3u27e1EzYoY+PGfO6sNhdZxp6Epqgd4tEa4P/S2F507gl9JhE
	CVvIv2w3ULaz1kZIM+Jzp9JJgv5se/NKzuIcuEdrwP6UBNY8Xbd2G4vmM7TP+Xutt57fqCk178o
	l1ALsikkGC9O50QBO8FFax/t6Ru63pE7JXHTHGtk4mDbpf4/HM93ZicM25IEzKoFBKHg94boiiH
	k79iYzyknK8rLYrTwqbyCppMFbFpLT6rJWtJNCRDywdMlD+5E5RVDAzfRAe0InFkEBu1nl0/Clk
	KeNDObi8T3Xeh8e0Q5NhrT61Ke25dmLMcGdluyXG6ELm8zaaIyZ3NG/7YZICwwFdj/QsoscmTM+
	QsOdo95OUlfGSyKCfNe9dwu2W8YIMxKTmO6jHUnelxcaLJbLLi3LPaPEef50vj6VDvmexTN2MT/
	awcEOV0SPCE6uZOWPnHv93wbNsiImNEVjZRXJJr63FKj9pg1R4P2W9k05t/+OPBQDytDSAU5MyH
	D5CoF7UggNfm1F+1O4pf/MFEvYl89l5EHDytP2AQpVuvjGPC42YXrV/EpfmGA7KYKQAZ7pnQGwf
	FL68wwvIqPwm73SwR6BjnfPXkOk3s//KwES1/9XVAbKa5I+cXROZYwispowbYttjSw5Dt1xI3Eo
	yz8r9viL9VfdgCc1anXskcpthenOUnm8/gsRG/ln2IwU6OUCAQp8=
X-Received: by 2002:a05:600c:c0d6:b0:4ba:6d8:dfaa with SMTP id 5b1f17b1804b1-4ba06d8e3afmr12626575e9.12.1794308361498;
        Tue, 10 Nov 2026 02:59:21 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:20 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:17 +0100
Subject: [PATCH v2 5/6] ARM: dts: imx6dl-colibri: Add Toradex Resistive
 Touch Display 7" Parallel
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-5-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3298;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=TCfvQZMlT2FEQWtnKqizOTemtEj324CkM8hau8ASkwU=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JO5eZ+T8KJ/kwVPP/owd6nwBm69uJ9cP/uzLjhI3
 vufdPFfeUcpC4MYF4OsmCJLxhNVQT6FEFkPjuZkmDmsTCBDGLg4BWAiHR4M/wxYTFMzp29os1Wa
 vTrj3+FD+++2xXVydaj/M2q9Lxo4mY+RYULf8gXJff2Z16d9TN1+Pdp6ytPbHgzfX22/uXzrBn3
 WlTwA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch, handled by the touch controller on the module.

The overlay is also combined with the Colibri iMX6 V1.2 Evaluation
Board v3 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...colibri-tdx-panel-res-touch-7inch-parallel.dtso | 29 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 02d21d62b370..c15b09c058eb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -92,6 +92,10 @@ imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter-dtb
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx-hdmi.dtbo
@@ -146,12 +150,14 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-tdx-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6dl-colibri-v1.2-eval-v3-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..331c81332081
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};

-- 
2.55.0

