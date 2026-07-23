Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90423E556B
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 07:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791749; cv=none; b=DIWrJnftUY3WClonBJnhVlpmVkm68Jqfbn9CH7lF5kJqvvEqwU8joibfwugU9BQiYf7CS3HuIn6MS7Ny/RJ4EFmJM+pfecmSWOeN97VP55F62KMK+WNqzbZBaynUJQEdZ9zFKfRbKuiayAcDkDVcXgFhBDEcTC13wjT5oOMsbho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791749; c=relaxed/simple;
	bh=wKij38HGAAt7YISA6FyqC9dlADCJpzJDlZ/LQ1v14os=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHGtXGUF/XM81QLxeuc4gNDooUXu8U/FDVGWFchy94Wf0iQqCrTnr719Srvf9BXqqdf24IkP952SqHDzhOnr4MxUE62OTjKBXLHgdOdtGAfNAhsBh4N5chaJWVZ2zcUrrUBd7tmr3WqgQbYdIjxv5kOUytLJ1hwDCTwMGOnU9eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Y430jYG2; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Y430jYG2"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AWfpNOMblUSFgxMlfiBcTi/hJKFn8YKP25mru4Aw2gA=;
	b=Y430jYG2h399Q9r2dE+wsbvx2A/5Dpi0qqtG1jAYAK1WLYQfgo5iwvXd6CnZeLe5Wku+4B
	UvLbXTuk3dYQp3b98MqzZzBPXDqyGCiHboSJUEBR1MZ2yNPPTazjCoHjHqGgJx4hPstfUs
	NF9K08X863Cnz6P7Mp8PQWoW7p44upALP0AQU0u1ux2tWFpDLITF/sHLYWWos1IXILg2dM
	lVqPN7InHSXlYvaqoSJ3u+XbEF3vyj6EJUktgTkPxZyaKQGQuD7UBwKHO/NiPFkehKGzuy
	uweftw4c8bYWYlWglg8d7YjeduUWEtInpQFbOdM2YXZE9QpdBvn8wlMr30UmYw==
Date: Thu, 23 Jul 2026 09:27:28 +0200
Subject: [PATCH v3 06/11] nvmem: imx-ocotp-ele: Use __free(kfree) in
 imx_ocotp_reg_read()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-6-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=tw7aokEcvh90MWTeMqjklR+YyN0xvrsJL5lNb7B2Txg=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0Las9roZu+TaT+86HF5013H9tN7LMRmCjjNfP3sft
 L11m2p1RykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwER+ujP8d5J9cuvqxQrTsAmL
 z5zQ1K/uFtYsv2F4JvnSrtVLfd1TlzD8M98Rto/Po+Wd1yapebte527yiGW5bN7V9OBm0qGDZz6
 vYQAA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This is useful to make sure the buffer is always freed when
its scope ends and makes the code slightly easier to read.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 9d3f94e35508..47ee6bd176a3 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -5,6 +5,7 @@
  * Copyright 2023 NXP
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -68,10 +69,10 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 {
 	struct imx_ocotp_priv *priv = context;
 	void __iomem *reg = priv->base + priv->data->reg_off;
+	void *p __free(kfree) = NULL;
 	u32 count, index, num_bytes;
 	enum fuse_type type;
 	u32 *buf;
-	void *p;
 	int i;
 	u8 skipbytes;
 
@@ -108,8 +109,6 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 
 	mutex_unlock(&priv->lock);
 
-	kfree(p);
-
 	return 0;
 };
 

-- 
2.55.0

