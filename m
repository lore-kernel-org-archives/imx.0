Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8340731F98A;
	Fri, 13 Mar 2026 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385358; cv=none; b=EnUoGJw7zvGySchGnJWwIlRE/X5ZR1oX3lNml/odyo4V5DN2lCc+zbU0iAnYg3BVoKUIm47eUvbvC3AQqBkIuRQQpNDnogq2jRQhLDsdaLnt9JpFPKu7DNV7epZhks4nTMnLy1tnsG3B/yyXFcZNypB9inuKzM8UxmKvdHgE3Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385358; c=relaxed/simple;
	bh=c/EhKa4zCbOC9qo+DjoOhTuFd/Y/hr2scky9mxnfJYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lo6owf6ym/paPilTxHjwAExK927Mwg/LsnbUTQxau87I35qFhUOaN+HVrq3slVa4x/P6FsLajQueogsCt8ZfCnCsNFs9Gym+zVipIFvTu00vVB7khT1sXcHJas2i8+iJ8rBBnMBA9noNJiEX9nzZOtAcjyWLeoPHsbbJQz2/qQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=P+g2OChh; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="P+g2OChh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YD+WAIAvu9uMcvTn8pDJU/qLVCdMBY10QasA8QIpb+s=; b=P+g2OChhnTQBSYTtqi/S22t9dW
	NGBhfixzLFXLwzzlfGuZjSFu51ZFyUnavF2Lk0R/QJl3DoxGlpVWukFVcJzPCh3sgfw7qQ0cT4qbu
	l1CZpNv7GE6FRpYsvtV1FfGvUS83BzFrEh4ymBzD7EE9wwA5ia2P3KsUvJmjkIT1RppI9vAcfNstM
	E/Qy3YdfvCJE0aLo+rmcXlA2MRhRU7LMmYpF1feQcZSZdes5GR+7Dyr8Ig0KkhzvRoinAVHh9p3gQ
	fInGEGu2MeuXgxhVhVrOaZSIRNdyEVFgIIs9kt1WLnBAiCZvXIilHz4GuiZt6IuzhHCbgxqVo2cqR
	np5rj8SQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXZ-000BWO-1V;
	Fri, 13 Mar 2026 08:02:33 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w0wXY-0005Xv-3A;
	Fri, 13 Mar 2026 08:02:33 +0100
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
Subject: [PATCH v2 2/5] arm64: dts: imx8mp-tqma8mpql-mba8mpxl-tm070jvhg33: Remove compatible from overlay
Date: Fri, 13 Mar 2026 08:02:21 +0100
Message-ID: <20260313070226.579939-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
References: <20260313070226.579939-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27938/Thu Mar 12 07:24:01 2026)

Override of board compatible is unexpected, especially when the same dtso
override difference mainboard. So remove it and update the copyright year.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Improved commit message

 .../imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
index ea44d605342ba..f6aaad91d7f8e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright (c) 2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * Copyright (c) 2022-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
  * Author: Alexander Stein
  */
@@ -8,10 +8,6 @@
 /dts-v1/;
 /plugin/;
 
-&{/} {
-	compatible = "tq,imx8mp-tqma8mpql-mba8mpxl", "tq,imx8mp-tqma8mpql", "fsl,imx8mp";
-};
-
 &backlight_lvds {
 	status = "okay";
 };
-- 
2.43.0

