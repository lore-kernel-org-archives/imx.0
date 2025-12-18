Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39B3128D2
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766037404; cv=none; b=rHCHMVuVh7QpP+F88KRKBFNqt/tHJrqaVHAD/JgkgFWAqOkHPEa+3ddfaMLg549Aio+Xhv9H2RzhSpj2Tde5IW3up0CcsYMYZPZvGuaSOMI4fx0je8Hh1gAhs/f3yWKcnlsqTFgydsDrSef4NcED3PTrfD8cH0P/mdbZ9oh3TTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766037404; c=relaxed/simple;
	bh=NDUuTAe6GnI9jj/43bSUGHl8qff3+dIFGK9G4CqLQpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sSqZlnuaMtbRl2uUEl2xlWzjA7fTW5kXW5SnGDqKdH76bZM7Wnl2BlKFvJCX21O3UZWrYsv69w2hdZVyTrR9Zy7HtH5Gfw19NHpaVKTZ6a0VkSG3iYbi4aTPewziu9x5Q4dWGQGauRXbc8IQJ5KmLHOFvG2zn+gVrPkq+VJrBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D1CDD20209F;
	Thu, 18 Dec 2025 06:56:34 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A165A200736;
	Thu, 18 Dec 2025 06:56:34 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id 845AA1800315;
	Wed, 17 Dec 2025 21:56:33 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Date: Wed, 17 Dec 2025 21:56:28 -0800
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 FRDM board
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-127-v2-1-67cb12e56242@nxp.com>
References: <20251217-127-v2-0-67cb12e56242@nxp.com>
In-Reply-To: <20251217-127-v2-0-67cb12e56242@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766037392; l=1050;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=NDUuTAe6GnI9jj/43bSUGHl8qff3+dIFGK9G4CqLQpA=;
 b=tfreaao2sXgbYa/vMHu2xsfHdr4KtQ5cnC7kNg6+jGlowA5tzLxX+pYusnpgyFXq1KWa04PJz
 KKgwQt83SfwBpkosYwrOhN7bRyB+GiAJnpuueKm7Mu1B1FRQw6enFHl
X-Developer-Key: i=lei.xu@nxp.com; a=ed25519;
 pk=faUN/3jfazJOPNYhE9pN+nzvk+lrEm64ZRf42Yeum6U=
X-Virus-Scanned: ClamAV using ClamSMTP

Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
development board, a compact and cost-effective platform based on
the i.MX95 applications processor.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

