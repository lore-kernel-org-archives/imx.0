Received: from mx-relay98-hz2.antispameurope.com (mx-relay98-hz2.antispameurope.com [94.100.136.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421D5331A6D
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.198
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763031006; cv=pass; b=dXnyS+VH78pJNX6rZD3ydSYwe4YALt2CM09TMAIlKOWB4kou2Q54gyLj/BAu99JXH219Ydyb9D2F0C9CVWPWuNgcXq6/KQQDPM/+qD/zvqmvUu2lhEArnZ+AI8MVYqWJLenMrX/XV42se8PL7Ee1FcvWYfqMjlY7pehIvo/v6Vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763031006; c=relaxed/simple;
	bh=HLL0IAJP64dP85RN0m4fxffw6mQ9TrEM/iZVC1SJfQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVylgv8TrJCQhMIrqkxaS/ESmSjUgTiHwwv6ZfKB7bmARkX8Fatm1G+4D6sm52lyStRGOUS708oIdcIt23ymNdYRE2WKKjm3ZSyUtY4hlyG/dz1p4HMuiMyOgnP6JooF9iyGjmiAame2AF3m8lLXtvejmBuZq4nDqBQ+zhWTQHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GHQM2M6C; arc=pass smtp.client-ip=94.100.136.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GHQM2M6C"
ARC-Authentication-Results: i=1; mx-gate98-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=20x6bk/6ulOfgyNrjZnFw6yDdlvk5X5c9JtUmQUUw5I=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763030954;
 b=iuNrO3quRsUORjs2f04Gw3pjRg13UPv70woSqIiy4oe9DpTjvV4Z9Xsq1lwdJ+hm2FHYG3Mh
 Kv13NNfwcFfBf+NvczCTlwf3ri495bXYF5livqGIQhSuyoVV51ebrpfU+K3apAWJhpjWTCTVdwh
 XOi1E5lSMfyf6sQH+UN++Efut5ADH6ZUCzaZrdeJ8V5CRFovWyl22u0A4RyGuHrHueGynQRAQQs
 0Bp4ACnXCr5ajpy9U/eLyHjgkpKn2bR/rqsuiTPB1Jh80sQwJyC0hPEzb6T1qnFA5kFxYq7HwjF
 Osxj5Lc3H8kG/7190zd3e7Bzbr+wexz7QIEta4v6Z3t8Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763030954;
 b=A6RSXlI8TFKdF3bGNMjPOFsvj3k4jpSIfMiVTQ2M0CQbc/RrQ7maUB978xMJzsmMMnT1+XhY
 xoTe0XQl0NTZeBj4NEU1qweA+/dx9Jc5jy0DzxsRijj/ew9FkUZDNZCSZJf2dTxr0Yk4y27FRqY
 0Ac0DiSq7FaBHfI+MfCvDzEI8YEwj0LaOSeGPHBZ6Yaz7+JWtRzc2kjqbN9yLbWjKDKPf5D3uQE
 wLOByaNA/1x/UUga9hB+IiEsrCYqFn3fcJSHeIqc5JZZt4oC39C6EOJQ3rG6shAM9Buwu0UwEyy
 LV7VJWUohikH/uLb5cExz/n0wcFlIUysRYCXuychPxlJg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay98-hz2.antispameurope.com;
 Thu, 13 Nov 2025 11:49:14 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3838D5A0ED4;
	Thu, 13 Nov 2025 11:49:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: mba8mx: Add MicIn routing
Date: Thu, 13 Nov 2025 11:48:54 +0100
Message-ID: <20251113104859.1354420-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay98-hz2.antispameurope.com with 4d6cTD74cSzJT7J
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:572a54ff1f0833590d00b461732b97c6
X-cloud-security:scantime:2.040
DKIM-Signature: a=rsa-sha256;
 bh=20x6bk/6ulOfgyNrjZnFw6yDdlvk5X5c9JtUmQUUw5I=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763030954; v=1;
 b=GHQM2M6CVCZPqHehgj3UtkaciE5rhx6Gu3pxrB3211AhnY+r6i2tozb3lC/CqHGuCDG73IVf
 cCqQSEQiEnjDGY1Brrnl++EkMgbIU8odAIohqR2wvjXtCh5Tf4goIeAgc7q8rPYi0vd1t96E7YG
 /e6mq0txrMeqIwTq/lT5xDkkqnoKbiAxGMjBNZwUENR/6Yat++t0Sv7ww34AKWsoBu/M02ymm32
 XV8o5YRdqs817w35xX1LgdNLAgaZgNXlNQwpFtbcOFhOs4iHarRVLrnKwA4AQUI5VhMSinnx/M2
 R7o/d3AT8ROmBB/tvV9QJ3Cp1uL5VRWK/aJnXKpamdurg==

MicIn is connected to IN3_L. Add routing including the Mic Bias.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 79daba930ad64..225cd2f1220bf 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -141,6 +141,13 @@ sound: sound {
 		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
 	};
 };
 
-- 
2.43.0

