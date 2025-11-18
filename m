Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B103161A5
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468141; cv=none; b=DCiu66TRlTTiD2eljweup3fEMHKyWn4k/8CXU+7FwGpkqRmGXixl96pZMxCr4+x+/lB+g20Kiipm1lRmVE81D0mBGVDwOQF5GbVYKHHUP5mPe9UQQ88EC4GXQCdY+L/x4epHT9AViXcICc/qXuuiSl5WJFF2hc6+F3/C64vOVCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468141; c=relaxed/simple;
	bh=xD5eO8zZTZ5QE7DIc4F5CtzX3FE0EsI+0LhUmv5CJ3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsIebkX3si+lfFVvUCQhfxNVLUGCdaetHCGMbOTGSwABygAP5f6z7IsTQdww6+wSfUU6q4ZuLa5VPVjo5km9q9H4nhagItCW9jd39IDy09CQ0aAELIWMQLj7JbnzOvx19SMtc6EvbI2XGmMsN5SVPiSnDOtfJkvlgLqFrPhXVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=GAPhR+cn; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="GAPhR+cn"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4487710A4A8;
	Tue, 18 Nov 2025 13:15:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1763468135; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=szk5tryMXW3LyEBOZGcjXu0tgh4kIq7mJsookjBWBB0=;
	b=GAPhR+cnAScOKWqNQNSvf0IS/OUKbsOdpskhLSgFLmqYdQa/ulxuS39Dpr0j9oc7UwBFyD
	npR4lzWHD9Gj/i4cq7i9nBwCGq8sEXN0AsuHa2xbA07ExD+OFv74isa3DMkNAM3KB/Mb/0
	87U9MV4TSekdDuZE24Aav08AHoemnFzI3AfcR0kvdi96rJuIUwRRbucXwjaKdG8R1eEO4H
	jEGfSRxnLqi6BbNITR7SDeMpyahJNO5RhawcrpSyeJrBNsIV0mxrCGf51uWfqjPyKJ7Naj
	QLsKrWw3GoaDJkt0QBzhix58BlW64w/pCtWtVf8iNXt8Q8if9MnyZaJPbVBgwg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: arm: fsl: Document ifm VHIP4 EvalBoard v1 and v2
Date: Tue, 18 Nov 2025 13:13:12 +0100
Message-ID: <20251118121513.88352-3-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118121513.88352-1-marex@nabladev.com>
References: <20251118121513.88352-1-marex@nabladev.com>
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

