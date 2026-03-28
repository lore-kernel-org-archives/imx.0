Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B59431E854
	for <imx@lists.linux.dev>; Sat, 28 Mar 2026 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774692017; cv=none; b=anqlohMZWWGGlZJEyhJZFx+zob+DZWT28xaL4IZlriuCDufotgCvxvOwQ22hHYOkiOJhpEP7XmewXlMdHdCdO7NeP1Y5gSrRsDU9DZzdLhdXpAZ2gd7+wJTXUgXPDtm6JHkXckAdd0m1NwCvOKaAU7AqQOJxy93ggiy8AnbXOn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774692017; c=relaxed/simple;
	bh=DllPNEY5HJhelRRWtMlz2dJNBymbUWyXeyN0iDUfRcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dff5IVvrb13a1pCLzS+c7YoMML707UjmNAjxQ515B7ytUavvOZhmud1tJ8saM4dIYIN6Aja8TrQnD7oM5BA4B+QUaO+WplKK98hfZYOGj7jAO4I8k2XEC1teOojFOyJd0o29mtqtHv93QJ/Cv50oGk3Vj2v0OCDgUc39V8tIAWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaeoRcau; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaeoRcau"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b983bb07eso1316618f8f.0
        for <imx@lists.linux.dev>; Sat, 28 Mar 2026 03:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774692014; x=1775296814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5w1Y1b3TwAv79lqz5JishdxGsbpyNm4BW0hPIUDQcY=;
        b=LaeoRcauWuF2Y3FMtpCA8ew73Ji85i21ZPxPjRdYrpf/CH17ZrVrRswy/tuKxLfVDJ
         aduEuHzsok7Z3Tv8S8YlST2LTch9F38L/sL0Qa3N470oIdFw57e+9OCumP5sjBKI5pk4
         W03yMDSQB7/9PdHRrCdGZdOsQNyu1mt0fClwLx/ur9Mw+EJgevlqW22ByN5oeWrntmZ3
         h46umIhYiRKve5uvwqxvNz6dXRXLM60rDUvy2lIL7JL7bG/0T9Qv2A85nEAd9wWbf2Jt
         lKytTWcJUyxqhvQ2gQtS2n6D/3Q0bq4F1MxbP1qMA0YVxYU0+PolX41//k170mlRC1mo
         vFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774692014; x=1775296814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5w1Y1b3TwAv79lqz5JishdxGsbpyNm4BW0hPIUDQcY=;
        b=qAa0q5DublnyXNIHjsZvR2uz+MYCjTN07xeQj+W44KQ2Do/yqoWF8M9fdjnqUuqbR6
         VMfKYDptFTmfHwQCQ1Egl/L82eqCg+1KkX3nAFPG7/PXQIhCepjD1+/u5MQPf5x9GVta
         VqZUxT5q3UywBAwfF9K3yZmdQNnf+uReP/m5C+ZiQ+d1FYocjKzTGL0Mt5wuy8qYjjxh
         N60VBudulkSywTy0GYi3kSBRhEQurMbd0LLuxIcXXzUMB3mJN+JADTk+BVE5ngoZXhuN
         k43+iAFzBcWYMMAPCzTE0Ikbw3qOOqfON95I+tjNDRsbwS9P9HVAEAIYqJGmZhdLbOM8
         66VA==
X-Forwarded-Encrypted: i=1; AJvYcCUxm3BoCaMPl8sP/lr7IMbbNugRBe4SpglQzxNTH5+aijVMMh34WjnqmpH/DMNjwCzc+t4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZmr6TV3BknxZI9kOXTjIwTO5PZdW3qTG4jaoarYdHvL85HcEG
	RKjoHAOCGwC4HUfP+1ODrsbPOpLSS1LD2ZQ0PXLbeKA3xwVYrtcKjgDY
X-Gm-Gg: ATEYQzwYuO57BcG5jFJAVZWv0Ej6UwqiVIlvNvbzqEltyiMHZCot53wL4HjWoFoLhHU
	f/1/GWer8XrSyJdREvFL8NmHRhCXkVgk8JS8RAm6fAjMt0XWoSfDKHjq7ingqXZ6wCbhBlwN2Jn
	6QTQ6fT1zm+qXMZ1nlcCm37FnYPQlq9nZBZEcuEVnX3IQAc1ON8vrprdP06RyaxqGPYxSE8yd2+
	LpGnn3F+3nr8g8mHa3L/TMamaWl/ExREhbym5Qu7XoDN60Pb003tgAZmL0kZkb/dG9pzQ95rD4O
	FOgVcApRnTPLguvYrRmmjes+8jbmcFQHVkpf+PS5cjCF//sk83uPj+6fP1e1BPCt35M+b2U1dSy
	gYcCto84IZtf4lK1jTwWUgcE2BBGDMp6pDhEd4InUyvG1NgigkF4FVC6eTReIFm34N8r3/lfO9N
	7j1IQ+LepdjOKetSQQ8rf+zv4IvZDUmm7HxCY2NRafJbVZAa1qnw9+l/yhArns+T8UWl1hafkgE
	J2B5CtYbA8HR+uiDG8bK/0=
X-Received: by 2002:a05:600c:6814:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-48727f7be29mr91414145e9.22.1774692014189;
        Sat, 28 Mar 2026 03:00:14 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d4d884sm198418535e9.15.2026.03.28.03.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 03:00:13 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jacopo@jmondi.org,
	aisheng.dong@nxp.com,
	guoniu.zhou@nxp.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: nxp: imx8-isi: fix memory leaks in probe error paths and remove
Date: Sat, 28 Mar 2026 10:00:10 +0000
Message-ID: <20260328100010.41236-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327222711.268132-1-devnexen@gmail.com>
References: <20260327222711.268132-1-devnexen@gmail.com>
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

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
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

