Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028C424469E
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268828; cv=none; b=mtuS+OYJ4FcboK299Nfj5w2jd3jjJIxHP9VshFjX8yr7BU39M0SGAXFCOkSxyNBWxt9fX2xiymEkOVe27TibuorwSgiH4jrD2fLOWxDOcyNl6r1g5xm6gh5GoQuwEP3zmDrh7tTS+DoM2c5O/Vzva1mP6GXKwD9eqdrwGn2NkJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268828; c=relaxed/simple;
	bh=/gzHGuZ/b71YHeLNSCqF7HwGsuPs7oNiMaA7VmETx8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivBtS9wBRbH50axbYMVssAivup1ZEU1K4/r99lfFmcyQkqyigAlBLoIgvppvmYhPzMKITg4PhXtGgGbx1M1/fZCUhPHX0N4Khi3+TIarzIa5tiVLO1Wf7WE8cAYXoGv63hfaIPupPbKXYAgihlTxtiw55HWBoF/uLW/4GP8ux2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5Ls2t7S; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5Ls2t7S"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso5596898a12.3
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 07:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268825; x=1762873625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9kL7sLOaubIomrxMG9EMGJEPQDeUh/zlxyCoHi0rRk=;
        b=I5Ls2t7SE2UYGU7Lk6u11j0gERsKr6gplla7sNWqrSal+QvXhkr+BD+x8MGh7a6Vnu
         QoMkv+eNzkW+X+KnlkJlYzDU0WmPF94+NaVmRCKy8uIwJUfK1w/cWl+GcZfNsNtKJKmd
         A9vtSvN1HJhx8sQ2un2hOjOcEcC5bC6CGK3Bjc9/LnN6EfE1sDVxkF6XuMg98xL2aQvp
         dr1EywK/GLZ3ewWUmIbycBj6H/ZPqvvGYCfITMc0ZblgTwVuP4g/q2/C6GJAYjf1oLQj
         HCtlH3s7v7ZHP/Lo5RBJjQuYvtUQDuCU0gVa8K9reXjqXbtbC8OJEHY4wcNbnE1Px5rC
         /u+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268825; x=1762873625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9kL7sLOaubIomrxMG9EMGJEPQDeUh/zlxyCoHi0rRk=;
        b=BWJ4boQLg9V+8YyUW4SXdQGZ2osdN8hkCH7QKNFwv3LMui20MYrEo3A2FSGECoME66
         LhEeLVwY9QQrVw76cu1GbKVy14TfknR3eV69rYSOnJJ0M93fMpGBKFK99MShmD7sJJJS
         DQtUIhZIEAH6KGU/69tE2ztRgMg0kKjIjT3/OB7XG+JxHDLzJZ67bMRLM/gAnruBZ2/H
         O2rlouHpQ+Se1lqDtXTF0wdwvXwBS+4iMnBFqPGDjoZtJRXab70tTZ+CW90kHBYoIkTv
         ke37ldBkhknu+tdhnMypQGzs878OhyfyJ92H3iH4Rf2q7JcXVsuLB1xHaHfYs0/cZ1Wl
         dUKA==
X-Forwarded-Encrypted: i=1; AJvYcCUV7/Pc0/hXhfMYiF7Jw7mv/c9XfILdpIUXslPmqEFIIY54QQi69MNk3hIxZ76sKxj9O4k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLmfbiE295lBpin0uKDxK3mc1JBcsKKDPdcvDzR1kYomjID8tr
	k/kUI3Fx613PpqLMlveotRoRSHx0hpAwVnEHTXXYAqiKbgCmCTFXRrQE
X-Gm-Gg: ASbGncuJca02HgIEyCoI5Y8ELerjA1Mo4OVtXQGapVbyN+/YSkkqCovh4hkw71Es/TV
	tG852anA98jvt1xSqCydHxcDKz4pqkHDBtfPOkui4K5eSmDP7vblbnaQmqtYYORrPAGnRPkSB/B
	LI3gXoOml09DqHlBxOrgHJKdV65oHayU7vjl4URGc/LZ3PDP6QajUg/HWkHN2XHBaaCe9R9JvFu
	MogDY/S+u7t2nXl2aEDpZ0ErhD2S/pN1KgSVzVTLUxOQiibkda9gXOIjqzCVT0l6HOIBWz9+WpB
	PFj+0kcDuzBf8sgWk+gSwF6ewIczjU3xrRQREYRJNLFoDSGdNtToeGvHF2iztxSZVeD6yyougFb
	xJs7FOpRTn72yB3DI+tl8mUhtvMgbMGJ2Jjz+KWTYr1Arz4MaM6urc8LF9jwhvnHbjlasZJXsvO
	hAYf9qYhBYCqHkiX0lc0nPWP9wnQ==
X-Google-Smtp-Source: AGHT+IFZdmElqbY9AODKm8wDfOCdQUqzn7Zp3okj0ZJauLQDD2dujxP+a4vOZzN9gWrLXe/og7S+0w==
X-Received: by 2002:a05:6402:51c9:b0:640:b825:183d with SMTP id 4fb4d7f45d1cf-640b8252621mr8119844a12.14.1762268825258;
        Tue, 04 Nov 2025 07:07:05 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm2342014a12.15.2025.11.04.07.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 07:07:04 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue,  4 Nov 2025 07:06:12 -0800
Message-ID: <20251104150612.1874-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
References: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  6 ++++
 2 files changed, 39 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..6481c484ca37
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+/* consumer type - master or peripheral */
+#define IMX8MP_AIPSTZ_MASTER		0x0
+#define IMX8MP_AIPSTZ_PERIPH		0x1
+
+/* master configuration options */
+#define IMX8MP_AIPSTZ_MPL		(1 << 0)
+#define IMX8MP_AIPSTZ_MTW		(1 << 1)
+#define IMX8MP_AIPSTZ_MTR		(1 << 2)
+#define IMX8MP_AIPSTZ_MBW		(1 << 3)
+
+/* peripheral configuration options */
+#define IMX8MP_AIPSTZ_TP		(1 << 0)
+#define IMX8MP_AIPSTZ_WP		(1 << 1)
+#define IMX8MP_AIPSTZ_SP		(1 << 2)
+#define IMX8MP_AIPSTZ_BW		(1 << 3)
+
+/* master ID definitions */
+#define IMX8MP_AIPSTZ_EDMA		0 /* AUDIOMIX EDMA */
+#define IMX8MP_AIPSTZ_CA53		1 /* Cortex-A53 cluster */
+#define IMX8MP_AIPSTZ_SDMA2		3 /* AUDIOMIX SDMA2 */
+#define IMX8MP_AIPSTZ_SDMA3		3 /* AUDIOMIX SDMA3 */
+#define IMX8MP_AIPSTZ_HIFI4		5 /* HIFI4 DSP */
+#define IMX8MP_AIPSTZ_CM7		6 /* Cortex-M7 */
+
+#endif /* __IMX8MP_AIPSTZ_H */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 426c11853d84..2173b539dfb5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
@@ -2479,6 +2480,11 @@ dsp: dsp@3b6e8000 {
 			firmware-name = "imx/dsp/hifi4.bin";
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.43.0

