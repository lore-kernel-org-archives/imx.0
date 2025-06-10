Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C70F241661
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571354; cv=none; b=KQQGc42966yXHxz3QhgppzWFd9P7rdQ8lhUc8l61pTNKXLswvVbWr+eM2FVX/Ieuq5iLShYjYZRF+q8/ODIyc0f9jLnhsx6w2AmvoI4Ank1DRykbqZGPa/RcV7eTPybXsjEyzg6acjSoTC+w1PMO74HFlgK69c0Nu6ETPp/2iJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571354; c=relaxed/simple;
	bh=XfcIcxXI2I5B4MxqQy8GQ6hBuvXXDtfq+RZ9BpUL2VA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lm/xcTOaEZK8E6ssAZMyc/HVbl2rRdqT9xxZ5JcvTonA3qD9jx5IDAhbq/PTfqwrsK8Cm2qHr2TGu6tsnG5AD+AAPy25zvrg3z+GWy+odPdpU7qbt0YT0DeXjmYp211Oy+aCPMotRjVvgDDkGHDlwpoyqVtFDFVUrLyBb9udeYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4gSBcv5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4gSBcv5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso5070270f8f.1
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571350; x=1750176150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrmmq6rgHplubUNFiw0xmTFpMEYkMb1SFr43ITy0Ej8=;
        b=c4gSBcv57ZfMip1lmA8OsKc8QshLJGGZSocxMkYT/D9f830x/vTUResd/LRiqpTYS+
         M41If/jvjGiVo+VMFIWtbKbNKje+Gvo7pdCA9m+H6X/e75T84CJpsAWzUDppAK/U4rlv
         P+SfQunyvGyenXVRxFguxfkUXAO221R8dr++dCVvyZXjmSgLuJ6UGZnV0++sZ78ctmoq
         C/0XN/0shL/QMLU8GVgCHxJXVD7Aip2ju5CK+gDzHMGwbXr8TjX8LiTyANsoIQOehQ7J
         zvV2u2UtnWgg/pRoHT9ZmxJgFTXBDMrwhJvsH6FSUbJog3NEVbFli8fAF0p5FfDTu0Uc
         TDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571350; x=1750176150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrmmq6rgHplubUNFiw0xmTFpMEYkMb1SFr43ITy0Ej8=;
        b=Pxa4NV05XFMlhoPmSzMVd3NaVh6MOhb1P68BJtpuChtjpsPDU4pWUw82T5bOhB4Xot
         oZ01UjowoT/7Rfox2g18FE3vVtYz+Tdz7t0cyHTXoNTEjTAcYmaVtySFDoEqBIWY+Nlr
         mqTn9VllIbS+EnRvdfqV8F5PQoxzySXtmvpYLW0upfMoOAe9n+X25brvIsOcn1REaHjY
         CrvR0sbtJtdCYenss5VNXVAfH88TUbIk9COlSsemh+HZxOUQXnMM+Avm/N6Snw2+lSN6
         LcmXSxSVF1rSSqujrZNHcJ+qQIlBJtYfaxdz3WQxZ6P71IORbQGVyd0xtILN7eU37J0L
         g4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVoIPKV/fvSjWUX6c7IHopJx4tc+Y6PWEGbAE67YJzOXLKbUAdD+Gw3u2SKyA1In99pOAI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQPOm0LHMz5etbMOLbBXj1v7spHH2FZiTbpJI7bQXabU/tRfWs
	LUg/F6iVttbbxrjEwjgcowQ2PGYC4pXeZTYv+2+/xvK4DNxzoeWRA7BV
X-Gm-Gg: ASbGncvBB0Q5pursXjlFizE03QuDmhPVsHSo2PGgZ1GJVdTbapeYwkylDpayqEA18NP
	6iC8kLztbnoE+DtqPfL6jYw3To4VSewnodzg2iQDe5I5zPupNTbnDIVtQ9IU9JlSJMlLrWH9la1
	Wr+lhrq5tZJsx6VqsYzK2fDuvATvBl0evvAIrVhC70uYbjWNTaS/Rf5vtlvZGX70PwbbsRx5TYj
	o0oX3eOoNu6ZeQx3v+c+gkaz2uBQf7ijAoXctqnwxBHJZOZfu7mql6sZXHwS4RBkW+E/WkoULt9
	z6TkrUvRVZQ3j95rJYvw4Al9BgumzoTax6e5mn6feWC4JcuoMq0AxskkX3IMKJuGTLnO6V+58ex
	KSh0vH8XqXJhMlu3Lw8h7L5o=
X-Google-Smtp-Source: AGHT+IHhY/k+f9IJHPIEjy9iyBzhgiJ5RVh5n83hNt9ZBYYDAnqAlzarCsi43dgG5BIjB8S0cXPlDg==
X-Received: by 2002:a05:6000:4023:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a531ab6dd4mr11951972f8f.42.1749571350236;
        Tue, 10 Jun 2025 09:02:30 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:29 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Date: Tue, 10 Jun 2025 12:01:51 -0400
Message-Id: <20250610160152.1113930-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
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
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 34 insertions(+)
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
index 307e1671eccf..9b550f225856 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-aipstz.h"
 #include "imx8mp-pinfunc.h"
 
 / {
-- 
2.34.1

