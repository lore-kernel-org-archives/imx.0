Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30033793AB
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821052; cv=none; b=E/E3I6lG/Xxm1kc+t2tWyFE5cL8ySnmUjLSBIBm4P87rXuUNs4erqrFVUnQvl+75+WP5Gu272kBOmSPZjghROHw+v57DYcRyNVXmoe/mx+/fxgH+/Wq4qDr30yxopUwtwigeoq5hHahZM8UcvFsTo5tQh2C2zLU0BLAmZSI5e0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821052; c=relaxed/simple;
	bh=OkNhGYKxsXIL01q2f6JRoPSEa1slCn/SvNtBwWjeuzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egC+8574naDTPECjBFoFei95OwigPfvRUWqnyD0kxGba+jpYgfAYDexXEqFYgZpGjAsHu2P3sjtuV5OLJyzHDzTMlfU/jIViyADSZvhbpcBrhxCfIURJ25EsiY9UJX6frh4WwRPJ/7qdBUOYV3guyy/25ZPqysExyRZ2/hSkVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4B74E200B58;
	Wed, 18 Mar 2026 09:04:08 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 16215200B6F;
	Wed, 18 Mar 2026 09:04:08 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 53690180217B;
	Wed, 18 Mar 2026 16:04:06 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Wed, 18 Mar 2026 17:04:02 +0900
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-imx95_frdm_pro-v1-1-8c00e59f0b1b@nxp.com>
References: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
In-Reply-To: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773821044; l=975;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=OkNhGYKxsXIL01q2f6JRoPSEa1slCn/SvNtBwWjeuzs=;
 b=E21/L1U5WBhU5pXwH89W4acVNE48yugfgwbmNSjNqRR44OJHl33Gucg3fh42P/R9mvKZ9lOtN
 Xk+u0p6+3WwAM1R932ve6SHFo+9qLMDnjHYROrl1nAHVSZLDDOKIcGU
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

Add the i.MX95 19x19 FRDM PRO board in the binding document.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f5d3c08369b92987b2cb01e36c26f9f72937f557..9f50b4bf67bc2c0b0e11b1ae615151aa4d5f0d09 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1485,6 +1485,7 @@ properties:
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
+              - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 

-- 
2.34.1

