Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FBE2DC333;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769157031; cv=none; b=m6DTcYn7qdZ4eVqnsTTbx10beocNDRsigxgFJzwSkXkKN10ENYyo2JXwFNJ3b6dopjnoPKJJFZCHym2x3/pir2tMxc8F2OZwTEZhyyRKTX0lDXt6ffb+kRb70ViWKnkGLNAAF732x/TJzbo4mE29Ql+IbDL5vXAP8Y8DR2IVuH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769157031; c=relaxed/simple;
	bh=qP1NLLG9rTvhPI7VcZ3e4V6pqIk+aWjOp6382FhfNww=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r0Zc9bNCpHjI023l7rRnAQf9r2V9zBjyeNbQIUtDItyUMjNAOzm7wbQrk2onXNLRZpbfYOgd/vvw2OzloBa3E11tIscw7DOwsS0yZpmQD4xi1B2QZqz01g1rDWgQGLklxGDLyHtHVP7bvHFRI7zIY8GNosawBwn441FaKntHzKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4TwvJRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4TwvJRt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9135AC19425;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769157030;
	bh=qP1NLLG9rTvhPI7VcZ3e4V6pqIk+aWjOp6382FhfNww=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=u4TwvJRtbQvnCJX0DpQ1wF5rJBVx5oolJhXO1MaHB5rzj+hAeK1+WTT5WCByDePMM
	 iSzZHThB1cQV9kkSbb4DRfcmcYW+9Jx2xoiMz4oMiYn/jRX8/QuEo7k9DW6qfQIr6s
	 Y+3NxfB2tnv7va4mIqpmKK9NQ+Efv1Xu9gTsTBpq4qJPZZJT+y/Oo51w3uAkfFbKmT
	 yEaNgAlNWwUkB2/GUJWNh1ptLvHNWYZB1aoZ66GQOZuZnIiFWp3aev+WjBgFtPrLPQ
	 yL9qTxFhL/pqSUrnPB846Jm8ZYu5OzIgElw45Hd+u0bLKirzmtyRjxXTSvCrEbBKh9
	 OvVPKNcDzHChg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EF3D72345;
	Fri, 23 Jan 2026 08:30:30 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v5 0/5] arm64: dts: freescale: add support for the
 GOcontroll Moduline IV/Mini
Date: Fri, 23 Jan 2026 09:30:27 +0100
Message-Id: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23M0QrCIBTG8VcJrzM8R12zq94jIsR0HdhmuCFF7
 N2zbgzW5Xc4v/+LTT6Rn9hh82LJZ5oojmXo7Ya5mx07z+laNkOBGoQwfKCRLpS5Fdprhw4QJSv
 f9+QDPb6l07nsG01zTM9vOMPnum5k4IIH2bbGKYNK749ddHGcU+z7nYsD+4Qy/mDEirFgFDa0w
 VjrQP3F8gdLUbEs2AfdOHU1AcH8xapigH3FqmBtbSNbiUGDXeFlWd4Fe5b1WgEAAA==
X-Change-ID: 20251009-mini_iv-a05e5c2c1223
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769157029; l=2544;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=qP1NLLG9rTvhPI7VcZ3e4V6pqIk+aWjOp6382FhfNww=;
 b=WYzINIuOP4mCBBodYcvLeOdMLJgwXSrgFXWpQiqb3CFwOamicg+qwM8vvYPOCv6G0afTml/NE
 IGeyucl9D5cCtRjO7o3yj3DyKeRdj3jHV0o1x4eVrdIBTIMAJlM54wx
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

Add initial support for the Moduline IV and Moduline Mini embedded
controllers.

These systems are powered by the Ka-Ro Electronics tx8m-1610 COM, which
features an imx8mm SoC.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v5:
- Fixup aliases (remove usb ones) (Shawn)
- Link to v4: https://lore.kernel.org/r/20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com

Changes in v4:
- Fix BUCK6 property order
- Change the BUCK6 min/max voltage to match the dram specs (Lothar)
- Make it clear that the two systems are based on a SoM in commit
  message of the dt-bindings (Conor)
- Drop merged PMIC fix (Matti, Mark)
- Link to v3: https://lore.kernel.org/r/20251030-mini_iv-v3-0-ef56c4d9f219@gocontroll.com

Changes in v3:
- Add patch fixing the pmic driver
- Use the proper feedback properties for BUCK6
- Slightly rework the compatibles, acked by conor dropped
- Add missing CAN interface supplies, remove the leftover comment
- Add missing vled-supply
- Add missing ethernet phy interrupt (doesn't work)
- Fix the cs-gpios properties in all spi interfaces
- Fix the order of properties in all spi interfaces
- Remove unused labels for regulators of the PMIC
- Link to v2: https://lore.kernel.org/r/20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com

Changes in v2:
- Fix allignment issue in imx8mm-tx8m-1610.dtsi (fec1)
- Move phy-reset into fec (works better in barebox)
- Make the gpio-line-names groups of four on every line
- Link to v1: https://lore.kernel.org/r/20251009-mini_iv-v1-0-f3889c492457@gocontroll.com

---
Maud Spierings (5):
      dt-bindings: arm: fsl: Add GOcontroll Moduline IV/Mini
      arm64: dts: imx8mm: Add pinctrl config definitions
      arm64: dts: freescale: add Ka-Ro Electronics tx8m-1610 COM
      arm64: dts: freescale: Add the GOcontroll Moduline IV
      arm64: dts: freescale: Add the GOcontroll Moduline Mini

 Documentation/devicetree/bindings/arm/fsl.yaml     |   8 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h     |  33 +
 .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 798 +++++++++++++++++++++
 .../imx8mm-tx8m-1610-moduline-mini-111.dts         | 686 ++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 444 ++++++++++++
 6 files changed, 1972 insertions(+)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20251009-mini_iv-a05e5c2c1223

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>


