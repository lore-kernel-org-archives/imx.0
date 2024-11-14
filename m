Received: from cmccmta2.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63821E7C2A
	for <imx@lists.linux.dev>; Thu, 14 Nov 2024 05:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731563981; cv=none; b=m/IylPZxiYDZIfNbICtdtCNL0rvv5y8L86IYL+fJzKs1aNvkoPeopHlF3sp5gZjPDEIEbV8BLXYS1UCxwmc7B0kVJBHI+SMO1QLtBI4nDoNOs/KRKk4sAF3QcQXR6m5hgSBjXO/zh1Slwc/QyoOjKHfXDPdDzkYYBGkMtC95spE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731563981; c=relaxed/simple;
	bh=QTWnHqyT/LNaWSZzix5iE+Id6VEUHg02HTfxPYltqjY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MeoFRJLQLx/MilQfDIeGbe3wf4jGsAHSji85hAF6IB4HmMGo0Cw0UZzI/UceFFH+oySDzchk95hoz072ukiJ2XNYZg3adwwnRO9UpPCs9BclnacWAQ0HjggzIZ989yHa08/pvDkZ5r7HGKh7wFTGvvjVvy8pYS9ezd56EcDE5x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee6673591c1791-ee061;
	Thu, 14 Nov 2024 13:59:29 +0800 (CST)
X-RM-TRANSID:2ee6673591c1791-ee061
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee8673591c0612-ab314;
	Thu, 14 Nov 2024 13:59:29 +0800 (CST)
X-RM-TRANSID:2ee8673591c0612-ab314
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: jassisinghbrar@gmail.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] mailbox: imx: Modify the incorrect format specifier
Date: Thu, 14 Nov 2024 13:59:26 +0800
Message-Id: <20241114055926.38502-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The format specifier of "unsigned int" in snprintf()
should be "%u", not "%i".

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
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



