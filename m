Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B8928BA95;
	Fri, 13 Mar 2026 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401671; cv=none; b=jniHFDFWUMLlkydNyf2gqnhuFT+K01ncVz0pkmV/cJXIWxk0z4vM3XmRTc0DQX2+g1Kb7yWjMMbaWMqGtdDrDJS79VEidFtldA99NG/DhxeTaRdvggWchC1poOSUbjtqKEU7IqIVYQmzDsGI8+DD4GfJjDWkVQKcQqcko0zxck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401671; c=relaxed/simple;
	bh=XXFRM9gdf/L9oKAgc4nzYM1lMzwM2HjqvMqPJVGBNcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJp+tDLTALWwPxFJkk5farGtwwXubgGA3G6YNrT3kpkMHRtmPq4qoMjo2DBZqWSnDsbk55RGwlS5LvaUnFofsDJ1x0A4IK8qmt9/tLrwvdk6AR4IARM7a02kpTI+CBZPtT42U/xmC4BnWXJ7v/QzvJHuvkW6wufnKimqVq0k27U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=C24+MHx9; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="C24+MHx9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VjnQd5X78Z17qUNY/CjSBfwHi61igTR49wOu82EKJas=; b=C24+MHx9Mgb4ZQAmDbZ3j0qR1J
	lpDhTw+lompiKtfEAz3xllYrJ0Rad4/aNAdT2DGJpYmoo4o2Y8uYNCQsBpxG6xnVoGX4pEgFjoxjn
	NVFyhjgDyPc4uKHjJkt0PtmwCU2d+32E9fMBJhAmTqrFGSVkpGs8ByTQjA9R5CIZVtCZ6UGJteIIh
	cNJwqsQ6xLovSOI6p+ibqSnVd/4fJAlzJ0DjhIt+eN9cuxh8+++/i8ZDXbvUz9cOglCsP+cBhNEj9
	1Xt/ANSkGG8ivu5BgGpJVPw/zd4T3z6cwVB0JslpykGiq5vzfnBdp5yjFg+vb8GTKGXR0wIMfq4Lo
	/I2kdujw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mh-00070m-2p;
	Fri, 13 Mar 2026 12:34:27 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w10mh-0004VU-1H;
	Fri, 13 Mar 2026 12:34:27 +0100
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
Subject: [PATCH 3/3] arm64: dts: freescale: tqma8mqnl-mba8mx: Add dual-channel LVDS overlay
Date: Fri, 13 Mar 2026 12:34:20 +0100
Message-ID: <20260313113422.1722787-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313113422.1722787-1-alexander.stein@ew.tq-group.com>
References: <20260313113422.1722787-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27939/Fri Mar 13 07:24:42 2026)

This adds an overlay for the supported LVDS display AUO G133HAN01.
The same overlay as for TQMa8MxML can be applied.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f1b54f1b0a23a..18fe5134ff407 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -216,8 +216,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mn-vhip4-evalboard-v1.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtb \
 			  imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtbo
 
+imx8mn-tqma8mqnl-mba8mx-lvds-g133han01-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
 imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtbo
 imx8mn-tqma8mqnl-mba8mx-usbotg-dtbs += imx8mn-tqma8mqnl-mba8mx.dtb imx8mn-tqma8mqnl-mba8mx-usbotg.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-g133han01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-tqma8mqnl-mba8mx-usbotg.dtb
 
-- 
2.43.0

