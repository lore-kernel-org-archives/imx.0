Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390EE17E009
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725206268; cv=none; b=FjSXcoGLJUamFXNhEfYvPlF++WqaF4w2UWThMoEg9O8nHeatcMbTTz1OrmIn5oeaWmxw1cGIYOKijZzSpXhgkFNwtvjj4KXXO2xYC1Gk2D61QHyXLEMT31qOxDbJFZSdqIv7TxMfFg+plqS6OL3pKz9sML1/1NaolW1rGDSXj84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725206268; c=relaxed/simple;
	bh=Pz3p6BXkOaHToDqmV2unQYCgJaP4GueoizZQ6wAOk9c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=OUEtu6Sa2PEUYfjCBjcbYRjKdtEkkExe1jIGgAAy7rtR379r8nIVkfclabCZpAPPhgyiyz+VjZpyUFgCSZjtzADmpgv14Zo/T78G91IcechKx9HrLGmcPV/f0qpzHq9bOftNaJTlZ8Bp+dwdEuAAG6sZ+5Oob9hBeeLQe1yOoQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=HiiY0uiV; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="HiiY0uiV"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 74D001F9C4;
	Sun,  1 Sep 2024 17:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1725206255;
	bh=AKeiSu4QNwwOqxNa3f8r6M+bdrYx9CoLG51vNSpp5fc=; h=From:To:Subject;
	b=HiiY0uiVY597sFgVSFVDHVKdvNhlkoJD0FJaElUKI+TfVhDzHg5A4QhjrL7UDwWqg
	 qSAv6OQvZ4Jj28QQ+rSdUJC1vCVAwttqwvuac6+zNIWHbAsydA1XII3Dn30nuIaDqY
	 XG+IH4A7zFpWXpGn+chMNngFrkg5qAuLP/dT8iPvgjFnc9PuYnVnwtVarT/7BTFhZa
	 XM9CA8T9yXKQ/nN2qeUmIvdkICkmfkwAO0EARvHX7TplBipARozaLk0vdi8D41FG6X
	 adnuKlXrw2R1uhCrHxntfcUxL8hpG3yFxhcwU5BUC1N+P4bmfbiVRO7W5gJMQlXJUu
	 vHF2caP6PAuiw==
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
Subject: [PATCH v2 00/10] arm64: dts: colibri-imx8x: Various improvements and additions
Date: Sun,  1 Sep 2024 17:57:11 +0200
Message-Id: <20240901155721.7912-1-francesco@dolcini.it>
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

v2: 
 - Fix USB OTG ID GPIO property (s/id-gpio/id-gpios)
 - Keep I2C nodes sorted by address

v1: https://lore.kernel.org/lkml/20240826215922.13225-1-francesco@dolcini.it/

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

