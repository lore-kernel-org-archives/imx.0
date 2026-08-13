Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D03B1EC8
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615110; cv=none; b=p+ro3B3bm8cnMUmYMnAmkP6QfDdyaObO0e96jqyAzDvGPwu0BsskMhUt9mzY3xV1MdsiG8cQU4AUtkNYQJiom6M4cwUIz/D0vnXSLIsUgcQ/NCg99BPbJJvk3OASdeehOOQjkauvYN9HpMt3i9UK3HLvncUPNsDNbwz+/s4dol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615110; c=relaxed/simple;
	bh=oPlFqJJXvgzJjD1o5PAaAwRcPegXJ2uFTIwAoKgniho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ip4bYIiMJxHTW31IdfUEWupFac1Ha+5ofqIAJUapothVekMbYCSUdWlIbh7z8nbA0zS2m12Xwg1vPZjNQ4yYw0WTmZzVCLuh6dLvkoIBuC4kWALjY4D7zbS66DqCtDOicppXU9gNE+haZdO0pggHrD6LPay1wEe0xtbqjt5KYYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 84bd6f4496fd11f1aa26b74ffac11d73-20260813
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e079411a-550d-409c-bcf4-64c53f5ff9ee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:000ab75f5e504c7f9b91d086a590c14a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 84bd6f4496fd11f1aa26b74ffac11d73-20260813
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1411366014; Thu, 13 Aug 2026 17:58:22 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkai Gong <gonglinkai@kylinos.cn>
Subject: [PATCH] firmware: imx: dsp: fix mailbox channel leak on kasprintf failure
Date: Thu, 13 Aug 2026 17:58:18 +0800
Message-Id: <20260813095818.2275666-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If kasprintf() fails while setting up mailbox channels, already
requested channels from earlier iterations were never freed. Route
the failure through the existing cleanup path.

Fixes: ffbf23d50353 ("firmware: imx: Add DSP IPC protocol interface")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/firmware/imx/imx-dsp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-dsp.c
index ed79e823157a..7e3f45ddf0c1 100644
--- a/drivers/firmware/imx/imx-dsp.c
+++ b/drivers/firmware/imx/imx-dsp.c
@@ -99,8 +99,10 @@ static int imx_dsp_setup_channels(struct imx_dsp_ipc *dsp_ipc)
 		else
 			chan_name = kasprintf(GFP_KERNEL, "rxdb%d", i - 2);
 
-		if (!chan_name)
-			return -ENOMEM;
+		if (!chan_name) {
+			ret = -ENOMEM;
+			goto out;
+		}
 
 		dsp_chan = &dsp_ipc->chans[i];
 		dsp_chan->name = chan_name;
-- 
2.25.1
