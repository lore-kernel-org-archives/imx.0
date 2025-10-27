Received: from mx-relay170-hz1.antispameurope.com (mx-relay170-hz1.antispameurope.com [94.100.132.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB32F2F99BD
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761563168; cv=pass; b=q0UZNuUOw9421A5kkk2ue6T8RBb3bqRviNN7AzBNsvv+YiG8c2OZ/AC/KpPWzWtKgeprUzhfNGWV3rvJBAW1Il5q2eenMdkS0Ub9DO4h/8UfYs7I2xUQtu7DD+Fq/YSm3IJN97evX3cEOGxbdiESr1d0Oi9oUVqlSrsz7mhpmZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761563168; c=relaxed/simple;
	bh=YZGQd8jI9Vellkzt/s6sS4bgFKhEBKH1fIQjG2qUnFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rSDNGefN4xgzDAbI4YJ5j4vyaORVDAVk/1zbApG2g3JWGH2GYpFT1z0CN1ROUqgT5xVgxJl1aXIFwGvrt3fz8wrDIKEh0CQbTZ3aXpV8ZtFWGzvsnwoWIN4c0x0bynFuohuqgdPdAu07DQmew0ZrqT51Eq2U8Jxhw+UpKkC2yY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oPfkdECx; arc=pass smtp.client-ip=94.100.132.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oPfkdECx"
ARC-Authentication-Results: i=1; mx-gate170-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=87X5R6vjtDdJY60KYPFY+Q7PYLNtQIh/pXfTLhBqd68=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761563125;
 b=Qh3QYsITGolYJwAHG0FZZn1wQGI+a+j6UxrwTDSz5d8cI0nSUORjn4vzKwCbI8lNzY50OivN
 GgJ5vDbf0RqBcamPCTf0teQ1rGpC2GPIW+KAfD0/dfUw1TRHadUuj1IM5ePeb+9Efcaa12WU4qD
 GfcxsS8zRh+lGBjoE8x7q3PytAQXNW94scw8ak34KSo1lCOUL9TZxmM0jlUrMrjE+Wen8pJS3Lc
 3Vi00EpopZaaLvTuYqrh3ls65Yr16U3yrT2cVDvxmJzYLxZFIcrg6ZHMGl6Z1NVc0ItvZWmnwRU
 eZqvLNn6e+LN2rLdoTbGRuuwS1uOPTzPz2+6qzKytY/4Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761563125;
 b=qJy6mvpOvFXAPOqY/6o/pC5mB/Ynnh+uxcbjKmikE78CsWA3UtCZUvtnDe/+rTgbGNwalJYe
 V527CH8ngCOPPDRSFRcvi+b3GmztuMiBKPaXgxmyxEZS6eTzqSp56IdFaB1dUilsBQCBlBm4U5b
 5uLebL3c8WMtvWhEOLLi3eDetDQtExdmUvZ10jjyNL8zqkMTLSWrTgsjiZxnQJO8WoWptuPWibY
 dOEVSYNxCjmA065azo7YHFrJ2QYI+YfvazUnMnvhB2VJp115LA7Msln42ZoQYVsh9qXA+dGjWCa
 uuLbcxoorY09f3AfhyYopOf5zIZ20AoJB46SwfBj1dNiA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay170-hz1.antispameurope.com;
 Mon, 27 Oct 2025 12:05:24 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5FCB6A4127F;
	Mon, 27 Oct 2025 12:05:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND
Date: Mon, 27 Oct 2025 12:04:55 +0100
Message-ID: <20251027110459.420857-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay170-hz1.antispameurope.com with 4cw9dg19t5z3WpYc
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f3fe413255b5fec6c4a2399235bbca65
X-cloud-security:scantime:2.082
DKIM-Signature: a=rsa-sha256;
 bh=87X5R6vjtDdJY60KYPFY+Q7PYLNtQIh/pXfTLhBqd68=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761563124; v=1;
 b=oPfkdECxGG4Erk+3NBMiFt0bn/5qHCrJta1NYHG55MgbjiBs9dDQVFqgu7CbbrckY2ltlpmN
 x5q76hxTLwYBHRmsZuqygVQOcApu41aMy1E2i2n7dbgMJ1CX4Xj9ivDPlfz3GPs+eBQCrg+L8AW
 zW+adtp3kA63vwA0IhKbFMoZHK+v3PnT3OqgZOTvML/VmdmhulY/cJLTjCBZOCSzHEf0yftED1+
 QWbOvdsugdwjgD3MmU0CGkpXdNBe6+3rhdE9Jg8exL7Chwv7DutBLkourkgaf+/TNqZhFsNAUIj
 UnaDcPSa91PNl20wEXcwULEo8QkyETUEkZId1IwijoqtA==

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
Layerscape LS1028A.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Add Frank's R-b

Changes in v2:
* Fix indentation

 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c5d81e3f8bd17..fbffb1a536ba3 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1656,6 +1656,15 @@ properties:
           - const: kontron,sl28
           - const: fsl,ls1028a
 
+      - description:
+          TQ-Systems TQMLS1028A SoM on MBLS1028A/MBLS1028A-IND board
+        items:
+          - enum:
+              - tq,ls1028a-tqmls1028a-mbls1028a
+              - tq,ls1028a-tqmls1028a-mbls1028a-ind
+          - const: tq,ls1028a-tqmls1028a
+          - const: fsl,ls1028a
+
       - description: LS1043A based Boards
         items:
           - enum:
-- 
2.43.0

