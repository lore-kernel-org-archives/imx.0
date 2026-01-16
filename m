Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F731196F
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553796; cv=none; b=s9YjEU10O17VqITlZkGyyI4VF7h/hciwn6VHV1IefWDkPytFd60NmRSdLlxyEVAhOZbJyHb2mspPJPSLCyp0EM3jf+Exz/KUlvW0wQYATeDMyZZvEt4yzKq0wPDEVxC2cTL/THugE606Y4X6CwhHHExC5rhSRuzsuGu0gWp5kh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553796; c=relaxed/simple;
	bh=5JqX7j8lCSsnk/Nujc7qIDWBCZqpjn8JpDzM46t4gbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5sEfV5HBP0gdKefPvgGjMC8/zeIiJ133a89HhsrHZy64XPNnIe4/prF2I7pL6xyQXuig1CYWLbvQSwyBUou90l+8OrgWX0X02dhigYlLyvynlhiEL/uG/Q5hRZeLGsXxUNcn/lnq5gWeWFLOG4T7jFgZMxIHqg3hk2uLCxplwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8A4E420303A;
	Fri, 16 Jan 2026 09:56:27 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5504220303F;
	Fri, 16 Jan 2026 09:56:27 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id 2CC741800317;
	Fri, 16 Jan 2026 00:56:26 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Date: Fri, 16 Jan 2026 00:56:13 -0800
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 FRDM board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-127-v3-1-3dc49545a745@nxp.com>
References: <20260116-127-v3-0-3dc49545a745@nxp.com>
In-Reply-To: <20260116-127-v3-0-3dc49545a745@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768553785; l=1164;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=5JqX7j8lCSsnk/Nujc7qIDWBCZqpjn8JpDzM46t4gbw=;
 b=bbhAUnbrBoqeLTFTFBsvS2InkYIxZ6yjeXp8G6mg5uVwHDrkLcU78yiCM6zkk5F19INP/4OTD
 CuRyrbadeUCB9///tDKW1gsW83Rl1T5sGllZBkfP8cW4u+5fVOYMFRB
X-Developer-Key: i=lei.xu@nxp.com; a=ed25519;
 pk=faUN/3jfazJOPNYhE9pN+nzvk+lrEm64ZRf42Yeum6U=
X-Virus-Scanned: ClamAV using ClamSMTP

Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
development board, a compact and cost-effective platform based on
the i.MX95 applications processor.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..4b6188d39be6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1432,6 +1432,7 @@ properties:
         items:
           - enum:
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
+              - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95

-- 
2.34.1

