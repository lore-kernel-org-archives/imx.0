Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E4E21D591
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737673; cv=none; b=X7P/ShL+TwqWSnNaW0wbLAjCW4TLKs7PQygB90fuBdYDnDDKBf4soliHpWmQFourDIIpkQlmNN6seFfD58z6tycSmg1UyH+//Tr1CAikgezEb40yebnggMY1+rHC5zn11G1XbVItxPT3Cd0jzW9x6WswPSjVHpQt+99ZxhJNoho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737673; c=relaxed/simple;
	bh=jhENJ0w4vz6KVeQI9RNy8HNZdBwnE5EMBVJIr+vh5qg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VAHUEunNjDZs1V2+1pgJUmgL6mGu3mb+pEE1TJfjQonqbmbmxV+r5XU13PewfavNUF5mSCvOHqkQ89q1B6kwwqi9G7nm7jyUbPCp8qHHbpp5tbtE5P2O3tZyAXSvq3nX+sQ5u4Mb1hc3QhEHlyqOITISV+7pOwV0qdpOw6NhMFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjpdNJQl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjpdNJQl"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c0dfba946so4306991f8f.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 10:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737669; x=1745342469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KQvEsaeONHy/l4Xju7O10zDYvEBhHW4gcNN9+1RZRM=;
        b=HjpdNJQlReS/sDWAdjo2hU3cJBPElHLu/Mv1v5jo7by7Z3Vv8cAoEsGigg1xzpFiu6
         T0ZVibJroK2nye5SYD8l508y0qg60ZlA1GIqB/5edotfZGBHKt/6S2LU7ARQCv0oSxzp
         WXftLDqnj6pr7ovbSv5VNUUZ78yslzOM71PcPOtwos7mVuv0qsbT0iXzCG8AN3ZjRW1S
         1bTX0F7kBb+PcBZ9BjWPTFxXhlxkLtLfB5uSHJpjBSxSfD3DQjew+B5F5EGrH2argft/
         wJn+9tetnsx6SGEwYXUOhkkx/kqP93BiwT0e2zsis3ongtB3nfC25G7E7A4e7eX96Byh
         H2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737669; x=1745342469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KQvEsaeONHy/l4Xju7O10zDYvEBhHW4gcNN9+1RZRM=;
        b=spnwKFWuHtYDNELGFyjCQMMz3RF9fCBiVWKZnzaW6vRtfBvOvvUjz75nBiO6e1CKsb
         Jb5THxqlxQxobWYLipO9bVeYK9peyTg/Yvu4WReybw1HqVDS8YXnr+m0GjyW8SC3mSYV
         ColixTTEjc4NGAOkcdI7vW1ro6lafl8EuxjO8vW+8UfkT8ZvHfkxzmVmCAeB3e15idv6
         fqw1yiOdU7tYxSyu+3sOXhkUkXt7nQND3+3T/awSF9voE8p/CofjYt0pNRptCNshAjq4
         p9CFFMkj1l+prbXR7qShNKTKxbGc5PhLbAIqgt6YWuq9DL/vE1NXl23Q2QpTbi2uOfxu
         +4PA==
X-Forwarded-Encrypted: i=1; AJvYcCW86hRWBkj5vW5yGonasjZ2VdQAVOe8Mdpa9fFPUa8jqIuLnZziKT1AUrhE3AU7j2T++6M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKHGe0TlezMw+rr49OF0ID7IRZjWEUv0sfukcVsS+jJE2x5LSL
	gRWtmDJwnGdDS/WJQOPLijTGGeQZhYyNJgr23AcNXYK4DBOUGnc2
X-Gm-Gg: ASbGncsJBcKg9Zh3f5gMsyVVJ63o4D3fH4CnfeO21asdUivJsfzJemeGTm3vyL2KYtO
	Xe3Q2dELmryzYg/3lHly2JWNe+JdQNP0OrntiCBzVuFSlpYpLHjniCNfFOR9/euemK3vvs6sS/P
	bUhI+AKiUf8rnzrGE4DUBiL+lq6TMw4djhQQ9FziQCmXx5HgBtilD2g3+ZjxAG1DoY79EqZVMiz
	JWqzAaqG2ucv79MA1qChOpB7t3u0wvTM/F59UARR7SDcI5JlnzWiCXaTe8QxHk1YR4bLK95Y+Io
	wZpFI/KUFXtbz8N1AKNHKaL1gDK5FAD+Ifm3FuZ9fvc9c4P5FB8z+z68Gc07+EmH2xbRwO2a9p+
	eqw4=
X-Google-Smtp-Source: AGHT+IE5LwUFFqRN1DRApHuDZUZuydgO0U6kSCqbQ6tZKxGSHxRY3Qiff50MLBjjeVgYq+0MQAeeSA==
X-Received: by 2002:a05:6000:1a8f:b0:390:e158:a1b8 with SMTP id ffacd0b85a97d-39ee2760646mr250766f8f.43.1744737669297;
        Tue, 15 Apr 2025 10:21:09 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:08 -0700 (PDT)
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
Subject: [PATCH v6 5/6] arm64: dts: imx8mp: add aipstz-related definitions
Date: Tue, 15 Apr 2025 13:19:18 -0400
Message-Id: <20250415171919.5623-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
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
index 000000000000..b5bfcbcf38b8
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

