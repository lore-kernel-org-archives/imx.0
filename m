Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E33365A12;
	Fri, 13 Mar 2026 07:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385833; cv=none; b=e1DEEv7zf762nnM9aAxqShC6j6SwVrm0AmF6/YCG1NQUsH0H811Rm3e05MDWoEuYNLu203AVrDooLoOHNPKJ4zzpIz6NrpBbncLRIZZB0BxFbk74BHDwd9mgJGU2HQQ2emPIqTigjwEIKkKPXkv0UNopXg/QeZpIS3fU7p7qeHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385833; c=relaxed/simple;
	bh=dK2P9jY5SUd3FvCA2KK/xMRw607GEqtZ0IROGOx6YN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1kyoeYgOWSKBgt7nkMdItimi25ym1iSMyOHvhp8+BPD65qByMW7IevVbny0zrrwElrX0cb6PcZh07kVfM3Xu93GAnJrwSBGS2krG35gzVQkxczC78Z3NZBshGogdhJMOZ7Dyns6vUWYA66eObjc/WO26wt2b2rV2td/i2vDeIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lfV24ZWA; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lfV24ZWA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fskU8s/y4CPwfkh2I0PNDuKk5UsSC1k3XQLvILrKupE=; b=lfV24ZWA3fGDw+KHJh5ch3fQfm
	ViWFmz71WF2/i77RB8OwD3pLGhpv/2Eef/et9BUJ6HvvE+FB/vX1vYQ4Vx58XH3BCSn9boErjuXC8
	7X1OoUmWEDJA3Dn4rnphkmVsxGd1Z/rCIWqJZXtaCLmNKvjyXy0FbbpheQ6T7o8t4YO+3PIAgDrBr
	Ef9afSVK84jbVCB0ktaG4qKdfnzxc1ikfHMSvGs7RvhMw62CPfQDlpdghzEu9teC7kh9G9WGKLltO
	cav3CxYrAOxrHZNkT1XnVa6tvtNfD/f5cWYSCNJBNg7b4Hk1aqCPUYwyNry5SrtWPK9qCqbY73U+e
	Mt+wxtHw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wfH-000D17-03;
	Fri, 13 Mar 2026 08:10:31 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wfG-000Eou-1V;
	Fri, 13 Mar 2026 08:10:30 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: imx8mm-tqma8mqml-mba8mx: LVDS overlay: Reduce DSI burst clock to 600Mhz
Date: Fri, 13 Mar 2026 08:10:24 +0100
Message-ID: <20260313071027.587992-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313071027.587992-1-alexander.stein@ew.tq-group.com>
References: <20260313071027.587992-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)

The DSI burst clock frequency is too high resulting in flickering. Reduce
the frequency.
While at it, remove the burst clock from board configuration as it is
display specific.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improve commit message and fix typo

 .../freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso    | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts      | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
index e5425653ea7ed..046399a455ba1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
@@ -32,7 +32,8 @@ &lcdif {
 };
 
 &mipi_dsi {
-       status = "okay";
+	samsung,burst-clock-frequency = <600000000>;
+	status = "okay";
 };
 
 &panel {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
index 8dcc5cbcb8f66..8490b7b04e9bb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
@@ -76,7 +76,6 @@ expander2: gpio@27 {
 };
 
 &mipi_dsi {
-	samsung,burst-clock-frequency = <891000000>;
 	samsung,esc-clock-frequency = <20000000>;
 };
 
-- 
2.43.0

