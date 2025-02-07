Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3679B2343B0
	for <imx@lists.linux.dev>; Fri,  7 Feb 2025 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917430; cv=none; b=bGN4+1h6RWuWX0M44GNDxXXXACQPEtaoB14GLKpK0a24sEUgMygCBZlKJB15olB6MuU/U6hLxcSSNPxRFW+yUHNZsuCz6w5ukaMgj9+J/YFFVhqD7pEs7Ux6OVxMXrmihET/nBMWpTkPNA6jhtrCRbo1ukA6mjL3Y+saTM9BXTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917430; c=relaxed/simple;
	bh=cOF5o6TN5V+ATdWgBW0jgO9n1zkXTUk12bJKODIY53o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PAZ/OPrH5uMwV0+DkAGROxz5aFNV3N13jULDDly+j5P0K26g6JFnMnIU0iNvTgpWKAo4Nm0XNtwm2YS1nbFr+Rr39h1CzCenPuG9d/3C2s9BveVdM7vHX4izYdPNtqRZB5u1YZDdRrW/IGWaKSvb0eQOxK280E2ypzNmiKzF3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=E+kroD0D; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FyU2EShc reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="E+kroD0D";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FyU2EShc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917429; x=1770453429;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a1S8+pFXHpW5Qtqd4mAyz5rzvawWhk+cuQoWwBBkzHY=;
  b=E+kroD0DIHrlFnqr1Yriv13eNL7WCCDruQmdkUBrWh5bIThXPKp2NJpK
   YVv9eGbNUQhLgVOFmWD2G5oyqfZBUyv/Z/pRZgB+LFyUC2Yvl+YlC9rgu
   PSJljMSYBMD3CtLvvFIFJlREY4zdetBX3pZO10nJzhXMd4o9rpFsc8D6k
   MdckuL97mxF0LNZHL+u+7evA8rf/RQ7toRtwpfXJ+/+R6cDsTLzi5kKZn
   F1m3ZCEQ5OsX30OLXNe4/NVvo/jZn1mGmBNIUm5Ki+kQi+rlRau7J22f6
   Z8djHRHl3EQqzQhJVAxHblhStqla/T8OCX7/3+2Rs95LutO6bf90/qGiK
   A==;
X-CSE-ConnectionGUID: SibWdkl1S+y9b3n+e7uqig==
X-CSE-MsgGUID: xw/SnEJbQr6N2mBpPHPcvg==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636079"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:44 +0100
X-CheckPoint: {67A5C61B-4-727D2C21-EE1B71AA}
X-MAIL-CPID: 64714A091E530C861FD836DF9D93E3AB_5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 197BC1682BC;
	Fri,  7 Feb 2025 09:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1S8+pFXHpW5Qtqd4mAyz5rzvawWhk+cuQoWwBBkzHY=;
	b=FyU2EShcawV//6bBdOofeoPWKSDffyu5W3+hU5JwaAHWw/uVv28o1Nlm0iGpgTXakqrovn
	vipTkGsTcnk5JJGDsFs/IjU+5DdxP2lZ0oSX2PG4t0yHGwxHdfOD+5dgSYjImUdXQGzq6r
	ZZ6cnhi0JVL6gX9X26nIbuv3uzllelSkptCHFeakScmTLCj2OdaEc4IxeALupNpV5H7uLI
	C28M9xw94fQeqTl6sHWlxoiHvTMsbiqAfifDpkvJD3mK+3Md7/PeYcj2tlwUtpBAcj8kro
	tjyeTpKhrPc0pyf9dVWFiVl5/eLDuf6KfxmN4SC0gOeR9nJVf9YXqfn3cDAOsw==
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
Subject: [PATCH v2 03/10] arm64: dts: imx8mn: Add i.MX8M Nano OCOTP disable fuse definitions
Date: Fri,  7 Feb 2025 09:36:08 +0100
Message-Id: <20250207083616.1442887-4-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h | 26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ocotp.h b/arch/arm64/boot/dts/freescale/imx8mn-ocotp.h
new file mode 100644
index 0000000000000..43583c4a70156
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mn-ocotp.h
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+#ifndef __DTS_IMX8MN_OCOTP_H
+#define __DTS_IMX8MN_OCOTP_H
+
+/*
+ * The OCOTP is a tuple of
+ * <fuse_addr fuse_bit_offset>
+ */
+
+#define IMX8MN_OCOTP_M7_DISABLE		20 8
+#define IMX8MN_OCOTP_M7_MPU_DISABLE	20 9
+#define IMX8MN_OCOTP_M7_FPU_DISABLE	20 10
+#define IMX8MN_OCOTP_USB_OTG1_DISABLE	20 11
+#define IMX8MN_OCOTP_GPU3D_DISABLE	20 24
+#define IMX8MN_OCOTP_MIPI_DSI_DISABLE	20 28
+#define IMX8MN_OCOTP_ENET_DISABLE	20 29
+#define IMX8MN_OCOTP_MIPI_CSI_DISABLE	20 30
+#define IMX8MN_OCOTP_ASRC_DISABLE	20 31
+
+#endif /* __DTS_IMX8MN_OCOTP_H */
-- 
2.34.1

