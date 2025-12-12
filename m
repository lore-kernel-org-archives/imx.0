Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB1117A2F0
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 02:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765506706; cv=none; b=bKsXITvr1HTl1mT5qVMMsSbV082nhpAVlICbhiqiBSYnJQj0Keon70EdRLgNOpVgOQRGYEGomKmEHok3F77dvutwhyoJL8OJJfsOr0UstwXzRlvGAFMVw+9FB2rjA4kwMrUWsYnAgKn1zKcfrQnhDxqgNnVeFmSOxKiQaIFveOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765506706; c=relaxed/simple;
	bh=Gy9TlgJnCmm6TOU+C1vsyNLI04jFbpgfKBDibUHLi+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m4OwEpOpQTGXnpZawGaek1op6ebE5qFlYc97epfkkqSO4OS/mdJh5Kw5vzAcxf88OyII2IzKGaJRT9aYTXgJX7rmgRJIIyGyaV9za6t2VMXEjgDNzL+kLSwbhaaB9jEk83d4DytqkJ1Dnpsy4XNKt4IRUCieBU7NAB7Bzdt9MVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 71090201E6A;
	Fri, 12 Dec 2025 03:31:38 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3BE07201E5D;
	Fri, 12 Dec 2025 03:31:38 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A0E281800095;
	Fri, 12 Dec 2025 10:31:36 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Fri, 12 Dec 2025 11:31:33 +0900
Subject: [PATCH v2 1/2] dt-bindings: arm: imx Add FRDM-IMX91 board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
In-Reply-To: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765506694; l=885;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=Gy9TlgJnCmm6TOU+C1vsyNLI04jFbpgfKBDibUHLi+M=;
 b=U6pV2LnRwk9vvUuUntCBQXJp4xWl3D1sfBtvgpDRst2y0d9m/0HFclA9+VqZop2gAHeXmajRj
 2e4gcFoDSYGCPnwSK8a7SSrVprl1Y8aAGPbT+o++3I+5Bx54BFIduhR
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

Add the board FRDM-IMX91 in the binding document.

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Change in v2:
- rename 'frdm-imx91' to 'imx91-11x11-frdm'
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43b06711e2efce61ac1fc2794b79bc..12d72057b1b817283754a2857d8106a409b594e7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1412,6 +1412,7 @@ properties:
         items:
           - enum:
               - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
+              - fsl,imx91-11x11-frdm      # FRDM i.MX91 Development Board
           - const: fsl,imx91
 
       - description: i.MX93 based Boards

-- 
2.34.1

