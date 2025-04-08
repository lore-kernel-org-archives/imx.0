Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7943C2356AF
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126985; cv=none; b=cYhKO3Spx7Q4NojWDgdESpfeZIyybQTMMM9naxW0AN5xvxK7x86l5ycmjbNmCIMAQtgkno34BWtrYWR4cJ1cSTzp/2TEQumNeua/LSDUGzUQaxWs/IPYNW53pgYq5fx2VNoBzMh7r8+53f6A1i4P06cGUztCOEH/CEUsByyntBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126985; c=relaxed/simple;
	bh=n1/mnxdtmAPmH/0yCHkDnFu0hUsdIiRl4rwzDoAtvHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C1nNxFYnRug1RgP2/oK2DH0cbNOlXyVAdalI3jJDBOwJfq74vBqp5yXzwLiF9JaAN/qkuJYu6pt9TzndlfmNM9k5NkKhTTFvB4yGdhGCyoXSdUVvKkP888Q+DYb464NaQem+p3Lf+mYMLLPpHj61jfbGPGLWx+QOq2zXiT65kbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hoa51W5J; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hoa51W5J"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so52182995e9.0
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 08:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126982; x=1744731782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maaEXNzrca1Kg4OV2OKYRdvmHiFVuGZqAVh5fMF8Ylk=;
        b=Hoa51W5JCL/1yMreFbOO6DEefgGR0IoQJXKcq0t7MlOV/Kfv6F2y/qgxy2rzYisRJW
         JXztaNv+5D7ZNNrZuFjPsV4E6FiMYmkiZ+GS/uxx1M3C/qWeqcK59KF9uq86GdQeUs5B
         J/kAlsqSXNbcjEPMMe/XKFfVkBKDj/2gBm1C6WmRfCJGWclaF31brX4gAEgkY8warbvk
         uvBvEGaB49LdGoPUk3ulc071vx59nFOecwlFWQj+YN57uJaCtK7GErlQC9MqzYe8ko2t
         E3A6HsvZjeHRyHnWipI75apslohEGnjDKjJc3LbS0jubgKwSeG+WDs2ZqTsifyuveays
         16aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126982; x=1744731782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maaEXNzrca1Kg4OV2OKYRdvmHiFVuGZqAVh5fMF8Ylk=;
        b=f0QunsH9kl2tF4Lg+z/nev1zUGLyagCfaLHEVbtpabU0BvPnQZwpLvVizS9EvekWp4
         2wcNLNf9TIqOcEiAGHPzD6F0BlgoEN3HtkNu9F9QOS40Kx+fwxubtacLRLZUtVBYeRuB
         /g8B4ADUik7LGZQkcbFB/OQGCMLw/wIW/fNw04X3jB9zQjcyoFnXr82me5utOX9P6zVd
         xUykUCuw+q2Unz8UNg2EJXFkfxbIf16cAQWYEWC0LS6kYqlA4WJkkauAJkOiFOBoF4OU
         Egry/vwPyeLQsu5+Ap41oIiibfhIrE+63aUpkFkzUoZImHzkgoh+/eWnAc7VwcdvDo3P
         6CFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMV2mBgxcf1E2pJ9rrtrIbaiP36cqWb1w4FEzYhXXPSB5lcyCnXuvX+0CfCxaH738fvqE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ7/w+R7teUk6jrv4pM05B6p/uMQrzGAxZefF7SyoVm/XaRi+N
	QYaz5sf8sTmEnDFAKxhJxiXVUEzL63UNSRAwvua/Npw9kAHIYM5D
X-Gm-Gg: ASbGncvdV8E9LYybgfmGShuuCUQ6vKDL631SuPt5EOlcnO0dGtYsehEYG5c5HUvWJsA
	ifFTHjQbrYWbv5LE/eXm5R0fuXaSTsKKCZzvkxRDm54nCiwfZv6qYonDbXDV9OPUF0jjGJwub9r
	uK3eoTDA06kywQRc335zzJA+qMSLUcsNBYVmMQx62U5K1Q11tBG7OSLcn7uWxV3jElhh8qlVYjF
	ZSBDwK7sOgPIhlzuDEXKl6zYnM+tKDJ9MfNu4GzPGTcVAJ9ifHus9J8vUinSzhbAK6FXUJCMlXo
	NUlVVxMU+OaKpTF1mK+5rkLuvhi4FabCtqWpvoc22HT+s1hAJlYQlDUwjlSI2N8WgBMv1UZM6dn
	AN7ZIOkMpVfGbkBdYJw==
X-Google-Smtp-Source: AGHT+IFOFcncwKUYi57UNaeAvO+49/JOi3agiI45bF7fu89GYair4F29jldwkpCUEx5THNXGOXM2Mg==
X-Received: by 2002:a05:600c:1549:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-43ecf8f2f4bmr173448545e9.16.1744126981776;
        Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Date: Tue,  8 Apr 2025 11:42:35 -0400
Message-Id: <20250408154236.49421-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add header file with AIPSTZ-related definitions: consumer types,
master/peripheral configuration bits, and master ID definitions.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 39 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..b816cb6ee9d0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+/* consumer type - master or peripheral */
+#define IMX8MP_AIPSTZ_MASTER 0x0
+#define IMX8MP_AIPSTZ_PERIPH 0x1
+
+/* master configuration options */
+#define IMX8MP_AIPSTZ_MPL (1 << 0)
+#define IMX8MP_AIPSTZ_MTW (1 << 1)
+#define IMX8MP_AIPSTZ_MTR (1 << 2)
+#define IMX8MP_AIPSTZ_MBW (1 << 3)
+
+/* peripheral configuration options */
+#define IMX8MP_AIPSTZ_TP (1 << 0)
+#define IMX8MP_AIPSTZ_WP (1 << 1)
+#define IMX8MP_AIPSTZ_SP (1 << 2)
+#define IMX8MP_AIPSTZ_BW (1 << 3)
+
+/* master ID definitions */
+#define IMX8MP_AIPSTZ_EDMA 0 /* AUDIOMIX EDMA */
+#define IMX8MP_AIPSTZ_CA53 1 /* Cortex-A53 cluster */
+#define IMX8MP_AIPSTZ_SDMA2 3 /* AUDIOMIX SDMA2 */
+#define IMX8MP_AIPSTZ_SDMA3 3 /* AUDIOMIX SDMA3 */
+#define IMX8MP_AIPSTZ_HIFI4 5 /* HIFI4 DSP */
+#define IMX8MP_AIPSTZ_CM7 6 /* Cortex-M7 */
+
+/* helper macros */
+#define IMX8MP_AIPSTZ_HIFI4_T_RW_PL					\
+	IMX8MP_AIPSTZ_MASTER						\
+	IMX8MP_AIPSTZ_HIFI4						\
+	(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+
+#endif /* __IMX8MP_AIPSTZ_H */
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index aa7940c65f2d..ebbc99f9ceba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
-- 
2.34.1

