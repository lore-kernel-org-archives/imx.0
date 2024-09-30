Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802C419994F
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697892; cv=none; b=cx/iKG1osdLPqvaYgnLIAYzqzLnsOFvBpvZlBLU9GhE2YnsMv5Qa1t1x9VzDVYX1JFmfBPvI1PKp8xEszcuNjy1qUE0XTZuIhRbd5FfjNwDW2Z6ORqZWFKk2gKJH3gPxN+MhsFR56MTH60z8GNQ8W9C09SYi/CGgWvR78P2hsv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697892; c=relaxed/simple;
	bh=iATwc6ufGXARE+6lG0pR6BzacdyrfLO5QVcrh6ufzXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UtOUsx7HNsJapoumCDPz2x3dOmvkAVZNmC/Al0heN4wkvZkneDjTGEwXMU5N/5s5OsJmDh7pbTwe3DiX4i4Vx04SCxw+KvA3+HsrKjAd8jlErVyTwraqO3puvTZ+jrydfwz2HDV2C5/TfgMvqVrWW7ZzJs5/xviP//r6TB5Ehhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CcGDxu6w; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CcGDxu6w"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cb3ba0a9a2so24001836d6.2
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697889; x=1728302689; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aurzIxhre/dA6wUpFHCHveAY7utZWkXC/gGbqMcXk0s=;
        b=CcGDxu6wY8a2pM8gTe8LWx10hV4+hiz+QTOUXZn3JvLp4WFQ+JvKJcapoYAR1WvG/E
         Ab0raf34m5WkqghhinX9u+TuW3lXeTLWwjnuIkzwSD2t2Zx2yNycWc6vAFKRSFhXcccp
         WRS0wn5pZUZZSfmSnCJ5bq7tfQFN8GYmW1dRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697889; x=1728302689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aurzIxhre/dA6wUpFHCHveAY7utZWkXC/gGbqMcXk0s=;
        b=T2WnuCSis4Y/BleYpgk3SzJDPkFqP8XORRZ2KAl6tnRWu8tJaerYFo0HDx21f0ZAWi
         Rrz6uO7Y89BhnOYFqH1FOFJ7T51JqcPn7UGLXw0iNjKMGzxWqtRoWMlQ2METFePa+VJx
         Y2okVvpZAXhz2BhO6JvHtA4H9ZGfXZ2n35rz3Ndfn7K2OfQEBuUXbvNSCS0jk1D6yLsY
         ixMOcTJK0y5R8+XKfAFrIU6oBis8v1j2KJ6klQGEOnCfCxXBQiCIiQR8yXCBFzHBGGhL
         dBt5VLM+XK99vX24Fi6rocYhSMyBiBYRKSvekfKWz1Bv9Xy87yXobqIwW+4ErtwSXjQ+
         2ijA==
X-Forwarded-Encrypted: i=1; AJvYcCXokh347G6GrssPCMqWGXL8+K8zkiuuWuAx0/PHL+iftcEbVRmJ6Zgbl58gsQdmk7WuPhc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVAQcXPuDDObuUOghq/1IemIsoGgkb+0FrZuE5zGLAvQTzzIb/
	QQN4F+HeSVSMd7axGXCt+uDkPYuk3gkPcExXnZtafYmWlO9lolZpKwTOYkeHyg==
X-Google-Smtp-Source: AGHT+IGIOHdh67nNwgDel6paDE35Eb29KwEMX4XzmiYgJj7qtD9+Z/d/ZNDrc9s0mVLpMYI/GTz7DA==
X-Received: by 2002:a05:6214:53c4:b0:6cb:27e6:393f with SMTP id 6a1803df08f44-6cb3b63d1cfmr165544066d6.36.1727697889388;
        Mon, 30 Sep 2024 05:04:49 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:17 +0000
Subject: [PATCH 22/45] media: aspeed: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-22-81e137456ce0@chromium.org>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
In-Reply-To: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mike Isely <isely@pobox.com>, 
 Olli Salonen <olli.salonen@iki.fi>, 
 Maxim Levitsky <maximlevitsky@gmail.com>, Sean Young <sean@mess.org>, 
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
 Jemma Denson <jdenson@gmail.com>, 
 Patrick Boettcher <patrick.boettcher@posteo.de>, 
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tim Harvey <tharvey@gateworks.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-aspeed@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The following cocci warnings are fixed:
drivers/media/platform/aspeed/aspeed-video.c:1944:6-16: opportunity for str_on_off(v -> hq_mode)
drivers/media/platform/aspeed/aspeed-video.c:1230:3-17: opportunity for str_on_off(video -> hq_mode)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/aspeed/aspeed-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index fc6050e3be0d..9c4a47d7a442 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1227,7 +1227,7 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
 	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
 		 video->jpeg_quality);
 	v4l2_dbg(1, debug, &video->v4l2_dev, "hq_mode(%s) hq_quality(%d)\n",
-		 video->hq_mode ? "on" : "off", video->jpeg_hq_quality);
+		 str_on_off(video->hq_mode), video->jpeg_hq_quality);
 
 	if (video->format == VIDEO_FMT_ASPEED)
 		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
@@ -1941,7 +1941,7 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 	seq_printf(s, "  %-20s:\t%d\n", "Quality", v->jpeg_quality);
 	if (v->format == VIDEO_FMT_ASPEED) {
 		seq_printf(s, "  %-20s:\t%s\n", "HQ Mode",
-			   v->hq_mode ? "on" : "off");
+			   str_on_off(v->hq_mode));
 		seq_printf(s, "  %-20s:\t%d\n", "HQ Quality",
 			   v->hq_mode ? v->jpeg_hq_quality : 0);
 	}

-- 
2.46.1.824.gd892dcdcdd-goog

