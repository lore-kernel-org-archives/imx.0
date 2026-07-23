Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76033DB30C
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790824; cv=none; b=KKf0zoGlZ73XrEOnrkYmvK6LEpZHX0cPV4lFLpCI0QJhw5pPCIvO77zGd6TQddW7L/jaFxQZy2XdoYIsMyLuk05q8szPiinBbhr7Tayq1Hw6iDi1ww6TmocM7liTx60ciov/GxI5vR0QTbHJhexVB+sopJ1MIUOirH4a3GpgMwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790824; c=relaxed/simple;
	bh=rIUO4rVG/YYP995nR+OcKZLSQoVP7DUjUlXUFgxS7j0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvAPfLnNQ49HsNO6FugZLA9hap2fV9+14EYBNLHwl7CJzSzI6qsms7+aSF3peQ4s5QJ5RGMVZkj+z/mfN6zGc5DzqI0paIV+EAFRypRxRJHf9Yrhc+fizcnP/NQNrCTsexG856CC1O6z9cE/AagWfRqOmKXA/u850lfFhmddWqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3B9221A015F;
	Thu, 23 Jul 2026 09:13:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 058A51A016E;
	Thu, 23 Jul 2026 09:13:34 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DD9A618000B1;
	Thu, 23 Jul 2026 15:13:31 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Thu, 23 Jul 2026 16:13:22 +0900
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM
 board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imx93w_frdm-v2-2-b108a76b2e40@nxp.com>
References: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
In-Reply-To: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 justin.jiang@nxp.com, xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784790808; l=1342;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=rIUO4rVG/YYP995nR+OcKZLSQoVP7DUjUlXUFgxS7j0=;
 b=hv4RhR1SGusEdrZXL/S4Ti4Kh1HUBL8TT7+2fH6ohxzVQXdwaV12M4k1cXBDjgaxYN5jDOuhU
 cvJcjbVJzavDVuMjWtIMoAhk3TxbTfvcT4KaRrEpMRbJxLAlcQmcGG1
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

Add DT compatible string for NXP i.MX93 Wireless FRDM board.

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless FRDM board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 FRDM board, with some minor
functional and pin connection differences.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7b57a6ee1b50dc22ece292d6d9b53b5aa834ee96..9ab7af8c02d68c7f95cccfb5071662eafc8f93a0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1513,6 +1513,7 @@ properties:
               - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
               - fsl,imx93-wireless-evk    # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP EVK Board
+              - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
       - description: i.MX94 based Boards

-- 
2.34.1

