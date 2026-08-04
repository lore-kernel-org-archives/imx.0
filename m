Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBAE4734EE
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860611; cv=none; b=HVGIXZWQuPQ31GIVLnZRnL1Rc3/wCy55sxplBJAIn4KP9CzgREmPieqHPqaZqH6qQ3IzwJTkXEvT+9kvt5tbSXjtNdf8P9M4nd7aXsDWc4lQ3cFxDJO4OJgzmBquAS8jQJt5TSnuOdWvPXbBNiQnXftoAAiK3ScI3qqZOZWc8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860611; c=relaxed/simple;
	bh=2MZAQAx7F7h7XcWezfPd1AwcxpU09BqS1KxBM6CgVjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XfmVaoiklZsMZ5kDeYfT/fDXzYAMKnjoks+dvoL1nHhb0zsOUNE75TbQdc6eSwB2gq800gC2saLxqUvUxYXTZ5EL3LwXzvcYFqNhB74/rYLG2NMjiuqnLiyUxRb1F0QKkOO5IzsQz/R7LPy/AAtBgePYk3vRay1dwqChjOgEYy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=HAZQkmOt; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="HAZQkmOt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B4E41195E2;
	Tue, 04 Aug 2026 18:23:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785860596; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=9RYvfhWxSn3k+lzwEVUe/TONrStK6sEJ9H+2bktoXC8=;
	b=HAZQkmOtJeVB312pLAOHxZb9JkXs59Sa68fuYtN3473fAX//swqU1yaJt3tOUvPsB6BPtx
	oLLmi2U8KVCbP9A6FFSmJ4NWtk9ZaK/zWsWot79vx1aulEmaurP/oB5DUpiH7j9yul9csg
	1+ToXNuz0yx6Q8BaT4db4xuHhQV3+23p2bJ1tM8P/4B51V5c5Z1X+Yh4gNcwVg9UgsvJhZ
	bmjYxt9QN4asymERCcL/WBmVfswTPbW0MdibUFU/L7YW4pL4dAMfkz5Ql7nmdpWJHM+fnT
	KwJ2OALb7ADqz/KXCNrzaXEcC8RMhEVWWftnJ0PvbFKwlPhb04ScrsMs3WgI/w==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Date: Tue,  4 Aug 2026 18:22:45 +0200
Message-ID: <20260804162310.24374-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT label to SPBA5 bus for usage in board DTs.
No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V6: New patch factored out of previous
    arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
V7: No change
V8: No change
V9: No change
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9cf9f6f08654d..bec64cbb36347 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1437,7 +1437,7 @@ aips5: bus@30df0000 {
 			#access-controller-cells = <3>;
 			ranges = <0x30c00000 0x30c00000 0x400000>;
 
-			spba-bus@30c00000 {
+			spba5: spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				reg = <0x30c00000 0x100000>;
 				#address-cells = <1>;
-- 
2.53.0

