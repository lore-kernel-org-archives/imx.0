Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB054E36C3
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408731; cv=none; b=J7xhsNP3eDxJF8KlLpy/KiMlEO3Bj0oq1mZre1q7WPRC8eHSaCQgwJu0tV6Dk63o2es+PaQlEIyQ8dTcLgIUFESKbbqTUmyVbUSBfcDzkFZMb8Zj/fVFjqsKf52vDBMBROQHij5LPFj6f3dUq0qh14fkDW7pVJzcL6tz+qd5W+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408731; c=relaxed/simple;
	bh=mhxLCTPjVQZv2OtRsJyKUu3/MGnO5VTuhQw6MyljM28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rJDlh3nHCR7IN5+FlkfZ6wX1l3i97W3exKs4lgheVrw0dL0mLQ4KDNGlQOBI7tI1d9Jk8FoNoQfyCc5YygdaznyeR/GEGmczdNquxhRcjCp+FCXygLu9ZArqvoaj3mb8Nsrx11WfWwyBz5ReMx8vvTjgPuLoEMXJvZmYcyc3zh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiAi6EFU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiAi6EFU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so945936f8f.3
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408725; x=1793013525; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADWQiUiXmhFxdxGNtaNp4L2f/HRKA6KEJjR+eWf0vVM=;
        b=RiAi6EFUPfisjBzvy/m9DHLUXa5p4zJq+poNlaBi7VsWoCZLAnit8a7tL5UAcR0z+8
         eLvEy5uFrHmtR+cr0Nd+yeEhdcBRcCk/rxF0YaNv3mD3UyTjHM/Q0eg+vpDmlyF2Ryba
         ATkuathQWok/xeGdxhcf31rB55PUaMIRS/FPhrvxvY1/BTpLFJ8wgupmQl9WZzwRpVwV
         IHHNW/esmqPHNcMyeGDWQ6bk2zd5lZHGzQPyUrQDfPwJ/YbrBBY3Heli44En8HQnxp/c
         Q1ZaESav/Ic/+5T7ScwIoSiSokRcgwDUPkfFFaHaXBN26pzlN99bTP/p4a8NZdQQsMsw
         wctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408725; x=1793013525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADWQiUiXmhFxdxGNtaNp4L2f/HRKA6KEJjR+eWf0vVM=;
        b=YbsYRHFbCP9sMcl12ns48Of87x7dcJTlW6+knyMjyOzzA56vyuZey+5j0h4Ethsqcy
         JiyxZHmRMlmIR8w5/Gpw2+Y3p9ZVnhs6KJ0P7vu2ltPQYPyuoiycplvy5QDgPqYiFfuD
         M7Se19hXWdbI29qYsRxei/6XyKUwGlh7shv9D/UkADLneLihpSLq7g/QcKvRyyaXRqFP
         HAZJL8fZNPtqvCNoh9KZGAMLf5Mrjpi+aN5NlGy1GZQNHm+sYcbaOChH4KwDjITEn19B
         hAu2uSd3V2fw1EoWsTgaJ7iV0f0nA4m2AY6adMTfOCrap/T4QPhoLHYhsITe4VNgKS0m
         1Pqw==
X-Forwarded-Encrypted: i=1; AKwUvBzX16t0xEUNuvSaFXRGl8Mqmr5pNPbLDEmLGjvvMRNkLdgC+tUA3nXu26FkrBr4bbAnSDo=@lists.linux.dev
X-Gm-Message-State: AFq9FYLedfJ/KtdvDW6PeHOw6Zt+17vtEAJabxNIwtoWaaxcBUr5nF2U
	uwT2LDKmX9YFYdQ9QuwS1swhiXMJo+w7wLX7aFgLi89xM2AZIn9yr1kf
X-Gm-Gg: AYBFou2hkRaBw6ZN+ty5SoNkw8KWxw68rNn952ckNpBDJo1BmOTKpJkBg91gdWiiv2X
	XvVs6DznHGfwEMKhNE/sE8US6cBZ9nemj4Tkfu7XbHY2Za2q1h+mGM8usbcv4VAEZMPgWI9oytD
	0sGYK3TO4dsptsuy9fst8umKhnAT93NW7COnZTyntEqhZu6L133XWui+XqkCfjEWUTbYKezL8zo
	KtFHYk3DwomL51wT2ovTb0GanvKTe26ea1YSwfaaa89ObwK/G64iHpMTv7XTaLYFbBSbTtRro9O
	f2C/XBOe2Bhmj7zdaj105u3chSUIgeGre4YnwpbEGaJ8td74j1Tt5fo6+z4i/THdi8+Cjsm6Arm
	90je59oLhczEzduuZYqJh7nTSfWznrQXeZEhQ4d/OZm22p0rQbdYlPsRLjGPvpkkIRvxkSxlNN2
	ay8IF7B/h9rReeX7RN3b43GyjTHbDcRQQo/mwszlRm0QjZRRctWBjebrM24yiFUreY+Oom7xdR2
	cOW4wJz02h05sBhrzklBBtZYkspW70G712re67DUXm76NjZOgLjRKeD8Q6RQ8/N6fTcvbsNb/6N
	pEtM2+sygYo9u7HPHIARWDAIuMLIZr5I
X-Received: by 2002:a05:600c:858c:b0:4a1:d957:733e with SMTP id 5b1f17b1804b1-4a1d95773ccmr99705095e9.26.1792408725266;
        Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:44 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:33 +0200
Subject: [PATCH 4/5] ARM: dts: imx6dl-colibri: Add Toradex Resistive Touch
 Display 7" Parallel
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-4-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=3yhzmAkS0sm6Z89eEvnHRy31Jkz9wloR2qd4ecuJsYo=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qe/r05eak5Xb/exYr29f+X5FfZ4G3D/2f5hgRefa
 sW8zA82HaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgIkwRTP8M37288i/Pm6tg5eN
 VBZ6Mrlvmv3xrG/vRfbQ1jsRsTwZrYwMd/LMd85bqCL69jzn710vFGafP3zISMVverOM+IqdUcp
 /2AA=
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
 ...6dl-colibri-panel-res-touch-7inch-parallel.dtso | 29 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 4f59ef0855cb..1ea51b13ab7c 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -92,6 +92,10 @@ imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter-dtbs :=
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -146,12 +150,14 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-iris-v2-hdmi.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
+	imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 000000000000..331c81332081
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-panel-res-touch-7inch-parallel.dtso
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

