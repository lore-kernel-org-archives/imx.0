Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFB34CA77E
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844201; cv=none; b=qUrPAPT1cPy4rhHvaPVBgvWLc1wBy3ahP/yqUNqBWk1T3ADovJc42u7HUzOzLvekyE2KuCBm+KZG9b9q1udqzFAzfTp7MoGfGOeCFUjGX1+XGtnxbdxwRaOqxcmMddn5Df0PmjfXPugKqCpxIqLIj0Ppa7B2REluA6RPF/56qQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844201; c=relaxed/simple;
	bh=nWTgMoW7Alfvw4HC5D4yHSnYtdfCYBNHKKsHkW8vWn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wbn7IUBkkHbonomWoXV9Bw+VP8uGQ0BCm4Z5MxJ9jz+tQfijqGixBIQgBR/t3hi5F9hYLfsfdRbm7icwBT6Qi/1gDjHUcWR8O3fef70sbEa5hixG09e1W9kCt9fVcNsm/0w8jpXYU+BE2MYMibaYQNamwlOEugYrRiy5IjGbaNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy1O6WIV; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy1O6WIV"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so716255f8f.0
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844197; x=1791448997; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gM4qEroTkI7GU8BzlqWFaTCiRRGSMw1n4u6I+iUHzPo=;
        b=Dy1O6WIV33/Pmv7gKVCR/v8JFPt0wN1ZCbnVa5tmcry2IpBQVQ4EAFVUfu9AJKx6jq
         lO2JtdnnC7oMIY0OyUGA7tbbEaEVrByYOmShgM4cXwBD4SLlzq64aC015QRkKOGImj9J
         yTja2ZuAXOKL+upK9pKGy11SYq3KEFII00Ib71ouSNaUvxNdC0QDfN4XQ34jZIHL2kgh
         q0SxPjTQvB6aOBTkgwOrZGMJ04O4LpiHaAbmKjCexQ5ViCsImoeNZGooJxK2O7R8YCpQ
         HPZRu1gPEPW/4rH8ICWuX64UE1D61u+rpAqElqvIH3Kz+LOaNOke7DRxDwy1gnUxLSMC
         /T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844197; x=1791448997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gM4qEroTkI7GU8BzlqWFaTCiRRGSMw1n4u6I+iUHzPo=;
        b=w2YF/x1O0L1KicWor0VIwnqZFONmTb5d0HFr+WY/UmJMKKKP8i151rre4gXyplrKPk
         mb4+hSngWSSzNV8t213e2UrDXNjsfcGTvKtZ54g/uY+d0FdZRon+qgWuO5Cl1mI822kr
         vPWxx9GmWom1qPAnEk3eOB9Y0P/bUPeY22gfBhuIU+LAH/69HCZy0DcZ/OOGY1Y6Wxjf
         9DnAznwZtqMhKPbJE8G8R4ELpd4tIl75guOyIkJQZn90aqUQcm1KKZ+NYh+hmhAiL8MP
         RBRb6rX/C6c/FslIM78AV62omA3lcEpeGyhRdbcRJT44GNzV/KTewQGgemuaXyKN/SgJ
         Su6w==
X-Gm-Message-State: AFuF++mSiVmt5ckbyShpPm8wd3z8hyBpI7mQY7eBd6hFdm3eRX78A4eF
	C4QmgUQXQjhRcUGub12igzXu41+igSAujwMo/i9JVNzoaDgvYrwtdMbS
X-Gm-Gg: AYBFou09uEgobiGaTyPSeFgbECCVeuUto+hJoHjKuztEobBIv4GiR3p8Def7d3derZi
	/tyrDGmnl6H3uc6VNYofb794iyYJX8yVaC3xCHkHBI+rbQHgUZtV6W5ZVsMtrBL3I0rApE2Su0/
	xpmVvg8dyltWrRiKYfwNB9ZNoNBrXWO04d63OEwSaiPPDkSzhG0EtM+B1b2aHCcvkiO94WcbqAY
	CR1m2KmELthCP8re0IaSHd7BmoIbZRC9YFCscR2UfvsiqwaY3lNgA6nYHciXJflel0yILddebnf
	sYRN349DPk6l+gwv5pKDHV6dop51hKroqOom0nlZT8knyGC6x6wiTzRYGI4vgsKLt2ICt9yJ9Gb
	hjy1gD1eTrqCfmfYlqpzpP6WeEr0tygyFMuuvAtjhRcR+KdtuBN83YFFaECkJhiU/zDJIgbAAuX
	Te5hLdFcDmqTLassiMvLih4sd2mqLumCglxnqnEa9DgxxZMmaTLfhxbRX5HkrES9azIVi9gHYQR
	BvQ8jGWyZ98boTHXCIs5P8rGnLe2Iidu4J2a/nMpWSgSzcndIUiVqS7qv/IN6uj9uhb6dJw1w==
X-Received: by 2002:a05:600c:46c8:b0:4a0:f0a:976a with SMTP id 5b1f17b1804b1-4a01ade9bd2mr64054025e9.13.1790844196791;
        Thu, 01 Oct 2026 01:43:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:10 +0200
Subject: [PATCH 1/3] arm64: dts: freescale: imx8-apalis: Add NAU8822 Bridge
 Tied Load
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-1-21881dc324c1@toradex.com>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
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

The NAU8822 on the Apalis Evaluation Board V1.2 can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with the Apalis iMX8.

The overlay is also combined with the Apalis iMX8QM V1.1 on Evaluation
Board V1.2 device tree to provide a ready-to-use DTB. The codec and its
routing are already described by the carrier device tree.

The overlay supports both Apalis iMX8QP and iMX8QM modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  6 ++++++
 .../dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso  | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9971b34f7301..2732b223eb3d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -801,13 +801,19 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mq-zii-ultra-zest.dtb
 imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33-dtbs += imx8mq-tqma8mq-mba8mx.dtb imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8-apalis-eval-v1.2-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
+
+imx8qm-apalis-v1.1-eval-v1.2-nau8822-btl-dtbs := imx8qm-apalis-v1.1-eval-v1.2.dtb \
+	imx8-apalis-eval-v1.2-nau8822-btl.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-tqma8qm-mba8x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
new file mode 100644
index 000000000000..b2f9c43d29cd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2-nau8822-btl.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable Bridge Tied Load (BTL) speaker mode on the Apalis Evaluation
+ * Board V1.2, combining the two loudspeaker outputs for higher output
+ * power.
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

