Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEADC13C3D2
	for <imx@lists.linux.dev>; Fri, 26 Apr 2024 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714117297; cv=none; b=jMB0Cd6z3MqDos6teRcJCdXUyGPJEhQ7RIfNKD4dcPOR/kv2Y90MryRzBlhVVelAsax6uu94vQjilri8FCJxGUHRcn57k6olo7lixMUGkrP3IiHgPpixvNPYm9LRQxcJhwhmaPAZq80hGwxxIL1E4S/77TAR2U/6M+sDh/srgKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714117297; c=relaxed/simple;
	bh=zYKq99FX6bSTj9flwcYNc4uocVSd8mkKIJiOpYzrO5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VCg0q0wWD20GtQCEv1ja75x6bF1+Bnb4BHhZ64mpWbi0F5UubsPm29uaqMYL14KsyzgteRW4RK4cFdZ7IbfKmX3ATg6EnPy54l9tH4XmlMbt/oHokU8TG72X74mvmJgtUvBn1BZXzKdDwBTY+TOpFYu66C3CCfQlwf6fzfAeQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engicam.com; spf=pass smtp.mailfrom=engicam.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=XwPh2Rxt; arc=none smtp.client-ip=62.149.156.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engicam.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engicam.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="XwPh2Rxt"
Received: from engicam.com ([146.241.21.121])
	by Aruba Outgoing Smtp  with ESMTPSA
	id 0GA2s5OJj7AmW0GA3sQ98F; Fri, 26 Apr 2024 09:38:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1714117104; bh=zYKq99FX6bSTj9flwcYNc4uocVSd8mkKIJiOpYzrO5s=;
	h=From:To:Subject:Date:MIME-Version;
	b=XwPh2RxtobdkhytyxoFlx7+wG7w1xaDzwQUi8tbLXjjuA646s9fCR1U+Xt60TJMix
	 S67wcI9kMs6XevjQ8IJztsPWAuPgbIdltScFhb2tLMC2mWLiLEwu68ZFvhMhPPGx5R
	 1gOfoD/0dlNixcvPyrGF6XlSS5EPpLzgAnYN87jBadf5jNl6TzZppU55DpTh9NVzo9
	 Nt6foj+74tldvaJzCqprEn0YERafPmZBQOyMEHG62zDOaOlkhocNehvYNJFe5+Hxyj
	 wy4toDQR8oumUScynf6ZF/Q4sVHaQVXpx1ZFEOjTbIh9Ln/jkSFx1thSfjGVadJxB7
	 TQSZNgN20Cx6w==
From: Fabio Aiuto <fabio.aiuto@engicam.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabio.aiuto@engicam.com>,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Mirko Ardinghi <mirko.ardinghi@engicam.com>,
	Krzysztof Kozlowsky <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Engicam i.Core MX93 EDIMM 2.0 Starter Kit
Date: Fri, 26 Apr 2024 09:38:18 +0200
Message-Id: <20240426073820.6466-2-fabio.aiuto@engicam.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426073820.6466-1-fabio.aiuto@engicam.com>
References: <20240426073820.6466-1-fabio.aiuto@engicam.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfD1XcedmZ1mUcGuYT6SmwH4d5NUx70sNmxpClv0ZEsrpcXJwE5/V5XJ65U4m3Wo5CGVMP57dboTrxa4xIqCoFj+iHOPhd6jve9AP9Gn+bLeOnltCTa9e
 f2GLjaOKvS6cqaY8uDGIo2dZbPur0+pJLAByt7G4Y32eZHPDmG6chNQqk0E4W+bQZneZSbjsVYnv26RLRoe4jJ9xVi7n9HPTCMRSj/qxCnozTXDin/YC8+yY
 F3Bm6dBLdIxbE0PMLvSWp92i7S7sGpF8N48LRZ6raGXWn9nkJ1vhZzojC9NViHtFeBmqylE9YB/gV8n9sIxroTXCAKG4UUOdLKr2Wp8cR8CPAKSSCnuqW2i3
 +vZ89/FPr+0iHBs9IkwSgUvuboSFGHruIsYeL0fK9dug/RIeMbn/ZbxVT7UcrAxfy62YfqmvoNeKXiR9cf5XJ4+I+iTWRC+I4/JMFp2AMnb3X14yjq4s0OQN
 t5NgCDIZBKDzbrRMvvgu9AgOdd8Ciq+TEkTjaD+CQfQeVLJWLwbqrdMQLrZasQksdetbAGscj/y2HGUl3lnp8DiSCy4Eyx8pIjhHkppEB6/EZJJ/ckitH2f1
 X5sdFx+0IwHjujKlIGB83bvVl5r2Fzx/sETBRYIav0DuQb9oyeukS3EGbcp0Uc/yNLf6aan6F4Z2PjRIh5MArkb1

i.Core MX93 is a NXP i.MX93 based EDIMM SoM by Engicam.

EDIMM 2.0 Starter Kit is an EDIMM 2.0 Form Factor Capacitive
Evaluation Board by Engicam.

i.Core MX93 needs to be mounted on top of EDIMM 2.0 Starter Kit
to get the full i.Core MX93 EDIMM 2.0 Starter Kit board.

Add bindings for this board.

Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Mirko Ardinghi <mirko.ardinghi@engicam.com>
Reviewed-by: Krzysztof Kozlowsky <krzk@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Fabio Aiuto <fabio.aiuto@engicam.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0027201e19f8..b497a01c7418 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1265,6 +1265,13 @@ properties:
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
           - const: fsl,imx93
 
+      - description: Engicam i.Core MX93 based Boards
+        items:
+          - enum:
+              - engicam,icore-mx93-edimm2         # i.MX93 Engicam i.Core MX93 EDIMM 2.0 Starter Kit
+          - const: engicam,icore-mx93             # i.MX93 Engicam i.Core MX93 Som
+          - const: fsl,imx93
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.34.1

