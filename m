Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7812F3DA7C5
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790819; cv=none; b=umuWm3YBg9Tjpnte0xs3QbuSAMh0ToZPDHJCbj+Yy1SNJNXbGkb4XJHlLTWZ12HY/PU9KSrWBJMlvUpkNmev5qpPr9U3nRgGT+0Tyn8TpobJYsKbJCZUpNOjHSkI+cwjA+7k3VjF1UOMLKf4HRNDhyUhpmJ+WE0c8YsMRlfT0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790819; c=relaxed/simple;
	bh=iPcXDcyUPOIKX85MlPV5vcloIKHXNagDNwWRTDwubp8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CJEVPU+jGMqY/Q7J+TROVEp6e3ov1ATjewe5x3nko9GshHObopelv+ho42drYrS4d3kyfaVMMF9cA0hrobMAgNScLVng0+dSae2XKgXT72qD9aRZIxNiQz2uVZ3u/2Q3hGlmfhu7crDbxM/KeD0fzBGKMxSaSuroLWovNrAhMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DA4761A015C;
	Thu, 23 Jul 2026 09:13:30 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A33291A015F;
	Thu, 23 Jul 2026 09:13:30 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 84AFA18000B5;
	Thu, 23 Jul 2026 15:13:28 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH v2 0/3] Add i.MX93 Wireless FRDM board support
Date: Thu, 23 Jul 2026 16:13:20 +0900
Message-Id: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABC/YWoC/1XMSw7CIBSF4a00dywGLhbUkfswjUEe9g6gDZha0
 3TvYhMHDv+TnG+B4jP5AudmgewnKjSkGrhrwPYmPTwjVxuQo+JaKEZxPsnXLWQXGbZ4NM5olAc
 J9TFmH2jetGtXu6fyHPJ7wyfxXX+O/nMmwTjj1hpl+d1gaC9pHvd2iNCt6/oB3lesVKQAAAA=
X-Change-ID: 20260716-imx93w_frdm-2528ada72343
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 justin.jiang@nxp.com, xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784790808; l=1408;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=iPcXDcyUPOIKX85MlPV5vcloIKHXNagDNwWRTDwubp8=;
 b=LoMAh0FzPwJKyZonHTr1PaHt7z0IIVO8VQm75psKOSKh0wBZyMMO3OOEPPlmxT8otmmEyYlFT
 6LhPWAR9wgaD1NG18+mDuPblSfBynCQH8X/KYn6BwrhZWBezjDTJfSQ
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

i.MX93 Wireless FRDM board(FRDM-IMX93W) is a low-cost and compact board featuring
the i.MX93W applications processor

FRDM-IMX93W board basically reuse the FRDM-IMX93 board, with some minor functional
and pin connection differences. Factor common parts of FRDM-IMX93 and FRDM-IMX93W
into imx93-11x11-frdm-common.dtsi and add the board-specific changes.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v2:
- Move board specific lpuart5 pin assignment to i.MX93 FRDM dts.
- Move pcal6408 node from common dtsi to i.MX93 FRDM dts
- Link to v1: https://lore.kernel.org/r/20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com

---
Joseph Guo (3):
      arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi
      dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
      arm64: dts: imx93: Add i.MX93 Wireless FRDM board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 ...11x11-frdm.dts => imx93-11x11-frdm-common.dtsi} | 129 +---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 679 +--------------------
 arch/arm64/boot/dts/freescale/imx93w-frdm.dts      |  23 +
 5 files changed, 32 insertions(+), 801 deletions(-)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-imx93w_frdm-2528ada72343

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

