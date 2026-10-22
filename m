Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673496;
	b=EpqY0yoFjhf5KmCXUAcfxn5A/x/Gy+JcAzODYU0Ejx+6QwHNhiMiFjld9o2v/P6fWTYO
	 O3wJ9HIGvaE8TF8ZutI7R19ShP9ioRPNEgH+4IPRu2ciK55hemoI5dDz+3NZIlbmc1bdS
	 sU++9rzG4kfJlTCY4brZtXpybWxvoXBvgaTeq0BL+GuFD04ImlaiSCkuE/RQa9VoJI/AY
	 r92pEiVk3/ffH7DZKCb4RWdgHGQsf/M/QBqNtolQdrjnsev3snZU80/YSpk+Z8W5Ck76N
	 HjfiWJ7vILmvRCQK/6LmOgQtvjig2u2TvFcAvM4Qd6divNdkixvn3J2WWyX+K0bmFZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
	b=N9O5nkb8QYNewe1rluU50omAvjCkX7DG3sC6y+7Ds87A2aD7SqIDpqlMI6PNiRtXvEiH
	 CrJ8sW7DquzDQ025nLF43cKBk8NEDcETNLYOYnebKCt5t3SPWPv2tFnUWpYGOcWRm7fyL
	 WsvooZNFZjibsuUSydJO5G2kNyO4cewd9/CXEYA0gofT0enFFnUkfB+G2g+yyTllPGaXG
	 sL/KIoGtIdmWJLwY86FIQteeB+Pn/fdH1z2gcrTr3tOHPdVIL7oOohEAqaqLkikYgDLun
	 b7fRbkgXo4sYqL+JBuHTXGaIJUHJozQpfsccSYKN+iuSmqixZJlprfUxWMODhXFyPJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ftC1DTPQ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3013A60A2604
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 12:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3013A60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ftC1DTPQ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so13858915e9.3
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673494; x=1793278294; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
        b=ftC1DTPQHLzYH0XyCwGWOKtQcTG6ROi24h9oBOQoVnc+pMY3zuMU7L2E2aUHxg2POs
         ba9fj4YSdsDfOhJdt9rg3Qzl4FH6GPbXSI32CKM+CyIDt78EjiZVLFg+UMY2ln8lG33W
         2nMIpVAPf973FE8dkkVbbMWDioO0cEa4tNSRPYMWvuLpXV7hRhqO4zRE/dpGcGRbyE/1
         n81UQId7S1y9eDLOXnkR/9mjwNL6i+VgKie3viO4Vuh0WPTaq9v0L2UmA76lKADn6bgB
         XpaznCc0E5ansPLGTDqvstL4H2+tDjABeN/Cfh9AmlFTSbbAoU2IbBjcCzxexfs7Po++
         27Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673494; x=1793278294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcIAT9ULUD3UTihgoNQ39oXw1BrZ4Mf7vBBpZUJnXkY=;
        b=d63Sp76SzMaEhDgQBXUctST+FsyBmR0IBHXYvk241m4zD6vbLkuNoXWCYFEOKmennU
         /iJjO2na4CZbonmxbLQNHrz7G1+M7LILB3gYoEXgtP+XFFsdls3NZlZ5QrLIkMxek94a
         Gw7ACaLrPyqSUMF1IRnx/YLq1XuBIDSnaqSeGi1QT0Fvku+vGHqx4GF5k3c6c4lKeOZA
         KRuiOVjHwO83SpOOHS1sM7qCK1HL6KQpfmzs5DYWljN4BJNdWC5qhVZDaYJQ2VK0xMWz
         5E3JG8qXwVBi0u4meYsYcJ8mG8urwgmjreS+kRoiRJBiklFXpyULL+mtbebgSSdOOhCa
         rjVg==
X-Gm-Message-State: AFq9FYKKHN3pAy5YU83/xT79yKoMsF1y+Xcs1jSD7EECusohwple5xLW
	xCgDPHyxKqieh1vWQagn0kpgmDy+1UZarDifBpHBUD7Zoqfi/mG75PmE
X-Gm-Gg: AYBFou1DEKxhM+KLNWmH8ph+6C2dCxNlonJVa4fNnrwW1SLZsAR24R9CiF1sIWmK4Cl
	D46W++2pHAH2NmAs0ydDZm/JFq6TFdOHaxiM+vYq+h6JvsD8KxDg3qoIWVs/rK3WFTO7nyj53Ly
	4wH3kbypneHyFzOaM/Xnz9pusSlo7H18HwpxNs1oi1RTRw5CQ303EtZrFDfNrlKPBoXM59X3zR3
	5/Ix2r3VCuR0LR90WiX+w8j87ttKVolDczuA5kv1avFDWs+h/fjVKgl6dFtDn4yEp9uwI+uxhTB
	n72GSwpOSmAS7UbCMiHbE53UxX90NV7FzuWfdSrfX0aiqrOkip8Nwy21pNOYoYUAR8R64HW6Fwe
	HQbnqgLQa9qs3NH4g2XxZXQi9kQ0PAu4mftBERmYhCi5Co9kwucnIxMpqFYe04EJYvRB5j+ac15
	wt2rLO7to/9fTmrdNLQhM19MbG98oLVUlCRbSBINJhug/gpuIQNgt740CuaGh/lgX1dwFdYzENz
	c0jpHOLsmlyXIT2V7ffLkeh8JlXlTHnAzv4q2gBU7rVkcpKsYvhKUjTbml0k0x8Gv6LbQJKKFS0
	Vx/nvH1lbChGAGhgqX6hNdSAdhJrS5ZoLorjTQh+CnFo6DTO6Tpir/Q=
X-Received: by 2002:a05:600c:1f88:b0:4a1:f90d:6f4c with SMTP id 5b1f17b1804b1-4a1fdd09ef4mr107714775e9.7.1792673489828;
        Thu, 22 Oct 2026 05:51:29 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:29 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:05 +0200
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mm-verdin: Share the
 NAU8822 BTL overlay
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
Message-Id: <20261022-imx-nau8822-btl-v2-1-b4221ed43650@toradex.com>
References: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
In-Reply-To: <20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The NAU8822 audio codec on the Verdin Development Board can combine its
two loudspeaker outputs into a Bridge Tied Load output. Selecting this
mode only sets a property on the codec node, labelled nau8822_1a
independent of the module.

Rename the Verdin iMX8M Mini overlay to imx-tdx-nau8822-btl.dtso so the
same overlay can be used with other modules on the board. The combined
Verdin iMX8M Mini DTB keeps its name.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                               | 5 +++--
 .../{imx8mm-verdin-dev-nau8822-btl.dtso => imx-tdx-nau8822-btl.dtso} | 0
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a80cccf34eb5..a4f26aef77fc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -107,6 +107,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-11-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-8-x.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-tqmlx2160a-mblx2160a-14-7-x.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx-tdx-nau8822-btl.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dx-colibri-iris-v2.dtb
@@ -253,7 +255,6 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
@@ -295,7 +296,7 @@ imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
-imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
rename to arch/arm64/boot/dts/freescale/imx-tdx-nau8822-btl.dtso

-- 
2.43.0

