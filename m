Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6764F2DCF45
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082017; cv=none; b=VkMaMsjLCJ2J5/942Js2aOU8UtEj/l1TmnxwQg/7irv8zJH5wfT+4cScEW0xVMyYAxjiywafB2revF5C/+6nflxviUXkD8p8wRuuja+ETscE95QvA/dBdfnHajOQGkzZgdxAQZlt+aB9HJbTerdEg7j8+IelqetHfhBry2HkDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082017; c=relaxed/simple;
	bh=YSyTVSaQdn2NwJL6GxptFOuj3Q635X7g7eHgWWcCa3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BjVcWmxOkaHGUUQnhEUZULXwf2GqxliNbCYWG8swJlQAH2+WwCvdJtKc6uzx7VSc8DKT3j2fP1SqB/hCXdhmynd2M6/jpQYNOqNlMKhRNCjc227zry8k6vtnxklfMJZRQ0AaI3AL7svajAai/Wk/QMessU/RTw9Krft45NW8c30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E745A1A1872;
	Tue, 30 Dec 2025 08:59:06 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B0E271A1112;
	Tue, 30 Dec 2025 08:59:06 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8B2DE18000AB;
	Tue, 30 Dec 2025 15:59:04 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Tue, 30 Dec 2025 16:58:53 +0900
Subject: [PATCH v3 1/2] dt-bindings: arm: imx Add FRDM-IMX91 board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-imx91_frdm-v3-1-60cac61c96ec@nxp.com>
References: <20251230-imx91_frdm-v3-0-60cac61c96ec@nxp.com>
In-Reply-To: <20251230-imx91_frdm-v3-0-60cac61c96ec@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767081542; l=1154;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=YSyTVSaQdn2NwJL6GxptFOuj3Q635X7g7eHgWWcCa3E=;
 b=6Af7zRJwmY1Yp9Cm0J5hRp6L/KoKoIYMEKQfQF1ZNi5QUbdil1mhgQLribAb0Gi+tIStgC9IZ
 /b9Xwohc9C6DY99Nxk+zWW8/XZBHK48g6EilO6uI4qkbU+xDCH1V4r2
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP

Add the board FRDM-IMX91 in the binding document.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Francesco Valla <francesco@valla.it>
Tested-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v2:
- rename 'frdm-imx91' to 'imx91-11x11-frdm'

Changes in v3:
- add code-review trailers
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

