Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876E3431F5
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 03:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768535135; cv=none; b=a2Xunj45RTU7X54J5f8V0PfhOI+iYf0Enfeut6iDekwWjm8clrL9GH+teS1lsoh/5G+NAMTTZl+Bqn8JxTqaSoNyB8A3+B+O860OcTLSV+NYs0+GRVQPr3ETp9cL/Vs+AzRZ3lZ62uGzIS6n+hvQCd3Khh2G19tAOcrSWEj13nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768535135; c=relaxed/simple;
	bh=eudUAc/K1rTdFktGK/atIBQW2r4DMgQVY68CSCwnKZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F30HcvMX4bBjpOkLzAt4ipvk1R5btLdYx2GqLBu7N3517yx8Lr2lWYBh6GEIeRSAY3C7YVLZ4bTeRTsNqkb+xMfJYqBq3MKW1y+FbctqdT7UhpgIXwijQ3jaQQysRXKShdfeIgRV3piZg7jPh5LIhnPcQWKdgr/bwwCzW1MaK78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 187BD200C09;
	Fri, 16 Jan 2026 04:45:32 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D6A13200C20;
	Fri, 16 Jan 2026 04:45:31 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D52F31800244;
	Fri, 16 Jan 2026 11:45:29 +0800 (+08)
From: Yanan Yang <yanan.yang@nxp.com>
Date: Fri, 16 Jan 2026 12:45:13 +0900
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-imx91s-frdm-v3-1-98671de64925@nxp.com>
References: <20260116-imx91s-frdm-v3-0-98671de64925@nxp.com>
In-Reply-To: <20260116-imx91s-frdm-v3-0-98671de64925@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 yanan.yang@nxp.com, qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768535127; l=1403;
 i=yanan.yang@nxp.com; s=20251205; h=from:subject:message-id;
 bh=eudUAc/K1rTdFktGK/atIBQW2r4DMgQVY68CSCwnKZE=;
 b=T17pCqEJfq8jOsOtsh3KtuVDuUihoK3M9E0wnWwaMcJ6m7ccbVGHt39jxdWLiIqqUcWMn9LdD
 ZdhllygBlZxAot4t9znRkSZPsECbufVB6Bq43EuFKWBEj/kz2NS7xuI
X-Developer-Key: i=yanan.yang@nxp.com; a=ed25519;
 pk=d4hHTp5SW/PyyxexLEo/3c2RAaQDwym0zuYlifH95PI=
X-Virus-Scanned: ClamAV using ClamSMTP

Add DT compatible string for NXP FRDM-IMX91S board

The FRDM-IMX91S is a low-cost, compact development board based on the
i.MX91 applications processor. It is a cost-optimized variant of the
FRDM-IMX91 board, with notable hardware differences requiring a separate
DTS:
- 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
- 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
- Single GbE port (FRDM-IMX91 has dual GbE)
- PMIC PF9453 (FRDM-IMX91 uses PCA9451A)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yanan Yang <yanan.yang@nxp.com>
---
Changes in v3:
- add code-review trailers

Changes in v2:
- Correct author name: removed extra period in "Yanan.Yang"
- Refined commit message to clarify board differences
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..82f28be401b8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1412,6 +1412,7 @@ properties:
         items:
           - enum:
               - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
+              - fsl,imx91-11x11-frdm-s    # FRDM-IMX91S Board
           - const: fsl,imx91
 
       - description: i.MX93 based Boards

-- 
2.43.0

