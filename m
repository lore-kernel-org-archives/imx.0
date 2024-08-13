Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B5017A584
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723533662; cv=none; b=TNWNLRKDJP7OO3jW3cahZq6ddNA3YUetmth/7xgBAAGDrKJUdgB+sS4JuEUNDPe8E7tr23gsJLApfMgjXmNseJ6Q7+oc5GV3SE2KdO20o2cdOxKovk6S5Ek9ym2btsa8pOgBLrKxQtLEmyMJ5/wIc6qSppVhyPBMBMQZ1ioeZWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723533662; c=relaxed/simple;
	bh=8gIIXIie6DPb62LEzBGuGbK5IwnLjxXCFluMXSg22xk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UwDtV/u2hO261DhcGhgfkEI+JZwvBSFNZt5y+6E24qUPDpLx/RY0PlOPjGagW8MUdyINp8aoVoYeyzw94BifE671q36Ccx4yo/eaMIUKaA1xXf8DJzHHC8Z1wl3wxfJ508B+sneDPjkhvzKVpYyxI3ukBLax9ZqJQzI1H1ri5nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=lgDBIo2R; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=eSxRCY9M reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="lgDBIo2R";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="eSxRCY9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723533660; x=1755069660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bBSX7eIsedYOrfBOu23bG84Q51XXxAX/HB5NV1UT4oE=;
  b=lgDBIo2RjMDjmXmMd3fMt4Pag5CVEw/BiwotIhZZZKNXk05C38oDgXDr
   zYVuhoOArQ5PAMc72wPgnV6Z3nvODQvB7exqTacQ67Ih7nYufMKF4tkMq
   qWATwijqyAgIJ1PNMXfh+eHFEwzVMK00mngnQFN1YrQddxUq4VRwdOvS3
   6zwqDWBE4DHCVuV1X1JPXV24M00HZfo9ysTIVNgy+x7f+5nIa+1unJ5HN
   iz16ms6xUyO8vUcLn48JTWMIDg5pTJ/K0CNrqug8JKmO9Hq+6JxbmiIMN
   llPSbsm6Lx6hiTLpYNXGErx9li1C//6OEmetx3H/OSZuEgdDjTtiIAKSi
   w==;
X-CSE-ConnectionGUID: M4yRj+MyTwCMj0EjbOQI4w==
X-CSE-MsgGUID: xgcECJyVS2u39O/CecjkXw==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38376004"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 09:21:00 +0200
X-CheckPoint: {66BB095C-0-E9ED6009-C4B0BEC8}
X-MAIL-CPID: 418BBA7B899E6859E33C810866FC26D1_3
X-Control-Analysis: str=0001.0A782F25.66BB095C.0063,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83AA116A23B;
	Tue, 13 Aug 2024 09:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723533655; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bBSX7eIsedYOrfBOu23bG84Q51XXxAX/HB5NV1UT4oE=;
	b=eSxRCY9MzLuB0++cstZtUDaYhm/qxlKwvzB9NjdCFIlZF36oMZkz6fRTpumsyQbIN+klKK
	86GCV+1OGa7OuPKxPOqokDGYMDQIjymKX1NpU1jEEQ5SPlodv0xJrx0t7F4mibw8QCgRtL
	RX0JN7fJfq/lhGvNNpSv4x1BBu8qRn5XF9Q+MhCuRXANFN3GYNzQgNaUKRDax8b5ZIF5Gd
	C+2zGHT1Mopv/TpEmQbMCIo8jGofenjHH1ZmskIqXJpvg4FNvhvhEcAAXcvmxrFG59NYWQ
	LUWgG5nNqOpSRr0tnYTwuLL20ifYSlR8NtirtN0hCJKWZk3qHZcV16VlIYl5bA==
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
Subject: [PATCH 4/7] arm64: dts: tqma8mqnl: change copyright entry to current TQ Copyright style
Date: Tue, 13 Aug 2024 09:20:16 +0200
Message-Id: <20240813072019.72735-5-Max.Merchel@ew.tq-group.com>
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

Add mailing list addresses and missing authors.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts | 4 +++-
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
index 433d8bba4425..9c3c1c92fc2f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2020-2021 TQ-Systems GmbH
+ * Copyright (c) 2020-2021 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index e68a3fd73e17..682948e751ff 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2020-2021 TQ-Systems GmbH
+ * Copyright (c) 2020-2021 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 #include "imx8mn.dtsi"
-- 
2.33.0

