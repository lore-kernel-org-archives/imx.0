Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10A17BB4
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280264; cv=none; b=cxE9zJO4TQIjqgGaYWmzeB1zbUGGQ5D/CrDP3CI0IBExjrMz5A5Juvp2Eg/PjuPOfEU7PM+pD8tBAC7GkVmXzp06UKa2/Q29nrsxPFW08pGI7cjUWlgqKRK+eYHJU5Sle0gLnzUo0t3UdburFADT/t53Jd6e7Tvfmto5APKE/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280264; c=relaxed/simple;
	bh=xouBU+V+1k9t2IvPI/pki5mHh2ozTxS9gpV7gWKth4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N3ZI0FEHbN4osae4b669sSjMGwoxD0pzTBjVnYQwRLRGdHiL1bwA0dTds1/TThIXlDoudcNF7Fqw49gGwTl1vPxjeADgfz8VxiBsEFKcxasgMXpagSIfqZ89PnLek6hkmxlo+jrYBxTn/3oSXvXndhYRfTcYNKkxlXcnQJD/iCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=JQmgHiwb; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="JQmgHiwb"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1EBA288B31;
	Wed, 25 Sep 2024 18:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727280260;
	bh=umQeb7H7bbta/j4WLfgbo2e8ZBJfmW5kO1w1tfCmBj0=;
	h=From:To:Cc:Subject:Date:From;
	b=JQmgHiwbkAR6WbcRN6J5HjD9hnhWjrUjRFL0VphI5dVXO8nGaVM+piSCYi5+DPZct
	 LwWV9cfQWteVl1Xv4YYAkwI/8Ma+FM0vp6dr6tOyRynbV5fi2eNahhAOFp30yPPD8H
	 js5QrVp/bvnuqgxPepVo5oc2Efwyn6WG4vylFSnFJGVWMFVCi8nbuoOZkDijqOV3gb
	 x16/SwvJupydhB0dO0/xBmIc3gYsO5wW0W0tqSh0+AvS5WZn1juFrjkpZKcbEDs89q
	 px83RzthhkeTgbuKO2v9NIYuoeKwoDeRW7/N1V0F/UCVPk72U6TN3Ro1QV+sp8gpOY
	 28mITauzMEz7w==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: kernel@dh-electronics.com,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Document DH i.MX8MP DHCOM SoM on DRC02 carrier board
Date: Wed, 25 Sep 2024 18:03:07 +0200
Message-ID: <20240925160343.84388-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Document support for DH electronics i.MX8MP DHCOM SoM on DRC02 carrier board.
This system is populated with two ethernet ports, two CANs, RS485 and RS232,
USB, capacitive buttons and an OLED display.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mathieu Othacehe <m.othacehe@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: Update subject prefix
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b39a7e031177e..09027a4ef515c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1100,6 +1100,7 @@ properties:
       - description: i.MX8MP DHCOM based Boards
         items:
           - enum:
+              - dh,imx8mp-dhcom-drc02        # i.MX8MP DHCOM SoM on DRC02 board
               - dh,imx8mp-dhcom-pdk2         # i.MX8MP DHCOM SoM on PDK2 board
               - dh,imx8mp-dhcom-pdk3         # i.MX8MP DHCOM SoM on PDK3 board
           - const: dh,imx8mp-dhcom-som       # i.MX8MP DHCOM SoM
-- 
2.45.2

