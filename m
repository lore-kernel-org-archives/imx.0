Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C0412C528
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713871950; cv=none; b=vDWdujkvevI7IckIx+lmmamafAlbL3IsyI+oos+qLnObJVnXPpn36RZuGp63qdbIUfPZfXBve9KkWC6iBkRENfVXDCWpj3P8EYujMCxgR8FnuCl9DNQHdbYBVPCVVP5x+K8KPzHMu/cFz5rWWQY0fgNk35SZ5XPWMPFzrO3PjSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713871950; c=relaxed/simple;
	bh=jwSYTrGlB4VVA6AzwNKL6XCoUro5wTrrJWrgjhjZkpc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BlS+ugRIJWF3SZL7UVhbmNRooiW8sVKE4Z/u5ad+Ox914czN1+Cjnm7Z65sLqqEObEumRUgwWdQtE3KKZqzs4QLFLiuiuJgWMUljQ7zwjti+gB4Zno6pgiVl/AzzPFBKODJtn0jmjT7QjVNyyCGF3kaqXSeUktql3Hod998bY+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=nWJQgNTL; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rAugLcGH reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="nWJQgNTL";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rAugLcGH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1713871948; x=1745407948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iu1dWYNKDp9es51AFvUQfiaCrk+4XgYnKK2u7hGngWI=;
  b=nWJQgNTLdoqOXNPFASR7E4GZxH5/XUnWqnMPmlinMtwO9lrAR8hMHdgu
   mDmFUqkU7X4k7w16IMX1MbEatwvAbR7SInmhWZIleKhkWtXrQbm3dkc/t
   yL9J0WmuXQknZ2Mm+BUYBqIiirD7RWaV/ytAGo0z1wrWNVVichtkjbuSZ
   la/83IDB3lVlk4wUVFPVuoyht+tW6GEHxMdS9hndNIlA0SIZB+PfXkWla
   K4FkqeDo0Ev9vvgJMyl+OIKUPNUyIx8rNlLRm/XyFgbmtD1o9fqqdebBT
   BFK6a/LyK5ucR9GsxUe6XKKyrGTQTVnJXyk8BzY7HIDFC/SIchQuPWlYI
   w==;
X-IronPort-AV: E=Sophos;i="6.07,222,1708383600"; 
   d="scan'208";a="36565285"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 23 Apr 2024 13:32:28 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17F9A1702F4;
	Tue, 23 Apr 2024 13:32:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1713871944; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=iu1dWYNKDp9es51AFvUQfiaCrk+4XgYnKK2u7hGngWI=;
	b=rAugLcGHgiuz1Oyvl6KBwdn5BzeB5gtuK3wRKTe3q/S6eOlw8WCj2ZMN10oqBmqqv22yOO
	/+FtnEkC7DreL7u50alA2g5FHbDfPG3lfQqEIZRLf/4+AT1n/zuPSFbkpY4sgrIRJbHviZ
	QIWEgbhf289G9ydfkvTvQhqi0r1VptQBBrbaG7olMDe9v49yYGGKqbC4sGGA0WMKMlAxNX
	CTPsLHaq/fUWZo+Y1MSYaSkRKM6c8YM8HLXKLfYIkfKpg1K6BMmxiB8fDo01RZ2jP7o5ps
	y5eH6WFEgRBQXkOZBys3gaUmW8o2WAPqYHGpc4fLTB2/VQL7U04c3lBJKQJC5g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: freescale: tqma8mq: Add partitions subnode to spi-nor
Date: Tue, 23 Apr 2024 13:31:50 +0200
Message-Id: <20240423113151.2145120-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423113151.2145120-1-alexander.stein@ew.tq-group.com>
References: <20240423113151.2145120-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The bootloader adds MTD partitions in this subnode if present, or in the
spi-nor node itself otherwise.
Setting #size-cells in MTD nodes itself is deprecated by mtd.yaml.
Fix all this by adding an empty partitions node which the bootloader will
fill with configured MTD partitions. Remove the deprecated properties
as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
index 5ca6b22525469..01e5092e4c40a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi
@@ -251,11 +251,15 @@ &qspi0 {
 	flash0: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		spi-max-frequency = <84000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
 	};
 };
 
-- 
2.34.1

