Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF156A32B
	for <imx@lists.linux.dev>; Fri,  1 Mar 2024 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709284474; cv=none; b=i5mEtbMBqyhxEPbMct1LiKMmxpY5P/LQMVFh2pnsbt5cfT3HJi4QOKUIvxdr1LKq388+FkCHtOdLztvxuYzjln0U7YCYpZmSOlQZXtk2cDHnGNrW0gc+iUSCg+i5iOt7at/v7JahtPI3A4sLldbYqALNfGWMUzfHuDCrUhASURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709284474; c=relaxed/simple;
	bh=FrwHZ9w9xTTtYLHM0eJYuip9mto9w9P9KtfcdJQDA8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XNjhxmfeBsPjmHcKd6ZmVn9yy6qRiHTPg60xRA8RDslw1iNSEMrET+NgErd2dRTd/2VgIr61cKeCFHtDmM9+0mxSCNEVf7kVI2aDvHBmhLU58K3cWxpZjLjPQeF6omh3e0d87ZJdq7kGnb6NTM66FQB1nkNwLRdAjcm2XXtKiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Suew9u5h; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oXtxSOiJ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Suew9u5h";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oXtxSOiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1709284472; x=1740820472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cE70ciaNhFvA6Vb21y4hOf+k8Cex8gPGVr4Ivb9Yb0w=;
  b=Suew9u5hweYsWHARyNtK4jWjvJdp04X2mK1QMvc4UOYGNDgy2mk/Jbb6
   Mv/cxJKnGCjCZh+ElceguBnOLC+uD8gZcar4wFDNUXyAXNN8ljUH/oeQB
   PNXtNeG+2aNwCqCOq0bmEs5NE3xirCt2cMAw3L6EVykXuRwnlF6uR8Yjn
   KV9LcXjE4DP51OAwCoDwOPw0PweIwMYKMO4VupnNbEwK2SgQ6su5ihjsU
   jXxOS1b4vWFtIEs8MIlbpYkAu3UBD5m/YvEEjyIcUJcU1bUByTE4x4ziY
   A/jiwQA3Rpl7KNVGyGv4r8Pgvpzu5+wn2P29/sOP7E5yOIN0MEr14Qlhl
   A==;
X-IronPort-AV: E=Sophos;i="6.06,195,1705359600"; 
   d="scan'208";a="35682438"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Mar 2024 10:14:31 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6AAD717351F;
	Fri,  1 Mar 2024 10:14:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1709284467; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cE70ciaNhFvA6Vb21y4hOf+k8Cex8gPGVr4Ivb9Yb0w=;
	b=oXtxSOiJoNpjQf//aROsg9t0Ti1Qr5QnpjiDkY2keH2SNMqvQVdA22VXKscdLZ3czIoYVe
	9q0FxYIIWkbuUBmofcXu2S2AqT969dPUHtFyagRoIf7Gjah8yhKW9qjVsM1VoD6v40+FJn
	DWzbcsgZjqw4qXYttvpcSHR5hgNyQAlvy65E4iuj3pWpQe+lf+ert65fygW4dWNa1lTNv/
	WYcK/1mMUSk68+s/JqX3oMVqGDsDN/20CaQiJojETV9tJi4qI8N+gGpmhV+tcIU1qohEwo
	hZuvSQGfG477763yM/Z1uxIgNtcLFiyqCnwxrEanNX3ZkW47Op7EtxDhWMOMXA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 2/5] arm64: dts: imx8mn: Add empty DSI output endpoint
Date: Fri,  1 Mar 2024 10:14:10 +0100
Message-Id: <20240301091413.3050689-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301091413.3050689-1-alexander.stein@ew.tq-group.com>
References: <20240301091413.3050689-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Also add a corresponding label so overlays can reference that node.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 619cedd8407c4..81ba70d7880b5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -1104,6 +1104,13 @@ dsim_from_lcdif: endpoint {
 							remote-endpoint = <&lcdif_to_dsim>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_dsi_out: endpoint {
+						};
+					};
 				};
 			};
 
-- 
2.34.1

