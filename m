Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786D039F187
	for <imx@lists.linux.dev>; Tue, 22 Sep 2026 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087651; cv=none; b=kWAzmWj4sGqAA3zgyd5G6BxkaL9kl7tpBfCCzJFENct2GUZ+anJMbcOBXogQnEGfzQ7pYNucu7l6jq//IPF9VSeDQ7mFSGvqmErWv6Pm6qRVbBMdcscaUARAE08/7G5zLf1gSYnPps2zB3ksu8iyaQXGBnTA81kJyZiYFksoSOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087651; c=relaxed/simple;
	bh=VnZx+mhFjp2ManlYLmoeXCKWNRbtXIxy8RAd2LNxni4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifbtcG6Ht4mzLaY7Z808s8s7d7B9j+lAjw+ii/UoAERsNT0vxGeV19xpuO+Qs/d7oSlR033urA6yHi41LbjMMtE9h7nfIAPEXbUyC6iqlsxOjc1ey5+q4TdhBvjjSXVe6Rf/j9DYsarh60gdwdkS8+d5yTIvPNoH+zm4D1I37uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeoaHV4O; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeoaHV4O"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f5603a0so569678166b.0
        for <imx@lists.linux.dev>; Tue, 22 Sep 2026 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087647; x=1790692447; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRRIQhX840mlDu5Jy0TZNaTjmaBVQgWoS7rcef0gYQM=;
        b=FeoaHV4OxEHbYrbHhBM3FfXMZ2diCiHsIhQbXbLsjbCOR6S3gwj2MBQSvBw1IchXwY
         SjbKYbywxc3eqnzaUEsnx/iKd65mWjnUQz3LtKWEssTw7GUOq+bmLYUUIfFTH5tk580w
         JU6mYv+m6i0zpyUwnkVh31h2QxpHuht3ugHwGIlSuBWpaKi38A3DaiCymEk+vfXp+Irz
         0NXZTToqJNezDw+ZBtFixxdhRJ+tVRaTpwMfhcKe2iD6kESs2y2wQmI90TqzQUYSSx3h
         YJgflP13Nz7fYVNJiuJnYuHxE+a4m1I/mLBd0NI6dFSuDHwqKjr3xMdIw4/CRsWe6dDH
         gjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087647; x=1790692447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRRIQhX840mlDu5Jy0TZNaTjmaBVQgWoS7rcef0gYQM=;
        b=qvZsFZTp1ZQ7BR7peAWZLezLc4Z8uuXMUncoQeT8jB692gmvgOB3WMxzijZhUQWbU2
         uyhh1lHe7KYYo5xFTW7mq5xSmx3y1bugjo0Vgb2/gxJW0NLj8w0XWrkp0o2YZF09xZDQ
         Pl693m929J3MU1O+JXkDolKWXlRshSv1Gmz+AfkJDCaC2A/W0pIeYMIh1FJfI7EGk36R
         yDDiOrE9BBzq9lHxA2FNtrWSMR3sezX06m41cDBlY1AnJdkSkT+EdnTFZqtFMlXio92l
         GoK9TFX/waPPv51ZsDJxeXZ6iBJss+KhkgYEoa/U+WIbCY+2+kZQYAmkCDANLDIC80hI
         NrbA==
X-Gm-Message-State: AFuF++nn50fNONyngAsc/exRSR+o98N0ZqDvJ7A+RH8OqGC6ghv2YMXW
	fUXGuB/42WTdQyF0/JysbUCJM1RgG3d5l07JkAFaH/79VW8qHfpCGN/QkTxRCrsf
X-Gm-Gg: AYBFou073bNiU2YJ/7RtzJcO9j+ZAx1QdyiaaXDlIssG6VpQbc6PzPa74+NOJxymNE7
	2vM2zIZdI/sVMTnxZVlRbkyMDRQrNV1DJL7YHlBGKAGmOK9Q/p+wvhp7NkBmzRstSSjrVzk5jdz
	EzAoOtVYxBGrMRc6Onv4THAmbY3S2t/IzpLI0U8ww4X92N/VEX1atQB8MSerxNtlA8GEQGC2zVV
	I2L5M6PDM9f2CpW8J1S9PzgnAazsFE9Z8mnqDGTMDXb+HOqh0bZZ/A3h9G6HGuCqTiGPh9pnQG3
	Y57N30unBXlZxJLJYpgpeQe3kNdzMND5RF/ZZ/DCYsP1o2ww8mX+AT/l+LlhpHup94PoBvywgWN
	yY28gJ00PtoHNmBvBIiLkLAYAfoG8Qq16T5v7PcPOH9YZ0EfEVgx4JNbAjzp4slsqIRX5i2LXCL
	l1noqkQHqGZChM67VLtUihzgcTumwxSf6p5W5Iwr9uA/RWtySzUnjKS59+ezAfzspQuACqDjV9L
	4BQoHlpPamWQiG0kh7Yi5OoDRU9wKyzpDrMG0NVO2fbfqZfLTdSlSwQd0YG80le3i6dLATKsw==
X-Received: by 2002:a17:907:d18:b0:c27:420b:7c82 with SMTP id a640c23a62f3a-c2a15e0e909mr1269150166b.48.1790087646940;
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5814e2sm103469966b.27.2026.09.22.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:06 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 22 Sep 2026 16:33:48 +0200
Subject: [PATCH 3/4] arm64: dts: freescale: imx95-aquila: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-v1-imx95-overlays-v1-3-694100afb4bc@toradex.com>
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

Aquila UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that reserves LPUART2 so Linux does not claim the port. Firmware must
configure the UART and its pads for the intended MCU application.

The overlay is also combined with the Aquila iMX95 Development Board
device tree to provide a ready-to-use DTB.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                    |  4 ++++
 arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c283c582d974..b17fd5b067de 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -954,7 +954,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
@@ -976,6 +978,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-aquila-dev-uart4-mcu-dtbs := imx95-aquila-dev.dtb imx95-aquila-uart4-mcu.dtbo
+
 imx95-verdin-wifi-dev-nau8822-btl-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-dev-nau8822-btl.dtbo
 imx95-verdin-wifi-dev-uart4-mcu-dtbs := imx95-verdin-wifi-dev.dtb imx95-verdin-uart4-mcu.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso
new file mode 100644
index 000000000000..140025af4d53
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Aquila iMX95 UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Aquila UART_4 */
+&lpuart2 {
+	status = "reserved";
+};

-- 
2.43.0

