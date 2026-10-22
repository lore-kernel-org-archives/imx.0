Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678183;
	b=Vs3y9SMPbgBN0E2ksbHfS0KBiGKvr9H5Ul4viqHeG1oVbn6UeTjQWiJckHICyZYzGJKZ
	 xGAD9OOpEm/p+/53PWPrVgLZr2x4g+g2A05UPUwB7+UG/GAUzY5BTST0LgN/rADSwAjS/
	 If5EJev4fh+ArxSqq5/zG6tsXFRot1E4WLA3mv7DM9KJWjuw4hVvTT9cSUTeYNmax+Z9h
	 bC0YLnfpubgIkmPhtk6x8IcqBeKLqCPxeRqTnUfxYh0tHU1G0HpUkhpQIkx4vhlcs20S+
	 kA9ylmHdQ1MWKE25idkvUFILnmPhhGbokmjjc+KFyz2yjSSDjSzi46K4Wr2oc8dWgXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
	b=NbkyrgDcAvFolOpaye+gXShywa16DlRXKfkdZl8dbRo4kq3zNXfv0RauEwuUNlBiY1Sl
	 +vZZBc7Z3ON3mdYZITMf/yHmJaoGt+vVIHbmNAWCR1gg5tN6QxUPs2ZbgXq/4U0sUySOW
	 t1EaTeaUWYvJ+W5Ml3lVe0gqfdsz/5Qg1Bhmemy3Ecp7ZgzHkKjrIa1MSgfS+f0/L57pW
	 00cDJ0shPzoahqKx/+xkvogcnpOAIJ73wVy7lpUpao1lVArjEX9hdpB/fcdONHz9b2tJm
	 lJzldq6nt8LtYPcviFaXnqJnJ7aSGVrZ1ByVv41D/B3zh+ZjEjBI+Kjpe/ypTDt/5eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BVqu9g68;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B2606A32D
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 220B2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BVqu9g68
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so4723075e9.3
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678181; x=1793282981; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
        b=BVqu9g689T8m0UJi8+yWcj0K1mhLn+yjTSz2IILhK3M6OKTDiTKtou8a7+GZCh3Q7O
         QMilpkNWn2e8c9CVM7tDhQ2TNYfHbCVqjJVTRRVwFrIW0rKCUicVT9p1FbG0WycaoF/A
         9mTMfWl/U2zIAZ2WRz/EfKvmCmZIV04cs4bAdHtfr6py8YSJYyu8JHzlDqg/q6A9l+fY
         BB/G2Hh4Ln0kUCostO1R9WHmKG4aDl/LC28Phk8r52DVOBNxL5Wulxv7twysnmBniddF
         ozsNHyv9HSJPWcPbNwkdH3ZKxr+JYFFXUqXnmfzrJY6lag8W5TBIGqLMR24VKn42kwL4
         W0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678181; x=1793282981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXc4CAj//Yvh/R5TXeL7axIFzwlES1+gsFXpkClPxwY=;
        b=BCsH9D4BNwqic9GcGH168e2tAUG07ntvJEQQfGmw2JiRIIGpyyMOb8wpTGToMkyjnb
         VHVUHPPcfBTc4SbjjCKhL0q0nQ+Pxqence+zUH71rxdE/WnMnn1E6QQM3iZTkBIg3Om3
         o5g7o/TCuL3OY+M7JuNwxEAR/T5X5BV9Yv6TIrQByn4nZZhARFEtHAER6vXUKwyFUoW0
         oT1j6IlTxK0GSrBRQx6PECalTetEjCg46dlJ3QV38XJYGTeo24uWRFWw9w1OMmOZQHHP
         fOhBJsbC0NsOhFWL2TOR9+XnoIHAoY/qQGXFRqPatixRRnaLEWkuq0uogEC+F+8JTsMd
         Xj/A==
X-Gm-Message-State: AFq9FYLqV0qHJGI4aN5v1jv7Dxaejgz9HYAn3k+Htuh3juTc0pxzG6Dm
	vN5VKrDwHzmdpeAY/4VyjKp8kUoZ2SsTn0NJbU2VCs+tQxFzSDPWzBmX
X-Gm-Gg: AYBFou1lriGowTyX9Fwba75IvhdWubWoJVp19rfogkkQSeoOrFnsZhELOFgwoKNBI/M
	PEoaR3+VH1fL7E2UcLAJFyYTXUpDw4txporwYhD+/gzrnf0EpR0LV9gkmCGTIU4i8tua/vptkKm
	6Wogb7QBSpfPiZ7mhASwBI5EUNU9u8TC5mrwThx4L8qK23zrMfdtqCrhgkH/T7NxPX5MayZnH+k
	lAJXqGhMzhPwYzMdZaNb4lpYbWGSAmJWGkdCWiwDEG2TPw/07k2LicjBK0ymAxMumHpC3ENsC24
	zvjkIn2jc1cDxiXkeeX+kyxoXEhgM/jZw9OnhyAhvGGc+KH3tNajVNH30EcR3VipdROAacZJ9S0
	I9hZeHWJaa6BhsOq/ABF4qhAlPK7bdEYy6WWX+WjV2XL9mH/0LPhHkaF1QRSWgtZQCX68kLru62
	Ss3hA8gDUAx1iCMKf7MNQapfnXfUccgV/Gx/OvUn5naEj21pSoEFG+9i8YAfDIJEvUHSm456hiA
	9sCChe8BNyl/zJeEEAMW6nWLNoC6YqRyY81+Rhir0icpDuuff7unahpS4xKxY4rPsfrAwlFHnJj
	CnpjNBuMj+EVMx68FXeEk+qTjDhwCfpv9uPI/6T8IdRlGdqcMTMpCQCy8r0xmDfhB3I+Oik2qdk
	n
X-Received: by 2002:a05:600c:1c19:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a1fdd74b84mr137319755e9.35.1792678181416;
        Thu, 22 Oct 2026 07:09:41 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584e760sm12368150f8f.59.2026.10.22.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:09:40 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:09:34 +0200
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
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
Message-Id: <20261022-v1-imx95-overlays-v2-2-c769d6eb54fd@toradex.com>
References: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
In-Reply-To: <20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com>
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

Verdin UART_4 can be assigned to Cortex-M7 firmware. Label it uart_mcu
so the shared imx-tdx-uart-mcu overlay can reserve it, and combine the
overlay with the Verdin iMX8M Plus Development Board device tree to
provide a ready-to-use DTB for the non-WiFi SoM variant. UART_4 carries
Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile           | 3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a40bcbe4876d..5ee9fa583515 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -732,6 +732,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -744,6 +745,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx-tdx-uart-mcu.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..7c9b21a041c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -857,7 +857,7 @@ &uart3 {
 };
 
 /* Verdin UART_4, used for Bluetooth on Wi-Fi/Bluetooth SKUs */
-&uart4 {
+uart_mcu: &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart4>;
 };

-- 
2.43.0

