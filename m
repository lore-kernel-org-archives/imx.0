Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096F73176E1
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770720496; cv=none; b=LcQV92TdiUOamoIRND3P0qvfadwFKva6+fzEfxj5Y2UmVkbkH0Lu+JF+sa4L7IY8aeyQ9ETmHq1b274CitrPSlppNrKI0DJMn4iRbFyYOZ/KA3i7ZV3xvRyOou45+npQwAlrmsEQ64kd7DEeZz01YXEbIH+gDap6pMo0GX7j5s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770720496; c=relaxed/simple;
	bh=rkq2K4vqf9hNirrFzUI1hw9VHIjNt2I3rTBNXNHNOfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W98pVFy+7PZ0gI93C/wysSO2qL3LXNDpNz/cC9Q0TgidkDRK6c4Mwur9PA0y2zPCXx9fnZ1y0cmetzzdpynz7J9mwoZLVBMC8dIUgNd1jWrMCIkwTMwS9xEy4BtFFRj/dSw+qq/VHXUlsAXBXODOBmckrmjdBR3Z7hmmbUGDBQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2990B200DA0;
	Tue, 10 Feb 2026 11:48:08 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E4FE5200D99;
	Tue, 10 Feb 2026 11:48:07 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D34491800079;
	Tue, 10 Feb 2026 18:48:05 +0800 (+08)
From: Yanan Yang <yanan.yang@nxp.com>
Date: Tue, 10 Feb 2026 19:47:54 +0900
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-imx91s-frdm-v5-1-b3e9a67d2285@nxp.com>
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
In-Reply-To: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 yanan.yang@nxp.com, qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770720483; l=1588;
 i=yanan.yang@nxp.com; s=20251205; h=from:subject:message-id;
 bh=rkq2K4vqf9hNirrFzUI1hw9VHIjNt2I3rTBNXNHNOfI=;
 b=ecOGkMrHM9s63kKB8aUGMzkTyPfikrmfU3MHGGbjGiPLW3vj77SHFAbgCL2WOn5MpPve4t+Qq
 AE8vGUuhLg6DAakwggKrLSxqB/5aRLbzI237iHyINWZBTXv1NA+tDkn
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
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Yanan Yang <yanan.yang@nxp.com>

---
Changes in v4:
- Rebase to latest linux-next tree

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
index 5716d701292c..3aeb81c43915 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1432,6 +1432,7 @@ properties:
           - enum:
               - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
               - fsl,imx91-11x11-frdm      # FRDM i.MX91 Development Board
+              - fsl,imx91-11x11-frdm-s    # FRDM i.MX91S Development Board
           - const: fsl,imx91
 
       - description: i.MX93 based Boards

-- 
2.43.0

