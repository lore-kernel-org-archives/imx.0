Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F71E9071
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504983; cv=none; b=g7t4pf+OMvjggOjX9yrlXkNBRNDV3gTOPR9gyikhgcYbg+pO5D1RYxMQ59vMssrg2JSh8osT+K2qc8Rc+95xcruNW1B4eS4c+0E8eoT6ap/Fczy3mOedmmKkj4BL/i0OSSva02c5uEV/+jBpL2+Ym3SVv9uMb2+dTU5muHTFEtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504983; c=relaxed/simple;
	bh=AmhwSNepj18v/9BsyXl4q8BQhzGM+VQTPO0KStA/Clc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S/AGREgpRZHvDs315FgoPPGBXSL8/Kn/Dsj6TviTdRsrGU0dIzN/9WodQZQtLkUew2BDWQx3GMQcuvBPSCHXWaN8I2UCdTB9YlrDrmJsEyPaSEp/PYO6/0W8uODW/bR3L03HRHMBd9jq4iZDs7PYJBloHPdHyqzWQLGqd2B37PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=K9jFrbt8; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="K9jFrbt8"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9214688E6B;
	Mon, 21 Oct 2024 12:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729504973;
	bh=2GHI9zvaCMNZNDAcNWlVDJe/x4Y4cP7miGsJUaBFGh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K9jFrbt8428rBt6pGEv1kM4yxTEHscFcytjAuRkO0kZszAbLj51OSij0RzTCiQhDQ
	 3u+cMwTwEXa3EaBymeEFeg5pE0ExjZWdW84zJX0OAe7+lwBXByjwvA0dkmnuvf47Zq
	 T5UaCdEEn6/eff/d2io9bxlFcommhY5mOsedby+0xMGWdsNLhyAVgKdThCc4QITCWL
	 +rIWYOKS8UqQA3DF21YyYFz4wrA9Hpw5WZ0HlsMomGpe5eShaDiAQnPEZ3SzR6dURb
	 +SEADT3DWM+JThE1GpT4Es7xEb7TA64SnoEclfpZx/721z5avtr5pxQxnuCJI3LW+Z
	 m+STDG4u3lppQ==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Lukasz Majewski <lukma@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 3/4] dt-bindings: arm: Document the btt3 i.MX28 based board
Date: Mon, 21 Oct 2024 12:02:23 +0200
Message-Id: <20241021100224.116129-3-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241021100224.116129-1-lukma@denx.de>
References: <20241021100224.116129-1-lukma@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The imx287 based btt3 board is very similar to xea in terms of used SOM
module.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---
Changes for v8:
- None

Changes for v9:
- None
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 2a42f943330d..ce128377200a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -97,6 +97,7 @@ properties:
               - i2se,duckbill
               - i2se,duckbill-2
               - karo,tx28                 # Ka-Ro electronics TX28 module
+              - lwn,imx28-btt3
               - lwn,imx28-xea
               - msr,m28cu3                # M28 SoM with custom base board
               - schulercontrol,imx28-sps1
-- 
2.39.5

