Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850711;
	b=XoBLmEADD87v4Kv0D0eEBII/+xZXlji9b+nHqc62IdvO4Snl+Xr4hyxGO64bRRUnQ4dv
	 3jEzDJidmI0Y8K2G1ldRlV40oTZbDzb0yar5PaU8y7tDuD/1kAAsuKhBk8N7J/VQ1UjGf
	 NZxtR8KkYFHXn/zC5G64rCHXXJI53VklG+MqXOik5YZjPa1YtEnH4WGaRZPGPLGajHwE3
	 F4TRdzcmdxH8fPj7W2mco7oEQjoCSvg0E1bQaEB1o1y3xdjKD328xWlD1caD9yKEjq7y/
	 8zT4Awt7L8Hrz87/7YS2jfoXdf2gv8ydcxqTb56GfVzT819p+6BpVlW3Q/lPDU8Ic6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850711;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=LsnlZ0iyv3XS+uA7w6ihOq25N3FOmWPOkw2a2GWEnbI=;
	b=HYePQ8g4Yw1PEIaRhs0cGmsu3ottPwK2lfLOmMJJ8nzhGqr9E5CuMiz4aNCXBPOUfdGb
	 rh2MdQj8C3vlzbMRsuKcmndgyupjUyCTHDm6IoB+rp9S7Ds/HtwQdnhXLWmvefmvXyfys
	 0eYW7bM3FehhHdKgXjBCpcqAInkjvSSMByQH+qdqGGvQmk63r4/QeHzV33nCGob4HD9IP
	 5ESm5ImeTUBBUokyP6W6q++Yw9KuCRAa0aLTyOyJtO67sjPP5gOCFdvcGg3M/DKyd/771
	 R+FSgsob920w8kfH3FQ/qArj7e1BxdRGuAV65kA9KW9X+oiXOLSR9y28fddoInp+R2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GBrK80u1;
	arc=none smtp.remote-ip=95.215.58.49
Received: from mta1.migadu.com (out-49.mta1.migadu.com [95.215.58.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2202606A31F
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 07:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2202606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GBrK80u1
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=R57eshxEcjKbYip9m8NirRQlmxLbqbpe/5gJMQp17mY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850708; v=1; x=1796455508;
 b=GBrK80u1NJ1V/J1JgGAuBIjw5Tm3edBGwz5aRy92xJrt7271FwuUqmvXdY4sk3JMqlPmNbEi
 Qo6Jd0d+muR0QolwcRC8mIWSFZMq595Ac+dGyIs9OjyZuN+hUtSZplDpOwhmBM2iXhbj/JjCVxh
 xMfb5ZGhksVZZXv9UmhDC+dc=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 70c3678ce507cdd9;
	Sat, 28 Nov 2026 07:25:07 +0000
X-Mizu-Trace-ID: 70c3678ce507cdd9
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:52 +0800
Subject: [PATCH 7/9] arm64: dts: imx93-11x11-evk: Correct PMIC interrupt
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
Message-Id: <20261128-pca945-int-v1-7-f3fe2beb2b51@nxp.com>
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

Fixes: 54c7a04ea3af ("arm64: dts: imx93-11x11-evk: add pca9451a support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
index 164b5c17bfe1..33022298b9cc 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
@@ -287,7 +287,7 @@ pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
 		interrupt-parent = <&pcal6524>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			buck1: BUCK1 {

-- 
2.56.0

