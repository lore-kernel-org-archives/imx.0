Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D9183CCC
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723533671; cv=none; b=drttUTXUhWM0bNSI9j2JoBSmB2T4pfpJM8gxHdsOROxMpNpRNQu9wdgLfhHTk1VDT2RvOPdNTfux8T9ptC46l9OIo50FGfH0DukWJxKAvKy5Pn6eXsbaUh0brwDbkYw//f0Fd1zD50KQ2WPbTfoWZnyeqL0d5WT5T9W+RlhC4aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723533671; c=relaxed/simple;
	bh=V40BVvFUf6ZIWwRzqovtUfVHibZcWMqMI9Ar0vrxWGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UoY4nUF0u94boedOieGw40iEszoHXPrHF0e5lydFDgL8lYDUT5RYplkiJYgmP7ugZKNmCLEO7ZybFrw9kjWrsNhiW6+2U89jVXBK7D71/NNp63fVFvCmkcxXmerhT5QU2TseXtJa9MHSsiXYoPCxBQZBi/hAiWlQVIWS70Odp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Bd8NGtuK; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=M//CoME4 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Bd8NGtuK";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="M//CoME4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723533669; x=1755069669;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kiriv8qE2Ro9GyQKsdPjDqMoORj3XrlU/6FzBRgs4ek=;
  b=Bd8NGtuKV8dC/xtbS0dgWWnSvYavbhSQjDqtwRC5V2epaHxjixsUrgwc
   R4EBUOteJMmH0N0Mkdz34kVA/LG6y0f5YRxlFkAp6FM3/N7WjAq/CBnHk
   +uCKGZX5Z1ROCKl4GDvh0pFduuvudUAw73LIm3Y2JfGgP0D+vIeLi8zAR
   0VxpZEXqoqf5yYmxLlzFFZ2SZD8VSyvaOrymsFCoqfQ5Svf/xwJcm3EC3
   3L1CAHB2jak0DncbFUV0QlLKxc/cZZXrhHDAdIpGM88J75tMzDA4VAWGm
   J7iA9EytJ6QfwdefzplqPZpVWUkvfEnEMCHk+mMDzkeET+zn15bfhOCJ6
   g==;
X-CSE-ConnectionGUID: 7JcCFCCWToOOtdsYlUtvWQ==
X-CSE-MsgGUID: LgrZqPQLSlGADsRHW17Stg==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38376019"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 09:21:09 +0200
X-CheckPoint: {66BB0965-1-E9ED6009-C4B0BEC8}
X-MAIL-CPID: CA06FFAD9E8F49EBE18E267DA9BC30A1_3
X-Control-Analysis: str=0001.0A782F27.66BB0965.0080,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8584016A295;
	Tue, 13 Aug 2024 09:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723533664; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kiriv8qE2Ro9GyQKsdPjDqMoORj3XrlU/6FzBRgs4ek=;
	b=M//CoME4BYRKDUb+thkrYCymguWUhHtgVWDuNXs8hP7Xw9NT8W0pV9Jct+4Ci3gQPBi6qE
	XeEbnD4CLojAAbP/mumiFuX3tfWxGcg7STuNAUM2v63+N58axa4PaKj6+smF+4f0W0Sw0a
	MmBRHpreUCLuZmGQzedWWAsPbK//cwvGxbF375sNwg+3IeERAgA8OzPLSJ+wzxg2X1U/9n
	UitIA0BnXA7gDLUzQARbu1sCdDzLXRG5Hs6r7vuS8yFHBfOmTyqwhubJ3D2T1BNm6OU9lS
	uWFl28e4dKx7+uo8YR0VvnC4vDjoa9HqWLh1X3yYSc2PX/hiHfnerRtramXAQw==
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 6/7] arm64: dts: tqma8xx: use GPL-2.0-only as done by included imx8qxp/imx8dxp
Date: Tue, 13 Aug 2024 09:20:18 +0200
Message-Id: <20240813072019.72735-7-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240813072019.72735-1-Max.Merchel@ew.tq-group.com>
References: <20240813072019.72735-1-Max.Merchel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The included device trees imx8dxp.dtsi and imx8qxp.dtsi are licensed under
"GPL-2.0-only".
Therefore, the licenses of the tqma8xx device tree are changed to the
same license.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp.dtsi       | 2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp.dtsi       | 2 +-
 arch/arm64/boot/dts/freescale/mba8xx.dtsi                 | 2 +-
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi                | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dts b/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dts
index f35514b7b338..d74b5338befe 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
diff --git a/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp.dtsi b/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp.dtsi
index e2de8517aa0e..9d2bf9178d86 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dts b/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dts
index 7d2e98bf8bc5..3544c347cdcd 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dts
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp.dtsi
index b14040bf4ddd..c3983391486d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index 276d1683b03b..3149c383e1c2 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
diff --git a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
index 366912bf3d5e..9659804c5f3b 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-or-later OR X11)
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright 2018-2023 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
-- 
2.33.0

