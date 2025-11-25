Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDFA314A63
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764067868; cv=pass; b=TIv6pNyaz1jtYgOH8YQeRoLFmNnxJxL1Z+UlgrQORzKxkeWENyH0K0n/fF1O1UZO+PVHj2qVtY9XTt7IxYLD0N+LX5d19cwAnLPboaQeJkGkDvCcE2czLzLfRqiBp340vVZosd27qXD/YZnoJNIzRVcR8OmK+24OKaWnwn+UDrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764067868; c=relaxed/simple;
	bh=NFi0icoHeQUKAw0Iv6PoZfT+ErxWseq3oUUyM9DTBwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+XBlH0ucEhTuSGmWl9/FpsRQJk19hXKs+GulEpXVHzgwCh9/ZYJJJPpuL8iKl30jn2TMm5qhqeg0Jd4AS9VVDH6mF47Wpn45+lE2d8SRlYonRDOR6lkknXt94cICr6n54/aMX+Y/d191BsGfQEc0kI44fLZV2GElZQ8KxlFDTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bYV5qJiA; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bYV5qJiA"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=IB2BJ+NjsePf+RBusrruQxj2A7QMZouxVFNIpo9FL7Y=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764067820;
 b=f2Mf1+Nkm72hlBwHBVGLpFcj7rzejFgwwDloyc83+1oW+VboRNFgCdCIuwJ0oNLuklxpykPk
 FVMgkn0OQRoPjpUOPsHMT+v+03mF535OdMc8PTTzolDVGmfcpJpDqZp5hpg0MZ3YXf1yo5PZhai
 L4Mlk7F2bxnNMCHHLAX+bwyNCGm/CZkI+epCHpGUr12FRBa4Rjxv3QadUvc0CI8aDu6KKrkUJFr
 eY9tipkQNMNrAS7M+PwY9EflQxtRJ/XibISnYkDFRptcDQfSfiaN9x7zSlBNDPJkic3h3T9/y/e
 J4WS53HEruhaA1YDnGkVRZSvByB/VZSIpK5ADiwyzYrCg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764067820;
 b=PKdmotDSGtDRxjnstQiOsaPGRjgqqrtOaONYgB7J9R2uza9gPwU8Tkbd+0oGoVLJSV4AY9yu
 +4j23g+RZp+NYq/aGSaNbVuj1AyRWgwdAKtFgVh+gqTmXM8Dlw35vHKMDyzhDHRPkAnHruHqWQn
 LxV7nGmN8phzOnUxTpPFLxT7PQPjN4KKcIoQfLFUc/DBsA4MslBRVCdMhdYhZrqKxsT9R2ys7ZO
 UlDOxAHKCCwou03T6cXrP1UUGtktVdKnxw6d6JDJR7IgAKVk4zj8f+PG4gk6p/oOS5BO/zYBHTK
 MOaQH1WcAXZQrzRq4Gbzmm1T5ko9c5oPu8GJowQYv0twA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 25 Nov 2025 11:50:20 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 77AEF220B93;
	Tue, 25 Nov 2025 11:50:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: soc: imx93-media-blk-ctrl: Fix indentation
Date: Tue, 25 Nov 2025 11:50:05 +0100
Message-ID: <20251125105006.1612348-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dFzwz1Gpdz3yZQL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:61951b6827d5fb2c244f892ba8d9d357
X-cloud-security:scantime:1.869
DKIM-Signature: a=rsa-sha256;
 bh=IB2BJ+NjsePf+RBusrruQxj2A7QMZouxVFNIpo9FL7Y=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764067819; v=1;
 b=bYV5qJiAga/Coi3Qd0UWpDU5TACStO6qg0/v7mRKhz6EE2bFr28XeksLbf+kl/wyek+4PE1o
 hfvbxifTlOyixl4PFgIzYuSNRAjTSpqtGxbWRE4rPBB+7EYvyuawJO7aOESIzu5BM+Sr/7RASTr
 cc0RJsBeVGl3UEyg/FVvJr9UrfkCqZCGb7cujhBJoFI/iV+yAIoIlf2uRCSw/aphB3hHG6d7D8T
 IQM+LFt1dLVttbno5TVF3bn18i34rdcXgQBim3gQjjyYIMWIXoJI5m2tcSpYiTt1xaC9ytZNclL
 N8PzJwspEdg8PcBL6d2pma5RR9xQl6s1liVxCUPDwrzwg==

Indentation is 4 spaces in DT bindings.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index 34aea58094e55..3173f0c112b0a 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -96,20 +96,20 @@ examples:
     #include <dt-bindings/power/fsl,imx93-power.h>
 
     system-controller@4ac10000 {
-      compatible = "fsl,imx93-media-blk-ctrl", "syscon";
-      reg = <0x4ac10000 0x10000>;
-      power-domains = <&mediamix>;
-      clocks = <&clk IMX93_CLK_MEDIA_APB>,
-               <&clk IMX93_CLK_MEDIA_AXI>,
-               <&clk IMX93_CLK_NIC_MEDIA_GATE>,
-               <&clk IMX93_CLK_MEDIA_DISP_PIX>,
-               <&clk IMX93_CLK_CAM_PIX>,
-               <&clk IMX93_CLK_PXP_GATE>,
-               <&clk IMX93_CLK_LCDIF_GATE>,
-               <&clk IMX93_CLK_ISI_GATE>,
-               <&clk IMX93_CLK_MIPI_CSI_GATE>,
-               <&clk IMX93_CLK_MIPI_DSI_GATE>;
-               clock-names = "apb", "axi", "nic", "disp", "cam",
-                             "pxp", "lcdif", "isi", "csi", "dsi";
-      #power-domain-cells = <1>;
+        compatible = "fsl,imx93-media-blk-ctrl", "syscon";
+        reg = <0x4ac10000 0x10000>;
+        power-domains = <&mediamix>;
+        clocks = <&clk IMX93_CLK_MEDIA_APB>,
+                 <&clk IMX93_CLK_MEDIA_AXI>,
+                 <&clk IMX93_CLK_NIC_MEDIA_GATE>,
+                 <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+                 <&clk IMX93_CLK_CAM_PIX>,
+                 <&clk IMX93_CLK_PXP_GATE>,
+                 <&clk IMX93_CLK_LCDIF_GATE>,
+                 <&clk IMX93_CLK_ISI_GATE>,
+                 <&clk IMX93_CLK_MIPI_CSI_GATE>,
+                 <&clk IMX93_CLK_MIPI_DSI_GATE>;
+        clock-names = "apb", "axi", "nic", "disp", "cam",
+                      "pxp", "lcdif", "isi", "csi", "dsi";
+        #power-domain-cells = <1>;
     };
-- 
2.43.0

