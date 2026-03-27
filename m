Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B42DCC1F
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 22:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774650437; cv=none; b=pjsh4SDY0BrjIC07k6HVZZWmhvaGst3C/F6/dCy32GPz/qz9FTkxFuN7cwusDYdYFfnIDrI5CGAs63zO/OmTbJdYKybtnhymHM+dHy3NSy/wLpG1xdvkbayu0X/kuyoO363yVyPe6aRyBelabqQe9eFwvdQ5F6jpfG0UjfhM638=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774650437; c=relaxed/simple;
	bh=N2ffpG7GT211fQ5zkji6w7hKk/MOkCjKg7KQvmCllI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WvdEhZqKNrZ5LxU2J4wjGInDLQtNhpGv+mTpUDCjqiCmTJh2rxuppq7o/dQOS2dQJ21HjQ6/52cK08Z/6OPDLQ5f+76nM9a92Ze3faRQfphQKULfh7g5BG/tUb79okr3alCHB3l7wFUeD4Wje5DBxSLhJ+1ISyiQZ+eKo+XKvaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9VU16x8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9VU16x8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48538c5956bso25394545e9.0
        for <imx@lists.linux.dev>; Fri, 27 Mar 2026 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774650434; x=1775255234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k97b44HDmjZh/vldQtsPrUOt0HFv7cy3dp+8tuieXWA=;
        b=l9VU16x8xxmaEA6NJGKD/wd79Fv6MAwVw+VIKA5m7GjcrHHAiB3m0eUQ2Dgv69zRzU
         zHGjUrFyB+qpOeVBi+M6wNLaiO/k3e0tw7apg3VMBSK6nyLlZU2r40i7TfSa1iXuObZD
         Zlz7Yvh+KTZhF413WXrm9iwXLQ9xgy13Ysc7L8UN9CEnBV4TPU3yWuTEQQ3MkRyzQcVO
         3EHcDDmFkzrscrM17q4jcYSxCx7Kcp6ES5dyeQqm988D2EeOhkogaQKUn4TYj+Fga0to
         1sChEfcQmlOtENcE7wtSKATS1YkvahbegWtw0kplvyWtWG1v7GWu9B8uBY0qS625TonK
         5toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774650434; x=1775255234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k97b44HDmjZh/vldQtsPrUOt0HFv7cy3dp+8tuieXWA=;
        b=dIM8ouLjpGSZWvIwqiCTEZHTYgoO+oDtFYbkJaR5jA31HixAfck6C5FlmoeeAacsTw
         Hkd2YOF8edHHI3M8/mcd6FLQgbkZpj80C/I9OcLX/rkBHVibTzxtVAqzzJ88/kHCyt1g
         X/mNe7suyLrvveY/8wYacmh+cGokYtVdidPxagjUkNBZRknn3+LVQK4PVNAzeULPV+nK
         Ctpc/mWyxknh/Izz31O3U7O4Jf5SpwlFeOJBlGHjQEz53W39pFIt8dt8XqgD5dzulTZR
         H1EXu/bbGHVuDhSK6LUKoWaDoeWwPwmWvkb3TwNkDQTkRwo1sWLcgc6q2wmpX8SZmQaJ
         XxSw==
X-Forwarded-Encrypted: i=1; AJvYcCXtVqnxgHzgYtPMcyOFWVFtgz4g9GfoWToSeVZJiyuPSWLpK+FviJhUaj2peuJ4/xkz4/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHrVfwvKibd1jGPoFjZceb8h8uiCn/OBknUFAFl7PPF9WyeCQy
	aB812tgdVccptSECvC/4YmkNwebzzGcrPnuaYpgfPAlPALAPi/fBguLQ
X-Gm-Gg: ATEYQzxYV2g0Bk50TDkpP8/OlSvLxH2x2S1/WAErtfuTlNA6c7wMOXPCyFWfythsL7f
	Ua6kHEwjdU7nJ1TVUQqhgm+fkyEu1PhgIkxrFyplQaa2WSjaj8gw2GlWi5a3ibtdphC+qd0Ye01
	qLyMkjVt0VAAVk9F9CB3H5L1/OW3UQ97SlhygZPJ1pBsTanUpDwOIo3VtTRi1laA4fCPJeBFuZa
	PTce813fvhbM6a7IiOn5dIIzdJVusqytmbLpQ2PMAKCwllNrBx8mDjP6JQSk2A0hmNPAMyegvHH
	F8Qr5ZW5Pxkbbcb8eElxY+EXX3o2CftqKd6GrMYxI6uD/cJcxhRyIdhNMWmBDrmFzn8oHlqlimg
	42Ra+n4P27XosHSAtNcp8taCUquMYqnik8IZg8INpRSVh9Nu6T15RjAWgIDnE5yQeh7TOET1d1n
	KDGj1MaKAX0fYIoQwwRVF5JqyN55W1IYC8KJeZR3GHep1CQpGQyxeeC2CI32Em/g+7bLxmu2yYL
	YsAORpSBNxY
X-Received: by 2002:a05:600c:45cd:b0:486:fbc4:8fe2 with SMTP id 5b1f17b1804b1-4872912dd2bmr59529345e9.15.1774650433771;
        Fri, 27 Mar 2026 15:27:13 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873062ec9bsm10062655e9.7.2026.03.27.15.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:27:13 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	jacopo@jmondi.org,
	aisheng.dong@nxp.com,
	guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: nxp: imx8-isi: fix memory leaks in probe error paths and remove
Date: Fri, 27 Mar 2026 22:27:11 +0000
Message-ID: <20260327222711.268132-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
frees it on any probe failure path or in mxc_isi_remove(), leaking the
allocation on every failed probe and every normal unbind.

Additionally, when mxc_isi_pipe_init() fails partway through the
channel loop or when mxc_isi_v4l2_init() fails, the already initialized
pipes are not cleaned up — their media entities and mutexes are leaked.

Fix both by adding kfree(isi->pipes) to all probe error paths and to
mxc_isi_remove(), and cleaning up already-initialized pipes in the
err_xbar error path.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISP Channel driver")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..ab32c5b6ac9c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -490,33 +490,43 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
-	if (isi->num_clks < 0)
+	if (isi->num_clks < 0) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
+	}
 
 	isi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(isi->regs))
+	if (IS_ERR(isi->regs)) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, PTR_ERR(isi->regs),
 				     "Failed to get ISI register map\n");
+	}
 
 	if (isi->pdata->gasket_ops) {
 		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
 							      "fsl,blk-ctrl");
-		if (IS_ERR(isi->gasket))
+		if (IS_ERR(isi->gasket)) {
+			kfree(isi->pipes);
 			return dev_err_probe(dev, PTR_ERR(isi->gasket),
 					     "failed to get gasket\n");
+		}
 	}
 
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
 	ret = devm_pm_runtime_enable(dev);
-	if (ret)
+	if (ret) {
+		kfree(isi->pipes);
 		return ret;
+	}
 
 	ret = mxc_isi_crossbar_init(isi);
-	if (ret)
+	if (ret) {
+		kfree(isi->pipes);
 		return dev_err_probe(dev, ret,
 				     "Failed to initialize crossbar\n");
+	}
 
 	for (i = 0; i < isi->pdata->num_channels; ++i) {
 		ret = mxc_isi_pipe_init(isi, i);
@@ -538,7 +548,10 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	return 0;
 
 err_xbar:
+	while (i--)
+		mxc_isi_pipe_cleanup(&isi->pipes[i]);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
+	kfree(isi->pipes);
 
 	return ret;
 }
@@ -556,6 +569,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
 		mxc_isi_pipe_cleanup(pipe);
 	}
 
+	kfree(isi->pipes);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
 }
-- 
2.53.0

