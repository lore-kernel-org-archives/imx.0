Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19AF37E5C3
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087648; cv=none; b=JZuKbKTWT4fANih9mCunLWPx46X+i070yy3KOMytdc0QXqJuIhtAAlRCWlG5r57mPBgiSkcLTcDcKKDCjEFXhzfAtr64TSxVtBuXm8kZVf8VzgdzHUNaW+SBayEhSv0T8VSTgZ2xvK6vsODanV/sHKY6xLRcTnyObz2Da3zYqbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087648; c=relaxed/simple;
	bh=kMN5YkIDcnYKVfhct4H26E5RszOMPe0PSxCRTtVviqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hy2PA6LJWI9bV6hBSuBYObvtOCdukIhY2gH/IPeFRIMw34WEV4Qmo0h58wvOnhMOxU0S0AKsZKRY/aVUpT7nPcRX0kxYjlp+RfWD5kDq72S5XH0OySeww0f+Dm+w7fvIsJIGrcBC1UwlLhEtILSGVq1eMFNQi8RgB7ZvHUwdp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nx2Z916N; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nx2Z916N"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so638924266b.3
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087645; x=1790692445; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aTHjSzS1R0vCIpKPbqs/XUMxbN0QidNLYGJ72kagVc=;
        b=nx2Z916Nms6pFd2M8JNvubO08+2MAzW6r2ZZ1UNezgR+551/qTOQEwwO0tLNE8KmOd
         VVYP1MjuVnlhMhKl/xWyYSR3HNxun6un1jv3Xkb/mMio1+p1yOql2tceuSP4N5gCyJBk
         neqRMf7IdIv7pjR1rDsd236U4ej2GeJmLyL3wgHfu8IvXgUQrTEt27fhWayzrTWL8LSl
         vC/1D+s5iiwJZK6OVmFnD9V9+vOw03ekv1tRtmHKLTW+qgbldFl2v6Wm6cgps4gJQH9j
         raGixCKueRP/dacxQBsF8NOYQUB87A0hdKMOZ1Co+VxKs0fvSjBZ6WBgR5kBH/ZzxpPh
         xNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087645; x=1790692445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7aTHjSzS1R0vCIpKPbqs/XUMxbN0QidNLYGJ72kagVc=;
        b=pRXn46F8grirbMj0jJwDZJyzfZTGQJhRNNPphX1qQzZcyiqzFtgjfy9yeXHK8Eqgzg
         XeN4GHatIbIThzBnCXy1/ttb0Wu4fXmpQoJfSFR9gHGisqUJSBA2IXEAJLbshlh5QaD6
         KxSQV8EvYmLfJwLhA0lsyz+hEAhb0F7J7k6Wz1k5JRC6a0ZzsllXvsXhmHVT6SWWiX4H
         0FOtGj3OGmGrug5tDqzWvUDFjejqS2KHVSGoCHzVhja5IAg0UBT8l5M0uW57bvUr94KJ
         Zzmn//Wk0npJRt9EtUBLtaiN9KN8mBljY1fltQI9Yup5676UD3mInkYHuaEcYXc3FSI9
         6tuQ==
X-Gm-Message-State: AFuF++mbYaTH06yN1IzDE3XBZldyeqKsgc8zMKYcglbG6bAXTZhETq6z
	x5X6wNCsd6QO2SZ1E417kl9pOXENye/gIP84vLBPxn92ZblzbNW7Hx6v
X-Gm-Gg: AYBFou3t8Tyi34tgb/FhmplB8hjnqCItknzLEsE5vAJwYK0bStohBlGeV22SF1aMnXR
	VzNmZm2NfKrlOvTo1PpN/i/zOLNPfQXdIVtYd1RfQEtEZw5qCL1tbrFv40Lx1g8gX85w4H5UIxB
	Rcjj+FXFdN4WDl+uNrY6IgY35IDQiekxwMzAJiNAo6QsheJ8mlGR+e9RaS/T5BySjWOFF5IwsEq
	dseF4OzgnRjFYPZNDZ+a0EowzbURV9F+CsRHv8RbaARkGHDPOMhfb30VNcyIzQrseap9OsHy/01
	u3LpjmqwtJMAZ5pWTFKphEexu/jJws7a0vWsp8L359BaIocl+2GV1rKVMx0rj5Ta78j52mhd0oA
	sp3ogIM4pmHPEJvVm6EEk6cPqV1RJb7FZheWoLXo8RyjvJBSh9OVvC1nepQ99xAe25BFuD1f7Md
	N2zWJuwLcRs9tjyaSPUsDbUhIez/cg8ZwSdnBWdO9rhdPttzvYRCxLi8MCh8bUKuc3edTa1vz2R
	+4roexC6LCHYYbvTjoxYg/cK4tOZcGcGWXMucHEWfrOltKzrV7TIAY5Sv4eHn/sKWwptXaHkWa2
	Ku1MMrCS
X-Received: by 2002:a17:907:dac:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c2a15834020mr1228411666b.36.1790087645170;
        Tue, 22 Sep 2026 07:34:05 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:04 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:46 +0200
Subject: [PATCH 1/4] arm64: dts: freescale: imx95-verdin: Add NAU8822
 Bridge Tied Load
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-1-694100afb4bc@toradex.com>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
In-Reply-To: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
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

The NAU8822 on the Verdin Development Board can combine its two
loudspeaker outputs into a Bridge Tied Load output. Add an overlay to
select this mode when using the board with Verdin iMX95.

The overlay is also combined with the Verdin iMX95 Development Board
device tree to provide a ready-to-use DTB for the WiFi SoM variant.
The codec and its routing are already described by the carrier device
tree.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  4 ++++
 .../boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso   | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 7944e3b32513..a7ae74a706a8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -959,6 +959,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-var-dart-sonata.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
@@ -966,12 +967,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso b/arch/arm64/boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso
new file mode 100644
index 000000000000..e94c60381c4e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-dev-nau8822-btl.dtso
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

