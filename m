Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249BE448D1A
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910293; cv=none; b=VIGauLNUGoyBJBAl+jIzgfk+ct6x7m9SCFZ4SLyW7LmCFQj1TzlvFMK6MyNgUIdcoOiWABlk5VCIFJRqlPJRJ7UOZkYt92PiE0Gzz9WQkyqtUIbPfkTQNople+Df1YDU/C89lWxwX5LltNc0YALFK/KFoDW10UrnJl/wkoSIQPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910293; c=relaxed/simple;
	bh=Dt11JjlnXRNlsfRDZJaKONmkHC1Tz3sJpFyIwNZn6oU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A7HOn6nGiAlB8oqYb5c7rG9PTvF6DyUzWvA2taDNLBDEFnEJ1ahNL8O5pOo0e44UnOg6n0VW6+DPJ2pjuMWOnIpyYfM8NB9GxGLiR7ZieHA/rSpth97YgX3vIoZdBunGIABgZYgjqdtGmtZnwinoQ8BtiV0D0F/olOvdvWyZxGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+IYXE+p; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+IYXE+p"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so578216f8f.2
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 09:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910289; x=1785515089; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oca1257RcNleArjY25A/HuTOrlgfLsamKajTMfVExe0=;
        b=i+IYXE+pqp97cuf/Eo13LhNp1TI8OEdBNmmc4kd1YRGfF8Xyw749A4AIUxodHgzBI+
         oe4jYEKHsP0P6P6FzkaMcCazfaXV02U3V47h/4ul+E1ounwHNPbekqAfzzTl4EubFmWC
         q0Ru+G7ohf63gvK9wx99ZbinW5eGFRiiA07QIfU6jYoz+rwT79wXRDXnuKnOUsHLvBAD
         O2XlIRYlHymM1HxRiGLesaFGHluEQWY0f+3I3AaoQjlHhYeOUSBVMa4Zf/BqMg4v5rgv
         T6HWI18UNDvbMGpBQIYmEqIJr9z0QpcoHcXk847zGbSfIWZMbVw9Z0LW4ZKf8WnjCncP
         NUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910289; x=1785515089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oca1257RcNleArjY25A/HuTOrlgfLsamKajTMfVExe0=;
        b=JFhgIr4pC6yMWLTXIxS9TbjcbTIQqJBZLxh6qVXhvC2zYnEmnyvJ1wAAGVFlllvb32
         LovNPU15qS0oBSgflpWxL4r/pp3l+K7kZReTpN1FWqmZmgNkH2gCRdj76rAmkeW0CKFA
         Ul32lq7HL2Kg9/MyvASI9QrQLfEMSqsJtaMvHLhXVVXC8e0j3ZKP/5FXB/jXJQmTygRF
         5R+6wBcS+1CwjZShIdVhjYZbFxb4GoO7WxDFE7DP7LuvmZrdmwMYP4Ah1wGaaWEWT9xB
         t1VRGJ/eItrEv38QOyunyFJZWX2UQxHuBsOp042xi0EpCGi5++ZOE49fjKFh7+EfAMW3
         kOWg==
X-Forwarded-Encrypted: i=1; AHgh+RqoEwXxzKs/iJ9PPepVY3wj0/BZkcUGXuKv34MNvxGXRT4+Fvlpae1I6+8R1fnIit6cdEo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZFj6lNVcQV9ddOWuO6mpaHApZmKvs6/FRbcdfUFJaXu+jrmUG
	KhDGrBtCDjVb/CKgO1f8aoH7c64qSalQp2jaI/yaQviu/3XuKKnFqp1X
X-Gm-Gg: AR+sD13h3VEMi49/HBaLF6O6ZAEYI+a/9O224JguAPjWfvdbf6D8vkzPfk7AFqkhDTe
	3RxERsAZzQtyAtCupUszUOaiKNKYMNvhKKs5fI27F1vpjVdQWTziL34nR36h0hnCwxPGo8KxxgN
	cAsW4Z41ndDaJNwaeZZZXWW5BJF5t+Wbw59q7IWvZmYHfrjeLJaKXCqPEW6Bf7e0Os9jEAx+1H/
	1IlfddD5hSlzg4ySz+RRpNTsBmHz+qFSXNzToCYa+hOsLQ1f0s3qtlDK8EvyEXMppwQEslfOK8T
	d2rx/1tVxOW9VkizEHA0DZcHmCzkn1N54P2MH3q6Urvr8VHBujkrV3jSRskbZLQwt405xOife96
	doha9u2k06xis4BFqYbvdMn3t9FcC4zODLef83RhoLbzOW4Bj+9FE3MtTdGhu7k4Vxe9b8ubRKW
	FELyt84PQXH5ljoo5H/4pkzxkyaJ0iE0w4vJy5aUwhJwhnXLpJbEMk6vBuLQuXtoJHlEyEl0B7E
	8Ly8A==
X-Received: by 2002:a05:6000:1869:b0:47e:8e8a:43f5 with SMTP id ffacd0b85a97d-47f8d71c758mr10505852f8f.20.1784910288925;
        Fri, 24 Jul 2026 09:24:48 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:48 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:33 +0200
Subject: [PATCH v2 7/7] arm64: dts: freescale: imx8mm-verdin: Add
 Cortex-M4F UART_4 overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-7-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M4F firmware. Add an overlay
that marks the UART as reserved so Linux does not claim the port.

The overlay is also combined with the Verdin iMX8M Mini Development
Board device tree to provide a ready-to-use DTB for the WiFi SoM
variant.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index fe261d7bdab5..95ae85ab4adf 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -192,6 +192,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
@@ -199,6 +200,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
@@ -220,6 +222,7 @@ imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..8dbecffe9e7b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX8M Mini UART_4 for Cortex-M4F
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&uart4 {
+	status = "reserved";
+};

-- 
2.43.0

