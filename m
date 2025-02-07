Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594BF1C5F3A
	for <imx@lists.linux.dev>; Fri,  7 Feb 2025 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917451; cv=none; b=RGy3Va8CXhWsYlGIcePDuckmsWzG+GA2OLIXhGgNJsg2glpMiIHRBWTnNqQjRVLQimCSrmVDnUJ+mxQSnDh98ZyphdPY8fZnlI1NnNDwNgRu+379yqd4TeAuRePt0NLbuB0sJUD/cWOOXj6uYuzkMu8ueAVW2MfmWpRp5iNVFbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917451; c=relaxed/simple;
	bh=epKjLi69BVTeU228sYLbDxc9Gb/CXKXnDmdzd8h1hXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lN8Vw++cidZH3nqyZvmBHL7qhQlVZ1I+z1jOI68eOY7s1M4gXaTHhAs2Od5Y4+aMVAWE1/4zksw5KCs4E+s0QZUZWF1VM0NxNsq6ilzTdbDc1ZL4yk/wyruiBtW8SVp9LtrsJ1R5gCjSQHBtFquV1a3a9h21QC6Hj+IieTpxxJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=eS0rfjRz; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=B6UFfvxg reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="eS0rfjRz";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="B6UFfvxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917450; x=1770453450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VU2LURvpuWlLE+ZwmrPv4Em3qMpL5cubt9yeIQOASOs=;
  b=eS0rfjRzSfmHPnjjcR4/auoZTArVAy5pwiM3lwwVxmlfCvJH0finZusy
   jVex8cG5H4pAJGIIENV8Z5CXXNjKlTJrrLDQo5fyJIlDEFr/bFn97kco+
   dVSJ8F30gm0WzXl77hzcBsXPWiTrDLdkVntOtxeGrn7C7ViQXOHMaBG8g
   Ztpykgz5yZq0bPVr7kPdUpeswa6MloW8L++1c1Mm/gaF1LWrZICvyLBYr
   gHEhepYME4sOv+W74Mk90104efrK9e+qd42FZCqFOe2HBPm+sfrU3MUHV
   u3ghfwkRtry1GSvDGCtvba6NiJ2Vjxey6DAgpkBNxl1q+jt4QcGHRmzwk
   Q==;
X-CSE-ConnectionGUID: zhYXy1pMQMaw6xj8EE0t+w==
X-CSE-MsgGUID: qpsPfg0xSFC1EqN34PCUPQ==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636110"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:37:07 +0100
X-CheckPoint: {67A5C632-1F-727D2C21-EE1B71AA}
X-MAIL-CPID: 085FFC876C4E2B2C688DB0CCF2FD4F60_5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B26AE168340;
	Fri,  7 Feb 2025 09:37:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VU2LURvpuWlLE+ZwmrPv4Em3qMpL5cubt9yeIQOASOs=;
	b=B6UFfvxgpjxaOWt4ibeMzpDJYTFrDEZsULVwacDBAc+fxFfOab2dnCHxhGdfzHF869KLmd
	dKM7OOIrGcC5QTip0wbtBWy6hmW2d2/oJebTigXEC5Js5P/SvTCXywbi/7+6Bs/O6ykUXU
	1noXifBhWs4nAvMvd8eIase8vIZ6VWBSosCmpzhHEjEWZb/9+ICO67vyEcqBKwML0++K5Z
	Swi8J4kvjAkfK92x5F6Qav057rTkqqVQVmTxQ0th18JUk4S8t7lY148MbW3xxLOPoS82PV
	8oS5CdHuJG+/iej8ofv6qf+z5udSJi8/HnFoBFRa2zrsRQvOUUl21j4zcQY4HA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] arm64: dts: imx8mm: Add i.MX8M Mini OCOTP disable fuse definitions
Date: Fri,  7 Feb 2025 09:36:12 +0100
Message-Id: <20250207083616.1442887-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

These definitions define the location of corresponding disable bits
in OCOTP peripheral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-ocotp.h | 31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-ocotp.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mm-ocotp.h
new file mode 100644
index 0000000000000..87698e7619262
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-ocotp.h
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#ifndef __DTS_IMX8MM_OCOTP_H
+#define __DTS_IMX8MM_OCOTP_H
+
+/*
+ * The OCOTP is a tuple of
+ * <fuse_addr fuse_bit_offset>
+ */
+
+#define IMX8MM_OCOTP_M4_DISABLE		20 8
+#define IMX8MM_OCOTP_M4_MPU_DISABLE	20 9
+#define IMX8MM_OCOTP_M4_FPU_DISABLE	20 10
+#define IMX8MM_OCOTP_USB_OTG1_DISABLE	20 11
+#define IMX8MM_OCOTP_USB_OTG2_DISABLE	20 12
+#define IMX8MM_OCOTP_G1_DISABLE		20 18
+#define IMX8MM_OCOTP_G2_DISABLE		20 19
+#define IMX8MM_OCOTP_H1_DISABLE		20 20
+#define IMX8MM_OCOTP_GPU2D_DISABLE	20 21
+#define IMX8MM_OCOTP_PCIE1_DISABLE	20 22
+#define IMX8MM_OCOTP_GPU3D_DISABLE	20 24
+#define IMX8MM_OCOTP_MIPI_DSI_DISABLE	20 28
+#define IMX8MM_OCOTP_ENET_DISABLE	20 29
+#define IMX8MM_OCOTP_MIPI_CSI_DISABLE	20 30
+
+#endif /* __DTS_IMX8MM_OCOTP_H */
-- 
2.34.1

