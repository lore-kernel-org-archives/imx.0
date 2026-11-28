Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850690;
	b=HAaXVmOcUokuOI5VNz3WoL4ZxHBSaS3TPj8Bw5oYv31rFhQ6zGwGmjQT3g0YzltDStD1
	 1uGCtSnQ+tJaCuFRpG10ikIDjs1rNfE7m6NAVXsgF1AMHbZ4wDAl4D2oklAgnRAAy1OVr
	 QRUG6Ofu09OAo/yh6AyUWT8gQ3aOli6HSuAhVnS2srBDLZwE8kw3/HXbROQt/dtAGBqaD
	 Xnk4vj6+w6UciO8u41o2pMg5tsGEHxIEeOymkco6AM5Ecl3/9xzlbyprhSMmum8jYe7fk
	 ynkM7+klQUOXX6AhZJ/C4M2w4/dVsD+FsWKqX51Vx1JUOyQWCm0Tat3+IrC0d3JUDxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850690;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=m9fa2exuhZJnSV10yjznSXcpf3pZyPVUg4CzTIKbXCA=;
	b=zL+kc1Zo/Gqw/Y0SREEEI83dVi7dFq7HbHRGThbMP2/R+S5eK6Xwi9HbXFF/1wLu/SMc
	 Lk6SuGN5tvprgjdN7PRQqPT4JaEMSXKN2d7AVEKR4rgXVMLBQ15jcimGBNaSomOu+YrWU
	 /yZclZaqZdzoLeJ7pN7yB7oR7jptPQnWldPkO4LffWca7MriDC0KV07aI1ckJLXIY4P+B
	 KVofdiuyNAgKfWRLOUra31BPneztU+XAWgjdtqvuggTIVsmKRdekXu3pnO3lPCYBAJH68
	 wHDmt+VQWykzCVwOfAukNnZ3voJe19PDzHoKIDs95AafKyd3uSX56RkTOerAXGWCuGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HxixjfgN;
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C9C606A31F
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 07:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C9C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HxixjfgN
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=4izvpiXaUinTD/T9W7e+P6mbpAwZ12sSjFVOLJZRREI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795850687; v=1; x=1796455487;
 b=HxixjfgNK1XmHLdBj8abDpY+pAUfqNRRd8gE6ldoJQpfaO3luL8z6nUwcCaqfF0pEA4L9fSM
 BfcxAMa8mDncuLSPYUd47o0Og/H26wTwDa5WYrKTtypVUPZGMq7MDA63i6FTa/KZkf/1iZUejbJ
 Lb+ZcBkwRu+9IwK4K9MFccr8=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0bb40b1e9401e879;
	Sat, 28 Nov 2026 07:24:47 +0000
X-Mizu-Trace-ID: 0bb40b1e9401e879
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 28 Nov 2026 15:23:50 +0800
Subject: [PATCH 5/9] arm64: dts: imx91-11x11-frdm: Correct PMIC interrupt
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
Message-Id: <20261128-pca945-int-v1-5-f3fe2beb2b51@nxp.com>
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

Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
index 6144fa6f3706..a062cbf6824c 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
@@ -319,7 +319,7 @@ pcal6524: gpio@22 {
 	pmic@25 {
 		compatible = "nxp,pca9451a";
 		reg = <0x25>;
-		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-parent = <&pcal6524>;
 		bootph-pre-ram;
 		bootph-some-ram;

-- 
2.56.0

