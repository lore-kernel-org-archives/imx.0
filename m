Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F53FB9F
	for <imx@lists.linux.dev>; Wed,  5 Jun 2024 00:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717547090; cv=none; b=L9nXSrk7GzqpKEHnS7zu6gG+Vk34b0oEL6SgJiSH473jukCrA1QhrhoyqbJpY9cgCtRkElraV1h73OS/dc4YRoMKs3Gh/Z+UYTgrqHI9kyLr9aQ7S6Dsclzjm9AP9ShgVWAtpkT1tI9dJD+2tvE5O+8e3n/sSz6qFRafgmzTwpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717547090; c=relaxed/simple;
	bh=vhPzviMn/rgVDu1u39BrxfVEMMEmR6rzDMtKb/Q2+t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZ8wbix7Cky+4mOrtTXhhWFSyYFZEQ3xF4TQbyDNuSgwoanjvtg5I7q0fILeSWgFmBxWddsI3fkSZmnoMDQr2EOb59RormKF3MmHn1ymGuv7R08GTpJJ2txq6YN4Zpe5aqT+wAu2dmHgDNKMY/rbv5bkvwQFmf7tCvxPpfd2xEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JX5tPZ+/; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JX5tPZ+/"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6cdf9a16229so1222705a12.3
        for <imx@lists.linux.dev>; Tue, 04 Jun 2024 17:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717547088; x=1718151888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msnwFK/XkOnU7RbguwwCWHAg9Wx/3x8graQzx6Y6iJo=;
        b=JX5tPZ+//bDOi3l40U5/8v0L+GbnaRo+QG6sGX0gq71Dy2cXeNufSkdRk0BdvKmfdL
         cWrB7zDUxpYS5+Cjf+l/wfcn2J5JRDlG4pmRfUpI/M3wEoRY+n4AoXl25oydRd8zhzCx
         EoclUOnyusZiG7yFCiZQnk6q0vbKi/F5EkvT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717547088; x=1718151888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msnwFK/XkOnU7RbguwwCWHAg9Wx/3x8graQzx6Y6iJo=;
        b=UU/vMK+tXMmcztaEDD9eSIMk9Hy4iILdDRgDzvfDn7CXg8QevPzDvJ393gccK2jpem
         feD18h7KRt5GBDFXsMQSWzbGGn+SAJpQMDX40VTHz8F6/KojJHGb3lk0Ce3z0cT9+rIH
         g6GpDVvvcSZ8C93EedBtPZLZVwvIFvEw6Wvh6nY8pJwOwMcL9QpywjtJdc3QHOWwoPpW
         QdA/dP92b3Q9G0+XrckBYtMMVPLH5LCBVA0U/OtVeS4gByiQfWXOR1b1jMnNPYSD6rQT
         00lPqJ26j9mNSf/HtLCBLj1/fPbBjk2MGEuV2RpVxvROuLsWcFiDbIQWO52BQ6tlFSrT
         u+lg==
X-Forwarded-Encrypted: i=1; AJvYcCXJh3opD1ww9aGooCBckZxjk8BsrS3qDwnrmdymgGt2aGd90HtF+25Kd8SqfdnQpQ9/Po53Puux0lsOYinE9Onz+JZO
X-Gm-Message-State: AOJu0YxwVAemoKyZx1zvySHGqr0ZSqb4DcCSb16+jyGWh96V9Eoaw7UE
	6smdPqZCWQjdU+WhgSlRIJVUD/9yB8pnsz/2D+hzPbU9YgdpVsrJ2bu6Vf62ww==
X-Google-Smtp-Source: AGHT+IFbuMMubq5nzPSGHbnA/7JCHbN1RIJ5658MiA6y66RGqchQoA/HmoffnqBh5Mo5cI2sbFTEzA==
X-Received: by 2002:a05:6a20:1590:b0:1af:d153:b76a with SMTP id adf61e73a8af0-1b2b6f68b99mr1497594637.18.1717547088161;
        Tue, 04 Jun 2024 17:24:48 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:3609:ff79:4625:8a71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 17:24:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yuran Pereira <yuran.pereira@hotmail.com>,
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/24] drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
Date: Tue,  4 Jun 2024 17:23:02 -0700
Message-ID: <20240604172305.v3.16.Ief712fb6720cb98bdf9ec8644362d028b6554f9b@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
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
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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
2.45.1.288.g0e0cd299f1-goog

