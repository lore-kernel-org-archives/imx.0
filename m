Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA20F139D14
	for <imx@lists.linux.dev>; Tue, 14 May 2024 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715680392; cv=none; b=mu9F97V502lCT9zgyrfg0qcEvD3BiGLb+oZZMo8xhIX1ck/h7wyq6EyNj/Oju0vtGUeEeR0ZVKj/EpV3caFrWKHkLdVcQ/5I/Ilw/eWL/RGY1ZSg0JJxOasNOwAbwrqZov7avqK/pB/gza5LE2Uk9dc5cnKjdliEyVq5FSJhHe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715680392; c=relaxed/simple;
	bh=ctka+yZVd8DwpplQfnow4oPq+/CyZFMffSHpY+xP8VA=;
	h=From:To:Subject:Date:Message-Id; b=Y6T3Myfe2I2laXrtR2Pfgeb6OxQ9+C5obl7K038CnH0bYymMbWpfh9eLO8gu6zWrrZ9Nqiz18Vdf9Sxvd680lxngmjVwy/RFXiHPZ3D16HMjNCnOSceReRAfH1H+hGxirF6zOY7U69EVMNSLNlM1+IioL2Dmn9s2VYqVO3ToROo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 80D0D1A15C6;
	Tue, 14 May 2024 11:52:55 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 399351A0C0A;
	Tue, 14 May 2024 11:52:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DBE1B180222C;
	Tue, 14 May 2024 17:52:52 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	shengjiu.wang@gmail.com
Subject: [PATCH v3 0/6] clk: imx: clk-audiomix: Improvement for audiomix
Date: Tue, 14 May 2024 17:33:24 +0800
Message-Id: <1715679210-9588-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Some improvement for audiomix driver:
Add reset controller for EARC function
Add CLK_SET_RATE_PARENT flags for clocks
Corrent parent clock for earc_phy and audpll clocks.

changes in v3:
- separate reset driver to driver/reset/
- add binding doc for reset driver.
- modify imx8mp.dtsi accordingly

changes in v2:
- add more info in commit messages.

Shengjiu Wang (6):
  dt-bindings: reset: fsl,imx8mp-audiomix-reset: add bindings
  reset: imx8mp-audiomix: Add AudioMix Block Control reset driver
  dt-bindings: clock: imx8mp: Add reset-controller sub-node
  clk: imx: clk-audiomix: Add CLK_SET_RATE_PARENT flags for clocks
  clk: imx: clk-audiomix: Corrent parent clock for earc_phy and audpll
  arm64: dts: imx8mp: Add reset-controller sub node for audio_blk_ctrl

 .../bindings/clock/imx8mp-audiomix.yaml       |  17 ++-
 .../reset/fsl,imx8mp-audiomix-reset.yaml      |  37 ++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   7 +-
 drivers/clk/imx/clk-imx8mp-audiomix.c         |  23 +++-
 drivers/reset/Kconfig                         |   8 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-imx8mp-audiomix.c         | 117 ++++++++++++++++++
 7 files changed, 201 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx8mp-audiomix-reset.yaml
 create mode 100644 drivers/reset/reset-imx8mp-audiomix.c

-- 
2.34.1

