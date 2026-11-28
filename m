Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850643;
	b=Rtcb354/IeTA7U5VJijEXejJKO7GgBBv2PBbPg7DIHTv7QZqUzOuouLOQwNEqXeAnDDg
	 mh5nFZw0Eh9w5NoS3wjHvsKOdfYMEPqvDm8LOD2RIzl4A1zM1Ul8QoKDEHKpwIRJHCz2r
	 lJdLErZjp+lXO7Fm7sQc+mMFXSuXW6q83ceYdal+44HPVeyk11Z8LUlX+m/hhl73gPzqC
	 pDGCKIZdF8d2g2BnLXotxB11m8pLzY3FWYA5vbKf6PFhQw4itkJBo1zEcXtkybZhqekT3
	 SWVZ3NDxSwxSMMWet0Wh7sP1O/3FxXabbr04M/KkvBPqF8qmMzOOI1W5jDi6wQ8qj3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850643;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=OIWmkoz/ccsbm5cn7EmTYj2aMiZyDkUZdfHw4MfKgFo=;
	b=Dh+GrqHNeqnKhTFY0qBV7ghCO0sKGeLJJrt06gY4pQvBu06judeMAWiaeUCiJL9IuDbB
	 46p24LSL6l0ml14bF9oanqU8u7pWq5+ZZ1ReWKTeNfd3LOkQLNSkKpaC8QHXpSCOfSLdA
	 +dKzFuSm0MDr7L52Hwy7szmMyqhkImf6vINEHQyf1xmjmUAAiB+UbiFS1bNjQWMH9L5hF
	 djbdmY4CS0NfIFWTszjMfzQ+O9dCMrLiDKDdvhwVFWpYNmiWbsCG/SZBn6UUhNUumVU2T
	 HpcDbh5Qkzuulc/F9ThkdL03Jlaer2y4zsXXwT1GgqSfQiFyWpR0ZGA4fi3BBZ253sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gkw6QUX0;
	arc=none smtp.remote-ip=95.215.58.22
Received: from mta1.migadu.com (out-22.mta1.migadu.com [95.215.58.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C51606A321
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 07:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C51606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gkw6QUX0
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=OPu6r00w5pS02VTnfc0Mf76uvr/kyRzj7ytYywT4JJE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850638; v=1; x=1796455438;
 b=gkw6QUX02l+Z2O4I8nIeNT+rEHcakpT4EEY+wbFl3xqB//oYdbXvzldnENs0K1dmFTnhFwAb
 aw4ms+PG3af52IXVr5GTDxSoPdKB1RoRTMl9Y1apzrcLwNAyfMRZxJYWDFjRk3fkIxglHwibjww
 5j9i6pZlvlb5Zv4unNUtL4JA=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 64b7477b175854f2;
	Sat, 28 Nov 2026 07:23:58 +0000
X-Mizu-Trace-ID: 64b7477b175854f2
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Subject: [PATCH 0/9] arm64: dts: imx: Correct PCA945x PMIC interrupt type
Date: Sat, 28 Nov 2026 15:23:45 +0800
Message-Id: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyML3YLkREsTU93MvBJdC2MjU0MTs2RjY+MUJaCGgqLUtMwKsGHRsbW
 1AJnSAjNcAAAA
X-Change-ID: 20261128-pca945-int-8325146c333d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Maud Spierings <maudspierings@gocontroll.com>, Joy Zou <joy.zou@nxp.com>, 
 Joseph Guo <qijian.guo@nxp.com>, Francesco Valla <francesco@valla.it>, 
 Steven Yang <steven.yang@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
 Fabian Pflug <f.pflug@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

The IRQ_B pin of the PCA9450/PCA9451A/PCA9452 PMICs is an active-low
open-drain output. The interrupt must therefore be described as level-low
rather than edge-triggered.

The pca9450 regulator driver was fixed to request IRQF_TRIGGER_LOW in
commit 5d0efaf47ee9 ("regulator: pca9450: Correct interrupt type"), which
is already upstream in v7.0-rc4. Device trees that still describe the
interrupt as edge-triggered no longer match the requested type, and the
GPIO/pca953x irqchip rejects the mapping:

  irq: type mismatch, failed to map hwirq-3 for gpio@30200000!

This series updates all i.MX device trees under
arch/arm64/boot/dts/freescale/ that use a PCA945x PMIC with an interrupt,
so that the interrupt is declared with IRQ_TYPE_LEVEL_LOW.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (9):
      arm64: dts: imx8mp-debix-model-a: Correct PMIC interrupt type
      arm64: dts: imx8mp-skov: Correct PMIC interrupt type
      arm64: dts: imx8mp-tx8p-ml81: Correct PMIC interrupt type
      arm64: dts: imx91-11x11-evk: Correct PMIC interrupt type
      arm64: dts: imx91-11x11-frdm: Correct PMIC interrupt type
      arm64: dts: imx93-9x9-qsb: Correct PMIC interrupt type
      arm64: dts: imx93-11x11-evk: Correct PMIC interrupt type
      arm64: dts: imx93-11x11-frdm: Correct PMIC interrupt type
      arm64: dts: imx93-14x14-evk: Correct PMIC interrupt type

 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts          | 2 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi  | 2 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts          | 2 +-
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts            | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: e5aad2bdbbee783611d32599f89cea3f12f9593d
change-id: 20261128-pca945-int-8325146c333d

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

