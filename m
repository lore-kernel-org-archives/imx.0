Received: from mx-relay22-hz1.antispameurope.com (mx-relay22-hz1.antispameurope.com [94.100.132.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0046932E15A
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.222
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383088; cv=pass; b=A37O/8MAC7KL4ovv9n/ddcVrt5iPyraW7g9pQzwwUTeT3XNK6taIpFLi9AHlh9kgjCX8pWdPbsc+6PQICQ7WAk8rLZsoJqM76kXLApFPnOM0KL/8wW3W/RqGkZoz5BMMYIOjvqNmiy5L8fQwdQsTCTHvOyuxxHlxGIyjiOzYq+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383088; c=relaxed/simple;
	bh=jTsRwS42tI5mx4ug5QK2yMOBtfpB3rHUg4f6Us7SdHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjaLeO2qnTXgXS6Tf9BSw2YRkXAcUwb5nql+iUfQvdY8gfHdIkLcX4HX3N2ydKF/q+LEAXez5mrdNFstiQfWmt9ti1ICFUDCu48L4wqENyu2eyw/ttMmlPRqVND5oLgpi9eIwExPa7vO8NlHTDnlhX3EMLWoo1n4nq+kC74cdFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=JEk9SYhh; arc=pass smtp.client-ip=94.100.132.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="JEk9SYhh"
ARC-Authentication-Results: i=1; mx-gate22-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383019;
 b=BYliL1/o9yGYqxhMhPySPajQeg1qxR28rG4aC57Um6viumicBcXhb8IsTQQ3iT85hukW5iU0
 MWh0z/QhOXKWDFO9PoP6oqbEoMxX1R+yYv5xgN0ZMdq4t37UEQdxmwZrjfWN8vgBzgWD+YD9otL
 NqZNS5IG+9n5OZeyJEbeo2qXBEtQPkfr3CK0GYb53xiCLtweVvmcRYTlJpF1FX/h4bWbCNpYXQE
 +rF17QAsC3GSDw2PrSlhMJwel6On4qBhmKwZKD0yZU35UMkfRDCF0icdX9Bsm16YvQiUGOXseMC
 +6DjyXdowGRfl48s6IjVZvnL6hUaoCQMU7iZx6o73uvJA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383019;
 b=LBz/G/csf0si6nP/k1pUMOskDTYo46gJdFY71SfcUVBYcehlQSj6Odyzwk30MJycwUuSxc8l
 2LEjtJo3a9FE4hjF7rJ3llqIUIaj0Qdjkw9JinrQn6N1ZX0mtAtKJ5kLriEL9ogtN2TXJDPVW9D
 jhUM1cal6FaFD5LlADnU52tySN4IfwfKW3WebZ9dm49X12b4dcIsTK0cZ7kY6sz8eg49dGPdDly
 HEjOPRHgtRpk+iZvU9n5QD066g6sClz7UrPkkfzxKoWriPdYoPw87Xl42OcxseBVjd9Thcb/oS4
 3XW4EZ1vSo3gSxt6kusnO0CCsh9R4AqOSQ5gGzDExX9PQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay22-hz1.antispameurope.com;
 Mon, 17 Nov 2025 13:36:59 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C8BABCC0DD9;
	Mon, 17 Nov 2025 13:36:49 +0100 (CET)
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
Subject: [PATCH 1/8] arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
Date: Mon, 17 Nov 2025 13:36:28 +0100
Message-ID: <20251117123643.711968-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay22-hz1.antispameurope.com with 4d96gk3DCkz2By2v
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:44583193c2954bed913768cd2e93b769
X-cloud-security:scantime:1.592
DKIM-Signature: a=rsa-sha256;
 bh=9Tj97bgHVDN13VarG25MeBuEY3cF2iNUf5mx4TIglo0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383018; v=1;
 b=JEk9SYhhK/EvfcTCG0P/RhljHkFMyikEcR7PTNBnJnk80bL5qIPG9gDAQOMzQ6FArXYP6m2x
 rPDD2A5EI4BQo51sJHwCEqTJmGvQLZLoLsZk7LMQq5hbLH9QFdjUJsydy2+uPTDFDB5ei3LRaLf
 2Cco1eE+250e27EpYCOXs6EYD87qS8IYaYRIbKsYemBRDtWFD4qEZxLYNtbo9iNbxnCfPZ16VBA
 LLx+TGWKkDL4+aavyyiyBbdaywlqf+w2ivGQ3GM89/w9+l5cZKkPsjA6K0P/Tuu5O0L1bRS7V2H
 CTak/Kt10Q5Mz5bSY9DkEIE3K6J90x9/eHFUTDWjLLbCA==

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

