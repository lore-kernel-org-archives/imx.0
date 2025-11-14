Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED432F3C09
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 06:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763103349; cv=none; b=I8Hne4ruXAYb2/zHcD+9XZR0FR7HJdq/0tIuf/KqMzoKo4wOp7Iyr2RU8t+h0DXLDp2GEL+VOOpQkoyR6Ua4whcm/mSmevoLLkeUZtILfCox7dyOc0FE2Pu8SXMz1iXX0jP79Z/r+UEi8yt2zI40AqdMInv6nCLP0K1Z3RnnTds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763103349; c=relaxed/simple;
	bh=rmkBAKWf4/tK+exu+WFt8u7DjEM6gjNCN0eLf4uTrd4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ps+CzoG/f9AVizO4pynxJu/wuQwQZgDzglp0l3ZgbEi5Y231B/E80dWPIvHUND/VDMUXwK6eByrmKsXVFmCqv84/4jNAl9YE2vDgeHwm7PLyVRvfWAZBVzTUtc8sDj9Se53oHpp0OSkhQZxgTBsJPw2O/q9KEEmKEEdiVcBqDwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0DC5B200C48;
	Fri, 14 Nov 2025 07:55:41 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CC2E3200C56;
	Fri, 14 Nov 2025 07:55:40 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BA3671800091;
	Fri, 14 Nov 2025 14:55:38 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH 0/2] Add FRDM i.MX 91 Development board support
Date: Fri, 14 Nov 2025 15:55:31 +0900
Message-Id: <20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPSFmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3czcCkvD+LSilFzdxJQUoySjZAPzVHMLJaCGgqLUtMwKsGHRsbW
 1ADiQr3BcAAAA
X-Change-ID: 20251114-imx91_frdm-add2b2c07e78
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Justin Jiang <justin.jiang@nxp.com>, Joseph Guo <qijian.guo@nxp.com>, 
 Tom Zheng <haidong.zheng@nxp.com>, Steven Yang <steven.yang@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763103338; l=704;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=rmkBAKWf4/tK+exu+WFt8u7DjEM6gjNCN0eLf4uTrd4=;
 b=kZlYUQ8RwDWIdWyIBvX3uN/6I641a03ENmZSX1Cy0sxCz8Lses1+2tCTaLPGEvfd+//Mg5TX6
 bYhFlpbF2bBCye7OVpZwy/p9tqnpI4j8Ylo08BKKgPmo4xMptZFvGc/
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

FRDM-IMX91 board is a low cost development platform based on i.MX91 SoC.
Add device tree and dt-binding for FRDM-IMX91

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Joseph Guo (2):
      arm64: dts: freescale: Add FRDM-IMX91 basic support
      dt-bindings: arm: imx Add FRDM-IMX91 board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 823 +++++++++++++++++++++
 3 files changed, 825 insertions(+)
---
base-commit: a39fa74eefcd9d7c2f7d4afb5894131d82f5aac5
change-id: 20251114-imx91_frdm-add2b2c07e78

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

