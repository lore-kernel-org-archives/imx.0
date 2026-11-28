Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850667;
	b=47hq3PLWO4q+kc0q3EXPWznZOo+/PZtyoeb3qb7lBhn4QOXyKfzIgSG/EbP/8wX/Jgv7
	 oMJ/pAd8S1Uh27PQZemt6NtpDmQzgcE5+C5atzY2o95Mwkrez7Sg6kH1BEZRCgefdPGgp
	 pPF/gdvVxMnvc8QKG/a8JroHq2sJs0mJXi/eMeuSLnkg2T+0uqavejj8Rd/80wsH75OZv
	 LZyzYP89+lIMiyYlMbM1pHMyrZvLyfVB5ImA4Tyd1SVJ7gCBmFUFzhewS8r35wZqEF1i0
	 MyaVHc8kcOPVCw/1pWRLm1M88GHIqKjHfrVvKnEOHr2iEBsE6Hqk+qbdtPPxtDaJmUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850667;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=aUaqP2SF55Si+vFkyZYV4iUXDbIn8uDcMBRei5iJXLE=;
	b=JHZ3W0qnVmLQXXdvhx5Bk9UXrDUH+S5VcMJmKZWdFRZ/bHKM3BWlyZ3djc/u5rVpPJ8h
	 7wkf9cxRtJwWEqxvf1asERUTZIEiQ6ks6e6zY5hTtTfTW0S1FviQTNvYRJWUOxCR30LFO
	 o/jS4JVvNQrlkHdPy2lVW0GfP+nT7PJR3G3zxuywOiFVoEzy/h0m03bHK422CSOYrijgb
	 WtNExLQAu8MBrw4t/w9BofGDPp+3iUkZjXvBBgfcrOzHYXShzMVWlE2qpDKWXZTO1IBOG
	 zgMNDiVdc6dRmCvoZSwptsMwJDYvyuk/gKizxcqtEGAj2ZRUKsGyoIi7TPcFJuWacpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qHrzGy1X;
	arc=none smtp.remote-ip=95.215.58.33
Received: from mta1.migadu.com (out-33.mta1.migadu.com [95.215.58.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847C606A31C
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 07:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4847C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qHrzGy1X
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=rVKYX39Z6yW1r3iIoDnclL3hTIIXUWWEoMd8DX4hGhQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850665; v=1; x=1796455465;
 b=qHrzGy1XzB+T/YRLF6pEZXonBxu9j+A56huAWqtWf3ejXp0Px+l4QVyr9LHQdQV5Gs4cACDp
 v7EAWGdd75XEpQaiVlR8P/8H495GJeDURfaYngRio2TFcIcpXwfT+nfeEJuyOE+lt+LPumCBw5t
 4CplT59BLoala/eloX1pXBuM=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e39fe85fcfd2c4c8;
	Sat, 28 Nov 2026 07:24:25 +0000
X-Mizu-Trace-ID: e39fe85fcfd2c4c8
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:48 +0800
Subject: [PATCH 3/9] arm64: dts: imx8mp-tx8p-ml81: Correct PMIC interrupt
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
Message-Id: <20261128-pca945-int-v1-3-f3fe2beb2b51@nxp.com>
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

The IRQ_B pin of the PCA9450 PMIC is an active-low open-drain output.
It is pulled low when an unmasked interrupt status bit changes and is
released high only after the processor reads the INT1 register, so the
interrupt must be described as level-low instead of edge-triggered.

This matches the IRQF_TRIGGER_LOW flag requested by the pca9450 driver
since commit 5d0efaf47ee9 ("regulator: pca9450: Correct interrupt type").

Fixes: bac63d7c5f46 ("arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
index bf49ae942d41..4f5cc73a833b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
@@ -268,7 +268,7 @@ pmic@25 {
 		compatible = "nxp,pca9450c";
 		reg = <0x25>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&pinctrl_pmic>;
 		pinctrl-names = "default";
 

-- 
2.56.0

