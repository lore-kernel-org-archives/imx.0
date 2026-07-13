Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7547031C56D
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955216; cv=none; b=dEyYpM3rcQ0RU4xd7FFGi/Efw1/ehBnPgAbpcehfMw3BSN1K7QtIe2IdMRGN2vlE2NzGkvfMzHIjUnabvrwqwq2W+yWlPZ5c7uhUKUs00Hq/+7mNKHVc7RlkshvqF0unT/xg+nSsXfV5cnIK6DgbCusc5TeHdnfOMf/irmlYO6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955216; c=relaxed/simple;
	bh=jlnzdBWKihd3qQboZyNAz6x+xJB3wNO0aLpCSwPK8QY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncdgldSj8g0RQUfa5VIXjU/VdkUt2MA9U/WwEQdoaVF+mJdSbYZ8xY2nifvBu2wRzdKYmZALZx+kaJBtSAMal04Ywo90u04pi70QfQwSCtmn67YBimES9VNVaeudIFnrcjG2veEeoP0k4xXw/a/aU8Hs39AUMEChuwqUlAKrtrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LN67R1v8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LN67R1v8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ec555a26so21391455e9.0
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955213; x=1784560013; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QKRuht4Zo9grMOtpWKiMvv6L6icfupPh6mIS6dQbZRs=;
        b=LN67R1v8KPOmhfFEVVT5/LkCH2f1PYUTU6bppdRmcCIBCYO3gntbgHoimnPDXcSKYZ
         BtESnUNjKSCo0O1YAClQcrFJKEBePqPDRIySFPX6IrfvfcMx6aWbcBdu8AUCCmNe+sxq
         NVZ2rMS9nUED/qjVcriVWgu/Qry+WvkAkug2/VMOB7FBlSyZBJ2xVitrYCEqprWR/D6E
         QVmCuZI8GWkBy+J5Eci399ZrMq+7XBHluUPruFERWcRplsly/yD2J097wxBA9ycmlInr
         Jg3P/G6v1a02IrC8QkbyzhA0JYaebvJu91x96Ltq1elnwN4YjhCMXijEmpVAqiqWafTL
         FChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955213; x=1784560013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKRuht4Zo9grMOtpWKiMvv6L6icfupPh6mIS6dQbZRs=;
        b=N8L+oTziq5bZZc/RgihNAWvdejKqj818lFctPul4+PpGjOByPLVVOd21xI03zcZM/D
         hLwUIrXiY7A8rAJsoAvl2AoHpsE6HiXjX2gQl+dzBSAZnFedikrf8HLsIO4iAFQWrqlZ
         CE/ajEUW7ZVU1AKjsCss5fm6519E8oG5f1h3k7rmzRElYTlAp48wvbAM6kFbczjLfJk2
         LFlMQcamhZs2bLZNgJTjLE8XY5GXHcuwm2p9Nsz49Lb+8+TANhg5DE5KykIffSAeTIRp
         cMP01dFniYfRzs2L5Mi+ovMaxLkvI/xl3oKoFbKlq14Cj2VgSYFX9EFdNfVCJAgG1SBS
         UOyg==
X-Forwarded-Encrypted: i=1; AHgh+Rr1Yy8yPHN93EqZ5HF2wJcUTICqNGtricCU4Q7lIeY0cRgWD7f3v/JesPcCbzzf0zuhaVw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXUUC7Eg2FUX8tfekRgmeiCvbe3R1fYOYVsuWeAXKsVKkWnwLP
	Gsf3jwAHgE5upm7wYCHZvtBerfAnYkMydSoMAYvYmzHvbUgnp10tQghR
X-Gm-Gg: AfdE7cmJj+fgzPNpOmKOEcCmRlVGqQJpeZIZYyIXPSdVf1fSZkUUy79qATrgFmlx2HD
	Wzna12jnr3e+fiSmmwmyTbJdp9VyikWZMEt8AHLSDl+JK3ijuS1d4eGkjIElqzEGyND/dUwyuDw
	EkGYTsU5Y4Q7lBkSnpB76QZOEnW1mBNRJT2u1GaHyAyb+Ol2KIz5Jr9d0OJViEkqh+HsseKKJ5e
	IOrkKD9nCEvJ3beKpuJwOYtEKvSbAlnV+WYxtaqyVxbk7zu5+C3AG8i1r1vAp7CsNpXA+7V4KOM
	OVBl89tFuvxQlA9/gR07/KpoiCcG3cn+pfKbybtBRv+sbaVfrT0wkETKSCfe6TAx3X8yEdVEoA3
	3rq+vmhG1zdG5dQG4Gut1nSnBpKxmZbRzVNuFx/GqOOhIxYmL22SGS3Qe6N9uyTcFwl8OKmlRib
	ifiFNo2ez3hrcFLA8u6Bc3GcRCvKBeWV+Wq/D1gRt63YELgsSQcKxJ5xDtWLGhNNtprzBO2qpGI
	h4w2cAnCVADee1izMh5Y3zdluM=
X-Received: by 2002:a7b:c447:0:b0:493:c548:87fb with SMTP id 5b1f17b1804b1-493f8834f07mr69080305e9.36.1783955212518;
        Mon, 13 Jul 2026 08:06:52 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:52 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:22 +0200
Subject: [PATCH 1/8] arm64: dts: freescale: imx8mm-verdin: Add NAU8822
 Bridge Tied Load
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-1-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
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
index 01d4ddfde098..f833e179ab3c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -176,6 +176,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
@@ -183,12 +184,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
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

