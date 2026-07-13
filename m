Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F5F33B969;
	Mon, 13 Jul 2026 09:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935960; cv=none; b=XIFUqHtN5GM5ovO38pmWjqtVpoma2n5OODdb+oiRz130z/15a1+4NRH1bnJNL9UnsmsOpZ2BhzZcH3Oosj/GjdE6Q1qM0dCApX5re9lAGkIEo/kpsn/cA0Iyw2rL9LFTvfAKxx+A4cGBiiuzgPbQIlx3+z6P5LOV7P0nxx5is3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935960; c=relaxed/simple;
	bh=8IzzGeOkA0693Sg01OE5HHxBNey7G4/7mNCtiz5EgQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAkfRhfiKkPCd6UWdKhlUM+DGneMMVrTBwAW0RrNz6ONIL2UxqGEOfQzu/WZ1BZ5wqzsPXJXP5hG+STYZZ5bnlercHAUEBOPFZJzvB1tiD/IXbdvTHo9FMSG94D/NAOk6rcIytxvzrs+xHk7uBboQISosvIG5yVHdvpIgCa35ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Y27lHHXo; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Y27lHHXo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=OrneY2kKhdTyzwwJPc0c8d/pNlFC/NXGDitof6NVC2g=; b=Y27lHHXo08WXoMk2xFeZQdz+34
	LYRm6tADlH2i0R2V9ynoDd9+99WCScjoXo5wcN6oxFBDKeRoFyFKjW7Rf29dlGxERpwZ2FErF9JCv
	7bS/Kbm/O/XtdNn951TPHhVytzUAZDdACspxGB7AFKhC94zncWgvhGvD/11tCv0n1/JYel3IT7y6X
	06ozM+nNukZfiYp77SHjq1qqTEoGBpWfAXSW5p0zXzZJv2hVSC3o9BDh+JmwrkvevVZBQVYFoaqXP
	HofkRVMT0l1hvPdcyBnVc75aGvH5IxuLByn5PpjNndVpxYMCsZxqaAlCFR9t3KHEPiIslRrq8zgzU
	WiCYnypQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp9-0004S2-0W;
	Mon, 13 Jul 2026 11:19:39 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp8-0004Bh-2N;
	Mon, 13 Jul 2026 11:19:38 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQMa91xxLA SOM
Date: Mon, 13 Jul 2026 11:19:21 +0200
Message-ID: <20260713091924.2319674-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
References: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28059/Mon Jul 13 08:25:07 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

TQMa91xxLA and TQMa91xxCA are two series of feature compatible SOM
using NXP i.MX91 SoC in 11x11 mm package.

MBa93xxCA is a starterkit base board usable for TQMa91xxCA and TQMa91xxLA
soldered on an adapter board to demonstrate use cases without display but
more interfaces.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f96f3d31dac10..1bc9edaedd6e4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1607,11 +1607,13 @@ properties:
           in the assembled SOC.
           MBa91xxCA mainboard can be used as starterkit for the SOM
           soldered on an adapter board or for the connector variant
-          MBa91xxLA mainboard is a single board computer using the solderable
-          SOM variant
+          to demonstrate parallel display and majority of interfaces while
+          MBa93xxCA starterkit mainboard is focused on communication
+          interfaces without display support.
         items:
           - enum:
               - tq,imx91-tqma9131-mba91xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa91xxCA
+              - tq,imx91-tqma9131-mba93xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa93xxCA
           - const: tq,imx91-tqma9131        # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM
           - const: fsl,imx91
 
-- 
2.54.0

