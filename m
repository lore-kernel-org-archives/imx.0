Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414B41C769F
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438681; cv=none; b=UREwFpqpE4Cv74LW1qAHi22ajUpRtbDfAwuOvs05jTa0KZCx6y5Nqj7Iai1L8A5uTr6gx1jhW7ronuMvnXNlpR0rs/UY//nhRO4sO8HxKSBlae/HjOGIt8qRihb3sn7lXo7ypbgYdyjEWJvmCCiHHkLPJG7seeHM2OOBStsZ878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438681; c=relaxed/simple;
	bh=12N3q46XQiecPb2oufmrGICQCBcT5ecdudDGcuTf44E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oYsmhhkXT5I0cFa7VVnNnm/qwOujAAFMgdjHDw/FDnEegoIoeeYka6zyg0EWEb/lMfvK8Y7WsMEpMVoFY2sMqIt8GxGkinY9MAKHc0liPeuSyMM8jvfwuGlEklrycBVsNbAee+azXdI25B58wdBogKdRJx4xSe6MEs1tbA4g+MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=ILQx7ecp; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=hZnQCOwC; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="ILQx7ecp";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="hZnQCOwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1725438678;
	bh=12N3q46XQiecPb2oufmrGICQCBcT5ecdudDGcuTf44E=;
	h=From:To:Cc:Subject:Date:From;
	b=ILQx7ecpTvUCHqc5lj3wAK15OxOUbxTVwjQsW5/97Pl44LokJI8jXjsj80z25OuDF
	 iM7OkDO/nDW5vWYHvLDHeKlBrqqRpfxrbKKFel16AoF4nFao+eJTH/td1xUs18+Vg7
	 f7UyGD576y/ZkJheLuYv7be4lGBReQQunP6mAdl+v9EqiZnCDRMIwQKLyG3VrZd+W6
	 g+eJVyPOCdeVYwqoOsD4MMddFZDpjc3p6Sr54v2ITJ0Xs0lJuODf7hEZkjoB7sTxgn
	 awA6LvefK9wo3KQK8arMeelgkhNohKGrb4V7FPBBsA7XnBbXQ0m6bVtSYHizEbLKPd
	 NpsY9T02GdHag==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id AE34D1DF
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 17:31:18 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=hZnQCOwC;
	dkim-atps=neutral
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 9F3169FD
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 17:31:15 +0900 (JST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-205428e6facso47137925ad.2
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1725438674; x=1726043474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wl5lFlZZmqmzzNDLDZabcElQI0pBWjUywY0vrZnCNgA=;
        b=hZnQCOwCPuR5E70N8w9AAAm9DpXpTgL1eS2mzo2MGpfexEVYe7NhFltKkirIqXcy85
         ++2hR4pESqRGY8RqF5fmBK7dVcjJgjDEJQvfwwdDyvCZVRK/RnxFXc4XafgRfiW6nVK8
         lNuYLhncjtVri7OLbAPcV9KwmtsiLDytP6Cdq56ScYSclmefLIszJgolGuNElKzTqaZX
         d71qWQpTERxcA6bttO3ZrDey28S3Ogr0pek/iBrW0bgec4bMhtH/jshpCKKrbb0fGP0b
         qsnObkHNm0x0T7s4UuQHDZ1JdjaJXAULORkfRhVSPjZdrv9JXilZRVtt67K/PVtOYhW0
         atxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725438674; x=1726043474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wl5lFlZZmqmzzNDLDZabcElQI0pBWjUywY0vrZnCNgA=;
        b=dkANCmgYjOFOKbbjQ0CJJ/Tkc4tkivuLMHX6fZBvaNTaqVGiXUBh9Q+hbfICfgoVHB
         +59nnGIYtGch3khYK2Z3hFBHcWCpmcxYGM4HNS6ppmnpcHNb4L9O3t3Y+h1BcwvQNyN+
         pdXbuViVNGtEHVxyA8B0nbX1L8+YfQeWntxJwD09K5zqQG6yncv3F4WCczH4m8r2XE7F
         a7cbKFP8KTwkbvm1uaywyh/3Y+gMz+e/bO8YfscN14YXZ2sXV9Jlbx39aBqq2JffefJl
         y01xhQfwoog/LR8ZDSGDKVguqdXv4R6L7ZHo3NrkoiSqzFpreSSHz14/BjtMISjizXYv
         7pGw==
X-Forwarded-Encrypted: i=1; AJvYcCUjKXzWyi2654nKZ+yfpl9yW8tEIVQLYa/hqx+s9Yzchtrwx70biE/e9uNeaiuw+ZVqVas=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx2+rz3ZGefV5X80AjGtnqpk2MMWnFAEtpKvNNacAEYLGzfjPN
	NowdBS/vyD1Ap5kpzdka2BvO9nRp/aZg60TljFNqrCB6jyjljmXB/DYFYTECrEOFIJ5zgvqjL0w
	E0ioSBLsdPW7bjyF/ySSXnZxoTbEgPZEhEv7GFcvZL5++hiopvzQ=
X-Received: by 2002:a17:902:d2d0:b0:205:5544:bad6 with SMTP id d9443c01a7336-20584230d75mr94740785ad.55.1725438674423;
        Wed, 04 Sep 2024 01:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgJbK93rPoTGn7e+5VtWYSo3ES6TsSkat4XXudfYHMjSL/FnAwD5lW7dBeTsvIE7zMeiGN1A==
X-Received: by 2002:a17:902:d2d0:b0:205:5544:bad6 with SMTP id d9443c01a7336-20584230d75mr94740425ad.55.1725438674064;
        Wed, 04 Sep 2024 01:31:14 -0700 (PDT)
Received: from pc-0182.atmarktech (117.209.187.35.bc.googleusercontent.com. [35.187.209.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae968f78sm9198335ad.119.2024.09.04.01.31.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2024 01:31:13 -0700 (PDT)
Received: from [::1] (helo=pc-0182.atmark.tech)
	by pc-0182.atmarktech with esmtp (Exim 4.96)
	(envelope-from <dominique.martinet@atmark-techno.com>)
	id 1sllPz-005H8O-2o;
	Wed, 04 Sep 2024 17:31:11 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Adam Ford <aford173@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Dominique Martinet <dominique.martinet@atmark-techno.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with selected clock
Date: Wed,  4 Sep 2024 17:31:01 +0900
Message-Id: <20240904083103.1257480-1-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when we
cannot output the exact frequency, enabling the imx8mp HDMI output to
support more modes

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
This completes the patch series sent by Adam Ford here:
https://lkml.kernel.org/r/20240904023310.163371-1-aford173@gmail.com

and makes the cheap screens we recommend work with our imx8mp board
without further kludging.


 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 13bc570c5473..9431cd5e06c3 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -23,6 +23,7 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 		       const struct drm_display_mode *mode)
 {
 	struct imx8mp_hdmi *hdmi = (struct imx8mp_hdmi *)data;
+	long round_rate;
 
 	if (mode->clock < 13500)
 		return MODE_CLOCK_LOW;
@@ -30,8 +31,9 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 	if (mode->clock > 297000)
 		return MODE_CLOCK_HIGH;
 
-	if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=
-	    mode->clock * 1000)
+	round_rate = clk_round_rate(hdmi->pixclk, mode->clock * 1000);
+	/* accept 0.5% = 1/200 = 5/1000 tolerance */
+	if (abs(round_rate - mode->clock * 1000) > mode->clock * 5)
 		return MODE_CLOCK_RANGE;
 
 	/* We don't support double-clocked and Interlaced modes */
-- 
2.39.2


