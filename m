Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ECB1A5B84
	for <imx@lists.linux.dev>; Sun,  7 Dec 2025 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765114323; cv=none; b=QW3jyVSZTkvZcPd/xt6ZkPp2nj8oLAfJeBUFIGOdt+BiSC0QgBVR/UQx8PMCplPJJWFguZ6rZejYtHzYtEugAtj0C7o8NbFYI7/hJqOXjiib/Rp2yA+YPt1oDoAENVi1uLVP/yrmAd30xMpjys3V6DsOnz94mdUjooWbdS4kCeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765114323; c=relaxed/simple;
	bh=Ms1VMn38PurnYbLCOaj8g6RLXsCv4SE/y4RWiYGa0xI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSkFvjEVDFmfXllq+ZkCw7rgLLm/LXk5rfNgaGkR8KtEmxnZxXMoA4qyMN5IlnBvM5puyNzq6a/F1Nk9Geu1NsK3kmLafSviacS+YJxV6LIejLlEImkeLycMmqIh5ph7WYrzmguU7Ni+kFbx/Rh8AquYdoU1e4OhYU2lJ77LvNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 20C08200181;
	Sun,  7 Dec 2025 14:26:09 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E5F382001B9;
	Sun,  7 Dec 2025 14:26:08 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id D3A641800303;
	Sun,  7 Dec 2025 05:26:07 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Date: Sun, 07 Dec 2025 05:26:05 -0800
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95 15x15
 FRDM board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251207-127-v1-1-5a2eeb69f150@nxp.com>
References: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
In-Reply-To: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765113967; l=980;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=Ms1VMn38PurnYbLCOaj8g6RLXsCv4SE/y4RWiYGa0xI=;
 b=3Qpr8GhKWzvDuemhut+WgqOIj7zL9qH2FK9sbgCY+K3m4Y2qxQoOztfYK8RrHhlvo5Ipcvfbi
 X1CNChqqGX7AoMi1CrvZCNnPOgsj4opSsiFJ0qNuUu+esq1MT+xhYcx
X-Developer-Key: i=lei.xu@nxp.com; a=ed25519;
 pk=faUN/3jfazJOPNYhE9pN+nzvk+lrEm64ZRf42Yeum6U=
X-Virus-Scanned: ClamAV using ClamSMTP

Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
development board, a compact and cost-effective platform based on
the i.MX95 applications processor.

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

