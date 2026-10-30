Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349237;
	b=NEg2kBzfcgRUi5HErPshnnrC/XSmMcGqVgvmo4/XY43U9HcfDJ2O4vp66sMktO75Do7Q
	 Limp+QjkDvmJJLWej1DDfN9emo1hRMIt/HptR4EgDt+lWa7j8UeAKXNXh58WZOnVkRXOe
	 iMUdKlYT7QVz8MeKopzmZRuJuFZS0a0tClvZKV5a6pfsowkfrdni9Lsq3pGc2axdsJDJ0
	 4Dyvjc/F37SrrUL98T4XHyhaA+Cn6f8R/hOQ33kmBgtavYR3n8fJg/k+HO41l/tTRoken
	 T8qSO3FAo4Dlfa1TxeBvGjIV5m2NUDyh2f6W5OHBehMFfabGa0eT7folveUtSqGwGxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349237;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sPAT5BdNlhSR3TVHkk2zOI9YV8pl9pF9QIk48sjM/RA=;
	b=vSAQWA19Kqakme0O4eRoTW7c0ChSvzCHJeHpC+Qf7cWmyIEHh9S6FU3CqtdnAMWDKfnX
	 LgGwjy+LjaMU5YHyUBjDw0X3FUEuG3LF1H+/qPh6fePsdvEjFUELOKUg88/J/Azgl2u8a
	 JoHGmerG3S3y6tI1GOOnVqir9onV5SOWjwm/CTrNoW3vwO34iFZunzwKT2QGdYM/XWXhq
	 GV4zwuzBUw5pwaTFP/7AxVbd8LO9pP/j1yfZmIMBpYaoHO60rJdZ5MddBbOi4RrdY+XiP
	 LjNPn8bHWiRWQTWuZ+rtKosL8Y2pLHhN5szMy/QR7zsOX5EWWBFe/sJmpkB+4TfHS/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RuNNqWEj;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69876606A31C
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 08:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69876606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=RuNNqWEj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RuNNqWEj6+XnzP+7lSLupdpDCajAdmybPNVly+fneDvgeY39ZyRTJxvtr1xuS42HaI9KimeGc43E6
	 wQXFWpD1gyYQvA2eYXz9/4+MT0QrCCWfzMZo89XwyGf1NIJhNKFw1c1sDSG6P/VWJyeBT/1a+5DFtY
	 KuIAgdRzL3NyIOXA=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae4566a3f2-12cef;
	Fri, 30 Oct 2026 16:33:46 +0800 (CST)
X-RM-TRANSID:2ee86ae4566a3f2-12cef
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae45668c95-55de9;
	Fri, 30 Oct 2026 16:33:46 +0800 (CST)
X-RM-TRANSID:2ee96ae45668c95-55de9
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Fri, 30 Oct 2026 16:33:42 +0800
Message-ID: <20261030083342.1531-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dcss_submodules_init() enables the DCSS clocks before initializing the
submodules, but if the first submodule (blkctl) fails to initialize the
function returns directly, without disabling the clocks again. All the
later error paths already jump to ctxld_err, which calls
dcss_clocks_disable().

Since the clocks are only devm-managed for their reference (devm_clk_get),
a blkctl init failure leaves all five DCSS clocks prepared and enabled.

Jump to ctxld_err so the clocks are disabled like on the other error
paths.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 7fd0c4c14..551786060 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -70,7 +70,7 @@ static int dcss_submodules_init(struct dcss_dev *dcss)
 
 	ret = dcss_blkctl_init(dcss, base_addr + devtype->blkctl_ofs);
 	if (ret)
-		return ret;
+		goto ctxld_err;
 
 	ret = dcss_ctxld_init(dcss, base_addr + devtype->ctxld_ofs);
 	if (ret)


