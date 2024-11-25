Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F20517E010
	for <imx@lists.linux.dev>; Mon, 25 Nov 2024 08:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732522730; cv=none; b=cTGIzfu8Y55fKgR6X2FL3MhjoDE/mTPSmeJHtplmVDNCAts+TYU3ojNyCXOsBByhgLZH5wP/BoMBooJ6uKNE/d339FbeJxZ1eL3zR+BGPsW7fsTb5JL58mBaFeg1+eFpuWGpl3zvXkTDa7sQLuOGjbLIG+2RuHE63A5igWB502U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732522730; c=relaxed/simple;
	bh=HSGbcxcpCnIjzIER8Q65nHkgT1znY/xVpPQxT3m2tjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a+T0w+Yugu+/NXajqFuuXZem/3VIQ2HRSptsfNmjli62RwkDvkxe61mCBkbVSXend7V3D/WXZ+e2cG4qa07VIHJaKXfgeYS6QTYDrmsaFgulxqeQjJOrTxA20ReMRUE766j+sjLMeDF4jvVxCVn5wAF3xxLqFRobP/BC0R6cOXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=FmmNpQy3; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="FmmNpQy3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=haW48oQXOuo8ByUf64fZOxiyomoePVLzMuucW0s/YDA=; b=FmmNpQy3Y2OUKU8QsWyab3YgxQ
	kt9YVOu1iwPNj5HOSzxrljCP2W4HMbKt4sQhwTGE7mpEBmuy7epTYDOD1FTXQudE7wj4uAcr3/y7V
	J5J2hz+PuTWV8WxcNGEulDVup68bqltIPl0aa9H4jG2v7yYJt8UZslyau6ZPUMpCqOh2eHXzWROyK
	IL4nQinY0D82rQwsgvhOu3CauC51avWauksQI7RZebe7/eBJTWakirubF2keCGr/Ag7Yll8Mwz4ko
	DUXmjUGg/Di65WTAP1LSeUrjh5ysmHcfA38l0kdSZlpoKsLLAgMSQ6C2hYFg86FcaaveFAlhnUV9b
	zO6OkBOg==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIw-00Eq70-1B;
	Mon, 25 Nov 2024 09:18:46 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 14/15] arm64: dts: imx8mm-phycore-som: Add no-eth phy overlay
Date: Mon, 25 Nov 2024 09:18:13 +0100
Message-Id: <20241125081814.397352-15-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Teresa Remmet <t.remmet@phytec.de>

There are SoM variants with no eth phy populated. Add overlay to be
able to support this.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/Makefile               |  2 ++
 .../boot/dts/freescale/imx8mm-phycore-no-eth.dtso    | 12 ++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 5bc083a7b778..da6ddce6b7c7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -125,10 +125,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-rdk.dtb
 
 imx8mm-phyboard-polis-peb-av-10-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-av-10.dtbo
 imx8mm-phyboard-polis-peb-eval-01-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phyboard-polis-peb-eval-01.dtbo
+imx8mm-phycore-no-eth-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-no-eth.dtbo
 imx8mm-phycore-rpmsg-dtbs += imx8mm-phyboard-polis-rdk.dtb imx8mm-phycore-rpmsg.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-av-10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phyboard-polis-peb-eval-01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-no-eth.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phycore-rpmsg.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-phygate-tauri-l.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtso
new file mode 100644
index 000000000000..dd66ccfbb4d7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtso
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 PHYTEC Messtechnik GmbH
+ * Author: Teresa Remmet <t.remmet@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&ethphy0 {
+	status = "disabled";
+};
-- 
2.34.1

