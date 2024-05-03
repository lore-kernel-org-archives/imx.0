Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83307135A65
	for <imx@lists.linux.dev>; Fri,  3 May 2024 21:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714772272; cv=none; b=O5oudsLg/uFtRPPrldOFltkOWg2wyoo/E+ywvT+tMuto9GMb1OzqyoEvkTlwysJ3qXFWEdkVFI4C7rs+CvcHayeFm7/ChZnhfDq9QdikRmpe5nJmowmva5bMOaX5g9G6ktYspWfSu0i91wlAc3/joKdQSmBkg7/juEReebKfsC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714772272; c=relaxed/simple;
	bh=Ag630NMyOKc2REE64wl78IRaThiGetixkU0G1oxt3RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jj4jNof6ryJ20yoi2sEMPZ58ckTt3XSstnK2paTA+5MDnaANLXz+4gAYioWveu865r1CIFw+qnsNnLNp6k3aC5rK3L8Q4Shz7pVJCz7v11VWu8NRQSUPwDRzvy2Qedht9qESw5tobbUd9gzRiw/8ZYiwr00iBG1YnXB6tKBvYHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jv2Nkrrl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jv2Nkrrl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e4266673bbso1050555ad.2
        for <imx@lists.linux.dev>; Fri, 03 May 2024 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714772271; x=1715377071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL+8TR+FVEOGHEmIclktS5Eo1OM2fp+pjfqU2SfLZsA=;
        b=jv2Nkrrl2ToQ82HZdbnAQn4SZFWe8aR5KjLS8rHkN5v3+Y3HcZ03vGOT4gY52OQgGe
         mPsj8WGBQwetZfYutJj8wPYZeiatB2PvjuUeBopNmliH9JddLWGErppOL0rPqR1G9i2G
         hH2ymdXJriUZGa6wifUe0RVA5Q0TwiMH9QM3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714772271; x=1715377071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rL+8TR+FVEOGHEmIclktS5Eo1OM2fp+pjfqU2SfLZsA=;
        b=b8mmcAbykSbf8+zFP3e2IaGGLOTeLaIJlxM/yFHk6bQ5+3+i5LPSROszjSVgTa5t20
         Oma3Ug++GtT7/hiZykwd5wS7GtOf4QaU1IXZfi2WHS6mPLiLqL8qVK9ypLlNNa381tlO
         5IvIJSYRBQEZzRr8tQHNxZLM/ZaW5ZjJn03wAB5uekabNjsaAYiZLALCBSb5K6sYhJsm
         IVJMT+oXrqvsZ0cifsomAKqRhoR5Kv+kr72KHJoUw9MRGW19OyPocgYPa2S6CBqDzFjV
         Hjqrg2GzemldJboyBHw5npC+Q+1Fw8g9VJOZlmqxa+bVaX4okUev+RYpfKudlu1KDa51
         ueOA==
X-Forwarded-Encrypted: i=1; AJvYcCVxWT1GmQXBRfiI/TTG+BmUYCTq+VWU4xY9LT5eWIqvSbGgIIJJxWu+NDaQZyw8ThNa7QkMopo/TSRJIuVATrEXlyeQ
X-Gm-Message-State: AOJu0YwZeV2Xt+eJbKWNZKDBA4aC4ObrwyukTjeKd0SoCQlCgDpz/BVV
	hl1NskKtUWbK8WwDoD1VjJSf+EiE9dcDFqUMEVq1IkspWplA1shYgirHXnkLeA==
X-Google-Smtp-Source: AGHT+IGqOILtOMpTQpdNPww4A4HTkoN+afOAFJGfdSt9UtYlGc1IDjYPsnnRSAg9cfQkss7IrOZqZQ==
X-Received: by 2002:a17:902:b495:b0:1ea:f7d4:cf2b with SMTP id y21-20020a170902b49500b001eaf7d4cf2bmr3601945plr.17.1714772271011;
        Fri, 03 May 2024 14:37:51 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
        by smtp.gmail.com with ESMTPSA id j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 14:37:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Yuran Pereira <yuran.pereira@hotmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Marco Franchi <marco.franchi@nxp.com>,
	Fabio Estevam <festevam@denx.de>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 37/48] drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
Date: Fri,  3 May 2024 14:33:18 -0700
Message-ID: <20240503143327.RFT.v2.37.Ief712fb6720cb98bdf9ec8644362d028b6554f9b@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

A grep through mainline for compatible strings used by this driver
indicates that it is used by IMX boards. As far as I can tell, all IMX
boards are now correctly calling drm_atomic_helper_shutdown() so we
can remove the calls.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Cc: Marco Franchi <marco.franchi@nxp.com>
Cc: Fabio Estevam <festevam@denx.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: imx@lists.linux.dev
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 98480904126c..8a3fe531c641 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -243,14 +243,6 @@ static void seiko_panel_remove(struct platform_device *pdev)
 	struct seiko_panel *panel = platform_get_drvdata(pdev);
 
 	drm_panel_remove(&panel->base);
-	drm_panel_disable(&panel->base);
-}
-
-static void seiko_panel_shutdown(struct platform_device *pdev)
-{
-	struct seiko_panel *panel = platform_get_drvdata(pdev);
-
-	drm_panel_disable(&panel->base);
 }
 
 static const struct display_timing seiko_43wvf1g_timing = {
@@ -306,7 +298,6 @@ static struct platform_driver seiko_panel_platform_driver = {
 	},
 	.probe = seiko_panel_platform_probe,
 	.remove_new = seiko_panel_remove,
-	.shutdown = seiko_panel_shutdown,
 };
 module_platform_driver(seiko_panel_platform_driver);
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

