Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D33631AA8F
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 03:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780372329; cv=none; b=fOrNfkNXOfVcm7GDHrGLVmD2JMsWlP4JflsjDKSCl1mDPtipN0aBksrcda0TE5KDWDSJPf+Y4gVpTUzUzxvwZVvBKgNKvRYtg+QenGQ8053LzshvhUOeQZTJsSRWALQfalCzVVKl7pk7si5KXpOQknyAzXrgbjAhla7FwU+X1qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780372329; c=relaxed/simple;
	bh=V2r/pRfA2wVYSkIHq1h5ZWGhTxUSxmurkgusfcpjU5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLaNOJwMq8IJpwqMa4zqiRCZEYjwf8T+AqOkGz2sOpPswXSdL+4OOzE0LA0ydRDAW5CKZ4mXrEkLxxWyREQA1T6ZJwLIMhS/N5j1jk275C2eBuzMZF1R+cZMqhRii60wGBWBjMayDdkS+g5M0xwsIlLk7xbRu51KFRkTCCy/qoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A65461A32D2;
	Tue,  2 Jun 2026 05:45:31 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 640081A5692;
	Tue,  2 Jun 2026 05:45:31 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0860C180007B;
	Tue,  2 Jun 2026 11:45:28 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Tue, 02 Jun 2026 12:45:15 +0900
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO
 board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-imx95_frdm_pro-v5-1-44ca5dc30a14@nxp.com>
References: <20260602-imx95_frdm_pro-v5-0-44ca5dc30a14@nxp.com>
In-Reply-To: <20260602-imx95_frdm_pro-v5-0-44ca5dc30a14@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780371926; l=1080;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=V2r/pRfA2wVYSkIHq1h5ZWGhTxUSxmurkgusfcpjU5I=;
 b=PuyRKHqaOVgHSts5/QrBsPb8OnCoTmkyK1rCfy4CV0DYIsb/FBVacytxbDdNKEsx1x9pSfd/n
 l+1f1gQJsHZA2RWWtsCWxY1gHeD1cBzpYQSTNetYDl9Rtnagj3XJ3aa
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
index 279e9a7e5f9e7e5c8c87a371c6ad14676474dfa8..a2cb7e43d657abb517c98250f9ce273180feb3db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1498,6 +1498,7 @@ properties:
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
+              - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 

-- 
2.34.1

