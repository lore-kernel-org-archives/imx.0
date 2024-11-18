Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0E13C9B8
	for <imx@lists.linux.dev>; Mon, 18 Nov 2024 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731919577; cv=none; b=q6zPuvAYHGs8wmJXNxDWz954wQua81gTd3wlAeSldOVwzSvVgrj74h7QZIvdeqR2ntP15VrZ5JcADaCWV5NSz8aLauten1gdSaDXg5hTGDI8uYXTwPZsI0qgpfFKDAAjCZipX3r3DnzYpGPTm5SHvsi3LTNLGPd6/jszna0Efxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731919577; c=relaxed/simple;
	bh=8ohPz5k6qH8S9h3TlTF94ZStXpc5+AXU/tiQEgx842I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T0kFB6dPiXX5W4oSyriSTyyUF+mrpt59tuTO/hAVa64MHH20jwN96Sy1ihqKbukuGAQJe4wLZp+wIBp2Eo2LI0r8+68mJGgfCNfAPKpjgfou3FrZR+30ZxIVLxzbCPM1Irq/2jGeRJf3iQJ8yfewC/b6KgytFjcam03SX2SBSAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id PLM00058;
        Mon, 18 Nov 2024 16:45:58 +0800
Received: from localhost.localdomain (10.94.9.174) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.39; Mon, 18 Nov 2024 16:45:57 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <viorel.suman@nxp.com>, <kernel@pengutronix.de>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<broonie@kernel.org>, <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>
CC: <imx@lists.linux.dev>, <inux-arm-kernel@lists.infradead.org>,
	<linux-sound@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [v2] ASoC: imx-audmix: Add NULL check in imx_audmix_probe
Date: Mon, 18 Nov 2024 16:45:53 +0800
Message-ID: <20241118084553.4195-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20241118164558435d837ede71e32fb10d2d296c1c3bb8
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in imx_audmix_probe() is not checked.
Add NULL check in imx_audmix_probe(), to handle kernel NULL
pointer dereference error.

Fixes: 05d996e11348 ("ASoC: imx-audmix: Split capture device for audmix")
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

