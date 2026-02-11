Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558BC281525
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813365; cv=pass; b=TgpwNwAK7s/mM7Xs5DS/0nxopJ+4EfeMiuaQDmXaaIFJbuB7mTGu2fDGJ1aLcSmk28HN8ejuoBwOLKghDIHsnoYrdP/JufM1kMpqgbr2XcDLG+VfSMz/h5TnjGBPNXAzpGBpUod5y3CpFQF46ydqGugKOHrwDnmZ8HjCGhmLcrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813365; c=relaxed/simple;
	bh=Bj8++Zqu3+fMRDp8KEV/HrWS2/CAZIerr5uJ2LpxVIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aRWGkijTuqkQpgRISYu9IGQ5UayExTWS61VTH2jL3ouKptYu2uG/emtKcZjpR3IqEaEIcoH0Gs56Aq5JsrUpfui1hMRKH6XQC6ucQdrQyxInd0PKvxlFr1QMu/VROlv4PkZtzFCpAHLc8PovwW+4V43SPSnntp2sCCmnmjjjZU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bAFGlk1s; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bAFGlk1s"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9a8119aWt/faL8kIM3FP7wFXRRc93I8ASt1myHt9FTc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813299;
 b=tXXIfhEbdU5qfq+ljterGar3H4c1ay1ZPimmZZ7m68+/lI335MrPATPMKdPkluSd+azZz46w
 +49utpYRnh67gYlD5R90Yz3Sb6ioMQr+F3V3gS7H76Bh/5BZ4nJ1iYuqUPBtlxQ4bx+BmQ+7Y8v
 e5B1EySNu5sA1zodiMCRY2hs53Z11zVdcooZoyCZTL8UR1FW3fRnHARKYXaqGiAB63m3+fiY6x1
 SUw3wHyB21oruyspnZCBJiaN1sLRxAIBgLdiINLkSo/JBxkn91N7dyr9yKW3WzV+Bo/YNMrLA7a
 Qy6J7EfAWY80r4KSS14gd6PRRo/lUnzJhX7aZNch8/MnQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813299;
 b=scKQMOHuDUvizoZAigGu37lqSWeyFT8wAsE0uN22IDXA/vrhvXev/E+mVFwoFIsb18xpW4Co
 v05DS5sxRQI9LLhfWqrBTmjiPYqIy0Wl/NVn1vHunrxQtQoWKKjBe/BQMe/hrGOryVk7tset8v5
 VRYgyUHpst5Dd1K4kwrMvOQs4vqHq7J/f80fHMT50Au9awBHbU/nvrxkmRDkh84dJ/SwHBvccGg
 KEkrNKTYq13Pxb8Ivo3rwqVxV/VbDxFh6mAWDAIrfwvWdR/X+ru6cPkRfFZQqx1UcYRzXA39z65
 tPWVrz5MM0FUPI4A53ybUyf01XOMIC553WHStn/vrQfbQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Wed, 11 Feb 2026 13:34:58 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C2BD85A03D9;
	Wed, 11 Feb 2026 13:34:41 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 0/5] Support TQMa8QM
Date: Wed, 11 Feb 2026 13:34:27 +0100
Message-ID: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4f9yYb0fGlz4MQWf
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:8727f709344811bd075061d5eca82f5b
X-cloud-security:scantime:2.347
DKIM-Signature: a=rsa-sha256;
 bh=9a8119aWt/faL8kIM3FP7wFXRRc93I8ASt1myHt9FTc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813298; v=1;
 b=bAFGlk1slTIqh6l5HONINDCn7PPJz4KbOJ08hAmK4FiKQ+WkUVgefOriEyEh5btt3ohobkXV
 n4hBS9xRCfkT9OhETglnmSwKh/MsAYYIvWhoYWdnVblzHXYvf8uYGFdTc6cRzUI39U1nRb+CWzH
 f3lNsY6/XbNAMZ4bqufxol65YT6xcqCy3zxz4KkGOwKhKCLwNwwdNYTnEUECcTsDLsQyZWorSpv
 t0ZCM/MfkB5HTF07WKTHtqBJM8xGbGIVlFuLeB8FF+C9Jq+HvpekHPPa7lvmYuOhW+0KrWoIsg4
 nr831LEcL+SjaIxUnGPpEx1pmBgynfHqXGbtTOt9TAAyA==

Hi,

this series adds support for TQ's TQMa8QM. The first 2 patches are prepatory:
1. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

2. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

3 & 4. Device bindings and platform DT

5. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Changes in v2:
The need for clock-output-names properties for renesas,9fgv0441 has
been removed by reworkging the PCIe clocking

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (5):
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: freescale: add initial device tree for TQMa8x
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 869 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 325 +++++++
 6 files changed, 1209 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0

