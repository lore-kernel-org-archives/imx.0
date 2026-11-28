Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850699;
	b=w2oNEhEaLoIrDIBKVMWHxs3sPSMrl6Xh3pV0VwpOlQF7TM1YOLlEReGpzMvBliLqE+NF
	 1xHpDySJbJYDIYtLkje5MrVROceq7++UZ8CZa7ioSSSzoX3D0t2cDg61+PCLVxCc83ZWn
	 JEe8fdRth2NX467SpAQjw3Yhsl9hWc/XMJfNn/UkNtESFInVT/EbC14YFD/LlulRUe/OX
	 XzX6+Opdlq4KX224WSJUifA8/EFOqlphREuoTkSc4ZD8YQ2qcRowenXpwpUt1BJRUYwyW
	 sEt1sGUIUf6KQxFThKiIYxzl6owig02PesluJv0cYQ1UxBlFSSNP/72aKTI/dfT8hLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850699;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=9C9dX4evSAhQ019QmjUwHWMFJWgXHBxU5waU+tAC004=;
	b=E49h5Hcdf51wysEomceEpb4i1qsVjeI87UH2S3zynVZgwOtC8Oq4udfL7j7GkQJjWM6C
	 RShxly26Tnngdmui3SL/PUy62F+dR2nazc4kdpKn/ThkEp2aGkIijiJ1ihQ40XUbmWoT8
	 ISJ1r+2Y6Nn9jluG9KSOk8vkPoiB7rZwcBxUwuvCku1xG1zcoTRewmroQuBU0KDyHEZco
	 SpFQ1MQC5HgTR9VSgTgS8o6yhgM87kcNWHn/Ab0kKIUbzaOF+dYNKvE5h0Vd7QvOBM3eX
	 0sGAaivv7mZa60EOPlAhSeIiSW8FniLio9NUYcgPOssNmFvMFwV0ois0fo3/WlOQZtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZCVtMO6J;
	arc=none smtp.remote-ip=95.215.58.44
Received: from mta1.migadu.com (out-44.mta1.migadu.com [95.215.58.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55A1606A31C
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 07:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A55A1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZCVtMO6J
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=UiUN0z+BThY4o9gexjt6H4M7bFuG/ilhU2LuRtDlH9I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850696; v=1; x=1796455496;
 b=ZCVtMO6JYY8fGKfaI6QdugK5uXLo5r3BEMBJ9e22Fm3H1JEgPHCtJw129aSHfoE3T9UouLNF
 PKlwFrQDPjkZaDV8S00DlRwfL+MLEIVM19rRDnl6FE366hTw1kGSvGwEe5APyQv/b3APmwuE75Q
 LYvrsxggqnmMM32pxhYjeQVM=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 40061bb714d262a9;
	Sat, 28 Nov 2026 07:24:56 +0000
X-Mizu-Trace-ID: 40061bb714d262a9
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:51 +0800
Subject: [PATCH 6/9] arm64: dts: imx93-9x9-qsb: Correct PMIC interrupt type
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
Message-Id: <20261128-pca945-int-v1-6-f3fe2beb2b51@nxp.com>
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

Fixes: 0565d20cd8c2 ("arm64: dts: freescale: Support i.MX93 9x9 Quick Start Board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 8a97bc58ec37..d87f69e1dda9 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -371,7 +371,7 @@ pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
 		interrupt-parent = <&pcal6524>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			buck1: BUCK1 {

-- 
2.56.0

