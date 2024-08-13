Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B917CA04
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723533666; cv=none; b=Fo8egIxmn6NuFatSM70b2qjLFH5r9hUBEXiFMHuqpgipB4lfY5kIgPJz916phwpveNtNg+MUTio3G8WULJ2Q6yeEIgpI5bHHy4hJgNEcL5/tKMqn3xdJ5Te1Dtr4DAPW3pOjZ0eRuOosr4MC2UZb7B0/EAVPd+MnDfGppf9D+To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723533666; c=relaxed/simple;
	bh=Kin7MnpVygtHSbTCoEZLVRyihCE/xHzrd8FLoLfTMO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gGbGYglizLgo0mjCZcQF6xucmtAGnWEypKWlCJU/qbbjBbkBcsvdEjoquiEg2dcyDi7weTyAhZa7dJwtvBuptf93bpVVjbOV3CUjiM7sUtiEIwhn0msAuz5bkfFBFdf3BFbl4B0KaEiH9kqXdgahLs3T+rSToL3Jb2Cyp4/fnCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=GBwDSAS0; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hohTyCy1 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="GBwDSAS0";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hohTyCy1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723533665; x=1755069665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UkG02IRLbuQxhId6LzbXT7Ov2Aqgx0DWfjgykqx/jT4=;
  b=GBwDSAS0NteHAmOtzNwzdWIQBoQ+iXGeHvfUOqnR3ei/BE4pvvKVjB/l
   jyJvGIxUjXZX3BPiQl224g4n0ampQs+wFeJd8Y/ESHWV30N9HsXNb4w+p
   3gAidjKE3yQl3RreGBIqHUcp+cgnwQsK+iKyvMjcJwxIDEFap2m1lwKBo
   wcGs5RINoss38cn05giTHt4JLVJmpO5sKWAPZgNX5o4FMYkOXBn5gFO+M
   BzGraEOR7ghkJexBrKVOia5HnUqcSOEIu0e/XRE1LX1REm1KLiRbmCDO9
   SQ3iOWch3cEMIzj/PqqtRNNzxKWSaYIA8YTENBrVeBVb0L5g9PBn8mzW7
   w==;
X-CSE-ConnectionGUID: IgfdJMJbRYWGDEwFqm6bnQ==
X-CSE-MsgGUID: FhOT8GdWToihgwniolyC1g==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38376009"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 09:21:04 +0200
X-CheckPoint: {66BB0960-11-751552D8-F91D2344}
X-MAIL-CPID: 077887CCF811A195D62A04B98097912A_4
X-Control-Analysis: str=0001.0A782F27.66BB0960.015F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B10316A2A0;
	Tue, 13 Aug 2024 09:21:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723533660; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=UkG02IRLbuQxhId6LzbXT7Ov2Aqgx0DWfjgykqx/jT4=;
	b=hohTyCy1qyLSQ1ome8JYN9WNYCg9p4HwMY0iv8pNlKkv9+czqGu3yw/m+lRnbWR45P2Xxs
	o4ZVi4fUbtSkN+lC4AyWnShh9P2wwz5/+Uo8NxlY0PJsIvrGHI1KkgGHtCb9HDkoyD8jf9
	sD7c/NblDH9DqHcMukihwqXEKuQmBeemcPcSFsgk5fTzpWl6zXknVIsPxRGjtHNbEZMfZu
	+qN3x6PDDwF6FoIFM/XIb1h9EJwoAAIimx76FKPAf9NlgHqhnSWEaEqHmF0rDd5KNYXfkC
	NoJ4j9tSQMMTdfTf9KePVSHWKJvmdb6hs/XqDevdvZbn3PYHDPgCPDR1oj6W5g==
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
Subject: [PATCH 5/7] arm64: dts: tqma8mpql: change copyright entry to current TQ Copyright style
Date: Tue, 13 Aug 2024 09:20:17 +0200
Message-Id: <20240813072019.72735-6-Max.Merchel@ew.tq-group.com>
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

Replace developer-specific, personal email addresses by mailing list addresses
while retaining the author.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts    | 3 +--
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts  | 5 +++--
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi          | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index d7fd9d36f824..d06755ccfdce 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -2,8 +2,7 @@
 /*
  * Copyright (c) 2023-2024 TQ-Systems GmbH <linux@ew.tq-group.com>,
  * D-82229 Seefeld, Germany.
- * Author: Martin Schmiedel
- * Author: Alexander Stein
+ * Author: Martin Schmiedel, Alexander Stein
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index ae64731266f3..fb89ae4d50e4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
- * Copyright 2021-2022 TQ-Systems GmbH
- * Author: Alexander Stein <alexander.stein@tq-group.com>
+ * Copyright (c) 2021-2022 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index 336785a9fba8..9fed9d2efcf9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
- * Copyright 2021-2022 TQ-Systems GmbH
- * Author: Alexander Stein <alexander.stein@tq-group.com>
+ * Copyright (c) 2020-2021 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 #include "imx8mp.dtsi"
-- 
2.33.0

