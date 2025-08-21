Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A462930BF7A
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773815; cv=none; b=gXl1q1TJ++dzT+WlF7VFeSd7SeoMx9VBvmH5uTfVMbqqG4bguK/cMi3aWMUt9rdhOhPGV3Del3TZH3wme2TiunRWvdyyGhn5DLfrfqf46iXS2aSEjkLsMTg161b2xzCb1MWGe7ll+diCSWQgIy2BjdFMvdGk0YU6JZgQIPr1wHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773815; c=relaxed/simple;
	bh=1QYvmumnrQVxK5rKCYmD/4xmuhFCKlHqnY40YuMrTis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epq0lYpBrgyiJ4mUYN0+Zey7YUTiPEBlES4zs5q+aNM2ZaVhIxaiHEkqUPOcDAnp6HyG4WgPyCFKvj9OS74oYeZfCHWIFkZjRy6TLQVbemX9N85zSFTDRMYBPiWrnleiEqkP3cQfPlyq1HsI6R36k/TF/MXj0fouLBblRSoXCR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F88DSpXx; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F88DSpXx"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb78c77ebso126716166b.1
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773812; x=1756378612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2daTJdOUs7gwwo4Y6Ley9/OGggF+jXeQxzTCIINH4FI=;
        b=F88DSpXxHaIvAjMFATGDv/8Ln8n2xpro5fYlEQ32HHEKMFyIEkPBb9NqfBYyKbc1er
         p0wRFlvIOamo38D8MX9ORoigz0u8uI/FOcQV6TR6TGM89bmr82uGMHch8tNA231IGNOr
         pHmlyvVFYwidonjyp6GFMBNq85hbbxObtMjc/K5bhqka159EbgYelPNUeA1FnX9qR4z7
         ecbOVZE0Rn/YgyztlEdl0dXgbQPjM/6gWlMNf+vNnDd1ccrOsZ5tfPxMqOGFrTJCRHCO
         b/pTGqYL19CkTFaB6cSzMWfih3ggnyAnrWY/ErcTGfnINUl+nv+A6ZsQEelgOYSbskOs
         xqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773812; x=1756378612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2daTJdOUs7gwwo4Y6Ley9/OGggF+jXeQxzTCIINH4FI=;
        b=pSBlO2n5XcXsJJ4WuVSfJ2XuaQ8KHR/heK+9crWjn0fQWuKtDXAUIhGgZP2hp9UU6o
         LGyR1FzFveGMBhnSvZEOtcAesM4pLeOy7R0p6urbEECPcL2l6Z53+frHGw1ZPOOwAjZd
         21zw258u5jSaHlc+FFABQ1rzS6G2Szrd01nqSTTz5jmZ0c7CNhp46B3fr1CyXHbLjo2V
         THIwgOZgVAroTHF4yVcLR5volRoKsby5kvnu2ryAMZonH7LRv7JAE13FZW3I3wqWvi/4
         WD8gvBlTUuWxSvrSgjiWs+9ESXwCNRqDQKfFItam32mLEwvfCrvw6OiNrc5YHkMTwAA6
         9A7A==
X-Forwarded-Encrypted: i=1; AJvYcCUFWw+FpwU21fnd0231LBLKXtjjAPicKY141mAnksOgCYkMVXF92+v0R2MTxZ8ygKlUPmw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6xZALzFM+D43Gqz0DHucPZ+fkh4Z/JrfvK749WK4aqKr0TEcl
	TNggqtzyG7uuZ3ZrTBUBWrz3W0yNyEN4pdA4DZgg7AvvIhi16omk4sEU
X-Gm-Gg: ASbGncuySO7OHV2HkdwL8HfTlNBZIqsffrEDIxO2imRsjuAG/m7Li4dE2l7Dq/VFTgX
	0M4rAT1ukaEWifxkTizEJvCG0F9ZWqh6rpstvTddsiu9E6mnzSvNDHJMTRXzY+8QKgHM/ZVM9if
	p9A3RqewVmkpzlzcKKGfMAinAaZ+TpAcRaIKjz6qRjUMJ4xIEZibt30j8NcpUQRhmDmzOINTea5
	8c/Wo7ZXUrf+7hvdJ3MnNAZtqujWDWW8vN+hZZ8PXNS41xP43qW2nDIz9ZKUA6UGloMuIpjorsz
	9sX5P9rGGjD929JIvk9NtMpBBuygKZyV5yOFnhpr1hYFwE3NVVWsNID6b10twwcz0WM/+O/qhi3
	Ruxbov2T+pdNHbujg9MG8hBcCrwCiKJ95CVko7hIBh1j//XfZS6Js
X-Google-Smtp-Source: AGHT+IFEe+0qmb0RjWgma2YAE8GxP9EJJf5z+x4gnLaWMQuiKVo3goUUZWAAcFHsJ3Iv3pAdS9sTvw==
X-Received: by 2002:a17:907:3d10:b0:af9:8438:de22 with SMTP id a640c23a62f3a-afe07d9c920mr191769866b.39.1755773811822;
        Thu, 21 Aug 2025 03:56:51 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:51 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: imx8mp: add aipstz-related definitions
Date: Thu, 21 Aug 2025 13:56:33 +0300
Message-ID: <20250821105634.1893-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
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
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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
index b62bb821cf61..afcd8c785cfd 100644
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

