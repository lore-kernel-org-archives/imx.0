Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5C439C007;
	Tue, 10 Mar 2026 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144039; cv=none; b=CMISjKqIk9Whh1MGJOIEnh2bzNtVHLyEfvISKnjpghJEo9u39AqbAvu/WHFjyBPSqyJF1KsHmEpMqPtDepTNHscDGp2LdDtDIoDrLkYRHlLKDP6e6znCJfCZcg7OvfS9dnr0nyZ0/LwEhYeKYBkvqpjDdsezBF3hNgq/3jFS5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144039; c=relaxed/simple;
	bh=jusdHucjwuYdW9FB5i2cn63fnZGk7Q0gav2VSNxud9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hmP2qWXXbcpb5lck22dpraiNa5uLvSP4f/JAUs7tlvVraK7tuRA32Rg5InQtIxZJ50Wk76a7p+mA+nkFdBAuxCZMBzMZ41wX8+yjfyoV/s7PYzsjvoVgS+XnSoXLUp975GRn3vqsGzgo/aOjr03AkeVRjr/kZVS2S5JXBIdKyIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=D3qcOSl+; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="D3qcOSl+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mns5kHjya87yBiuGsrLcPjseRn6aU4f5S1UjSPze5P4=; b=D3qcOSl++jizeMT75UxChGOutm
	Okix0K6WZUTTtI00sULXqfm7ZEbmEboX3E8qcyk6gzCDVNVPnwj1UaARpsf3tqi08RKvlDeJsI02o
	5PDNjbPD/Y9HlwKqa17Eh3vl2mhrpRFL+B/zuqWjRX1qsuKkTmTbE2snOFrcNgW44Q23El1I1IcmC
	XJ1PrDnt/lBBxF8NVSu+77toU216p1iy/CxHIMkdY0udrMivy8z3N0f7Uatg6wmmtsUAC6xBAkCLW
	8ojIvKfCel7+WTRCXsaAyxVWs/SciHzocGscwfj+FKT0B6kkhVmLf+hntzmbyAKW6j9OMXgY2GHx0
	JnNw93IA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vzvlE-000ONp-0W;
	Tue, 10 Mar 2026 13:00:28 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vzvlD-000CgW-22;
	Tue, 10 Mar 2026 13:00:27 +0100
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
Subject: [PATCH 2/3] arm64: dts: imx8mm-tqma8mqml-mba8mx: LVDS overlay: Reduce DSI burst clock
Date: Tue, 10 Mar 2026 13:00:11 +0100
Message-ID: <20260310120014.3178231-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310120014.3178231-1-alexander.stein@ew.tq-group.com>
References: <20260310120014.3178231-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27936/Tue Mar 10 07:24:39 2026)

The DSI burst clock frequency is to high resulting in flickering. Reduce
the frequency.
While at it, remove the burst clock from board configuration as it is
display specific.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso    | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts      | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
index e44249c6d8a09..0b52607e50059 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtso
@@ -36,7 +36,8 @@ &lcdif {
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

