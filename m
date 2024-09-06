Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D021D45F9
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725652117; cv=none; b=pEMMeBNpu1hLjJcxN7oGLFIACdbuJNrdQAikTrxDWAU2qW6e4gk5wpaEkYh5Eu3UlyPiz+ephmnfqZRuPowEUw+3H7HlCCKe6IzJrUlLf8fxDJXm3NlbwgTHjsJLnejtbtitRQwXqk8WTM5S8UfLj6ehyXendAb8XnewL9eUn/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725652117; c=relaxed/simple;
	bh=XbV4G23yHZQt0Afyfcg56V50a4AMQgZBjj0zuKMcjJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qp2SWsxd0Dofkd4BRiUwZxZSwcvkyZ3dI28vVzzc31jcA86/JOc/FGWODgjuqqPdoo0bClYjmMzDBCHQRi6CguVq+R9OSNyKwWmA1zRULPUvhne+ssTsFqtASUbSkfhQR0WTXCAqEcqyWe6EhTbyx2mfhIPpM2sXQKLllHK1IIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=E4G3y5qP; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="E4G3y5qP"
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mevBsT9PpGrBemevBsXT6K; Fri, 06 Sep 2024 21:47:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725652040;
	bh=+Da3YG45hYBpjGQbOAK9bnsoiqlIfkN8ZztMmx3F5yk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=E4G3y5qPUbQ0ybAxno9HO49+HCCyR9DDuZR0Q2jV3MWK6exeZ5zoDY7lr0x/UALpT
	 y+vBnTduSgfIhWgYOkzU8ApCFhnR5DZ7iL6jE55pF1x+men2aiCGUnhWJQ0oX8Tgng
	 4q8/TTMBhUj6AsXln/f9GvBsHjaFBLixe+aYDmI/bg/I7WXzvsAPY0fF+BDkh372J0
	 2Eb0KTU8BCVSmRqDst2CYj2b2aNUQ5YWVjcKIRY4XRF2coIKRDGKFQcYE/FQtfMxsW
	 zxXQa0kcUtlEbau6xQDhxqnJis3aLD2sLQDC/jl+plgWAPJhWjNhQB7vBlPECayMKM
	 QVWA17oN+hx1g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Sep 2024 21:47:20 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/ipuv3/parallel: Fix an error handling path in imx_pd_probe()
Date: Fri,  6 Sep 2024 21:47:00 +0200
Message-ID: <1cdd8523443d8850c5531462b30064cb2058924a.1725651992.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If component_add() fails, we need to undo a potential previous
drm_edid_alloc() call.

Add an error handling path and the missing drm_edid_free(), as already done
in the reomve function.

Fixes: 42e08287a318 ("drm/ipuv3/parallel: convert to struct drm_edid")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 91d7808a2d8d..6d51203f7f0f 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -350,7 +350,15 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imxpd);
 
-	return component_add(dev, &imx_pd_ops);
+	ret = component_add(dev, &imx_pd_ops);
+	if (ret)
+		goto free_edid;
+
+	return 0;
+
+free_edid:
+	drm_edid_free(imxpd->drm_edid);
+	return ret;
 }
 
 static void imx_pd_remove(struct platform_device *pdev)
-- 
2.46.0

