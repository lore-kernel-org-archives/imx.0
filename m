Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766643793D7;
	Tue, 10 Mar 2026 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144038; cv=none; b=hlAANfBy985d/kHbcp/A4dj4fzfGcQsDpab6mXHwBzIgJv4gbtS2k2WkkzRs8vvAmhiadUjnXcfv0G+5rlSd3wQLetQ5BeI7Lqhv07a7EUMOYSk+COwIpZ/nqRYQIS2wBfe1+OwE4atlLyQfYyf41KRnjbY4TbEC6vGVL4IMwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144038; c=relaxed/simple;
	bh=gEadUf8pScbOPPORls8BlDbL0L/N3+GrGRPyXVP6N7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPyDgdfgtgOYavnQtaqgUFImbF0Tek2fqHgWcMvLAtpSyzsww8Vp9DqnvULgjtpNXjTXTeVZnWnGpf8EIwZ12Ro599Ppzo7oFgKcYjtKPSsNEMMlyxRKKJNtVqrHrrthvZ+1kikCJZfRqUUXJz7MoXGX+n5p/oiwiYusDjIdpU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Mn6bzUQ5; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Mn6bzUQ5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wUoAavUyYHPsPUG+WLiIa1Q8RmfP5vNXxKQgznghik8=; b=Mn6bzUQ5hG6shTTSFThJJormp6
	PQ0ktaGGv8gFMJxc+CeGCqLgYQxOXqL8KJ72qt3j1BmEjIUNYIFRgjSqGl3MJCCYZV/bJ/R/zIre4
	6Uonohh5zLVTvrhzSR7iSH5Otbn36n2KJu/OBPcu+mPyyOZUh3PDgOiYNe6Nsl3162g875jvIRcJ+
	u5+miqCgB59C0Y7PKJhOCXpP2CkfsfNpqhmirwCiZt+YaceiZlk/Jpr/5kLE3NVhF4B+ibjmbROVU
	zTIRIHtkE+30gQyuXaop+pGNHbm45uzz9oKUEYx1SNwfN3UoKV3nMPGzI8eNyyGCos9Bmg1ifHitV
	gEX6hCtw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vzvlF-000OO3-0N;
	Tue, 10 Mar 2026 13:00:29 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1vzvlE-000CgW-1q;
	Tue, 10 Mar 2026 13:00:28 +0100
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
Subject: [PATCH 3/3] arm64: dts: imx8mn-tqma8mqnl-mba8mx: LVDS overlay: Reduce DSI burst clock
Date: Tue, 10 Mar 2026 13:00:12 +0100
Message-ID: <20260310120014.3178231-3-alexander.stein@ew.tq-group.com>
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
 .../dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso  | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts        | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
index 29235e390a5d7..102550da70f6b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtso
@@ -36,6 +36,7 @@ &lcdif {
 };
 
 &mipi_dsi {
+	samsung,burst-clock-frequency = <600000000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
index 664f4a6950a82..01d565cdbfea0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
@@ -65,7 +65,6 @@ expander2: gpio@27 {
 };
 
 &mipi_dsi {
-	samsung,burst-clock-frequency = <891000000>;
 	samsung,esc-clock-frequency = <20000000>;
 };
 
-- 
2.43.0

