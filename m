Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905F134D4F9
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633101; cv=pass; b=Vqnm/JHffAsEpOE8Qc79+nwhZqTVWKRAWWOeACv8cmn3mqgdp8mKebj4usfv99sDExEbAjZLP0UimTNj8GCmC26RTUu6toA3TD7Do7BMC3+h3e8UuD9uyS2Je5S2xsGV/O+2dlbU/byBBNhZO3lpSKtm1EqYUgbHB3Ip91RD3o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633101; c=relaxed/simple;
	bh=vb76K7DxUOHLYCCWwZ9hT+el5Zb+R31VybQPF4zcs/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HsXBQU+IFmalaxJlZcLXlHolWdp9d4lwgpjhbCRiempVL4ah32oHrdylDccjAgtz8t8fY/pln5DM62O6bYJem++OiZvtMDHFc+V9jDYOXLc3wNSSP5+LWbWIMxtD2kAVzrsONxlTEc6uOybIk691v+u6CeZSk7W8IS/ub7Q91qI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RHMmegS1; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RHMmegS1"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2qgonF5w2c8p56bKXYWtL97G1fsfaN/h16mnAE/Q9wM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772633077;
 b=fh9cIPECa63QEnXjlIy3fvxA4OofZDFvVsYEQEkVMoCdLJbn9h3egx3ROfttDtVn618+Fsgz
 MFParso7Py5QkaxtUjMqMuprNst/j+BWJyzFl3mbhpHOEcTOi895sr6RF7wD0bzVrS7FEkVAHvh
 dmZ7Wt7Yvg5VYkPW2WWZUYrE3s1IbGIP8TRcXs5juAZC3L+UFCn5S9fwhaz/KnQNv9QzywJSkkV
 szjQD+ZJ4mzm6pDGC6A2swxopzfzvXObhCW5CPMDcSmJ6Y5OPKAnyWoBGZP3ZEhAx/sz8GufqFe
 DhcpGkSyAdyNqNl0/04Uj1txGBLZ/S612sJMK974GN1DA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772633077;
 b=q6HgE03HLkeEaWjVAquMI8OIM4mjykwmpuddun9viNTqDHqMpG2ja7hYKb9oZtcJF0AfoMyI
 EUXofWGONY6vjBcj9dntNu4kxCpaW6g0O97Gw16OhEoFs5WMxt9yrYv8yZ+WQG2pXB7905vDl/b
 bQp0MsNNXm+oXDZkelUHJlgDfC7/FNRL2gx5qQ7HBbRXvpLEDzWrylXHqMZ3An98d6Jxw8q1tyA
 s99Yzxc+u8frbGomchd8/Jyl/RfkfsETnpg7svdZqJ5Cu13zVAR+GNZQH7qc5uveRpTruD3NyEI
 1QQlIGvAOwQz2e5W7BgcaghxqsEJuBUgikERW4GracUSA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 04 Mar 2026 15:04:37 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6AF095A0A7A;
	Wed,  4 Mar 2026 15:04:28 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 1/1] drm: lcdif: Use dev_err_probe()
Date: Wed,  4 Mar 2026 15:04:25 +0100
Message-ID: <20260304140426.1499446-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fQvYT2nvYz3ynSL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:fbf676b47f4878b0afe26766cd0a8878
X-cloud-security:scantime:1.444
DKIM-Signature: a=rsa-sha256;
 bh=2qgonF5w2c8p56bKXYWtL97G1fsfaN/h16mnAE/Q9wM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772633077; v=1;
 b=RHMmegS1qUdYMls08WzlX7ea1LgJyQExf3fxe8br908/wXYXKSwgx+8ZX3BFunCiC2q+PQTa
 htuztWvuKqz4xMesll0y7b00g+0+yj1LMlNxlMF//TP84yrInWHlMCk7690wtwRsSArDwT7LosS
 nBATgukypsuuLMt82/5Mwic9caWsmpYwZgBgsn/OnjHNP5sMVmWL/9+gJjanMzOm4ziOZJLLfpt
 P7OqHJ+tevEw69A+GbQ2WhN73kfTDsHl5n/rD9m0x5ObRV5N4OxKgeU7I3kFXu9ys0J0s9ggmVz
 AaJmMiRaT6hAbaMeghcUjLSv0auquvRO0qWz3JyKav0Zw==

Use dev_err_probe() to add a reason for deferred probe. This can
especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Collected Frank's R-b

 drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index fcb2a7517377e..47da1d9336b90 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -149,15 +149,17 @@ static int lcdif_load(struct drm_device *drm)
 
 	lcdif->clk = devm_clk_get(drm->dev, "pix");
 	if (IS_ERR(lcdif->clk))
-		return PTR_ERR(lcdif->clk);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix clock\n");
 
 	lcdif->clk_axi = devm_clk_get(drm->dev, "axi");
 	if (IS_ERR(lcdif->clk_axi))
-		return PTR_ERR(lcdif->clk_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
+				     "Failed to get axi clock\n");
 
 	lcdif->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
 	if (IS_ERR(lcdif->clk_disp_axi))
-		return PTR_ERR(lcdif->clk_disp_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
+				     "Failed to get disp_axi clock\n");
 
 	platform_set_drvdata(pdev, drm);
 
-- 
2.43.0

