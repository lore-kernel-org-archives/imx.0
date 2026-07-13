Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6316031C56D
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955228; cv=none; b=C/kegViQ6YoSrAJgP2e2JM/iQveZd+FCC+z1oLkcvnVWF3jEqciko+WdRUQJke0sqdtX8AuhmxxIjqiARAw6B3MdvBHy2k6aZSWhlxKGy0rSJ9ZLUi/u7/8YkCWAStVTmK5OG6I868ie5+nKVzMDpr1DWsHdNQkoxgd76mc9H2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955228; c=relaxed/simple;
	bh=3181rxI7RMc/ENmXtWxGxojMovVD/zC4nX94sor5K1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUmZKE05SsKG7Gmi1PPnOvtg04zX6KUgHQzpgpZbk0tEqX9q5fWfuysvLT2S/HHzTbbdXQbaUnWImAgFMWHwuDhRHatzkbZ28pOdY6gihWcHMY2gRgMiqeGfuoTaGrlInSvdL5eVdypAkkn0ZCYrPtaE63MM8gvuhBRHgLmiA+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJaVS8fr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJaVS8fr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-471eeac43bfso3212883f8f.3
        for <imx@lists.linux.dev>; Mon, 13 Jul 2026 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955221; x=1784560021; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfh4lLbCVK5LG8yB3IA/+fVz0G2PykpCGfs0ou1iHvM=;
        b=LJaVS8frz/h2LhaGrccVoAYyNwLuSZ3A0iHH6t+Ixg+p8Zs7iZbEhLv56PC/qs9FGQ
         YrlXOHAZIJVLXBchFqTpvZ+mehS13CgkF0JhvJe44KNlFWB2DfhVFM74OR9IPr8ZUmHt
         iDhhZUfaiDSKdgs5oJmmyOus9lp5/JxNBf2qziQxLaCOAho2mR44ja2KKS1LnmCuR/m8
         PgO2+PiJcUcuwPY+QCVwPXl51TFLurT+HSuHkj+XnyviOPGolCmOovs87Ag1gj2cNSsb
         qs+KOHgYP/gx5fE/cfcC+F9fmaFJBpzmrAhotYuP9Hur//8Tuv8oyk5dKeOBG/+zRpib
         Vz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955221; x=1784560021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfh4lLbCVK5LG8yB3IA/+fVz0G2PykpCGfs0ou1iHvM=;
        b=DV4DSz2hGiTJb/OyucH7x5K8sfPQmHKuJqPR9MWWPMGNeqVvswkaoAIVv1vxk9dPAQ
         CTUDQr3qYEWUUu7W4IPoei3VBw3GWUX+PmEdkVGAQ1Wt5N/A7fbWTCa3hmmA+ASL+NwL
         WcOCzYqzouMA0X/STYFfR1zy0+r7eFHG5/XvzVAvsbToMkh5YR7imKHCTW9o7bGEwx7j
         bqiG0sYMJUMUaARIVN/jx4srBr7j0bZ6NcsCnnMGkNDcFbaAMSVVEo5r/ZDA7h9O3gXF
         A9w7kwY/SGuij+Enh/374q0wyYlgDY5nW45jRdWnE/lFU4+B+Xq+xJqZ/R3pwvR/eAan
         BQng==
X-Forwarded-Encrypted: i=1; AHgh+RrAnHAzVYurCICOQlI2JYC6/SwsS4M3aU+Nz113JPY2FB+0lZx5pIxxxdgzblt3d2HQN3g=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPPOBJ71CMTbQ+OdRRgIyPCpiGGEBLQQ5CZmNEfl/YY2izYCT7
	Cl1OS7/ClkKEDhlYo4gpKycXyMDJ7ocCcdg/2wqVnO6Rwxssbb562Ype
X-Gm-Gg: AfdE7clgl6qbE/8E5/3WBkEoZOowjUpIEs2P3ilyd0zmgFIrJn2+co6spga5rpJX4cC
	OfPyLVxZxuwsx8XgLTk4piGcBBuFEBHsqmP++6/eDFv2Puk+9MsTZotIy9CIrOAK9UOa9gAbxuU
	oFXpgbjPdbeHu3ia0r6zLPD3O6yOSewFN1vda+TKeX4E/BwikF+GWq3eq6T7fEl4xj4chhlo818
	dC3DYZJyQgdlZxjPpZwbVsTq6BAXCZHdBhwUm1+yh27pXpJSQMg7vUo1u7GYx5BjosS8UYY9vGR
	yn7VFyUrgg8MICS8VoLsMfGA2MJPs/JPGxJUoUW2DBm8N4VzLKvHR/qnMDb3YsshGcoe6IW/2UN
	vnByosnm4nKCT9imTzMSu+X2+2Ebw8cpTlsl0t8n4oP0tnMHOtz3hv+rFOtvl/SHo5ev5T0b4G2
	tcgLhpCEcNaSVdj77TTiwg8fQi1H5FlHucOXX/Y+oWmPIpa4m/0OVyg7+RbhTP34cIct1eLSL9k
	IC+mWQi8ZpPfJly
X-Received: by 2002:a05:6000:4381:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f2dcb50f2mr11326337f8f.14.1783955220701;
        Mon, 13 Jul 2026 08:07:00 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:07:00 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:29 +0200
Subject: [PATCH 8/8] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F
 UART_4 overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-8-4acd63db4504@toradex.com>
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
index ed3d678e7c5e..605008d7fe6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -193,6 +193,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
@@ -202,6 +203,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
@@ -225,6 +227,7 @@ imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ve
 imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640.dtbo
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

