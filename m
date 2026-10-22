Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673493;
	b=TQC52YH938HFkuSHyKC2mXQXfucS4tn8gFQRxUkW+nCnFe4jpGfZh0W4f8Bpy1S9CFDy
	 gK7AQwj3mCXEkArgRh8uODNJ44sFbuNP8UhUy7iCT05s3bVFSGxDXWmGlvfvSGVaG+UHJ
	 5nmgaJ5/6K5eCCg3Vc8pddsQYcq1lTcU8IkGIC7ZTwM4sVcJ10TDdQWU2bQBTiSVVXNMU
	 p6FiYXbXABY4h80XmT3mwz2TzDIFSYTiJSqwf8vhbx2ocR/YksZ/jX9IhoYFc+KWXPCxM
	 sW9eRVe0ECJN0aDt3O23nUlrDj7egJIf3yxs5vHok6bAwnU7j2sbxOqsMCO4jB3Si+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
	b=lW9/1fSCNLWPRQTzhSF8XtBsf7wrlSQXd/vwuY31Bi95MxGjbeIhBRrj1uikqrBe3Lnd
	 ncMgHeZu/E8MBI7KboL3xTXUOAEwOrA+10njZI63cPuwl4mEIL7raPWer8zoaNCMExul9
	 doRne5u22ZVPvB8CVmb7Fhp5AeEBon2e6UrfsPocv4z+tmpwSn+LVM9PqjQNWQvdZAlFB
	 nfElJJg3bQRVxKpHJhZE9oGKNRa4G9i2Z5UDR2hTUD97Oes3JQIRp3BXOyPZSbd4XWZwq
	 IBe6MpdFIwRU/B2FVY2YccwyhU/LN4WqWidcpMi5uVwxn2DsY+bYVDgxH383kXWZgig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D4rKfz0j;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7938606A330
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 12:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7938606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D4rKfz0j
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso16566525e9.1
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673491; x=1793278291; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
        b=D4rKfz0jeEZr1KcJDX9x7cYSnrKZUvjYnrCBdGx26l1yUzs/fU8cJX2EXzOxLyGya/
         ECaWrUrvGanXRnb/CGz+/0cTl95D36Yl1cCmoBLrfxtGw+d604wvqqrS7AzsMaZQuGlm
         SQ2eKnZ/j9FHbGwWqXB3+PeA76zqSXcdsNKrLGEfrkO8aIZ+ZVQGVgJraBLgDRgrnECP
         hr0oSpa3YV3xRGRE2Q9ikwjlVQy+DPnRMPLUC78tc15hMlK7t0F+3Vtk3P8DcRsQzPcP
         Dg8icFMoKY2ohqBpLaRDQMwNQhWACETWwEHteqBKOYYiw6kLMJb0OCajjn1PNCjhIPk6
         9UqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673491; x=1793278291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UC1n9q3EpmPuUpvBqt4fP3LiFXC+thJA0wBcCFtVB2o=;
        b=PQ7RzFMNl1+Kt0zEapci8A4nTnrLUY6fzE6zkLVpwgYgTIc8j/2/n3oJ6qtgdaEUOO
         NVPG5wrALbwh/r0Ez0Zu10KNofGf3d5uBlBy89bf9fEjwzrcddjSswcZm4fWy+PcFAru
         JGWA0qH/MqVnRvqK8R9Kp0nvXXI4KDR+/1o91iMyZhrSdveJEnCIuSApCEoHeQd3QTgf
         dBYdwZa4WWtrx8DY1laEsTLPdGriVlgapYTzbKImsSfFpqRriTQOVnpjgaQw54La9tE8
         bENOUXIVPFUoXFPSlCjTXvHxtyKjxN43lO2XztIJEdv+XBJDohgH+ah+vfCK8stOzDOr
         tbzQ==
X-Gm-Message-State: AFq9FYJInTV3u7+rcMP74+4nzMU+nsRjkmLCDiCu4yACEw1Ax6nboN9f
	NSba1ACHX+/z3ciJA2iEcReL2bSVJ3OdeNQBfNm3k7cO98Q3lZDQxZMf
X-Gm-Gg: AYBFou1E65iU46yKOzxTeZAVjAlRPA1DaDWDCVI+YVSnxHN+55LWmS1LA+1oQS3aazY
	+YulOHr8fpcIXOW2Hj0DuHjZpznRnmJLPpOVjwiGebUGjBGjgwfGjGpikmiklDZfHg55mL/F1Mf
	L00i+XRAZ6fJ/NqVwdjdsB2dkwMt4CUq3UNMVMfIhOHtfDUhvYpgUNEXCA8MKP2+s58aszbwcFo
	/5QGzhHVk80w2pmewFpn8rMEOUnAwOc9lpC2oJwfOdCFCzAqcave8bo26liqHZe/rovB6kEXlj/
	S2AqTQPOL0NKfyhSdqBYnoX0/vSaBHivMCkwxdVeA3Hx9XIPOSQ2/+Xx9ctDzRS0wUyiA2e0aH+
	6picciH24y5yQZR6tSvvqc72qkLZcBZ/yOtUHkyPqsyvj6fGsks1eW4qdwfBgBrVg8HzzJdsOHc
	NLP891/G+NlvML07muvM1MEeO4LT9BnC9S/NQ1Hr/ts3sxRH7DFv7KXuRbnAeLcawYA+zXLnW72
	gkSGTIKJilu79OdTdB1DJMIxMNO1jEX+8VS329yrQ/wW/jd6gM1Cb5RS0Fzv3jnpuY/nekSilhF
	uDa7kUdoINvpi2tpJjHDx5NW4i4Gt52jEBtHSi8YFhUWPYkd9LXZIqk=
X-Received: by 2002:a05:600c:8b6a:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a1fdd3bc69mr97539725e9.30.1792673490763;
        Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a0f243sm64112995e9.5.2026.10.22.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:51:30 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 14:51:06 +0200
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-verdin: Add NAU8822
 Bridge Tied Load
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
Message-Id: <20261022-imx-nau8822-btl-v2-2-b4221ed43650@toradex.com>
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

Combine the shared NAU8822 Bridge Tied Load (BTL) overlay with the
Verdin iMX8M Plus Development Board device tree to provide a
ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a4f26aef77fc..3821e3f16210 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -738,12 +738,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx-tdx-nau8822-btl.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo

-- 
2.43.0

