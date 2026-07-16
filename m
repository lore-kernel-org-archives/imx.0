Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112213D522C;
	Thu, 16 Jul 2026 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208008; cv=none; b=OVLeyA3atBq1Ij/ahnEJGB/fr/u0q3rIusT8X5hj/09ZriinAhZbqhOo8GEIfKy6cvSgX3kDK38INXqWBDWWC9XNJV7ExqQH2wvoJU5HVENHMXPlnsfLgNfhQZSLvTqh6egpgCgnYdsZEV2Yk3wBuJ7G6CkAFpA5HB6TYGpEUKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208008; c=relaxed/simple;
	bh=1I3UeytjrpTm1Zxt6N8iRSRngsveCRIzG81oAYMn87Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYl59S1I/9Fm9MlgJYKMa2GWjBt0VTGSz2MRb4MNhmiUf5lYit8PzamCRQoiJsswART29uh5IDhO+uKF7j1FO/Q2jIW6cMqFGanTRI/4fQ7SHoqnBxTBF/3sbaU4zEJRaOten9uWGmas7DcZNhMc7wNqK/WqwnyTLtAzgN/2Tkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRbjkQcR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRbjkQcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421181F000E9;
	Thu, 16 Jul 2026 13:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784208006;
	bh=G9TdbDqBLIgYoXEokaUX6Znn1R65A/jD89s8AWApvkw=;
	h=From:To:Cc:Subject:Date;
	b=oRbjkQcR/w8JCQbBajwuQeUYIyWdhQjZSXtS9hdHyhYj/pAFim58GsWKiSJsWpZx2
	 oDBIzUSOxNbVIHfDemBiH4VqUHwfkWsok2MK6Sax36E5yz7mMgcqdUFXbuabgkY2Ml
	 KUWaTj4R18cPKEgfEHhT3JC+ICH1HullgL98MnsmlAQiJBzYtSNI6OMLRIjk6peMC8
	 1FAvzSRwYXBilnt0rwQtuu0DB+ROm7J8HMTFhtWFbSziMZ+wh53xxrMzvWbyAVMnqM
	 0h3nekRVyhGUIf4ETc1ZxI629+hgc/GfqBn98oCHmjvuyh7t1Xkuigzn6hixNEmTok
	 x/L7CFujQMZXQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wkM0S-00000006Z6m-0Dkz;
	Thu, 16 Jul 2026 15:20:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] drm/imx/tve: take i2c adapter module reference
Date: Thu, 16 Jul 2026 15:19:37 +0200
Message-ID: <20260716131937.1564892-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i2c subsystem currently blocks during adapter deregistration
whenever there are consumers holding a reference.

Switch to using of_get_i2c_adapter_by_node() which also takes a
reference to the adapter module so that an attempt to unload the module
while in use fails gracefully instead of blocking uninterruptibly.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index e861b8b9d8fa..389f45d54faa 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -528,11 +528,11 @@ static const struct component_ops imx_tve_ops = {
 	.bind	= imx_tve_bind,
 };
 
-static void imx_tve_put_device(void *_dev)
+static void imx_tve_put_adapter(void *_adap)
 {
-	struct device *dev = _dev;
+	struct i2c_adapter *adap = _adap;
 
-	put_device(dev);
+	i2c_put_adapter(adap);
 }
 
 static int imx_tve_probe(struct platform_device *pdev)
@@ -554,11 +554,11 @@ static int imx_tve_probe(struct platform_device *pdev)
 
 	ddc_node = of_parse_phandle(np, "ddc-i2c-bus", 0);
 	if (ddc_node) {
-		tve->ddc = of_find_i2c_adapter_by_node(ddc_node);
+		tve->ddc = of_get_i2c_adapter_by_node(ddc_node);
 		of_node_put(ddc_node);
 		if (tve->ddc) {
-			ret = devm_add_action_or_reset(dev, imx_tve_put_device,
-						       &tve->ddc->dev);
+			ret = devm_add_action_or_reset(dev, imx_tve_put_adapter,
+						       tve->ddc);
 			if (ret)
 				return ret;
 		}
-- 
2.54.0

