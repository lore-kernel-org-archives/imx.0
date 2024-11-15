Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD9926AFB
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 01:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731633536; cv=none; b=IViQxZzE2mDtr1b1OWrXg5Tnb/Kbel53TgzCUzlyvlXEmuScpLQxl2hyM7Sx6zohjoWxhJsso6FRwKYo9XgeHV2+33c+oos8o1xK7+ffjo965eErXAahTq0nOO0h5Vj8Bg6eS66YUa/iM/Q3mfm8SLzsqxuuArEvk9Cyi4BpTQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731633536; c=relaxed/simple;
	bh=j3Yc9esCHcVJb2KmDLHstL0XXEqzdkKMJZMzq1aSNA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BhtOUBdKX+MbbVrgzrsFJeCAjmuF+90X1DUfTi/zFiiQfPOuId3rojcaw9lvWH2ES9FoqHi9jxCrqes3Ji7/h3CNtNZ70y6NpGDOZM0VcfvOzGvNUN/7EHb0RYolPWnpvSPbfhcdFyKdwHsEjOxdcxmqLkVTGGk2AOC+5kW4sz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36736a17765f-f4e87;
	Fri, 15 Nov 2024 09:18:48 +0800 (CST)
X-RM-TRANSID:2ee36736a17765f-f4e87
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56736a178f13-dc523;
	Fri, 15 Nov 2024 09:18:48 +0800 (CST)
X-RM-TRANSID:2ee56736a178f13-dc523
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: frank.li@nxp.com
Cc: imx@lists.linux.dev,
	jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2] mailbox: imx: Modify the incorrect format specifier
Date: Fri, 15 Nov 2024 09:18:46 +0800
Message-Id: <20241115011846.2330-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <ZzYoWFVhfNnAcAmy@lizhi-Precision-Tower-5810>
References: <ZzYoWFVhfNnAcAmy@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

Replace %i with %u in snprintf() because it is "unsigned int".

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v1->v2:
	Modify commit info and add review tag.

 drivers/mailbox/imx-mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index f815dab3be50..3fe51b2de89e 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -782,7 +782,7 @@ static int imx_mu_init_generic(struct imx_mu_priv *priv)
 		cp->chan = &priv->mbox_chans[i];
 		priv->mbox_chans[i].con_priv = cp;
 		snprintf(cp->irq_desc, sizeof(cp->irq_desc),
-			 "%s[%i-%i]", dev_name(priv->dev), cp->type, cp->idx);
+			 "%s[%i-%u]", dev_name(priv->dev), cp->type, cp->idx);
 	}
 
 	priv->mbox.num_chans = IMX_MU_CHANS;
@@ -819,7 +819,7 @@ static int imx_mu_init_specific(struct imx_mu_priv *priv)
 		cp->chan = &priv->mbox_chans[i];
 		priv->mbox_chans[i].con_priv = cp;
 		snprintf(cp->irq_desc, sizeof(cp->irq_desc),
-			 "%s[%i-%i]", dev_name(priv->dev), cp->type, cp->idx);
+			 "%s[%i-%u]", dev_name(priv->dev), cp->type, cp->idx);
 	}
 
 	priv->mbox.num_chans = num_chans;
-- 
2.33.0



