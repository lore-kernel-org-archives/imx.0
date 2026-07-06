Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4829379EDC
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348062; cv=none; b=AunP19Jf2tTVkNXRS/CPP57Gfa8U0LHjpdw1aWx5kNNSEFEsJI8t0bG6HyefXbORWXtdJmSmRitEfjFVYmspiy2WEBiegVMTwc4i4gm7wsFVxBrvQqGe1Qi+cTukifejNys97YIkkTYm90dxy7ejmp2Z7QeQveafOHl2eaYWHbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348062; c=relaxed/simple;
	bh=5Wnt31yQHJfLi2cT2JQcz/tKHvw9ih8sBZJ07DKrbOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jgKixSZdbL88YZzqjtaUypIT5QYZKOkG1NZ+UCb0G+H1FV/IouY249Lrgq5xxzrT2Q1Ib1+MD28UrP58D4CQ3yDMINRXw0ztO+4YMGtyuEZyr7DgkviVl9mgQ7fuKQXHieGUp9xSN4Uut/ERhGAsTaBKBmiCTmI3mC+xvXi2bzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arnOQbv4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arnOQbv4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so28040705e9.1
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783348056; x=1783952856; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThmdWFoUi9SJhoiWKeVyJUwaJ8zMIfm7djT8Y8A3Rq8=;
        b=arnOQbv4pxC8dIb3Ggz3eOsE3f4Z+MDSKTTFJvyDu0AblrUXdV3xqlIOdOWlfLa0P6
         QuHq/qU5tVcJ4TMpvXFxmvnmxDSBpiTdnFELzfgUJlRZGH0dUKPOsRYEtB73Lkmb8tV7
         +4Mgf0m5TW4o/1V+x07cw8J0yOFZPfnQLN/RXNyvb2fidkmbvK187CqYLQbUTRfiDyhq
         R4ckF+naWIdmyow+MBCIjEoFqHL0rwGx06oJjB/jjmpu83ytgQmNzHUBUn+/e4G4rscu
         ZnJQLHuP77z8091NSwcvlLzg/sP/brHw/VJdt5hX1m4kDFbE8S+sitRGI8IkhS1qQIso
         vqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348056; x=1783952856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThmdWFoUi9SJhoiWKeVyJUwaJ8zMIfm7djT8Y8A3Rq8=;
        b=ozzHMu2VAfsScKK1S/bnrlNtfZ2Vocm18UFzB8yDUroLdo+WbQVv/AIFyiut+cMXts
         CZZllAaDujQls18ytIhMw3fByyFBE/Ibm9WpiI/MxlCRSQOFeeGdEV8uNnbWU0fpurlS
         H1lRLAlc2SlGAnt57U7NJv2O0apvi/auCdRdOKyGHM3gM3xhMzMYtHlV55HSQTZY53iU
         YD+B9lVwf5A7Q15IPLNo1OlkHbA3HrwrSxf5Ji26l5s86csrBwlpukbAKtiXUjglDPTc
         qgYzxyWgXLEyTIK6Ce702Mf6VhTuBNtr31rdy/wgq9hCecCBUyUJAd8ypUzEPC72QLus
         94+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpwkrapG9hwodX2YH/v9BWS+DuZQ64MMmDLHrlLucaFe4FY8m+fUCaimoymLp0oeivevyI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Mqojn4I91Y1GprYJCjOo0o0W7NHiQg4e+3Q6a4K+QbC42u/f
	Gv5AsXCzUIQtecdCspWoMLH7ScrJxKz+cQJWCO2rsRZvigqU6fL+6/Pj
X-Gm-Gg: AfdE7cnBH4KzyLam+w1XPbdf2bIg8wYLjuvmtrKggnuCzNx+Rlkec5R7kcS0QB1+M0m
	YRK65SWW8DdTOFC/tmLE3L/fHvbjiUCYSkHAP1jhczTvCux3TWQzDqnYVPMXXXArzZHfA35FdXI
	0qd8dzdIPuWOealIejf4TGVxRRrqFU3oYrIErCS/ExaCbZ6m3FMtpCJKOUkZh5yTBbBzqtNZCXZ
	gCEpC2M7b3LoumphxRohtq5Hl4FeSyvOZ4+WL4c8J+exR8d8F7unwjTyRpeXN08LcIPLuFZbe/4
	t90zSkMVYjjZXtSSzOz5pB+GrN6LK0tlW77250WMWHx5AObRevX73aKz5lNwamsnCoBr0p/WYal
	Idx16dXJyC38X+zqy+NNYgPECiQbNn4y1O+ZtQiQZ42bpe0/9cO4BSGlKcwxlBAVYctAz/uWeEh
	2ILJX6tY2n7asyXUKoxGp6E/1DOkkyp7yUDazQCJcn/BPa6uZ2q78WN9fdGu8=
X-Received: by 2002:a05:600c:8b6f:b0:493:a7bc:5bcf with SMTP id 5b1f17b1804b1-493df08cf98mr8234245e9.24.1783348055423;
        Mon, 06 Jul 2026 07:27:35 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:bfda:c630:e88a:7a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm268422715e9.4.2026.07.06.07.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:27:34 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] drm/imx: check parallel-display drm_bridge_attach
Date: Mon,  6 Jul 2026 16:27:32 +0200
Message-ID: <20260706142732.49397-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check drm_bridge_attach() in parallel-display.c, aligns with ldb/hdmi.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index eb75827394f8..fd48845877cc 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -210,7 +210,9 @@ static int imx_pd_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret)
+		return ret;
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector))
-- 
2.43.0

