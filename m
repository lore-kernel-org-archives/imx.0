Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8360040B366
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785157311; cv=none; b=FJ2sk2Cs4vM4ipM6vwFLOyYwn/qqxmXlurACPcEbqe4vWZBU2LSG082eMvoMcHzWnl8lC+dzfI7Bv/Jy2gmMPg6+iRuoSiUcmgiwuDYBCIp+n46sKlS1TU1M+iVpiN+fgm9Y4+a//LuW1A38PiXZD6zRcPCi/CkD9l1lTL/kgNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785157311; c=relaxed/simple;
	bh=B1jI5uT+gofUm33XQtgnrXVpG6TZVW8DZA4+G3z20ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBF0BlmWWPN7oi3LAImegKYd2c7KpD6dWkblQ1IEZ2qm8khvEgrBnVvQMimu8Ft9DujcBU92fpV/cK4MFBRevQBAg8YM68eY8MemXs0guR3RenphJTuXcoa8lTtEThoW/8Zh/Bs0tOsPM8L5G+Zd5dCiRL/Tbm2qN+U7Q1PIVF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=CO1dZ6d3; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="CO1dZ6d3"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1785157300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8LvETlpvfmRLPMNJAZRBxPv0T9l44dUeg5xWaQVYdU=;
	b=CO1dZ6d3He9vQlEdzpNbQPtlg4+lI9huQZw3ktsB0YhRMkITc64MwPbpIWmi45o8H1MzRo
	PJuHhbV07Ofq1UKURi3QrIRODfD81ImJcoqIiETqfUzTtOGd7BVNUYCsj8eFKwWxsUCvM9
	w/e9RwPiJqWI4QqbpWUIiPJvmCgG0oaGKx6RcoDWrv3sclQ/nVcxyqm+Jur5y8hQKxB5XM
	Gh1FB6DQeswPjmTLZaRiDJZ0eyRt/o64wyItao2N7XsW392sUY2L72DZZo8R5CToNjYcMG
	JBDQlIcY2QF19faAgOKczdDKvUGlQ5pzuEi+RTk6ClSeb8MIoo4hCmzHYC1uJg==
Date: Mon, 27 Jul 2026 15:00:49 +0200
Subject: [PATCH v4 06/11] nvmem: imx-ocotp-ele: Use scope-based cleanup
 helpers in imx_ocotp_reg_read()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-6-1a515de33093@kontron.de>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=uV7ENiMD1Wh2iEaVPUtHrZxGI6SC1sRbjqoh1DEWumU=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISs9bPVHptpF64VLi/8HXNi6Zp/5x4S7J26V3PXXcA+oP
 vqbfXVLRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwES6JzD8M5OWcxNvvPW7/fqp
 k+mLRXe6/LR+EhmksV3/j9yMSR+TXjP8T1Xvd0hhNdBIPsRdFPcu5fDcyMfKmpw6lQrzTuxfMKm
 PCwA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This simplifies the code and makes sure that buffers are cleared and
locks are released at the end of the function scope.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 9d3f94e35508..010b53001323 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -5,6 +5,7 @@
  * Copyright 2023 NXP
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -71,7 +72,6 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	u32 count, index, num_bytes;
 	enum fuse_type type;
 	u32 *buf;
-	void *p;
 	int i;
 	u8 skipbytes;
 
@@ -83,11 +83,11 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	num_bytes = round_up(bytes + skipbytes, 4);
 	count = num_bytes >> 2;
 
-	p = kzalloc(num_bytes, GFP_KERNEL);
+	void *p __free(kfree) = kzalloc(num_bytes, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 
 	buf = p;
 
@@ -106,10 +106,6 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 
 	memcpy(val, ((u8 *)p) + skipbytes, bytes);
 
-	mutex_unlock(&priv->lock);
-
-	kfree(p);
-
 	return 0;
 };
 

-- 
2.55.0

