Received: from mx-relay90-hz2.antispameurope.com (mx-relay90-hz2.antispameurope.com [94.100.136.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163EB2F5A10
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.190
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954369; cv=pass; b=hM4GnRsYObIBL10AF6xQPqPrH9J9H6F2OA85Wa4xeo00ShBCkJ2WHYr9Snsc/BR09w11SlTdFauoT3SsnKcoDUIA0ESao7AhtNl9sNUcG6A9drDzGbB7MDwBw3AiEkFlbjd3U7Dx8ObRMyq6bRkNe6o5Zj8aO/X/OKlmkzfnkjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954369; c=relaxed/simple;
	bh=LEugHl+T2Qjsz7Dwy5Eo2XDiHbOrQbuBQ+4N6hD52oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rVAQ4qHOS+UQjKpzqtb3qrK8ASnBsURSXFZNaYDVlcVGQO5KJU1KNqXKfwl7LpuZZ8a2vyJXRZf5jYp+FSQ4+bcssM8RKi8jGhfjoyacsslFJDqRo720JMZWsnmoJJtHkHLbX6oqfKnvlHb0khzv0XZUiRoDRU6q33Z40tGaY8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QEJPaMCj; arc=pass smtp.client-ip=94.100.136.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QEJPaMCj"
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Vy47wkPi9vz9nd/Ubb0WzYYj5086de9de6TtEsO3Zns=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760954340;
 b=Fkk59HkvLKNNoYS52o+LOMZYuwPVt6YPEDhIicL/adudtby9ioYbvUe1jm61bZzrcYB05FUU
 W2+jfMYmcNpY2CRz5buzXAyxKNs0qr8NjDfN3i6R5aw9b8oyhnLEwgE2qUezMQh+OAsdm71XnZJ
 ARDaeaomJqKsMJDi1zV3n3M2/WUfw0dhPVvNjM+Ebnd54bZF4CPPgwJE5CmeRXfX8ibGjH4rrA3
 bECXMgLRKOkbJU2J2eFX6NbZ9KTgdcr7si4Puwrcc2fGuQw4mYVAVQkxEq0y+kXRDV/Bu7qYzkH
 xjNkUgAdDqHd/Da3LXPSazjQ5rHPUAALT3nCX7V4xmYYg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760954340;
 b=bElIPWePspruczrurS+I3UZYbI82vZigxyF4qm5dyvvpovZUmRge0D1mHtlmXP63u1sldDIX
 mygl9vGzCpN1zHX1NHdtOLGelzImYSqoJfhWwvL5ioVXhspvkBCUFxfrOyAonLBidCfpxf69t+P
 oZItc2Rfxa92XpEPHxlc9y9zo9RHXK2aBDmdCydY/IcuOLjZnjuEE2XLV597mPQnjUpqKPnG1hA
 qb0GtxAQmGVheGgasFMsUM76memVAosLIBII5jQJW93SPbpkuib//vrUWymc7BCiZ2OaUa6TA+9
 GagMN+I8hpHxaavkU68aBSgOuP8Bet72A9fJUspqoGX0g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Mon, 20 Oct 2025 11:59:00 +0200
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 88256CC0DD7;
	Mon, 20 Oct 2025 11:58:49 +0200 (CEST)
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
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liu Ying <victor.liu@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2 1/1] drm: lcdif: Use dev_err_probe()
Date: Mon, 20 Oct 2025 11:58:45 +0200
Message-ID: <20251020095846.116202-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4cqrVL377fzX01q
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:303711fa30182f3b5e5363e87477579b
X-cloud-security:scantime:1.797
DKIM-Signature: a=rsa-sha256;
 bh=Vy47wkPi9vz9nd/Ubb0WzYYj5086de9de6TtEsO3Zns=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760954340; v=1;
 b=QEJPaMCjr3WSx1QnUMmgPqFnJlksHWFQFB8tb4f6IsS5A90bXwTfAppKrzVp1sVsbifF6trb
 ErAtaqob8T0lADDT42xqF2LlnkyyXc1yAqyurdLxlUnVcn20eIl558h7RAdCcFi8CULUFySQwHZ
 JYfgTXJfPy0AkgXHkYLkfU/BrZFgqdD7xyjfaQdnf7SQaPgIo5Wlb3NbDQuHc8zFXMu/EFzkWUP
 WAocYY6qUmLJONrW4I4Aj1IoipxC2gVj86uQ1Uzq1vJM/MKK5GjNBBoKjRGSVMi+Ga//bS3xbDr
 Ke+Vqay12sj2uShpnIW4oUsVQQMY8g41EZzHopFk6WHFw==

Use dev_err_probe() to add a reason for deferred probe. This can
especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Collected Liu's and Marcos' R-b

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

