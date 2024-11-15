Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5115015FD13
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731653787; cv=none; b=I+SEBhPN0EBGvSMSYA4yyw0bmZySSLnrMelUxDXdtozRGklGOK5nSr4/aF4b7qfx0gdQ8AyaVS+76jYc99hwwiZxWrGIMChOSq/9GT2yimKKBrG1wjou5jql1vlZzKDEfrAXygnBL79XSS025ig3PidvPKddUwgNRieR7aNpX1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731653787; c=relaxed/simple;
	bh=mMvZ61Vr7hWsoYH3dITBfijIQv3Q+4S5HS/5QkDmVOg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L2Fk0CTyEdEPoUE90Juy2JTpzhRVqx5kXBD3b+2AcIX0pFH+/TxDTEuNmGCeOcha2Dp5QqSy85YUHW8LQ9mL/MTE+bFRAiLJ//bAZNbrZ+sZWPgw7z/U0/Ke/dQfDIomRkck6le7xErSDSJf5Q2PCoXfH1YAyT927+DS6Uiy6Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id LHT00112;
        Fri, 15 Nov 2024 14:56:12 +0800
Received: from localhost.localdomain (10.94.16.210) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.39; Fri, 15 Nov 2024 14:56:11 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <viorel.suman@nxp.com>, <kernel@pengutronix.de>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<broonie@kernel.org>, <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>
CC: <imx@lists.linux.dev>, <inux-arm-kernel@lists.infradead.org>,
	<linux-sound@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] ASoC: imx-audmix: Add NULL check in imx_audmix_probe
Date: Fri, 15 Nov 2024 14:56:10 +0800
Message-ID: <20241115065610.39112-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 202411151456127f2a7e5cc4da919ac711d0e077c980ee
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in imx_audmix_probe() is not checked.
Add NULL check in imx_audmix_probe(), to handle kernel NULL
pointer dereference error.

Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 sound/soc/fsl/imx-audmix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index dcf770b55c4b..231400661c90 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -274,6 +274,9 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		/* Add AUDMIX Backend */
 		be_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					 "audmix-%d", i);
+		if (!be_name)
+			return -ENOMEM;
+
 		priv->dai[num_dai + i].cpus	= &dlc[1];
 		priv->dai[num_dai + i].codecs	= &snd_soc_dummy_dlc;
 
-- 
2.31.1

