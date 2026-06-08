Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A3230DECC
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 02:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780884241; cv=none; b=A3+m6OfXJArfEI3o2DBawc1QTI+XucnPloY16eH7yplnDnYb9I2TCLqZMqkGWB7p6pSxlbfoYssRqtcms8K4Oav9xX05U8QMRAinJXmgN0CucYWHW5aldgzV+QYpFsW0ZEwQqdmAG3qk9BiNrZEF0hiJGUKgDIUz/nRKGWw7R0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780884241; c=relaxed/simple;
	bh=hlFYaUTSjRGQCbRPUTISZOpkboaNYc4KC6YoFUSLQVw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=VYLE/TS2zhukCox5tE90+twjE2QeEQ6s6eTgca+xkLgG9IXFTxsZ1r6ACPEStdE3/MqJ4nVZxgmvJ8W7cz7jTw/aVk+OiV234qpCFGpSSJOmj8v2mmAY5HcTv/+3NN+t+AIxiw7+so4b27f5rXZC5NCES4aI8pEqmZYCXkUBIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4d17705662de11f1aa26b74ffac11d73-20260608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4bde894d-a57c-4625-88a5-1f0ac44a5651,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:cee024ca77f4731c922f1daea4109161,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4d17705662de11f1aa26b74ffac11d73-20260608
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1016750694; Mon, 08 Jun 2026 10:03:54 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show
Date: Mon,  8 Jun 2026 10:03:45 +0800
Message-Id: <20260608020345.247101-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a proper NULL check for the kmalloc() return value in syslog_show().
If memory allocation fails, syslog would be NULL and passing it to
misc_syslog() could lead to a NULL pointer dereference.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/firmware/imx/sm-misc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
index ac9af824c2d4..fb8d7bdb5b08 100644
--- a/drivers/firmware/imx/sm-misc.c
+++ b/drivers/firmware/imx/sm-misc.c
@@ -79,6 +79,9 @@ static int syslog_show(struct seq_file *file, void *priv)
 	u16 size = SZ_4K / 4;
 	int ret;
 
+	if (!syslog)
+		return -ENOMEM;
+
 	if (!ph)
 		return -ENODEV;
 
-- 
2.25.1

