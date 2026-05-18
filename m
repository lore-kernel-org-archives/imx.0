Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1A336EDA
	for <imx@lists.linux.dev>; Mon, 18 May 2026 02:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073138; cv=none; b=qJd/D0212JOSX7aXduYNogMvzPg0eku6K1mmA5LJKNLVr7Sszh3u/thE41MDyFOVWrw/hMmYB913Lq3Yr7e8Cn06SHZfZnzbqb8rSXNxZThBMPZd+fmzZnPlGB3VjQyUkLhXRA+bjzYXeN9SLBc4mnLlt8xbq7AeSbmtV50jqGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073138; c=relaxed/simple;
	bh=9GQNv2wGSWkbfAUHwoF9Hs8KSZtunAO9+Pncvtb1r5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9AkXw6uoNRyoZewTyW99PFf8sHSNE9Xp76PMQOKUMpfZW1lw2a1H0XbHGOyGY9YEfNJGCq9eeLCC0KDvm1kqQG7oEYGSoiV1igNR+ST/9ZdcWU7dweMcfA3p3SVfilY4Je7UNnfy8Jt2sAzBwrcqChO2boDdvjkay9mWn8N8oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6E0A4201203;
	Mon, 18 May 2026 04:58:55 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 36EA92011A8;
	Mon, 18 May 2026 04:58:55 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id EA507180217B;
	Mon, 18 May 2026 10:58:52 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Mon, 18 May 2026 11:58:19 +0900
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO
 board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-imx95_frdm_pro-v4-1-975346555a9b@nxp.com>
References: <20260518-imx95_frdm_pro-v4-0-975346555a9b@nxp.com>
In-Reply-To: <20260518-imx95_frdm_pro-v4-0-975346555a9b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779073130; l=1080;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=9GQNv2wGSWkbfAUHwoF9Hs8KSZtunAO9+Pncvtb1r5A=;
 b=ifZjH5AbvLyD0FuomB604p0HFCt20GtUi1uva/Kxe5I4PlVKAhJNNJ+GWAXQ65kGdgRFqqcfQ
 xJIYQF2gPhwCS0lY5YZ0/q6Fva52LCG5j1u19tboczSGgruANefVql3
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

