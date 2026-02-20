Received: from mail2.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675BB19D07A
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 10:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583812; cv=none; b=juI+Hl6c2Tqfta49rB4zzOoPU94q8xfpP6gt012Swnj1z60yYvnoCgjuXFhOEHs3LPaAxhXnBniuFOlwe8+8ntgm04gsjm8N5jcJ1sDL9LRGv/7q7IURiqGHj/yVCCAoeGoIbpHdjizdd9z/Myblp7kmuYQQmYjISVTaPs6ym4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583812; c=relaxed/simple;
	bh=ewRyQrji4pGYELiqYVENo0GDrQt6nOBBUes06GLpVJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9yxue1IjaY7CHP0Uy6Dn8uHVoBUmZQe1j3yjILlxX5LsLAF8N5DMShECFKA4cpBF0KQqwaFWMiEepUt0LcjhPOaIB5VorKZnZlWVDZlaQ0IpsbB8pYd2E13htkewlPEJRHWtwbALeliXXoG46MRSZyY158gtgwBpp6uJMSAn6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=kguP8LI8; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="kguP8LI8"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1771583801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6tAL8GI9iApgRaPZmu4GB32Zrpmts92Rjsp7FmvajSQ=;
	b=kguP8LI8u1PoAj8In3GfvOKdb8oc8Ne0lq2zdwc2k7DNeUOZwhreRoSk0zAjouCBX8kxOr
	hRgICRvMg6TC5thAT5wvu0RN+0z1j/gfPf9uagk7IxeDkc87+FXviOWebfg32895/s4oY1
	rPugm+dFePo8o3OeUJUIc1pBkqCSenFhcRnz3Q18xwPeS+MLMRkYQMH//c+JM83IuEam1J
	XlUCeLT1Dq3LIjTjYwnI+ZwlNu+9jUREHEJoSuBwhJ43bKTSxwkYHNYhxjal0IiSE6aklq
	Vj/T4R28X8BKo2dVhOo3SznAFLwxuXcMl/p3U3pI84jaacyqfENiqZXGpMlWeQ==
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 0/4] Kontron i.MX8MP OSM Devicetree Fixups
Date: Fri, 20 Feb 2026 11:36:15 +0100
Message-ID: <20260220103636.9697-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This contains three fixes and one cosmetic change for
the Kontron i.MX8MP OSM devices.

Changes for v2:
* Add Frank's R-b tags (thanks)
* Enhance commit message of patch 2

Annette Kobou (1):
  arm64: dts: imx8mp-kontron: Fix boot order for PMIC and RTC

Frieder Schrempf (3):
  arm64: dts: imx8mp-kontron: Fix touch reset configuration on DL
    devices
  arm64: dts: imx8mp-kontron: Drop vmmc-supply to fix SD card on SMARC
    eval carrier
  arm64: dts: imx8mp-kontron: Use GPIO/IRQ defines in DL devicetree

 .../boot/dts/freescale/imx8mp-kontron-dl.dtso | 26 ++++++++++++++++---
 .../dts/freescale/imx8mp-kontron-osm-s.dtsi   |  6 +++++
 .../imx8mp-kontron-smarc-eval-carrier.dts     |  1 -
 3 files changed, 29 insertions(+), 4 deletions(-)

-- 
2.52.0

