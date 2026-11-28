Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850649;
	b=Ex+iZj2TG0frZN9Qw2t+ukhRMc4SSRmF5WWO2S+pVT38DxYBDlyNhYlw3idtroH6z+Ia
	 A72IQlIWa53Eppeig1WtaXlyGtkhT/GGlfIokPUnh7xpANVipRVAyA1KHSAF0HFSaviBB
	 adnZWbopuMvaXkapY9g9Oyc69mufoMZ7htXnwwJOL437BXGFtPIitpZHifYPhJd0topJy
	 LYG1p4+AoGAuxFgo1bnZxU+CSAyU53nLnpow1oziAlNCaGsu1PN55gVk9o124e5V1kKEN
	 yVvqUpaYZzuC42C46IbuDDaXGC3EZb4iSUZ1sxoYMEuunCkkvntBY2SSy1lH9ideB7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850649;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=3dD30kkDq+twXvmPdRGbIYvvHT+vV41N3PnWvxsqQh0=;
	b=OFoAoy2Bz0ecVzOFa0slAxlWmqok9nFNZBO5nFDtDku0R7xC7fmh9LyBOCyGB2nqwRtQ
	 gWoSJq6kuj1Y3a/a/kkd5pKS1kMEVxk68IeNdHf0fV9/PxSQAO7I+h0Tt5HUU29vLDQnO
	 VYbmSZCnxy09fXeGxWHcY2VUxXfdOg0aKR1/y/5d9KTKaujEnGaI+7sn14gUFVv9nwWAT
	 iRafDOsCfbfBRal1h6YTJrQvwbOlpQkQIkmKVoaNyJVaTJTUK8AEYzOlPZoxxdU/G6pvp
	 MSUIt8c238rOYY8932es4uHnNQ7r1lsrM9UgZHctAyuVVq0FyBngy5RbRKRPMlv3K/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EPQlQYgD;
	arc=none smtp.remote-ip=95.215.58.27
Received: from mta1.migadu.com (out-27.mta1.migadu.com [95.215.58.27])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F174606A31C
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 07:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F174606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EPQlQYgD
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=eaVBVC8MLtVKTzsFu2ZH4BwVLKqluakkDvqjSBNObiQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850646; v=1; x=1796455446;
 b=EPQlQYgD6Hyo/p6oalXsixk3UyKEk0x7ISyTQtVfL0+3PgHg2wKOqcV9PKQ8SDWKcnWoZ136
 spO9Gt6gsl5IEnhrU8NKWbiDdYsU67bCsMKPUmp2mNvSY9zNwc7umlo1Ki4KFsZlmQRpQKuXMhn
 AHhioTFO7jVv6fvXfvCj9uWA=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 02089df3548f31c9;
	Sat, 28 Nov 2026 07:24:06 +0000
X-Mizu-Trace-ID: 02089df3548f31c9
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:46 +0800
Subject: [PATCH 1/9] arm64: dts: imx8mp-debix-model-a: Correct PMIC
 interrupt type
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
Message-Id: <20261128-pca945-int-v1-1-f3fe2beb2b51@nxp.com>
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

Fixes: c86d350aae68 ("arm64: dts: Add device tree for the Debix Model A Board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 201cf7f5eb0e..e756994f0b68 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -140,7 +140,7 @@ pmic@25 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			buck1: BUCK1 {

-- 
2.56.0

