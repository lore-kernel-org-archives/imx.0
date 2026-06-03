Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D618481AB3
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492393; cv=none; b=RL0CG3T3z6EJnb2QnfcOhuIOkQQu7eMmJhH/Hdq/0LCc6qOfhRxnHBFzhnLq/qYyJHkgwALmDyJ0f93Tzyxp6ZVZXVw5BI/m5p0S8HM5zhgRvci3394YDDbKfqb2MbKVpFX6hn5nfUI6v3l6SmffqOMUChbmK0ldIN7gROX6elA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492393; c=relaxed/simple;
	bh=6OM3yxzhPjBt16s7w15QUwvhrHSDAam1R5GqhU8R45M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q34hOsisw2XnivJH+VFWtagNVc+Kt807Bg35ikT8vleHyg41EgTai/JoW0ap27kgelLXnh3EKS9nEiVkBJ60ryfeHlhxXo16HrcOL3ongIRgNPeSV9zFd5vcJziRHUF32zHZ/BUf+Xkcu4f+PJZi7THG8Vyn33snOtxO1KaYC+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwkPn4Nq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwkPn4Nq"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso4677665f8f.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492386; x=1781097186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgwmeHX1hbkUcZ0QBlqPTtZl5v1WvSKOppfTm3dzSus=;
        b=CwkPn4NqW9ml/4j+Di3yBpACBi2p/1t2iW5bmpFLRLNb+kBfjpHUB7k0/q6QdvfGWU
         VkaxgjCkXhTWWj8lHUHkjNnqQtCDVnQrYxiCy4LTz9Mt85KkM/TqHTqdGK0Ahpn6rLO3
         kWY8/Rd//l225Vh8b5QjoP/+5JUqbi/+Yv7YKgdsMwvBWysyZgpjbPfMd9NNJRUTGNk/
         VVWOYbjZ/D7WYPKMzN+MlvmNR4oTB5r+i+Fz2HNvzSlit/87l4VaGhLQsrX6lyZ5wYiN
         sZkJGFY5Jr0hYhOctMy9Ue0wKsRVLLMNBYmTFg9+Ngsyuv3RLkpmBE+SxmjTC+l+/7Xy
         SRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492386; x=1781097186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YgwmeHX1hbkUcZ0QBlqPTtZl5v1WvSKOppfTm3dzSus=;
        b=EnZAZ6x9kzrxXyZj1FWDJe3GhLjyXGI0XyVZqWiOilMePsu7/sG1zDbc2kdttqV/on
         dmio+A9wU5AD0pumf3yRdY1ZdF3hBOLNcocMFVxudnTkfrvqAslumj94yZ3DXMUX1NK8
         mX1k2pF85YOIGc/4oN+MkyTfubbyqSJjIuyIDiBQsD37Nh4gGjeglIFxJwjLbftOf3HJ
         H2cK8AMmhmrPjjW2pqS8KNFFH/tS9/3Zy/IQNQUqB/0toswoNxjA4Ctl3lh9OC+nRlRK
         j1wddhChl0KKkt7brjBjfVEx6+XKCBL9eWK8alykc4buIEuVvNe9E8ckE4qYvheSOsGJ
         wxMA==
X-Forwarded-Encrypted: i=1; AFNElJ8anaEdUmunhzZNdQ9gQq/oK4G3Of4mrk0d9nEjkpqjowRb9EQy5Srl2tnTlS0XuC6Ryow=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq8gKVF9bonoGweYcrlzr/719ltzca1MqA1dZIRfgCwQSvSYRB
	7QNBqcT2qz6NO/AeoUcN8fYmIwxOZ553EtvLjuSNSEdZBOGucn4FdJV15yH6xA==
X-Gm-Gg: Acq92OHovj9yCTg95jhEHDkEWbuPTJ0yxqHm+91ZCj+khri6cRtj4Uenom9VP1MvQF3
	fkrlQo/IHNdAOnl43x0yL7XAaZseAHjPrbLJ0nw8FA8zo0k/SZC90WxKKsWsR/6HSqOCEMTSEzr
	c5zL+DNVpMSmMjW6ONGNQvUhwZwl5hJyzH+zrLmkATwJ6QJRAzZJkmbWtbzfqaPNYkCkM+oblRM
	uzwu3zHXA/DchKjxXC0AO6CuN/zD6bGzy9a/Gve81BkqV3C1EIqZAg5lJo3j2ScKfv/pcNXEIcv
	EFdQBoo315g2xpVOkzrwQi0cTbRpvBKlhFdsD2B75L9P6MzXAai8cv5LdFp/6/A04ex58ewGBlL
	jvQ3JEmOhJsH1wFXsB3piGKq991zP/IhS+ZKlbX8snMCxOQK4GxK+IxPwaCe41ysYDOjxx1DgHS
	B5/jeew74ZAfPYLi/Uj1Sx9LcM/UkHGUZfRmNqJJFm2Fn6EYQL0CYRWMwm+vfPrzXh3BPP4OnKZ
	ajCYJ76ghKaJNp2jW2wmTYT9FTKnfGng3SgZ0SKmDNLZYVz
X-Received: by 2002:a05:600c:1551:b0:490:9d1b:2022 with SMTP id 5b1f17b1804b1-490b5e805aemr59644945e9.13.1780492385546;
        Wed, 03 Jun 2026 06:13:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:05 -0700 (PDT)
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
Subject: [PATCH v2 11/12] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Wed,  3 Jun 2026 15:12:49 +0200
Message-ID: <ecdc707f750339257a758a09b61f5382d0bde471.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 91d24110a283..912d064a4ce1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -246,6 +246,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -398,6 +404,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3

