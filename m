Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D472638239E
	for <imx@lists.linux.dev>; Sat,  9 May 2026 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778311295; cv=none; b=NVXjueoUim8GYMS3hSEFsoTKVhMloZ16/rivR4NLQ5KzJXDNIm8ZhC6GWS/kiKmIN9A0pzD8c6QynARxB1/IysP/a7FTER7nfOaY7rK/5HT6Nx71TstO2OWVclB7WUtHnbLggF/pC2qinsGkEYH3Ewglip8kIOTWSkySmgU74ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778311295; c=relaxed/simple;
	bh=9GQNv2wGSWkbfAUHwoF9Hs8KSZtunAO9+Pncvtb1r5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YH7zxbQMVB6gNXMGKfKCE88swKF3lj/gCqkJ6C4qGkbCB0pHqsb/daQ6SpGCICUfXWGY8msjau3I56ukPTs0FYaWeM4aKbP3tKOtxFvdaRQcuNZ4pDT2ikT+BimN3qu/MsGwssNGtDyBwVUmlRwm7CeAgcRaS9IIsCOqI75FB0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9E6612039C1;
	Sat,  9 May 2026 09:21:25 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 673972039B5;
	Sat,  9 May 2026 09:21:25 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 305F218002C2;
	Sat,  9 May 2026 15:21:23 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Sat, 09 May 2026 16:21:14 +0900
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO
 board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-imx95_frdm_pro-v3-1-96290b471396@nxp.com>
References: <20260509-imx95_frdm_pro-v3-0-96290b471396@nxp.com>
In-Reply-To: <20260509-imx95_frdm_pro-v3-0-96290b471396@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778311281; l=1080;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=9GQNv2wGSWkbfAUHwoF9Hs8KSZtunAO9+Pncvtb1r5A=;
 b=U9j2dgObsYdZu6uI2c1ybMXQPvd3bTNsEMyOi4q2MWnWX8ZAd7ibMD2usoIrxXqEKyU8BGmFM
 F1WarRH+GkPAhH/4ryidtLEBSPYUNtZ2meKT9jxsUpYd/+vxMccRUgH
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

Add the i.MX95 19x19 FRDM PRO board in the binding document.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

