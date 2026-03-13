Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F352ED848;
	Fri, 13 Mar 2026 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401669; cv=none; b=Sb3boZz4vwLaNrIJWTJ2/A+D8T6kYkGj9tbIhZuUodnHEPMS4WtVb3EuTgrMubhrpvyz8QTaORSb73Q1zpRzmUBUam+wK0FruKQBeolBZAmblBbA2GlQ8WAqKAX/8UyIwszxLXxKQGm/Lhj+5xXeAXXXzJy1IOTpeIRs48/jS1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401669; c=relaxed/simple;
	bh=KUO8BDyh9rFnbzg5tX883LD3Q29EGiCHvLbfzXZQew0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfxCkcdvZTHEwOlnTuTe2BDzfZIDMsa7fqG+uz8+mqcbISQKhm03JJrNBR4rPGcDJ04ZKI4EYQlVaeY3DehX0zLMDH9yaGS2lCm4ZjZx5DT51aJjt0SmD/jlCEdkrGtRPD8Lk+IsjqmNyw3XKlJDgvNYOu2UI22dDi8MTARu8Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=C9NPpEr0; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="C9NPpEr0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=tCc/sKraMt4Y6QmqGzkkXdepq6AtQpu2jfZGQHdbWMk=; b=C9NPpEr0kVu8bvDm+gVWUfa53y
	R66J1TWInmlmkLjZvFDRLS2rd0ZOPItjtNTWfPZ6Y+kR3q2ls7+BV/wCKR2msMyUdwFtdBiA3sLq7
	vkmFvIq17mxac9RsssAVlNFruHx+x48cZemuQGXK0fpcoJnwgb83/aRlijLxeQ2FZwVj9+zu9Tnhq
	i30+23IRxQJQNS+z4WNcHTl3HzawsJUbpH5R9FRMgIH5CJuugaKdRjSQyulcvGumkDvrWe7iYMwIT
	JGliMk9qfo+yWaq5jZqIxdTF9oWchjSegie1UGF5Xrkvi/ZWKj1+afiKmfUvkiA8U3jG4a7Gyofru
	yrxLIwVQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mf-00070J-3C;
	Fri, 13 Mar 2026 12:34:26 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mf-0004VU-1Y;
	Fri, 13 Mar 2026 12:34:25 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/3] arm64: dts: mba8mx: Add DSI->LVDS bridge IRQ
Date: Fri, 13 Mar 2026 12:34:18 +0100
Message-ID: <20260313113422.1722787-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27939/Fri Mar 13 07:24:42 2026)

Now that the bindings supports IRQ, add the IRQ line. Add a GPIO label
as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 10d5c211b1c9b..c24ae953cbc25 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -209,7 +209,7 @@ expander0: gpio@23 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 		gpio-line-names = "", "", "", "",
-				  "", "", "LVDS_BRIDGE_EN", "",
+				  "", "", "LVDS_BRIDGE_EN", "LVDS_BRIDGE_IRQ",
 				  "", "", "", "",
 				  "", "", "", "";
 
@@ -298,6 +298,8 @@ dsi_lvds_bridge: bridge@2d {
 		reg = <0x2d>;
 		enable-gpios = <&gpio_delays 0 130000 0>;
 		vcc-supply = <&reg_sn65dsi83_1v8>;
+		interrupt-parent = <&expander0>;
+		interrupts = <7 IRQ_TYPE_EDGE_RISING>;
 		status = "disabled";
 
 		ports {
-- 
2.43.0

