Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850680;
	b=cA8G2Xv13/9zCXQGW+akhwBwHDqjggjUIbPBD6QNaQXvWq5ji0x9WwlQMHf8osVYFfGt
	 5eqiIH08MKt0mhd5ckbRgudy0R9v+t7pnmiLbMRizRnGBB0gE6EB6W7CmAiSVUstRIjV4
	 YRuOrCiPbvxe85Gxa86EpW7u/qgSNeygWbbpW4CmvRqOwPyEU1kIVSVAeGnnSZPBoBnt+
	 TchB+YazGmA9j4ymnaT6/XWjYLhgw5s+Oi1LXuS29qmeXQHhB6NDE2pvh+CocplYnmZQL
	 w5c6p1igN85MpUL8t37OtlBexAg4drl0NorYxGjA6gfChRvncDQ0gDlX4WRjERcfbMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850680;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=3SUtTLC1soRDDz6/4e6GIxm8BK2GH1tVXHrXabtckwc=;
	b=36R97KFBYfxVSK8Tut44udMgSGwrhx8zk+AetfrAOk+Id3EmAHGe1+xJZvLGTYzY3U7q
	 podAPdpqPyAJWISXFAI+L4Bg0CQpER7Fl0rnEcQxO4588XadQ2QYLsXBRLDvJ7PxjGcp9
	 vHDUfoRflZWnNw0FXwfSIHBJyXst28oCfUIB4tw4YKgoW7iUnfz8KTRN7f5ccQrGjDFTU
	 sjoLBYwGXM216PRT5zlJHp1Pbpapl4JA++8Bw7BDf9Ll6N2t6451W332qYPahb6XaU+dt
	 3cLWqDRpAFt03NjgCZSGE5LsVxgJtOGUkhrGAl7QNUX4fY3mLwDl0L5GIZZ1/jPmoTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d2xfElwZ;
	arc=none smtp.remote-ip=95.215.58.37
Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F8606A31C
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 07:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d2xfElwZ
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=SlIIfsBH0x58YJWWrwjSs5tfIKEhQVlucr/vM3GSWRM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850677; v=1; x=1796455477;
 b=d2xfElwZJWVmqQyyP7hhtFaObYD65sI6e8eJUsTlM1DJothuqtkPLM9GU4MkpHwNKHMhRO9x
 YYXFCv/qc0udm8wUlzYvmk0aEofHRX5bZ9JRddoDIQpeNlpOu5uuNgWv3qRlnKuKCM1ybPxC8T/
 /tCpo57LULQBjm7BqtED8Vdo=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e999d6798d851358;
	Sat, 28 Nov 2026 07:24:37 +0000
X-Mizu-Trace-ID: e999d6798d851358
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:49 +0800
Subject: [PATCH 4/9] arm64: dts: imx91-11x11-evk: Correct PMIC interrupt
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
Message-Id: <20261128-pca945-int-v1-4-f3fe2beb2b51@nxp.com>
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

Fixes: 6772c4cffd87 ("arm64: dts: freescale: add i.MX91 11x11 EVK basic support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index d473c0890048..b178e3d4c3fc 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -337,7 +337,7 @@ m2-pcm-level-shifter-hog {
 	pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&pcal6524>;
 
 		regulators {

-- 
2.56.0

