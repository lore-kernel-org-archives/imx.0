Received: from mx-relay36-hz2.antispameurope.com (mx-relay36-hz2.antispameurope.com [94.100.136.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6491230DEB9
	for <imx@lists.linux.dev>; Mon, 22 Dec 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391547; cv=pass; b=VHaZXT5ybb4+NWB2KzOh2l4duVw+Oli6C4LHkpewgI6pIn308Fo7afaUJwsGdLCWkoYK357Mt2FzcxPTE+iCySXPZq8aUYFMN11BTlikuUedd86KZvpBNMp+x4PwvcNDYQvSOUvRhR4o4mgwXTfP+DSixRmvFZ7dq1/8xRow+dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391547; c=relaxed/simple;
	bh=7Kha4etk7Ta02lxni42PAENRkKky7hBrerq9amiVqr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftZ/XQsVhOcHFQdyWahkszA/W8S5t0IApr0tBIrMmSxxPGmfzKe7NNHeIdOT0REp7ksuUppDWaloh+Cx56jZERdjhEsQfZNYsBzGhmBWgCFcMvay1quS+dvtzcF3bjIymmMjymxH+lvPv8iap/iG8lMmyfemAebTGF4aa4yrfk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hI+XoOcy; arc=pass smtp.client-ip=94.100.136.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hI+XoOcy"
ARC-Authentication-Results: i=1; mx-gate36-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=80hdS/w+v0x8DWisrHsGxaZlP+KSYRcYUlXhBDOL7cg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766391512;
 b=dW6/jNdurnidG04s6uKoYLDzgPNAGpI9ijl7nYouXWODm2abPhucqu2fKRHqRZvCGjznYJcU
 JShkVjPU8StHRSocIdNWT8bUPffGwxDOCIDIbWCiqFtolnXLo8g4jQK6hHXvEekWt4yrFLW1NPX
 //bXJ/mlmrxpLNLNDgfOJbKZldedv58vZd11lg2INBOX2/vULFYV/yGutsMmSmE9PPre+n6F78f
 Pv4lFtJr7W48GCk4DIOxKQWgd5d5GT8JF3AyNn5Uj67CFHuDWt5PiP5x8+9X6XloN/ahCkf3ad4
 Wi+0X1qDEKuB3bR/wg/27YrP/HifqbzF5nude6ot5DuVA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766391512;
 b=ZFF47xIdJjm+/LDDKxUCen0LUi8JMPzSf1UyfbKvqC8tfAoL7NTlzJ8OTfiYnXfFWky03ESC
 xVEiCsCO/rYgvqIyhWQFZsJE8+z2hV82Gho5fra6eUqk0sNgtLKnOn98sIVDzzVt0XPtBhYmlf/
 SkBu8k3vbx1Krp02YwWECqGdPhMIVt6kEu9OxpkpIS3UPj5YqdzT+Ved8nPP1FUL3PuInuNvm8o
 rZBnCBitMUNrRqDnH4j48UNNffZf1SQJMsC4aPKAQ43dYtMtzHsbd39NZiPJ/8wbaKmc3xehI7l
 y7YC7H/BUtRzbNhQMt/qvi0aDVo2rbGJXv76olFEUUT5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz2.antispameurope.com;
 Mon, 22 Dec 2025 09:18:32 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A8402220D99;
	Mon, 22 Dec 2025 09:18:18 +0100 (CET)
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
Subject: [PATCH 2/2] arm64: dts: tqma8mpql-mba8mp-ras314: Configure multiple queues on eqos
Date: Mon, 22 Dec 2025 09:18:09 +0100
Message-ID: <20251222081812.1120998-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>
References: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz2.antispameurope.com with 4dZWHK4xCLz1S5Vj
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:99bff2056c426201606ecfd6bb8a64f5
X-cloud-security:scantime:2.201
DKIM-Signature: a=rsa-sha256;
 bh=80hdS/w+v0x8DWisrHsGxaZlP+KSYRcYUlXhBDOL7cg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766391511; v=1;
 b=hI+XoOcykhtxcWXM8FTH5hNzT4PmILANjMnfQkbyR972TA1EndR7amwjOnU6eRPr5jGCdo4g
 Zzj2YDkpQYe89RD5ZzkmPh/qTSUIVUkfWEC3DLzNd+m8gIcP3uPYclHO9fyZiWjSukj0gb34sWh
 Xywvt+wzVazLAa56hBaJk3u9fK2+uk8iZrzxxX7DG5fFzpXmEGHgnZtZQ0c2i1FG0BIEGLknuR4
 MBVTzbPU6GliPr7O/DtX5tHAuo/OSRAkEIQNXN7+ybBk77tVbnAsedzXHvsPnT5I32+mGOBodZ6
 CL8m0s8ehrWEs6tvdL2ptzSs3Otx9TbEqJUFibhe8EPTw==

The MBa8MP-RAS314 mainboard has an integrated PHY connected to the EQOS
ethernet controller which can support up to five queues. Configure
these queues in the same manor as done on the imx8mp-evk.
Setting DMA to threas mode is necessary to prevent FIFO overflows, see
commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
on eqos")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../imx8mp-tqma8mpql-mba8mp-ras314.dts        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index 204bbf0719890..b0d058833fbbb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -184,6 +184,9 @@ &eqos {
 	pinctrl-0 = <&pinctrl_eqos>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy3>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
 	status = "okay";
 
 	mdio {
@@ -209,6 +212,70 @@ ethphy3: ethernet-phy@3 {
 			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
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

