Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0196C13B5B7
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723533657; cv=none; b=qdMkhjXbfhw1uYYPfiUwhKeHI+jCcSI8Dhh7Yi2KEF0bkeSwbFDYgZBUaaIAqOEcpUulabHXybpeyTPWg7M+Z0LchEQHkbN5xqGu+uAyV8S/BZN+QWEw4Zov/Yz59lUwX0faPPDfa97L6Od9qLqMiTIBhNHkrNt+HIv+n14wlZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723533657; c=relaxed/simple;
	bh=cUzg/PXrO5VDoFvy/NMNwFeMQHGQtKF8eIyjEJZiqLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VlBrBbueVMat/qJqZ9I/O9ifpPVhhXlUoPg9X46B6Vp9mbaPVKdJBU34lHWt4fDql3gJhuPy7FcHQiFtwohivcQBhBavwWcVdqd6agHNa1g57p27fmqFMlWu4+FIU+51nO6gGSb1Bj+ptL/D/psjx29Xg4shADkYx0l2K+kanJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Fmf+hlr4; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bzubahfQ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Fmf+hlr4";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bzubahfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723533656; x=1755069656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FZeaBk0a7bkJOTwufcY+UqCirm2VTy9tH7/QRilYcoE=;
  b=Fmf+hlr4TBuBfP5tYTe4BpMnTOjUVHSduTBk1hXIeUNGiMwH9gsm6dP8
   VyV8NLobQQ6Nx6z7LT5uacpkQc3CO5pFd2DfPCHKgZBhOqrkv2r31i/ml
   GBLF+lISibzhYSupfLfwCnvz076xQYMO+n+g4Cbm/ThyyeUntp8okrTEX
   39XCAEjlwYA6Bs3JBkdfW93copuuKzSZQtwX7IqNnv7xN+74AGLMAehn8
   x3rRT5POcGtTne/WgOYTWYqYCNA1kD4b8r/sLI7WbdW7cuTKJu9kZ+DAt
   RrRBD7yuGPwQO2uXwumFn/qJQketn1oTeT5+o6DReUFdYm2WI9L8ow2CV
   A==;
X-CSE-ConnectionGUID: K8ak6rGURjGojr1ud3pWyQ==
X-CSE-MsgGUID: VRvTc+ihQDOl/zaicOCcpg==
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; 
   d="scan'208";a="38375999"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Aug 2024 09:20:55 +0200
X-CheckPoint: {66BB0957-12-2C7A84BB-EFCBC4CF}
X-MAIL-CPID: 899940D8A3C940CF24B5B62BBE666154_2
X-Control-Analysis: str=0001.0A782F18.66BB0957.0147,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 069F81695AC;
	Tue, 13 Aug 2024 09:20:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723533651; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FZeaBk0a7bkJOTwufcY+UqCirm2VTy9tH7/QRilYcoE=;
	b=bzubahfQkYGi0mSdwW5l8aPj1ns5u1dEHOa266ndCzopt0WbL1oY9nkQqqxeajKzgaw6iR
	KUdbk7pDbCUZ/7Z8SdVers9QiAt22CJ67juVY+pxCcA7OA4IsFS7eyVXBv65/Ytg7RYHbA
	uZXv2dm5vWoV+wMdixDtSvc8xKMpyB1SEjjiGSl0fRXVEtiWcXNUERRExc1ZSbrePvWY62
	fzLuJ22gPcaUpC4iFTqwuLdDoXpRh1r33VQqqcxWsCeYlAyh+d5nKIVSwlHfHSUmsvfnOR
	juF07rDDvQHQThHrijBaTeBKHmSPw4bHvg6ex0sDZzbAx8Tqrt2OAb9g6+SeeQ==
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
Subject: [PATCH 3/7] arm64: dts: tqma8mqml: change copyright entry to current TQ Copyright style
Date: Tue, 13 Aug 2024 09:20:15 +0200
Message-Id: <20240813072019.72735-4-Max.Merchel@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts | 4 +++-
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
index 01b632b220dc..cae7b5ebc71b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2020-2021 TQ-Systems GmbH
+ * Copyright (c) 2020-2021 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index ca0205b9019e..0b348bef0988 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
 /*
- * Copyright 2020-2021 TQ-Systems GmbH
+ * Copyright (c) 2020-2021 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
-- 
2.33.0

