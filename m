Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E5C4CCDC7
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 08:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844203; cv=none; b=TW9zNPOlkjP5SVbhu2wzCio6Tx7R/X/NCuFQoOINodTq63W+UEVJ7Jp/RWppg6z7LXSlCwhONzu1izKwzVmXtD/bJkKHMG/qzNYXM3VNpc3+FxGaCA58/dgWhjH11X9z4hameICb75rhekr+ElRxPM2ClimIXAF/EYn5v0vwqP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844203; c=relaxed/simple;
	bh=wnUhyrYWheq78/htTGSabO8i37WkHuTnJpbuds4kcNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWT4sYtFLCr/N9Dh/XjldQvoaVY6UMQKdnJLRIRySkQKH16dWtONxf52mZ6/nnBboMr5HHdG/pHl2K/ePRDxAkYLKUuWr+dw6gO/j6gO4qDni3SP5Mgb7imyyPIoge4+b6zo29FQpGdyTflgb/2cAIqaG3YtlcSBhttiV9HPOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXlDFYn0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXlDFYn0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so40425575e9.0
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844199; x=1791448999; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5CmcYL0XK1JJEyDbPwadIyEyX0pGtm4tcAMQK4meqBo=;
        b=oXlDFYn0tZfsFaVwwaECTrAhiKcUKVd89gXKPP/eUXwhNL23Mx5j56KkgSTLsNMG/D
         2vIN7jG9yLHo8UjLX1u8Dxw0p1iF8Lh1V3YcQQnZMttCtSpohkv2g3kB6MBjwajsVMUc
         18EBCcyKOgFxWdD/jW5+VYVMFXHMJJxbm8cyOgj+Z7+z6OmXeRTUS8TCh4zs3pNERAeB
         qNf8Du0FnCryNVvNPkZVI/Sox/h+JoV+d9nYRhcJSAVUHr93JVwzkS/c/mDA2lKSfxqp
         Mgfv6vMqMZaxqmysl4q1tWHz4N75XpXtRTW2oSvxrigNq++fQwv5ET199ZL7XvNAK7qX
         GEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844199; x=1791448999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CmcYL0XK1JJEyDbPwadIyEyX0pGtm4tcAMQK4meqBo=;
        b=BajkO+Fnhk6einAsRLaupe2E4rsNBvtYlsEKckGbxa3+W3ndWFRLSOxk3xP7RIzm03
         inP7iVApmJuYuOsyzGBZvxodsYHu64Qg/pYgG2Nnt7obfVLQCrOK9r2yyPIxX7jNh4Gp
         zG8QDwpQ86wjWr1AaOY8oWYKMhyX/dp1/3o1stVQ6xAg9N6RQARakRsVftaysPypfFJk
         vqYRGTEd/KDTtwRilybENTPFaGcPinAxiank+0SxO7D24K1arfFGEXiJTCLHafClgvpE
         uYV7WLOoeg+IZ532hhaEGfDFBhIv8O2naAKPGMKghMdh8YUcBZIKq2QkG7cZ8PJhApiF
         FwEg==
X-Gm-Message-State: AFuF++kCiR0HlSmVHvo071aF3ogrbc67RhX/ygZoMTg0rtALXZ5YR8oO
	Djgns2p68vmK/GyMGfBpfnSRSNGjf2uQAihk+3+f1p+3iAIbGJXQQU5o
X-Gm-Gg: AYBFou3beCmO+kmw7lgch9sd15/qN7IiDJcx0cjcNid0Zno7szm2mY2gzG8WP4RqJkw
	SIFC5NatqdjpVSy7yn1Dc+ggOEfFnt0PsaXf8+q1UDFH5HmBKaSbLIOLEH6Ru2SEP5Mmb/Pqx/2
	FBy5i57yQkuuc16VhpwrELwBq0wawz992fbGKbXU+CGyA6jAAqeTGTSC4v48LygcAO1lHOrfOAb
	1gWkEfbwo6JCbbMR0tuV0SmU0C6FqEu7AYx/CB44T75TSg5ynjE+kTW52NzENu0wKv+erV3ahRY
	Zb/XLYILhSoB3hTnWlUjNkcO+SmDa05nJ5ZYsEO4Ob+iV10+r/1y9LPQzxOogTmrXRbn5jIap/d
	QMF0KdYm3FETAYqIzh2tcmSmQJ/mEMhLm4WGQhXQN5tMDuB1uWW0QrIwKifw415FMCjB46lG1ID
	V0WpwBpkAtl5v6x7UhOF+zVdsaq89XD9MH+7J7uMTGGYILJLRlg9WaOA98rENc41syVedD2Um4X
	aVNlPfSgSCbifuhxWOl/Y0Ork192HU9dn0pA5BLauGWC5numL0TXOVRvqBugZTVq5Kk2lGzUA==
X-Received: by 2002:a05:600c:3b1a:b0:49f:c451:b4ab with SMTP id 5b1f17b1804b1-4a01b12b310mr67078895e9.29.1790844198541;
        Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:18 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:12 +0200
Subject: [PATCH 3/3] arm64: dts: freescale: imx8x-colibri: Add Cortex-M4
 UART overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-3-21881dc324c1@toradex.com>
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

Reserve the Cortex-M4 UART and its LPCG clock provider for firmware.
The UART is already disabled in the base tree, but its clock provider
can still probe and participate in Linux clock and power management.
Mark both devices "reserved" rather than "disabled", as they remain
operational but are owned by the Cortex-M4 firmware. Firmware must
configure the UART and its pads for the intended MCU application.

Add a combination with Colibri iMX8QXP on Evaluation Board V3 to
validate the ownership changes against a supported base.

The overlay supports both Colibri iMX8DX and iMX8QXP modules.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                 |  5 +++++
 .../boot/dts/freescale/imx8x-colibri-uart-m4.dtso      | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2732b223eb3d..61dbab287a35 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -832,9 +832,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qp-apalis-v1.1-ixora-v1.2.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-aster.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3-uart-m4.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8x-colibri-uart-m4.dtbo
+
+imx8qxp-colibri-eval-v3-uart-m4-dtbs := imx8qxp-colibri-eval-v3.dtb imx8x-colibri-uart-m4.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
 
 imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri-uart-m4.dtso b/arch/arm64/boot/dts/freescale/imx8x-colibri-uart-m4.dtso
new file mode 100644
index 000000000000..c43be136a46d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri-uart-m4.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Colibri iMX8X Cortex-M4 UART, reserved for firmware and not used by Linux
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Cortex-M4 UART */
+&cm40_lpuart {
+	status = "reserved";
+};
+
+&cm40_uart_lpcg {
+	status = "reserved";
+};

-- 
2.43.0

