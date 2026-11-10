Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308362;
	b=Mf58SeNuQkUjja5Sl8Tm/HiQj2HHqp/IFwCcKI01wZXtb54sQWCiQKEmsByUPkwTnKCs
	 MsJApBRnx0O9Rats6mV8mLVKKHi/jhEBJk3KPy9cHp+dtrp04Ymggy8qMkH6vp6mWLhjn
	 /3ENi3F/x9otkhrhqBAcW0k+sZnps26V6fGoW7iA+o3G4FGBgDz6PrmwAkV+Vyhjes919
	 kEnyg1GqUbFbQr5nHzV9OBEwR1sg29eDWzhGd6wFvdgbWEhPry12jlW+M0LxhKDSZUh/1
	 KIJJt/jgDR1EpnbmjGxnMjaSgc4RzM32yJwlpDrD2h8rz7SKaT4YPfDFwn/4v//DNFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
	b=5ZV24NM65NOXLZcnRHg8kYx4KxvHkL7cFP1+EwyPA1Rb+GZbATGbO4B3tX5Wt9ZMWfEd
	 Qp0oYESWkOACl/ZxeM2PbIJUZpOcycironmw0RCXtVW4of37ZJEoezUy6OPq144h3BiCe
	 +B7Ltafplwt8U5aVR3EU6qpuj5LFtlc9656MsIG0uPojTfgI866w/BO0Qfv+mdu7w9K/U
	 ZJfvdIoMY6IlG9wabAvMtGJzCzkxoNfc/ba8uKjDny9Fbt8dPXUf996oRULz287q03DOQ
	 /YCWqajmf4HnCQsGDkEvK0kthdg3m2o5epWjR7uTc4jYHJuSvApqGL86tw1fJMf9vhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J8zM/C+8";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6560D60A260E
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6560D60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J8zM/C+8
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4919a880834so1145107f8f.0
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 02:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308360; x=1794913160; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
        b=J8zM/C+8RcZURfARe6I0FC+VVK0MejLteX3lXnG54OUPPCMKhOw37Z6AZit6syXvUE
         TE/zB8ckT0NUn2YoKa0XqGgEkYnmDltP6gAV/xfsge7HdTGnmlnxurffQDof4hAUd/UY
         2uKKGBPDJe38pJCkaw4Ek4cUnYglbbuaHoiWJNRPJ27KDGalFnHgqMkU/P0wsMtFV6Lz
         7fEKqu0S2lRQQN/MWmuOImzC83u0Ly1UQ78OE0PpmcEcXDdvWw/2EjPXGRpK9mSvvhjt
         yUwFHt3z+sQ18l6+tXe6szFSXYQY9hs8/1zwBDu8PBGAPF3s2Xd+/Ct8RIizjRr+p9hQ
         V9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308360; x=1794913160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcCGiCjdU5FhG+TlgbR/2iRKge2AOKDzUhGWjXjUD5k=;
        b=uDyY3OlDbyKBVjGbk+Tt8YZvO11174eH/18JMtd7BoxuZiGe1/mdrbpJy6sbZYHat8
         PdHE+66a+uJEGK7eDc1IWcnqCrqUWpok2sYZWAJ/L5phgOrLyuAOeKdoD+02yk2C2e2t
         fhDb7QyLprhpwWLFw5zDuxVgt62bk1P84S8JJ/5/Pa2NWqbSDdspCUbQdjsa/thXxtoi
         BKTzzd2wD9TXFvQx/QDS9BFHUZv0CG5HCpytQcwfR6uA/6UqI4bhJiUamurY9HwbGiug
         uhnj1Fb8B9IWDaq1YL/YmpXsiw6M1/vLatVcDlPGBlM9z5ALK2bQVxuqnSVF71oBrliL
         0fRw==
X-Forwarded-Encrypted: i=1; AL+hErEHjiyNklzWxkmksyPUG2yTK5u1yNfAWfSn5Xvl31J2lNVjTICwRV4v/ZV2l9ZX2GI7y6Y=@lists.linux.dev
X-Gm-Message-State: APuU4Z/o4R0fcMGAZX+MeO7+IeJ8Vvz5xw8misiDkTC2bpmMpBdYdGgM
	iHXMyV89DQuak7aYIoPyhfLi6SHQgKtMwpf4YVvE2fHtaut9zjYL5v7v
X-Gm-Gg: AYBFou2ScVUXurTK4uD3qGqciH/+JgS5q7OtjXO3QwupCJFLn8XXbY+Rj6m7Cn9Xhrw
	IacSK706lI7N4MmOJTM6jc2N/+jKUySoHXJ1e2tXo0B8da1j9GBk20pqjtPm9Oo/phLa5BAnkE4
	FmbSS3UuullNAeauGQoinYSYwG7fDYGQ1I2Wj0mW3ucKH1W6ERZD5srjCVyXNiXssQ0RuoKuTk9
	VpX4xzNU37QIteoDk22ZSzuPY3sqAoLOmqiosUq+IAWXyM+7EjMeq4vU5qUQcNJyMu/3TRYlAPJ
	dhhNMk+26qbGbeEfvYqr4r/h+pNTZ9QQaLmM9qPuqOeN6KG2VvnIL3tNmujU1CsDrzBBmcBYODU
	KIo/13jfBaVkSO8z2eH4tN++SNJd6Tn9H9L0xRAbBbykY9X6bgzDR8SDioUVpLAJCqeV5K41/Ed
	zaOV7S1qDOmczhzJLMsAabW0hCnaSQKuy6OfWRS/8WELdexZSwLbq5OH+I+WFpfyQZnYEKeG6n/
	LZ+JHdcC+Ho73CtWUf1IFOm+ImOqVNauBOBU+CNn3WAf4pNy+kHtQenrxICuxdd313WHChpi5/+
	dpmHEhwYehytkz4SAZ0/f4Uc8W6tYpvT2aH+00tvbSuLGLtAVjh6vGiUK1sTx9DeTGZeMmKO7TY
	D05T/OrMoFB17AsVhp7Du197/ajF8mBTIlnG423mRD9VgfNuENRs=
X-Received: by 2002:a05:6000:460a:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-498302fbab6mr3856100f8f.35.1794308359531;
        Tue, 10 Nov 2026 02:59:19 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:19 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:15 +0100
Subject: [PATCH v2 3/6] ARM: dts: imx6dl-colibri: Add Toradex Capacitive
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
Message-Id: <20261110-colibri-imx6-overlays-v2-3-9776c186d953@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4169;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=9wYjQMWgGZ2miySG/qhMsDxpWS6y2NDDR/Qv0+L/cjs=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JPZ7v7UNSkCzt9e1x90ORjV9ayX2TmIIUc6YEG72
 W6z17qWHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIn0zWX4H9Bddcuo3tVz27J1
 Mo2OB/Oak602q93+8sXxdsvO9OT1Pxn+F78VfSQR+dDLLLNr6WPD/S5VLrdk789W27ppytwHFlJ
 r+QA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Colibri iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Iris v2 and Aster carrier boards.

The touch interrupt and reset signals on SODIMM 107 and SODIMM 106 share
their pads with the WEIM nEXT_CS1 and nEXT_CS2 chip selects, disable
WEIM to avoid the pin conflict.

The overlay is also combined with the Colibri iMX6 V1.2 Iris v2 and
Aster carrier board device trees to provide ready-to-use DTBs.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 | 11 +++++++
 ...colibri-tdx-panel-cap-touch-7inch-parallel.dtso | 38 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c72920658609..7f527e2b9090 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -80,6 +80,10 @@ imx6dl-colibri-v1.2-aster-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx-hdmi.dtbo
@@ -92,6 +96,10 @@ imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -132,14 +140,17 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-hdmi.dtb \
 	imx6dl-colibri-iris-v2.dtb \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
+	imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
+	imx6dl-colibri-v1.2-aster-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-v2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..13b4888e07db
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Iris v2 and Aster v1.1 carrier boards).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
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
+	power-supply = <&reg_module_3v3>;
+
+	status = "okay";
+};
+
+&weim {
+	status = "disabled";
+};

-- 
2.55.0

