Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A98322C77
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 18:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767120107; cv=none; b=SAbA/geFgiVFWUMozT7B8iHOTx/IjnSkK+YbYXgjmb5QCv1PIt6VGXbbRboUA1qyOoHxChKs/xLFAtZwUEHgGtujGeIjOPzMgmOpFf6B723PT1fFLY1thgT8k6B7fmXinZYTvThFz5wePoG/X2wCCc3HkKiR7iqqUX1F59iZvEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767120107; c=relaxed/simple;
	bh=q90ZacewWb5DiHjB/r7cstHAmdt0bC5rCaMxz1r3Ygo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZzXcXGqRDK6GSNiyVvZojDbq26cmR08Z943oCWYEWZ7NhFaZg+mBhkCUm5NSSggBAZsCYft0UTqZI0GA+u/Y8gys0NGnERJCsg6EuVPxRkCuwIOZVhmG8q9tPseeE4sW9HPoYoDr02St/d+HkFf4tblZIKx1RoAsbZvBZxvyKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=fh9Ady+C; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="fh9Ady+C"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B414510CE65;
	Tue, 30 Dec 2025 19:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767120102; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fdohV05PWrCvEVOmrgoFb/WVa7Mf6GVZF7Ugyjl2xAk=;
	b=fh9Ady+CYoQ2sdHwUv11wDbZ5YMu0KL90PJTb/p1j44FGmWIfxqetM8dvGd/Ksp6kjHPGx
	tA9Irk0uAyTU4xmMaNMg+sJ7XyVDdNfKmQFuvmXKUv+33VEGXldndn84+femzcFyv813A1
	ob5cGM+S1aH1LGb9RbcNAHB1MGfVJqtDF71EytN6juDsmtkxgGBMzWPq2ap/GRCY//qAqs
	Ey/dynWO/4u8y3T1bsDrxUI4t2LojwROeh6UBPjfII1t/jigiiU+Ly9Dz55znECMUwDKgU
	AJPjORGGHmNQMk6gmUkcFne0FRaX8WVdowM7s/7VkRXWdiGK1598LB8g3vPk2w==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: arm: fsl: Document ifm VHIP4 EvalBoard v1 and v2
Date: Tue, 30 Dec 2025 19:40:59 +0100
Message-ID: <20251230184121.52635-2-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251230184121.52635-1-marex@nabladev.com>
References: <20251230184121.52635-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document ifm i.MX8MN VHIP4 EvalBoard v1 and v2 reference design binding.
This system exists in two generations, v1 and v2, which share a lot of
commonality. The boards come with either single gigabit ethernet or an
KSZ8794 fast-ethernet switch, boot from eMMC, and offer CAN interfaces
via Microchip MCP25xx SPI CAN controllers, UART, and USB host. The GPU
is not available in the SoC populated on these devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Add AB from Rob
V3: No change
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43b..4d0aee780bcb2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1071,6 +1071,15 @@ properties:
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
           - const: fsl,imx8mn
 
+      - description: ifm i.MX8MN VHIP4 based boards
+        items:
+          - enum:
+              - ifm,imx8mn-vhip4-evalboard-v1
+              - ifm,imx8mn-vhip4-evalboard-v2
+          - const: ifm,imx8mn-vhip4-evalboard
+          - const: ifm,imx8mn-vhip4
+          - const: fsl,imx8mn
+
       - description: Variscite VAR-SOM-MX8MN based boards
         items:
           - enum:
-- 
2.51.0

