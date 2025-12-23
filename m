Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6863733BBDE
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766507327; cv=none; b=S6cHVi8twfjcKeXwgWC9boz3V0NeYLcVbYbQWmaXh1dMtjMz5v8nuwhKWgE4VyWvsD+Y83qSwyPP6y4M8KzV+cQhdQfisQvs50M8Ii4nRW9FiFewz8G8HA0nyts9oWXfzlZqjzurC4Kkkv5wqkGdCBnKL1PVTKwD8JNevadyqMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766507327; c=relaxed/simple;
	bh=ghbFggSrZg+jlnLOMRMCr3H0zcTIySHg25pJyjn+YrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpKiAPw8zsg6fS2GDnkvOvy1pmlaW1I6pB1vHhRRd6vh0aOM/ndeYu0oMVeQH5+iLEy/9f2xyQeaKCNCQxMO2+WZIfbXm6G5Fc9/pCANSRMd/gE8BwlHxd0igzWmX/yOUqzrdR8AaOFPU3BTE4nxSAscqeC8WNMFLdHmSTEDS0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=w/FkMiIp; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="w/FkMiIp"
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 360AA1FE66;
	Tue, 23 Dec 2025 17:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766507323;
	bh=WRrkmvhzu2YQMk3bdMEXXwokIel0iB14JRo8xu+Pvg0=; h=From:To:Subject;
	b=w/FkMiIp2fwdn7DuybuT8W46jKLSkE9gX+eGG28zg0ZSuzfdy+wWDyTTg2sm5/xki
	 yDhCisMNpzc7h9EaDJketXxAD8qrv/2FivO0aj7zmiqVNT41fY9yF+IcI6itGSdA0N
	 WbZGsEltrKb3OhNvMDMIJsQEFSeFTk/Q4QtfiwTnbNbaGbMowrtD+HjJXn6No6Wb91
	 ozaSimlRej36EWQKsgXutNC68m4FVoBhqYfPcN3jLY2v79uQIzs1+hTJEgixBDs9VL
	 E7SI5O5HiFKQfbeF0MwfLU+z0LOgFtEYF4/pD10Ly41i7oz5bN0AyMODu9VHkv05QK
	 JL2r/R9TgRrXA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/4] arm64: dts: freescale: Add NXP i.MX8QP SoC dtsi
Date: Tue, 23 Dec 2025 17:28:29 +0100
Message-ID: <20251223162833.138286-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223162833.138286-1-francesco@dolcini.it>
References: <20251223162833.138286-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for NXP i.MX8QP SoC, this is pin to pin compatible variant
of the i.MX8QM, with a slower GPU and one Cortex A72 core instead of
two.

Link: https://www.nxp.com/products/i.MX8
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8qp.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qp.dtsi b/arch/arm64/boot/dts/freescale/imx8qp.dtsi
new file mode 100644
index 000000000000..26af9c5a51c5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qp.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+
+#include "imx8qm.dtsi"
+
+/delete-node/ &A72_1;
+
+&cluster1 {
+	/delete-node/ core1;
+};
+
+&gpu_3d0 {
+	assigned-clock-rates = <625000000>, <625000000>;
+};
+
+&thermal_zones {
+	cpu1-thermal {
+		cooling-maps {
+			map0 {
+				cooling-device =
+					<&A72_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
-- 
2.47.3

