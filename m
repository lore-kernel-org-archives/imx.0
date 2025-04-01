Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3C220E33E
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522361; cv=none; b=IydXsxKJqVT7qLAB6A9YaEU9pmcPw6vN6RdpaYrpcddxH2CuUIQuKNTJJRdISY8ZWkfSurLTobBWwWkXOBKxYr0tY8X8sT8oF/79Uq0Z+mdtSbs/fDzVI3GdUr6sR/0xiYQvk/2IyrbiG1O+3UEQlcnyQVgYMEVKUNqHtKPIVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522361; c=relaxed/simple;
	bh=HH0oAiXb2UmIxHzrzPgqGqA5ibbNu6HqpAv4SPnDq0I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gWInj5A9IzukuaLGH7w/4dvgRUv58OwstNkZZk4L+6Re3KrBL6rUSDgRSZ3faZvV/wkJU+vWEVGJ2PMSRDLeQiUAT7HaVeTznMDpSMWYNzAU1m7ExYCJeqQKq1RX0NR2PWmwncUxvIUiKQuNdCQpSn77ZZMfVjpwmk7CTtGeEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bz6Yy+6P; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bz6Yy+6P"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so58787345e9.2
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522358; x=1744127158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ietc0fMCi11BuUwuyiJvWRzPfrCW2xOJHK6xEAe6XA8=;
        b=Bz6Yy+6PSNFXAYD8KerLUqJvL2lIUrpDyJPVMqqi7RZHwpgooqg500uaFcJ5bchJvz
         Oq6VtUDoBvinKeKO9KrKZjHfhqYfTkPlp975KjiVSnZhybsDimtrDZjNoTLIPz1rd/Kg
         ijvHLbAbywf0ovl5VQIL8js5InSREjzRITUkbqHKanXLmcz85PwtWKHD9gkFnP7Qw+Q3
         9JsvY8m68ioZEIZj82ZbynztHPqa57nO5GoCYk4cKQrJGgmGUZ3+xCrELSruprnPe5Qh
         6Hl4VuWxLZWyNMOhqAR/lm+scKSWkr36IkR6KhYNsIpm0BFsx6lr692mkVPiEqPwB4im
         GeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522358; x=1744127158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ietc0fMCi11BuUwuyiJvWRzPfrCW2xOJHK6xEAe6XA8=;
        b=ejsNWKlJS75ikw2Lamy1fzI4nTdGE/neyrGgky893yTsFplhIMpN28vz+V6bPhdZtk
         hHTDY8c25LYonjcD4NB5so9NmImashY6K7AqGdMBZBK4QzmPKhGBHmxX7bsyQ+gX/Uu/
         6atDtPOQONAb9eWmjTut2kJIaN/QLHKfPOAnR5x48WD2ek23MzbrlhYlJVd3nH7Ath2N
         sYgpbj+mxZoIKPPDiDtSqmTcigmAO6Engk6yTseGvTinImZJ8r+081rAHkema9F1jEjY
         +sW5Oq69AKhg+UP6FTcBRuTN0toHgO1JNRu/sirzgBRK/+VtioQyN5lYFU1VG2Ho5Ety
         J1oA==
X-Forwarded-Encrypted: i=1; AJvYcCWmXzRiHP0fC2FekMKEHzsQ21hcJHvbzCLZPeLztdQBjs5F+9GPLxsRpfyjb51FJLsvN3o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzuVhclIy/O1aYCc/lAdONq7w7R78/+nqQuXpehThml2qCYP0z
	PkbyQy2xXEJaQ2td7a5qqy6AzPClk4pDAgQF3Vb/MYKb3rGAGn1T
X-Gm-Gg: ASbGncs7RRuEDdW7AurjFWuNHyqFpeWveRNv6PH7GyQg23YV0UdE6SSXLaTJu/Dx4M+
	3KlR83wjw9gLAMghVqH8gIC1l54rXPZjg32KrVZYOGQe8GnF5xAav9emdQCID7LR99ZAGWUG5B/
	b3gP+PalW/3B6xTHtvLvBnZUPGW7yUhy2H/7GG20M46J50PEJTwJQZcMbf+NcjokBRQLpn0fkQ9
	RcRvTcFVoskIc8H2MgWJkDxkO3dWmj6XNQt/NoebKAzrR25mm7HcLWlfOdZFGd+k4ZLUIk0TQwR
	MeEULLwXV5LZSc7rMVJm1EjyIdC2aIJr4vSI2iBcKF5D3RWqa1J00QysNUbxNF+w9d+Cps99Ha3
	AT4151LM=
X-Google-Smtp-Source: AGHT+IG9ZYKWN1b40JEhYbcSZx3uZ/1WRX1tT2EFyx9rWI4+Ii3DekqK4BS11iLLv97oUFUaX8G+Zw==
X-Received: by 2002:a05:600c:3d0d:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-43db61e0584mr134804935e9.2.1743522357576;
        Tue, 01 Apr 2025 08:45:57 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:57 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] arm64: dts: imx8mp: add aipstz master ID definitions
Date: Tue,  1 Apr 2025 11:44:03 -0400
Message-Id: <20250401154404.45932-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add header file with master ID definitions for i.MX8MP's AIPSTZ.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 25 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
new file mode 100644
index 000000000000..23725cdef23b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef __IMX8MP_AIPSTZ_H
+#define __IMX8MP_AIPSTZ_H
+
+#include <dt-bindings/bus/imx-aipstz.h>
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
+#define IMX8MP_AIPSTZ_HIFI4_T_RW_PL				\
+	IMX_AIPSTZ_MASTER					\
+	IMX8MP_AIPSTZ_HIFI4					\
+	(IMX_AIPSTZ_MPL | IMX_AIPSTZ_MTW | IMX_AIPSTZ_MTR)
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

