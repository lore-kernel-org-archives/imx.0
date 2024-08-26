Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3918A13A899
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724709583; cv=none; b=GsLngQGO/0EbFxfQ5fm3lKda0rEAFXiuDtd7P77uGJUH134DBFujv0Vi74HdvqeQi9FU9FwqIXdJKFx90c7HGukmZDpjag6USTwuMbkU1TOUpharlzEv4dUlw9c8DytG3amrF7xm/sNEzFWbKjQtCt6Vt2ItR+g76SMBP+okOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724709583; c=relaxed/simple;
	bh=HvGserTtMgsQajo5CC1fnzNXSoyTYXSJddXaLuF3wrA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=X3uetpBMUG8XsB9p+/3evhzaua9faxb/BNpuAQbMIcnRG6U1Dz1acbmHkeGy1mIsyugwxjfMFQc/7KCfolneuXrq8scoSEGm3aiG1+A5eSrNPSzsaPyibfAVsFcAS1Yekksb2mxBHcDRd7xVOAvFSGmbOftHGkbbxYWxoqXcGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=aXNh8g5K; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="aXNh8g5K"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 356EC212A9;
	Mon, 26 Aug 2024 23:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1724709576;
	bh=EYmF5/QhDbJjKfovz5yydsOAjH3w80TXNx4jPy/QEqc=; h=From:To:Subject;
	b=aXNh8g5KLKMKNmMTzFBhlu50Gyx2XlrLb8PgnboMQUuir6Ako4QZni+kaPkaS/ajg
	 DfKEPbWjNzDB7XPxbf8zQCTpX+JJuxzvO5Qw0SGx5J9nsWcloG73rQAdAcheGeKktA
	 A7n1AXsvKOB5CEnot5zdzEXD+hi41FVJsLI0BELkNnmS7qw5Z2SYSn6vVJIzLFbewn
	 OXFhMj4u+Fa4lYBdA44HWIs0HMyUJbmqjQaA9Nkeod/X0HQrXENUUyM+UuTs+EBrpm
	 rBmreqMpDfqzGBF6+IrKa8qBl+6aXk/qFClpTaQKIW/f7sA3ZBR4HQIKtqqxPQ5vsJ
	 VWkXsRkYXOHvw==
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
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 00/10] arm64: dts: colibri-imx8x: Various improvements and additions
Date: Mon, 26 Aug 2024 23:59:12 +0200
Message-Id: <20240826215922.13225-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series improves Toradex Colibri iMX8X support adding:
 - working ethernet
 - correct PMIC thermal zones
 - USB support
 - analogue audio
 - ADC
 - PWM
 - VPU


Emanuele Ghidoli (1):
  arm64: dts: colibri-imx8x: Add usb support

Francesco Dolcini (3):
  arm64: dts: colibri-imx8x: Add fxl6408 gpio expander
  arm64: dts: colibri-imx8x: Add PMIC thermal zone
  arm64: dts: colibri-imx8x: Add USB3803 HUB

João Paulo Gonçalves (5):
  arm64: dts: colibri-imx8x: Add analog inputs
  arm64: dts: colibri-imx8x: Add sound card
  arm64: dts: colibri-imx8x: Add vpu support
  arm64: dts: colibri-imx8x: Add adma_pwm
  arm64: dts: colibri-imx8x: Cleanup comments

Philippe Schenker (1):
  arm64: dts: colibri-imx8x: Add 50mhz clock for eth

 .../boot/dts/freescale/imx8dx-colibri.dtsi    |  11 +
 .../dts/freescale/imx8x-colibri-aster.dtsi    |  36 +++
 .../dts/freescale/imx8x-colibri-eval-v3.dtsi  |  36 +++
 .../dts/freescale/imx8x-colibri-iris.dtsi     |  36 +++
 .../boot/dts/freescale/imx8x-colibri.dtsi     | 212 +++++++++++++++++-
 5 files changed, 322 insertions(+), 9 deletions(-)

-- 
2.39.2

