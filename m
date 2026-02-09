Received: from mx-relay186-hz1.antispameurope.com (mx-relay186-hz1.antispameurope.com [94.100.133.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D03793BF
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647825; cv=pass; b=uXQKV3B6QVOcU/iMGZy5QhX8x3s1qoZz7Fkl4JPLtTYvV4A6usKFX9vbLaT9u13dAvkva1tbH9RbKTf01jKazq1dxWih9Tb1xZHAOmZi0p8Nzy5BxfOne/Cf/Ws33hsVbVaAKK12dysjAuJypUA1Y/x3tp5+zZFgcJrC5Do+O6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647825; c=relaxed/simple;
	bh=zSCFwLG7ul6NOSki73bwKNNrOcsAYXLywsqttLdzIyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+NhLn6CD6ZiRY3ay1td5YcDfpRlmzGrlDLxHntW/CZqZ7SxG49RqCfzNHdC/5Ku4LTPltjCSR0GGKy5MYZ6l/GvnABlmLIjSu/12DKf1lFJPhueinxBMJJiLooegk6OnUdvbjKhRV8B3wZC9sQoWCc4NjG4tbcK85/K1c09pNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gUZkIzv5; arc=pass smtp.client-ip=94.100.133.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gUZkIzv5"
ARC-Authentication-Results: i=1; mx-gate186-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=bW8kBX1s+EXbf2lLP1wP7V5qCWYSVmt/hNU3H0N9lZA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770647778;
 b=BkmCdzRAw11lJZ8xok276VG0mETnRJzSXXI9dsNRAc259yinZpLwFD4Bo4SrQkHzAFcdtVZm
 yjDNHfYo6eD2w5rDDxbBibUMgHntbQrXZXCserm9S/ze6R6mdOZuiHbHh8M152+FqFys1WyyKX4
 IYhm9sciT0rt8FjBO3ZPH8S94sEOXjrNGkU+5xf2fmaG88Myn5ZKGhHfXVNpIeC3UX3MgYsbqmk
 6Y1zQdyAdYNI7TYLT0sZSkbDAktDAhJjAs62KLLqSXAQdguphpHF8E4GUxUHy8RBtgwmiAszy/b
 8CV4tOhRawk1vPsbwq9q08mGzdtilPGmZLFzVUm2Hbe8g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770647778;
 b=ewuVVg2Wckc3Ndmi0mFIg67dDGgWn7HH02S/hh3dQTkqZVruZ+qniYpinOlam7Plfs4rsfjs
 yCFvKNYulI4YEL31ncxz8JnAXWvQoD7r5ATYq3/wFZiknItptriocHi3UX4gk/v/LpcXDNeOSyA
 QnQjG/LxrgwIKICQg9UC2/0wdbkdKPrX2FeYSiACZXOMezonOLEW3dfMitF8U+zxq3QSO5eyBo0
 JjpMSxEQ2Ig4BmtGSSZ4/t63ekLlEzoO17PcmtFRAlg+O3GvAqcXk1Zzn6RlAl5w/eyQzoCkdRC
 xVzjWvJWar7ho8q3ocq8KAmAD8A/1PbGr9Kjz3Z8lBz2Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay186-hz1.antispameurope.com;
 Mon, 09 Feb 2026 15:36:17 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 18416220D21;
	Mon,  9 Feb 2026 15:36:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple queues on eqos
Date: Mon,  9 Feb 2026 15:35:52 +0100
Message-ID: <20260209143555.202042-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay186-hz1.antispameurope.com with 4f8nLY5s0Hz3xgwN
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:405bf8049cad9f07363be847723c878f
X-cloud-security:scantime:1.927
DKIM-Signature: a=rsa-sha256;
 bh=bW8kBX1s+EXbf2lLP1wP7V5qCWYSVmt/hNU3H0N9lZA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770647777; v=1;
 b=gUZkIzv5lqNt81+L+SWIhyzjw1yV+UCNhuCeag2v0M/2nJprZOxXpRDbCXC2SuypbebYPaQv
 ne7JhSFeW9pWwE3zf2F5ZQasFeWGymHxfJwC+nX05CfzuTgkWQaSH61h/IyJjzyJnEV5mZvPY23
 1pZWrOBE7zOPqeacxy+SCej29Ur9knCqwiQDqO4yW1ZCJwiqWuLjD7U4+DpBXbHfGaREKUuzuYp
 aiSaYRA//VXqzq9i+4v5nGo5KPHHq7J7f8TfBpeSLMuX0X6OmWGWeG48vS84E3/sKF5lY1PgUZD
 daq8bUu93Bt4taKHx5sXqXvYbxGXsq+waHln15xTxpx2Q==

The MBa8MPxL mainboard has an integrated PHY connected to the EQOS
ethernet controller which can support up to five queues. Configure
these queues in the same manor as done on the imx8mp-evk.
Setting DMA to threas mode is necessary to prevent FIFO overflows, see
commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
on eqos")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Rebased to correct branch

 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ad49bf85a04d3..890d1e525a489 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -336,6 +336,9 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_phy>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
 	status = "okay";
 
 	mdio {
@@ -359,6 +362,70 @@ ethphy3: ethernet-phy@3 {
 			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <5>;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <5>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+			snps,map-to-dma-channel = <0>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+			snps,map-to-dma-channel = <1>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+			snps,map-to-dma-channel = <2>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+			snps,map-to-dma-channel = <3>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+			snps,map-to-dma-channel = <4>;
+		};
+	};
 };
 
 &fec {
-- 
2.43.0

