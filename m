Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEBC46D548
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781302; cv=none; b=L68QRxEWrqMIWlks9I36jS/+VWHuhDgqQifc2jZeQ6GBbWsvPM6mNkAROrcDYNjti7vZnfhoc446jUhukNvL7SbigVLhdX7JmMjfnmK7g5zFzF1DpFNxkW/Pd+DvFXAzg/1Cl5dRNLic6IWl9AhSJSpjBe9aUUynhIsIWQLhwA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781302; c=relaxed/simple;
	bh=b7Hmk4cNyp3rrqJdAEe17kwY+5NGv4bOQ4fm+78tCZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYTA6wUEe0THL4b3WwrvR0DhFUggf8KrX4l6k6g9M+E5MRm8vNmOtQcUV/8WJ+ujK1GHmhwM424tp3mIbkvEiZraz7yvrokkxyD0FsYix7bK4ANCllNm1LE3ohn6Kb9ui7RdxQo9zWqj+ml3IlGoe+XD3YcpRUVwHh9t+glBWEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzlvOVu9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzlvOVu9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1820687f8f.2
        for <imx@lists.linux.dev>; Mon, 07 Sep 2026 04:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781298; x=1789386098; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQUBOPYyowxH3WcaM03g9fGKTEt+Ia5xxYG+47H3YdM=;
        b=IzlvOVu9sZUgt21BE6sNNtsQ0F3twC+Oel3Mc2KYEDL81Gcs9G8GPo6eOajaoHeBJB
         i/2iGlYWRfCDWnu1TUmbc7RROxFiCxnp3h+djwMTJaiMNWfzYHEYTako2KrcqhBtEhHn
         ZK4Jjtd5M9GagZvY8zw/zWKHCAOxPGcQ8dEdzweBtjMv/YET16hfHQLXF0TcpIJYucY4
         AQBmX7EWjcXtCnq9B8Oi0i/+Znbpvj0LwaXX8donh4NZ8w4nGkMWb6qj8vi5+zc1/pHM
         gX1Q68Xr3aCIl/VYqVs9z3yFeUStnIVOof+ZEOWZ3ohn90r+P1+nMNQJNTTsHpwos+Dg
         847A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781298; x=1789386098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQUBOPYyowxH3WcaM03g9fGKTEt+Ia5xxYG+47H3YdM=;
        b=FXGSp89oTWxRyHqvif/oreTbmnWhD+3z5kX4LAIxEYE6G9o0dNl2YtmHRK0v2DQ99I
         kptFHbESccL0wslMKs9mWo3ZCsCHalQNs4KnLbD7+R2VkkptwYQGRRvVOKU9yybcG60B
         jO8xsjutGDwr/AI4IHvFlZlYUkA8+02EE3SheXr+g4LelulgbcJhIBjeAuZkKq1OEMe7
         16Zn4GEJ1gvS9mo0Jxb6YBagiNIST2JgPIABnZnOoo+eSoVwdiHkTDRCfQ6hjhuyuSyx
         AZeBRknuYQ/xMe6Y6q08YJhAgJE1Ua+kp9JXSpUcIHPscDQdVq1Fcnslq6DYWAJ1u4rP
         FB0w==
X-Gm-Message-State: AFuF++nmNDMXrXvNpIwM55sL1aNefhPWwdRtmmLXcDOD8xYlXk7uBgoZ
	1CNMwzwTc90X6a5WrXWzHA3fc4dPr0GSNPZnUKyzdXT5EyneRH1NbHDC
X-Gm-Gg: AYBFou2zVNAYH3ZOoslpMH7T8ftsLymlm2XAoQz8GSJAQjvl+2loD5JnSQdtaJxS692
	crGFMD4aiKyERQ77VHWMjBECbIF5zYhFKvEJcBg2D4ktv989G4lvGI4v1WMswLDxLvPsYxguBi0
	7WKFtLJceD+WzLBdnfeGexuSkqDxudsjtMu6eGhQxlkHpT61xxJULm47HcrpxJOmh1z5Le0DyvS
	DtfAVk975/+/DIy4DPuMemjTsA3MLEHJdmwoMFPRNaYGDgdETzgfHCrB0OlsS2L9Mm8UYsNsdXr
	Xah4vtaxH2zwC3fvW1LfcfZEzrADttZzK0WZDP5o4UcXBxHTaDX0XJk1r7oAy39EP9CRS9PSnEP
	/pa0a85MvrXZuBMRg0hOuxFvItUTCw9tIDkESGGgYV2rEn/HwI0FPio7WN4OUI4Zu8QYw+jrOUh
	BbtmceBUNDYtXnZlwpaz9LeMIbzrDkAp/6ruKIxGn2g7hgjblZLLBoJ1nUBXz0utB9SxDqi9xqe
	7ldJQM+YREIrdsrXvOrgCaninu1zXSnuBzLXlQwq5Kls2pJjLilAmP7XiohNj4=
X-Received: by 2002:a05:6000:712:b0:485:8a47:5b9a with SMTP id ffacd0b85a97d-4858a475db8mr21110822f8f.55.1788781297779;
        Mon, 07 Sep 2026 04:41:37 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:37 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:30 +0200
Subject: [PATCH 1/4] arm64: dts: freescale: imx8mp-verdin: Add NAU8822
 Bridge Tied Load
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-1-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
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

Add a device tree overlay for configuring the NAU8822 loudspeaker
outputs as a Bridge Tied Load (BTL) output on the Verdin Development
Board.

The overlay adds the codec property for the BTL-capable output
configuration, where the two loudspeaker outputs are combined for higher
output power.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso  | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 984642146dd9..8c6fdeaf12af 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -728,6 +728,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw73xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
@@ -735,12 +736,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
+imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
 imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e94c60381c4e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-nau8822-btl.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
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

