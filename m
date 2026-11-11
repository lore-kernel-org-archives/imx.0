Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423885;
	b=WNdPIQ/7Rsu/8M82IR+6Wkwa1hKOTVzBrYcWs3Phyeie8Ve83rkOi0FMWC9N+1JO8HH8
	 yAjbJDBMyi81Hib4XtPEpP/j04nnal+Zycu1D2wICtOT+mTUviOgmS0OrnzOdZwB6KLu+
	 s5Ne3TQyWcFAWoGB/w23/M9hFXBy95aYxDZjxv1y8r9SSgiEr0CsfSP4eBVjOvkyE7duu
	 AbsLOQgvfIo1lK0+zli/rL21jDQz1d70e/QZgRU5NsXzoG+cInGRhsvkvUFlu+drv5j6T
	 WDwiygXRqd4IJvHsAUjLaFQfW3bwCueg7S63ZnLb38VuE7Lrq1ZRWFZyhsaonQ8IweA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
	b=BfkLwo/Eg6coOcHmUsZlHYZ7Tj9O0W0Q4rbT2dOgoGYXkDeuQdoaKSa2D94vuopbl5ia
	 Mp6D80lV0m64jwjZtZqqXBrOyqR0ZiQV5sLIS5bNKDCaTsfDePWh/m94n9+oue++LCYrR
	 gxtWfFEN/hxWZFWrtQvRofIiSs4l9mgGdncvU2wwWmBCDMruiXO8zygcqxSLZdautr0r8
	 sVh6F2/C/3zS72l3DNUqbT3LnoGNpzOOPySVl6LokeILyexFx4oW7rJmDPA9asV4EnXGB
	 0UAE9BeMxP1vZHhTaz4ViGnVgL6vywG6f9lbzXEb8Ear/awzwu+XcFiG9/+howMjtHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VM367xmK;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D988606A331
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 19:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D988606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VM367xmK
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2194741a91.3
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 11:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423883; x=1795028683; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
        b=VM367xmKW5ZXbtPZK5Nc5AAzLutqjcTeINLr2xVpWu+K09tW/G2KJkjCxJQHDTckne
         /EgEWq8Yeo38HJGzy5bHy6c+joOKpF3k/vgBWbaOLI2wKjxm2iW28b6Z0Gs4xkR/EsLw
         Yyl0LkJXBQHi731X1GKl9HWUE5MhtoPA+r+NMqgWV9DqV6kyqFseB3EhrqXvulq9TRi5
         Q3E6BDjo4NIsIfZls8TLgrrXqp8P7jObyV9BrAnBjJYUABHH7I2yt3nj/OFKW4aTLZ26
         yI41pTIZ8iIIMc001V1jWZTSxqzp3H1kf4Wd9dc6zICAcN3a1mF9rkcquQitIg40dxHp
         Dx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423883; x=1795028683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
        b=af3KVjXiYucNjn8mBdp5QdkjDPH/l9wqZC1WeZB6vdGlPZd1QKypt2JrLhs56mHLMR
         TjRcBq8u6P7SOEEtPPHJ3IZahUlRS5QQz6Mi8BTAErR5f+54d2FpELYxcm/14+4ixsc5
         L05eyd4s8wYGwSnfjy5Picq6WEekCY1AfiLrNKmTL4ZLDRt4ZkeOOIOyiM8nlvxsUREe
         SJDIhWR1Us7bfhXU4d0mODsf5m16Tk4vfIOuatDENpI5/cArt0ZTyyhO/Li9R1dt+aWb
         N8cRWOjh6xh06IbZ7iQ2vuRsE56HlEBXPHyRVlbxIGLRVMtd+TKIhLNo5qc3PNKwiN3w
         alfg==
X-Forwarded-Encrypted: i=1; AL+hErGAeTfWZz0pUyi+1Msb8Lw+3oF+XdKRGC3TO/IGWju1OkAEP0oRBRvoZ6EgcHr25ArGDdg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9SmjOdBbQj3yvNQ9rm3aOqrJR+04gXZsuNnL34e+PSweCM8QxS
	QD7/i2On/a/bI4H51mJ/MqMX3up/Q3t9oSPIuKGXiLh7h7zM3ejoSObB
X-Gm-Gg: AYBFou3wF2VR2vNZIlSAH540FBXuPRaw6Rf3QsOoOj05KYkNHUX86bqgva3QEamVUFS
	z95nMB4jXW1OyC93wNBjYYDvKavz+uZEHhsRUtuCMVFnOB0bpin5R+DfAk9YGPhrcrkiEHzG94V
	kVnvxw0BrwHAjmQubJZ6YasUrCafOjQnJd4c7R54YSEREF+5kAsmzxqJa47oWQ3zETVIZ88MVI0
	5EaIVJpwOr4kYosvhH8tbRcxhOVUlmgnCMLNG68L05EwDf15sS7HHFk4vEsFpEr8wTOjpX8aOLN
	rcT1WWSMfrmqPB5C92tUZ9yZKNF2inXOxLWn9lfvDCi2jE26y3Whe4Fi4MFWdr29OXTW+Iw7k5A
	Zvc1QTDe1wpj7BiZpwW3ERFKcbGT2D2qvslQgppOGDiJ4wgVK/txAE4y0hP4hKHoFrnCPq7HoLx
	O8QXE/wIxW7BNL6fJxHaWo2fAA3PYDWW/Xie79fKboy1+gq72gTYfex/5On9JTFVCBYEta38Q3m
	4LmGF5cA6hYsuRSAOECFjoNEF9LPcQ3VKu2fyeag+92PRfOoZDkqzo2eH6xv/c4v7BlF6DPXb2D
	m4mOwIl+GKoqR/xIzd0t81oWy6sfO7KAodr1WrxaGnGuwnvAn9fX+aY=
X-Received: by 2002:a17:90b:3b48:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b182f63031mr3037004a91.61.1794423882994;
        Wed, 11 Nov 2026 11:04:42 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:42 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:00 -0300
Subject: [PATCH v2 4/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive
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
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-4-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3576;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ZRG6uTVDCNpvd0EHx/INXE11uzseEG+H6P3n5N9dPRk=;
 b=gMm6Huj51U6J6pMlyymBdzIF5kciVOacCr9+30TMDp5J4q5dzRWiQvxRTBPUIsqOtODnGwOtg
 S4o3V/Mx2M4B0pBSn2y4caf+1wAwhzWVtRS/9A9nn3U12oI3nk3WFJH
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Ixora carrier board and Apalis
Evaluation Board.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 ++++
 ...-apalis-tdx-panel-cap-touch-7inch-parallel.dtso | 34 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 3b69669b27129..d7f9b2b5bb493 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -168,6 +168,10 @@ imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -325,6 +329,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
+	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -336,6 +341,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..f04516e3c5cfa
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Ixora carrier board and Apalis Evaluation Board).
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&atmel_mxt_ts {
+	status = "okay";
+};
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
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

-- 
2.43.0

