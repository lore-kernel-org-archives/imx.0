Received: from mx-relay90-hz2.antispameurope.com (mx-relay90-hz2.antispameurope.com [94.100.136.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6728CF5D
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765277635; cv=pass; b=P8BIfcaC47+lVcHU/NUNi/OhoWgne8yMSRSFEh6wAyZ+w6WkcaiTft+tRysTEQ/2FoEj6/BYuU0X/btTMvyyhtpBhx2yEpwaN9z7X6pkhB3o1MF+1ER8NkqTg1V/O5Puy3PbHKsU+GGLghOU8Y630WTV+/bKJu7I48T85InKL0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765277635; c=relaxed/simple;
	bh=jTsRwS42tI5mx4ug5QK2yMOBtfpB3rHUg4f6Us7SdHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4TGoFkh8a9Klg10rC3nb7AT82WB1x18d7PH6pb46ESUk4HWNz8i1JjATggTCg5SiEktn/J+nSf4BdBz0il8tVXTOZc+hQO41LP5HcUVJFAkf1ndx+7guB0Tqkpg1Onm1E3rP2NstsTQLjoKG2dwO/DZJuhmXPeOTJbhuZwOdcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=DEnnEgNV; arc=pass smtp.client-ip=94.100.136.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="DEnnEgNV"
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277612;
 b=n+Nc9k/7onMZwkfl4AuyhBPzx1NDJd6fow/O8ks2CkfJx0rXCjiUTOS7hrT9HWpWVBPYy7i5
 dKgK9A/EgsrrqjpQ+N2EgIKEjReEaG27lQos7rOmiNM1KOkpw4G4GqHS22BQhi4zhTZvFQAxN5p
 mj8ci7eKdysO8cuBF1/nWJBb/V1WZZCMZ6M/v/6WO0xWZX3jwe/rUw9MCpgsLIWOGF8rOBzBFYi
 /dPmzXYh3gZsoE3SQD4LN5f/ZcA4kO4TYVBoVH9WJVcxeKtTdaVcb4+/Rum8ye90E593KpBadnm
 jLsR4OIPyPPQrPsF3iwiqcdiMZhR34+xfVrRnfBCLPfRw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277612;
 b=LTBpL22RlU5pCSBK5H3ETbgKXiEeOmtsUvN1kcxeDOWP/E/A5j7bC6+B+IDYRYKp/51qysds
 7D5aycJUpANXgQaD4uaOENADqG6poLzdPSgyQ/apTUUrvFfBCjKv4hWQg5Dz40WX7ins5o/tYSo
 hU3OvtQRT+a/vmtV77l3iorTgwgh1j+ZIWh5mz/A5V5NHplIaRuuRq4Gftb7eKVpYoCBN7ZI7Ec
 8PTgrhxVkMWX3QP13xMLyd1tNUyOQRrJk2eR1XgcAEODmKGVZb+u8WFcpheLB9TX7BdvHccv1Zg
 WOt0K9JR5tzXn/eouNL4cM7vhyvpBc9L9o20UaozW/SuA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Tue, 09 Dec 2025 11:53:31 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id E3CEBCC0E8E;
	Tue,  9 Dec 2025 11:53:21 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
Date: Tue,  9 Dec 2025 11:53:07 +0100
Message-ID: <20251209105318.977102-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4dQbLB4ZrZzWxV2
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:5cdad8a37ec4edf0a973856c329ef64b
X-cloud-security:scantime:1.663
DKIM-Signature: a=rsa-sha256;
 bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277611; v=1;
 b=DEnnEgNVjM29Fs7qk/vve11v1FnFZ1NDiXKkYAHzkLUJMvHTETsheldIp2gzZWCVaENXQRmJ
 8hD4PzMiZbFWwrt+zR41yPu+w3EVYe0ypDqkvos8nm4ry6l5ZEYHD4sfw7SNC9UszXXnyqjoWO6
 gEHokeoegiGE93AGMybLgdenkUdrMUYbeQj7sVuzDaH1sE5wb+TrvBWBwHXXGqApH2wi7FuxIpS
 nKYwIkf5qHbROoNMzipIZsDxvMm2MLZntxuQGok1hNNSSefNaWY4lPh0D8sdrtxyHCL6V/CsX9v
 YSKHuS2kUiy0OitxEnRkg3Spu3oqQwm98DdryZvuNhwag==

Replace personal mail address by mailing list.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 59642a8a2c445..0605cf2faf83b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
- * Copyright 2021-2022 TQ-Systems GmbH
- * Author: Alexander Stein <alexander.stein@tq-group.com>
+ * Copyright 2021-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
  */
 
 /dts-v1/;
-- 
2.43.0

