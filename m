Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF19018E25
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 02:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725504752; cv=none; b=EBW9Aiau7Qw8RrABLG1n7ESlJX79nGDWub3jKOMRNqK/dQLIsLCKQUkCFvCKLXaCGLtds3/Zh5X4vym4jUnZ/ltXm0uH1haP9LqOFUv2RoPWkUfpUAUSyMmjyi9q4IGub8V0qtsna6XEhdgJcC/agIEW66cmdo5ppdQEs1+zLUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725504752; c=relaxed/simple;
	bh=hpelPGMvNZYijOvUd26KewdRVHyFU4aMJO0lQyoJ5yE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ewHXSv7vc2RUb/XFlksmn56D7hmbiq2fMajX3/MD/QhvUVTXc/jBlVKKIScpnO09sBWM0LGYbt7soFhh1wBCD2x5pOh8NSuGkRv2VgsgkUqJCAnz/ujlyQdw2HjwD9DRsLOHILr1EeEg8SmwIoMcDEL8QZak+Ls5f/rUrsUPdXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0264A200530;
	Thu,  5 Sep 2024 04:52:29 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BB716200C46;
	Thu,  5 Sep 2024 04:52:28 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B81BB180031E;
	Thu,  5 Sep 2024 10:52:26 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: nxp,imx95-blk-ctl: Correct compatible entries by alphabetical order
Date: Thu,  5 Sep 2024 10:31:06 +0800
Message-Id: <1725503468-22105-2-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1725503468-22105-1-git-send-email-hongxing.zhu@nxp.com>
References: <1725503468-22105-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

No function chanegs, correct compatible entries by alphabetical order.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 .../devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 2dffc02dcd8b..6a928735e00d 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -13,9 +13,9 @@ properties:
   compatible:
     items:
       - enum:
-          - nxp,imx95-lvds-csr
-          - nxp,imx95-display-csr
           - nxp,imx95-camera-csr
+          - nxp,imx95-display-csr
+          - nxp,imx95-lvds-csr
           - nxp,imx95-vpu-csr
       - const: syscon
 
-- 
2.37.1

