Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA86E19D08A
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697907; cv=none; b=PACi7MXZzXHjg3GfBVl3WZBV+OH73C9b6DECfaoqo4yyA+xjP0TaaUmyMnInqxoOcktPZtdSpSHLu2Nkj+ISWmJQX7rSaFi1HJiRpJKWC/cJ7xvhneuohAIwHstCKq7c1O3W63MyMOKj1rUK0q0JBrUXHNrNwe5IZfUUsTNjm0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697907; c=relaxed/simple;
	bh=87v9QUWrd9KJQVHdmwih7BqMWpDw/nyVGryHPM6oqVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5zVS+awwDYWWJIU3R+tDX8k8Gh0WK6lVo8SuDJMEss1fcrIwi2zYlYV3IM4nBsdQjxOrM9BwgcSLh4J5f64BzbpyJU2LxmBcNO4nkvx3VgqrfiNyGTFLhPefmv80EOOronwLcx4kpD/8AEXaU5eQJeZ0B9T7URE6ddrwQvUbH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YcrjuNJ3; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YcrjuNJ3"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6cb2f271043so47473036d6.0
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697905; x=1728302705; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ebt+1b/55aPXlqauBXJO18wSUl/XzTUjhH2wTMyzrFA=;
        b=YcrjuNJ3uag0To/ZCkz24RG24lFx0V4nRouhwJj2HzWAFdafnWvR800RmYiGTopH+n
         aI7mkec5beGXBQmFAySdQy+ZRwD4O/T+dPHxrb8GWyYabMdvWrcxDcAwods59uPFsbgm
         jJqlGctijQAE0hg4gmRRYsv5AkVccyZdeU0Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697905; x=1728302705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ebt+1b/55aPXlqauBXJO18wSUl/XzTUjhH2wTMyzrFA=;
        b=frPPrLZmmmT7ScU0Oxq/B6CwAqQMwnCXjOvzeGCtmf/diCnPBbqNW6zetUCk/UCifu
         Y4ZF0qw0yiRsuo2JUA/lrgIASPjSo30XHr2kD7h9QhfnrE+NWSxzTZNxDdgVH8l74knt
         jPtJfrGXnvTKDazr3iqL4/geNoZb/LEr7T0HiHxJbqq1kg1p75rtY+x/giZ90LADAxig
         LYETGSU+mr2Yl+9j81SSr6CDDh83ln5nyh5H5if4Oq2BTVbdJzB9NPMNZLUJ6scc3C7X
         16Yzc9DufBxuK5VQrW9oJE6aDYbT48EVl+ssvsg3LU+ES/nG96IvdQEoinTMmrM2pmPL
         maYA==
X-Forwarded-Encrypted: i=1; AJvYcCVGaj1qR8qFourPdM2U3+LTOpHJgKgPNoBy7O1F+wnso/yAMwO4VkNOGS8N+3jrtBLuV+c=@lists.linux.dev
X-Gm-Message-State: AOJu0YySbNDb1Sk5w1Wiv0mTt9+Sylvq9IwtUp+WJ8Or3QPgkJGFoTwv
	Yj+LlWwjm7yaX+HjKjXFVL7NuNjosP0A+/5z944M2gULCxc4K7uWiC2zeTnsQA==
X-Google-Smtp-Source: AGHT+IG7DxsLwmOc7mkRl/MFKW8HAXRHroSnhiAWX2HVxDFuz0PGg7dWtpjL7qcJseQqckH9Ha41Tg==
X-Received: by 2002:a05:6214:448c:b0:6c1:8663:e8f0 with SMTP id 6a1803df08f44-6cb3b61465amr169180096d6.28.1727697904581;
        Mon, 30 Sep 2024 05:05:04 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:25 +0000
Subject: [PATCH 30/45] media: i2c: cx25840: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-30-81e137456ce0@chromium.org>
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
drivers/media/i2c/cx25840/cx25840-ir.c:1089:4-9: opportunity for str_enabled_disabled(filtr)
drivers/media/i2c/cx25840/cx25840-ir.c:1028:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_DMD)
drivers/media/i2c/cx25840/cx25840-ir.c:1113:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_MOD)
drivers/media/i2c/cx25840/cx25840-ir.c:1030:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_RFE)
drivers/media/i2c/cx25840/cx25840-ir.c:1115:4-21: opportunity for str_enabled_disabled(cntrl & CNTRL_TFE)
drivers/media/i2c/cx25840/cx25840-ir.c:1101:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_ROE)
drivers/media/i2c/cx25840/cx25840-ir.c:1107:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_RSE)
drivers/media/i2c/cx25840/cx25840-ir.c:1097:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_RTE)
drivers/media/i2c/cx25840/cx25840-ir.c:1135:4-21: opportunity for str_enabled_disabled(irqen & IRQEN_TSE)
drivers/media/i2c/cx25840/cx25840-ir.c:1026:4-21: opportunity for str_yes_no(cntrl & CNTRL_RXE)
drivers/media/i2c/cx25840/cx25840-ir.c:1111:4-21: opportunity for str_yes_no(cntrl & CNTRL_TXE)
drivers/media/i2c/cx25840/cx25840-ir.c:1103:4-21: opportunity for str_yes_no(stats & STATS_RBY)
drivers/media/i2c/cx25840/cx25840-ir.c:1099:4-21: opportunity for str_yes_no(stats & STATS_ROR)
drivers/media/i2c/cx25840/cx25840-ir.c:1105:4-21: opportunity for str_yes_no(stats & STATS_RSR)
drivers/media/i2c/cx25840/cx25840-ir.c:1095:4-21: opportunity for str_yes_no(stats & STATS_RTO)
drivers/media/i2c/cx25840/cx25840-ir.c:1131:4-21: opportunity for str_yes_no(stats & STATS_TBY)
drivers/media/i2c/cx25840/cx25840-ir.c:1133:4-21: opportunity for str_yes_no(stats & STATS_TSR)
drivers/media/i2c/cx25840/cx25840-core.c:2369:2-8: opportunity for str_enable_disable(enable)
drivers/media/i2c/cx25840/cx25840-core.c:2392:2-8: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/cx25840/cx25840-core.c |  4 ++--
 drivers/media/i2c/cx25840/cx25840-ir.c   | 34 ++++++++++++++++----------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c/cx25840/cx25840-core.c
index a90a9e5705a0..dd8474609092 100644
--- a/drivers/media/i2c/cx25840/cx25840-core.c
+++ b/drivers/media/i2c/cx25840/cx25840-core.c
@@ -2366,7 +2366,7 @@ static int cx25840_s_audio_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 
 	v4l_dbg(1, cx25840_debug, client, "%s audio output\n",
-		enable ? "enable" : "disable");
+		str_enable_disable(enable));
 
 	if (enable) {
 		v = cx25840_read(client, 0x115) | 0x80;
@@ -2389,7 +2389,7 @@ static int cx25840_s_stream(struct v4l2_subdev *sd, int enable)
 	u8 v;
 
 	v4l_dbg(1, cx25840_debug, client, "%s video output\n",
-		enable ? "enable" : "disable");
+		str_enable_disable(enable));
 
 	/*
 	 * It's not clear what should be done for these devices.
diff --git a/drivers/media/i2c/cx25840/cx25840-ir.c b/drivers/media/i2c/cx25840/cx25840-ir.c
index 8cef9656c612..6f3978135178 100644
--- a/drivers/media/i2c/cx25840/cx25840-ir.c
+++ b/drivers/media/i2c/cx25840/cx25840-ir.c
@@ -1023,11 +1023,11 @@ int cx25840_ir_log_status(struct v4l2_subdev *sd)
 
 	v4l2_info(sd, "IR Receiver:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_RXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_RXE));
 	v4l2_info(sd, "\tDemodulation from a carrier:       %s\n",
-		  cntrl & CNTRL_DMD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_DMD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_RFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_RFE));
 	switch (cntrl & CNTRL_EDG) {
 	case CNTRL_EDG_NONE:
 		s = "disabled";
@@ -1086,33 +1086,33 @@ int cx25840_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, rxclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, rxclk));
 	v4l2_info(sd, "\tLow pass filter:                   %s\n",
-		  filtr ? "enabled" : "disabled");
+		  str_enabled_disabled(filtr));
 	if (filtr)
 		v4l2_info(sd, "\tMin acceptable pulse width (LPF):  %u us, %u ns\n",
 			  lpf_count_to_us(filtr),
 			  lpf_count_to_ns(filtr));
 	v4l2_info(sd, "\tPulse width timer timed-out:       %s\n",
-		  stats & STATS_RTO ? "yes" : "no");
+		  str_yes_no(stats & STATS_RTO));
 	v4l2_info(sd, "\tPulse width timer time-out intr:   %s\n",
-		  irqen & IRQEN_RTE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RTE));
 	v4l2_info(sd, "\tFIFO overrun:                      %s\n",
-		  stats & STATS_ROR ? "yes" : "no");
+		  str_yes_no(stats & STATS_ROR));
 	v4l2_info(sd, "\tFIFO overrun interrupt:            %s\n",
-		  irqen & IRQEN_ROE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_ROE));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_RBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_RBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_RSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_RSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_RSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_RSE));
 
 	v4l2_info(sd, "IR Transmitter:\n");
 	v4l2_info(sd, "\tEnabled:                           %s\n",
-		  cntrl & CNTRL_TXE ? "yes" : "no");
+		  str_yes_no(cntrl & CNTRL_TXE));
 	v4l2_info(sd, "\tModulation onto a carrier:         %s\n",
-		  cntrl & CNTRL_MOD ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_MOD));
 	v4l2_info(sd, "\tFIFO:                              %s\n",
-		  cntrl & CNTRL_TFE ? "enabled" : "disabled");
+		  str_enabled_disabled(cntrl & CNTRL_TFE));
 	v4l2_info(sd, "\tFIFO interrupt watermark:          %s\n",
 		  cntrl & CNTRL_TIC ? "not empty" : "half full or less");
 	v4l2_info(sd, "\tCarrier polarity:                  %s\n",
@@ -1128,11 +1128,11 @@ int cx25840_ir_log_status(struct v4l2_subdev *sd)
 		  pulse_width_count_to_us(FIFO_RXTX, txclk),
 		  pulse_width_count_to_ns(FIFO_RXTX, txclk));
 	v4l2_info(sd, "\tBusy:                              %s\n",
-		  stats & STATS_TBY ? "yes" : "no");
+		  str_yes_no(stats & STATS_TBY));
 	v4l2_info(sd, "\tFIFO service requested:            %s\n",
-		  stats & STATS_TSR ? "yes" : "no");
+		  str_yes_no(stats & STATS_TSR));
 	v4l2_info(sd, "\tFIFO service request interrupt:    %s\n",
-		  irqen & IRQEN_TSE ? "enabled" : "disabled");
+		  str_enabled_disabled(irqen & IRQEN_TSE));
 
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

