Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7982AEF5
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 04:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761625976; cv=none; b=L74vRtVB/YDyrgKZeJsRP2O6RwTchl8FIn4q6vP6N0puPN1GA/y4bGJGyRCqd1E75hCIyT8tKw/y3m9d5MCxX+pQ67gQxI+E5QpYeRLA/+umlzJqTYXArF+hjADd2H5hH/2/bV9jxDjoKUGUE0kqRaHJYKcLwvjpZ+HCNpo0Boc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761625976; c=relaxed/simple;
	bh=OuDtOT5tw8r53N1ZORqGAJM8l0j+UaK4SsmFIS3gR2U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NUoupz7xVFRfn30M+XCJAwshQemnOzWKX38alPpdciCtbpvayiMIJ+es4bSy9TFHCDbVIjUudbJ9R9uUVDZVUZ53tEEVrvrpRfFV+X4+qDAWpwx+B2Rfm7rSTGpCNCashzbbRH8tROP+M87sxVGCwTg5BiUY5BSxCKJmh4us3EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=lRcp1Srp; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="lRcp1Srp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tiO4gsYvAQbC6JLiDRJnzC66h7WdHdCwGJ5rnwniCq4=; b=lRcp1SrpJPghipfol7gRvgYGfG
	1l0kvl7u1frab8bYdTZWfGMaZ9LkOybjotzexh8V4eKZKK4G3W3ZhsXzhLzV3QPgt32mdvygiK38K
	zHPgEe2YrkBMHfcGKxeNl1xYWWLV7B1RyO8ASEcUkEL7JwiwgMpoZVcgJfC1/oU6QD3g5t/LSHVzF
	5KUFvcLOuxdZfQ7aAbFYUXE9NnaATt7eCnXOFrQ1zMuLYdM4uciKl1Jm08buBuglEkgf14GWcxtVt
	lxQ/H5Br/od2x9gG5FkJDheIJdFmyjlFQlJhatB71f5birsvyUnXZSwDjjqhbam5ePQ5aLVCC7qTy
	Uhace4vQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:36546 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1vDbO3-000000099zL-25FI;
	Tue, 28 Oct 2025 05:32:46 +0100
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add PHYTEC phyBOARD-Segin-i.MX91 board
Date: Tue, 28 Oct 2025 05:32:43 +0100
Message-Id: <20251028043244.496662-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add device-tree bindings for PHYTEC phyBOARD-Segin-i.MX91 board based on
the PHYTEC phyCORE-i.MX91 SoM (System-on-Module).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Add tag Acked-by: Conor Dooley <conor.dooley@microchip.com>

Link to v1: https://lore.kernel.org/all/20251021093704.690410-1-primoz.fiser@norik.com/

 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..73987ba1d16a 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1492,6 +1492,13 @@ properties:
           - const: tq,imx93-tqma9352        # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM
           - const: fsl,imx93
 
+      - description: PHYTEC phyCORE-i.MX91 SoM based boards
+        items:
+          - enum:
+              - phytec,imx91-phyboard-segin # phyBOARD-Segin with i.MX91
+          - const: phytec,imx91-phycore-som # phyCORE-i.MX91 SoM
+          - const: fsl,imx91
+
       - description: PHYTEC phyCORE-i.MX93 SoM based boards
         items:
           - enum:
-- 
2.34.1

