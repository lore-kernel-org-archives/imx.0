Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2A3B2FC2
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643560; cv=none; b=H3bjs0JAXpqhar01E+Mblet1YxQPf/x201SoGWPiHUcnAAONp7jvxkHQ2DvrKMz+JB1jXcjQLRwQq70Fb2WNy0phFJhVGpqxi97oursIXYD5vZMJIWnXt8J5R1+Z23rXTScNKxjQ86EpsosVWCwUuxk39n/SEXMotqcKnMRkExo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643560; c=relaxed/simple;
	bh=3pACP9aiC+CmZGh8/eMaLFgQwOOYDM128FdHVc/lfQQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hV2fpSk0C+ccr1OijzST7I+TbPeGoKjMXkZWCzE0Bs1B2qRgAsrXabHckS1pTDLWGzBxYCeI1LL0fr/+S2IB/o86KSs5of6uJ1yIpknd9Rv+KRXyJydPcWc2YWUJzqMniM+KsAS+aq1erGcKAEU3lW8hpRi80eAkg2ZBruPLAdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP02.bk.prodrive.nl
 (10.1.0.91) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 12:19:09 +0200
Received: from lnxdevrm02.bk.prodrive.nl (10.1.1.121) by
 EXCOP01.bk.prodrive.nl (10.1.0.22) with Microsoft SMTP Server id 15.2.1748.39
 via Frontend Transport; Wed, 8 Apr 2026 12:19:09 +0200
Received: from paugeu by lnxdevrm02.bk.prodrive.nl with local (Exim 4.96)
	(envelope-from <paul.geurts@prodrive-technologies.com>)
	id 1wAQ05-008rKV-1h;
	Wed, 08 Apr 2026 12:19:09 +0200
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: <srini@kernel.org>, <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <gregkh@linuxfoundation.org>,
	<p.zabel@pengutronix.de>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <martijn.de.gouw@prodrive-technologies.com>, Paul Geurts
	<paul.geurts@prodrive-technologies.com>
Subject: [PATCH] nvmem: imx-ocotp: Initialize in subsys_initcall
Date: Wed, 8 Apr 2026 12:19:01 +0200
Message-ID: <20260408101901.2111140-1-paul.geurts@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The i.MX OCOTP driver is implemented as module_platform_driver();,
which makes it initialize in device_initcall(). This means that all
drivers referencing the clock driver nodes in the device tree are
deferred by fw_devlink.

As the OCOTP driver is arch specific, but dependent on the i.MX clock
driver, which is also initialized in arch_initcall(), explicitly
initialize the driver in subsys_initcall(). This makes sure the drivers
depending on fuses defined by OCOTP, which are initialized in
device_initcall() are not deferred.

Fixes: 3edba6b47e42 ("nvmem: imx-ocotp: Add i.MX6 OCOTP driver")
Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
---
 drivers/nvmem/imx-ocotp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 108d78d7f6cb..9b1e7bb14ced 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -638,7 +638,18 @@ static struct platform_driver imx_ocotp_driver = {
 		.of_match_table = imx_ocotp_dt_ids,
 	},
 };
-module_platform_driver(imx_ocotp_driver);
+
+static int __init imx_ocotp_init(void)
+{
+	return platform_driver_register(&imx_ocotp_driver);
+}
+subsys_initcall(imx_ocotp_init);
+
+static void __exit imx_ocotp_exit(void)
+{
+	platform_driver_unregister(&imx_ocotp_driver);
+}
+module_exit(imx_ocotp_exit);
 
 MODULE_AUTHOR("Philipp Zabel <p.zabel@pengutronix.de>");
 MODULE_DESCRIPTION("i.MX6/i.MX7 OCOTP fuse box driver");
-- 
2.39.2

