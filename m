Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE521FECA8
	for <imx@lists.linux.dev>; Mon,  2 Dec 2024 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138582; cv=none; b=rTUBIw3nJ/VBw4H51E9hkHpvYBI9h1EzUDaTf/d+2Min8OnLmKlPGCUYV4Rqx561+xtlZFqVzuBhspF9uKKGMHsT3jzjcOO21sgaFD3zbaiCE5cN97SfsinHSP9HMj30d0GkKSkgFhh6WqeSonxl6++2hQlJKzlimictni0bJfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138582; c=relaxed/simple;
	bh=ZPaXYv47e/WQG4obGp3rPX00hCB/gvGfq8LMT3XH96c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhLf7LOgway+d8R9qf09Aku3ZIAX+RvTjt0cgg4AuvtPP0hjJH42LrvO8NTMUEaBxLMZb8PuE85ck5u9ZxFTvRLPRK8zY2Rt6kfpoYJOeZe7lr/r31VIvufbx14/VJksdh/RlqXWiFgTWzg8VIp0YMzxs1g3Do2hmS9FDaPFEuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Ve-0000UJ-EC; Mon, 02 Dec 2024 12:22:34 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vd-001Ht1-05;
	Mon, 02 Dec 2024 12:22:33 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vd-003R1L-2E;
	Mon, 02 Dec 2024 12:22:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 02 Dec 2024 12:22:32 +0100
Subject: [PATCH v2 4/4] nvmem: imx-ocotp-ele: set word length to 1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-imx-ele-ocotp-fixes-v2-4-3c021a97eb5d@pengutronix.de>
References: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
In-Reply-To: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peng Fan <peng.fan@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 stable <stable@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733138553; l=1541;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=ZPaXYv47e/WQG4obGp3rPX00hCB/gvGfq8LMT3XH96c=;
 b=5eU7lUWgrtgcrvC11GGxw98/t4z9jTOvrrvJztR35tRTHRnzL7ycIfw5wyjjSm/QbkFrm81FC
 nxc/gLkbVJ9Bjkiw12E7CkWNSqvRHmkKEmAtSXJ4EsUurRQCS+UiAQe
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The ELE hardware internally has a word length of 4. However, among other
things we store MAC addresses in the ELE OCOTP. With a length of 6 bytes
these are naturally unaligned to the word length. Therefore we must
support unaligned reads in reg_read() and indeed it works properly when
reg_read() is called via nvmem_reg_read(). Setting the word size to 4
has the only visible effect that doing unaligned reads from userspace
via bin_attr_nvmem_read() do not work because they are rejected by that
function.

Given that we have to abstract from word accesses to byte accesses in
the driver, set the word size to 1. This allows bytewise accesses from
userspace to be able to test what the driver has to support anyway.

Fixes: 22e9e6fcfb504 ("nvmem: imx: support i.MX93 OCOTP")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Cc: stable <stable@kernel.org>
---
 drivers/nvmem/imx-ocotp-ele.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index 422a6d53b10ef..ca6dd71d8a2e2 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -153,7 +153,7 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.owner = THIS_MODULE;
 	priv->config.size = priv->data->size;
 	priv->config.reg_read = priv->data->reg_read;
-	priv->config.word_size = 4;
+	priv->config.word_size = 1;
 	priv->config.stride = 1;
 	priv->config.priv = priv;
 	priv->config.read_only = true;

-- 
2.39.5

