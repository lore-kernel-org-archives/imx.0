Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E72935950
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 05:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265125; cv=none; b=rpq8qxjYsgq5ZmZk4PkE9tdsIDUqeP8umaW8rsXiZ9qKQD5pLY6Nhf8hyLwLuS4oJ2kngX0H8pm1p6LLXWBys4ZoL3rPHNzq94wAvmpO6bl6VaHExlE6+J/i6IauJUMPy4f3I59NqJNYewVlam7Pft/+xZOWrHd80FXq3A9kymI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265125; c=relaxed/simple;
	bh=Pz8rjupJB2ZM6ycmPL/h9gsGIcaLh9i3O3s2e7rrrGY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GI30TkhQADmjT9RjvoiSvTq/LVSWNDJuUeFApH8zniIN0mhR8QxN1pnUiFZfpXKBnfJmf5fieMHL0SFEja+NmPxh7QNjWQQ+ILHMro4OHJG4a1fMjLAnE7etBMegbnkcJhrPnuS1+JhuTJ628bdSuQQdbkGu8iS9Y3d4G6MpCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BBC3D1A0143;
	Fri, 17 Jul 2026 07:11:56 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 75A571A013A;
	Fri, 17 Jul 2026 07:11:56 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A768E18000B5;
	Fri, 17 Jul 2026 13:11:54 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH 0/3] Add i.MX93 Wireless FRDM board support
Date: Fri, 17 Jul 2026 14:11:51 +0900
Message-Id: <20260717-imx93w_frdm-v1-0-0cca6c0ba2f5@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJe5WWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mz3czcCkvj8vi0opRcXSNTI4vElERzI2MTYyWgjoKi1LTMCrBp0bG
 1tQDcJy8LXQAAAA==
X-Change-ID: 20260716-imx93w_frdm-2528ada72343
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784265114; l=1190;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=Pz8rjupJB2ZM6ycmPL/h9gsGIcaLh9i3O3s2e7rrrGY=;
 b=a2PwV3YNEBSPZgtC+a9YakjggLlvUrI6SOSWUjI9WZ/Gi/4gJrkgfNk83DPdKLyh3jlruo/ha
 czGTOozzcDdBYfvmDw+87k5bs4YNxiK/BBF6SfI1cTgWPQXjoXH4baR
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
Joseph Guo (3):
      arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi
      dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM board
      arm64: dts: imx93: Add i.MX93 Wireless FRDM board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../dts/freescale/imx93-11x11-frdm-common.dtsi     | 692 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 686 +-------------------
 arch/arm64/boot/dts/freescale/imx93w-frdm.dts      |  23 +
 5 files changed, 719 insertions(+), 684 deletions(-)
---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-imx93w_frdm-2528ada72343

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>

