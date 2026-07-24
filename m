Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4D150997
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910284; cv=none; b=pW12ZQ5SY9WjM0Z504Tf03bl6X96z3+53Tw7+bPAJXt/CVUW2V6KXFaEiEdzq57NBApCjTKntJU8FhfjtKLSZQ5rILjk5qvyflwNPD7znPqaROEiIF4Y0fjnOlT6h+h0Cb/W+qJq2YW7SCCY1z0SGCf1tMzhw/YBZLNCigGs6kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910284; c=relaxed/simple;
	bh=xZsPZpBIozX76x33uid6osTEvOMu7gP9Tz9RTskpCAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tjx/TFjmqOcDWcGYp7EarXidpNuOnQNHi6aK3qjacLdLpDbd9yo5+AyZQH6/be+vnEVMuoMgpdTn8CqmbH5dP4PxJntzYadLP3lwzRiEO24yPTzp1dpzANLHN+eHn8dDQ695Mqwa1jWBVOrm8I/09i3IFxs4BMf1nCpWlNQV3Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KprPCv2N; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KprPCv2N"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so5471565e9.1
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910281; x=1785515081; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kaqe66R3qWhJ5/dzgdJ4AaH835aC7AWww7mcN/p7sJY=;
        b=KprPCv2NcCPfg4ANKSguSR5BkekFAZSGFaV+jme/BRDtkZJiBOo1k4YEUb8LGCXRXR
         Ld5J56+FlrkZ7rBwnCDRILWmL79foqEUM45BpAxbpnETQ3eREol8Njk6OJo4YDbrS50/
         hqLmVwJzpOq7K9OrjKOWDy5QuTraJQjPuAlWsp0eL1TxxhKUEmxOP/bj9wKxd/Jj0/Ld
         W5xuXTkzzZymBXtay+ofbUaC1thE3KoTTYL+C4lkwUGzvFJeCJG6yVUGal8Vk/hhooQG
         SU4A2MUMBhs4parIsbTHyJRhb63/AnZvka44Q4n86qc6fjfNHS1Vdmw+BafNevuTapek
         R/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910281; x=1785515081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kaqe66R3qWhJ5/dzgdJ4AaH835aC7AWww7mcN/p7sJY=;
        b=VK17nf7Bj3NGfqU0O91nQPfx/xGd007ipR+FjtmkNBvrhV6Jb2/GVlwVN6LoCU/dt1
         gmRzlvwTwE7Hs8N0wIJthMvXpUSnNuZvGnZN1kU2p33dc2bZ9Z3NRHDBc0LLb+Ila3g2
         Tmzc0idHk+fUvOp69u6iJaR1eX3VNb6rEsC84Pg0aLKEgqDnhFJhPIF20aVY5cFd1Hnz
         nbkEpQdpSedI0m3LXiFyziw+JPffB4E39L0RrIvy8ab7WyPA6fwIC3oP6T6KyPlzklL/
         V2YjnlICWIj2lr8hMrbcaJuRY0VXfl9ixbtGN2k7hfswym8mgGb5iEEDO6alqHSxB7n9
         ZZJA==
X-Forwarded-Encrypted: i=1; AHgh+RpUkPb81+jIN+7jW9sB1eYHpu0PuUK1H8hMEQuuQ8vtpikR7cDwJYjh0y5jlZsO7zDBKsQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwB1WUxhWJdN/10l/WpZ7x0oAU1mKb5VanaOd9r+7q6rPpWBIVu
	BhB8FCqfwymaBZCacRnZX34LHmPWyuyakrjJTsMXElNJLDz+VX+rlGdC
X-Gm-Gg: AR+sD12IWPdmJElYt5Rf6qZMJOl868xPoWptdLzLRVkPrvKJ54IfIaKltD57K+hNDkI
	ljWb2ajYZdI5iVPU6jo/k5r95SecNL73eMh6151VCY/ciVqnQ6SqH8myLwOhMSQitcw/JL/PYMs
	bzxbGR1kGn9d5bQBWZRjC7iZpjWe6Fxb+bhTsd13qy/3Hoz+bSm9+f0iPLNIibvZ9DfD6FEvo/L
	aOouW75zfm0nWh7NFkmIYGeQlvivb6GAlyb1W084rtrjAPENDeXVRofZJ5PlPGGl7Te5ztDob8z
	z8i4qPIdjFo0CJGfmgEeJ8x3Jyo9CbZO1N5yxdtJI51RyGEGJw5yoJXRWnZhl3NRnKkmPxQPhn9
	76XwJTiq+rj+fEjz+Ul37c57+VyOgTYAsyDAVw3iPOOE7BhCv4wxr40XmCNolclq8NnesafS2Xt
	PEHmv6TKaeXMusF01LSmMl7W8O+D5cFg5b6htuNZBC0JBrVTiV/gXHucLABSEm5fOIg7tu6ovKI
	c/K/w==
X-Received: by 2002:a05:600c:4f44:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-49573c8d564mr98485145e9.3.1784910280700;
        Fri, 24 Jul 2026 09:24:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:39 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:27 +0200
Subject: [PATCH v2 1/7] arm64: dts: freescale: imx8mm-verdin: Add NAU8822
 Bridge Tied Load
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-1-9d7988bd76f6@toradex.com>
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

Add a device tree overlay for configuring the NAU8822 loudspeaker
outputs as a Bridge Tied Load (BTL) output on the Verdin Development
Board.

The overlay adds the codec property for the BTL-capable output
configuration, where the two loudspeaker outputs are combined for higher
output power.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d5c2dc720197..dcc0464b4e80 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -177,6 +177,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
@@ -184,12 +185,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
+imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e4b662519a6b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Verdin Development Board,
+ * combining the two loudspeaker outputs for higher output power.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&nau8822_1a {
+	nuvoton,spk-btl;
+};

-- 
2.43.0

