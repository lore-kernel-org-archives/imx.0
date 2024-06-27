Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD3513C821
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 10:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483041; cv=none; b=bObJvsZROnBYausdtYir+/6WeWqPAktwBzCWUFj+ZN59FzRCy2cPMUXORovgJy7Lzu/s3MiwiovhetzyQDnVKe0K1U2PCmJOnPoPWqUKCLw2CPKTz1/i+MGY9SdYrOQ0q5tjyzNB+ehLpaeBnIEOW80ofINXapxMi4lkMTGkT+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483041; c=relaxed/simple;
	bh=Fu70GtrJHO5py+//DRB2JUJJpuyey7Gfe5fGukdcygY=;
	h=From:To:Subject:Date:Message-Id; b=LeYHMsjkTXDR4b0VH21ysovVrHzs1Bovzmr9DFZkdsxlYxbvS9i3DL3NPJnxkOUKuyPAKVGKLISUubDotmFtnNjNK+KBYYzi0Kb+4mDMGznif80k3m1JvyoxAcikZCVNoIIaq1/lrl/AMX8AE5QBRIkTirFD9VY1JnMPNLKBfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A22D61A19DE;
	Thu, 27 Jun 2024 12:10:32 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6A49F1A0868;
	Thu, 27 Jun 2024 12:10:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8D872180222F;
	Thu, 27 Jun 2024 18:10:30 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] arm64: dts: imx8mp: add audio XCVR sound card
Date: Thu, 27 Jun 2024 17:52:58 +0800
Message-Id: <1719481981-4069-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add audio XCVR sound card, which support SPDIF TX & RX,
eARC RX and ARC RX.

changes in v2:
- use minItems:3 for i.MX8MP and update example

Shengjiu Wang (3):
  ASoC: dt-bindings: fsl,xcvr: Adjust the number of interrupts
  arm64: dts: imx8mp: Add audio XCVR device node
  arm64: dts: imx8mp-evk: Add audio XCVR sound card

 .../devicetree/bindings/sound/fsl,xcvr.yaml   | 11 +++++---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 27 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 26 ++++++++++++++++++
 3 files changed, 61 insertions(+), 3 deletions(-)

-- 
2.34.1

