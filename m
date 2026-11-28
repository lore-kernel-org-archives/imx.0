Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850724;
	b=PfPQIBoQgCz77cN1dc7qBUrq4gCqolGU9n1D40V6A0C2QHI9jaMotYeSvijFcggLKcFh
	 2NAjEmlyvgaDhHZSehkdC4ugccjUO2AHHC0fCenc45WIrTxHk5hXRK6W/HvN2BIoYjK0r
	 gfRU4TQCdn72h8M8usXaWJkph6Yb2WQUPAmh0zGia0I9cEJJKLoiYWYDpzNynDnWJ9bTD
	 HYk1J/h1+VKsDEWtJpmDnCUSKaPwYRuTwG79FAPRbUpEY9kNFyfvPxb74BNwD/8acfB0B
	 C3xCSECb+ivppVCEfywlSfFzDfO0U/l1vnxy+YPSkkW3T0IhAwcYxfxuZ6+arPY04Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850724;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=CSvpXGtyEATLlj/2FrXWL2Yf8kgpvuWchRuqAUx0gQU=;
	b=T5QXSvNDNrbZocfAB40tPxM0diSVs8orv2l5FgZsBXgAH7HRVYu8dDlTOX4x//wguMCT
	 2aN31tOE+JXtFDtAei9I+BTYd7jhDr6wx3uAtHBI2poXhPekNac6dovP622MYnKQY6GEU
	 /9CQA4XwwMzchNukK2b3p9aPyP1G25lYBUTSiCggRUCQbOLHWUqT63L/ymQKDjXlNBOU4
	 IU8kcIQgLAlLi3bHsy/+/C5t3D/GI5W++pw/6dRA5GQAF3rZGs3D8cZScCiOEH0XIOL2E
	 zWOKReJzSARp/2+qaT6zAYh9Sznk6fLU0Z0v8w6zv2co/CBoFCOUbCOnuRQgyCBroHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v93gqFUr;
	arc=none smtp.remote-ip=91.218.175.183
Received: from mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AAE606A31C
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 07:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14AAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v93gqFUr
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=n35dCWLwzjQCCqkz64F9jozc879Qt86Z6dajYODYIzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850722; v=1; x=1796455522;
 b=v93gqFUrcY4yYIRJte+8b0qEVhBbNpymfES5xb2JZt5fG1gwuJiydv/iAf+RfJz9Acme/lHO
 6tBbA18Hnbj7rqNEtR4ZiFMxM7EFXh85QF2gZfwb1cDbXuz4FZDiPLj/5gqpYVBJghzaFLm+7qt
 VpYWAEv80Zlfm4ktHbX12jRA=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 566add8d639687ed;
	Sat, 28 Nov 2026 07:25:21 +0000
X-Mizu-Trace-ID: 566add8d639687ed
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:53 +0800
Subject: [PATCH 8/9] arm64: dts: imx93-11x11-frdm: Correct PMIC interrupt
 type
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
Message-Id: <20261128-pca945-int-v1-8-f3fe2beb2b51@nxp.com>
References: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
In-Reply-To: <20261128-pca945-int-v1-0-f3fe2beb2b51@nxp.com>
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

From: Peng Fan <peng.fan@nxp.com>

The IRQ_B pin of the PCA9451A PMIC is an active-low open-drain output.
It is pulled low when an unmasked interrupt status bit changes and is
released high only after the processor reads the INT1 register, so the
interrupt must be described as level-low instead of edge-triggered.

This matches the IRQF_TRIGGER_LOW flag requested by the pca9450 driver
since commit 5d0efaf47ee9 ("regulator: pca9450: Correct interrupt type").

Fixes: eb2f28413e23 ("arm64: dts: freescale: add support for NXP i.MX93 FRDM")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
index 33ed26aafde8..d82b0245402d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
@@ -215,7 +215,7 @@ pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
 		interrupt-parent = <&pcal6524>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 

-- 
2.56.0

