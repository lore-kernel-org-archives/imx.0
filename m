Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B145149C7B
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 00:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781051925; cv=none; b=gaYQf/rkD8yCx2ioz+2E10gqhF/fVlxtiVaGfeWjDMa4x89JUOBokzPse/aivfqrhcEYs9qQCI2vW8jbAE7akarNKUlGI0me9DuEAbp3jbgtD67kSdW51DR4Lnwu+nMOU2Vxabc7imMO61st9NHqxHyq8OGvjcdW238pbKKiyEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781051925; c=relaxed/simple;
	bh=P4KdCdKPd36GmkTRF1iLJAi50zV9UGzBl3PGKvvezmk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=ZsSgOKX7Fg8iReDDX9CpB+H0RELeb3YlGv2uwmQJXHMkoAL16QV2hwRYHsKHhSyrMWlfrAVw148ST5XaxWNSejBIAolGrc3Cy+ESvSzRbOOm+ce7VR/OnfFFE6beMs5RzANxVI77LLVlmuaCDoOJrYxBCwGPr7DWCXi9AP66Aes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b7febb9a646411f1aa26b74ffac11d73-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b210929b-8dda-49ef-9b3f-b051acd1e692,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:0a9ddcc8ccc6b2f673e7b23b3bf7751d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7febb9a646411f1aa26b74ffac11d73-20260610
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 19332144; Wed, 10 Jun 2026 08:38:37 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	shawnguo@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show
Date: Wed, 10 Jun 2026 08:38:14 +0800
Message-Id: <20260610003814.75493-1-lijun01@kylinos.cn>
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

Fixes: 80a4062e8821 ("firmware: imx: sm-misc: Dump syslog info")
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

