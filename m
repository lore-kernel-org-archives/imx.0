Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388619E7EB
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697914; cv=none; b=HcepGv9MC9kkFgsXv4l4RaPyXmcuKTd/ZsVL8Iua+FYupasMwvAxDBxYl8OyvLYPMwWtz+JojpZwPkIc7mbisPpdHNih2sHYzpLh4jNGgUCguumoZtb+Q0AjvbgGxRHJB7puG4Ab9ozAJsXv3FUgtdZqyefCvkMC/XJE8PfHmLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697914; c=relaxed/simple;
	bh=+YlokRj+2d48flI/asuiz7UPyCUXWUPJX4RPdyyncNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TqZ3JEcB0aCI1nfPfz0/8wQ8Ug6lrKT8DQ+YFR0RtuLXIi5kXWJ3lajbjC3Wem/Dds8XZ9X1MwWKWJNZuOvaiHVK3uVVTI4iGB4q1crS1ktqftFv6tsmHnSXecVqeWdw7RRxN1U29i/jIJ82eres2Cb4gGssxgZsKUfAJvoi5O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cqMEhTa4; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cqMEhTa4"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6cb3ba0a9a2so24004276d6.2
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697912; x=1728302712; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Y9A3WlXYOmIt22yAkVtKfWzTv1HcbDXEuxLhuXF1BM=;
        b=cqMEhTa4SQP65vJAauwkFLReBnSqczUYyVvFTrYMRR8EDs23VOx/tRSd/2Zl8XOb4f
         c2b61KJvjJmAA4/X5cHmJtHbe+qAUPYDSUHNWfzEPDgXmTvL75wBrsS7RO5F81Ew/ThT
         RrEtF98uDbxzLK7bF+WqpLqwz9XE2ZRF+Wi/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697912; x=1728302712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Y9A3WlXYOmIt22yAkVtKfWzTv1HcbDXEuxLhuXF1BM=;
        b=Smv5UQJPdb/vFjIk5Ayz9j6PO5qiGtWK0TMihnLz63GGxImPNUpRpEG+NuGGWIlNv8
         bo9yEfxUaoyBaeKK+6Jq72/2QF61vt94V3+k+ExZSXdB7S6C7O3d1xBu63vA1/3/4JO0
         byO/clzKBLkyj8u7YTcPVr/4BeVSsNdmeMWr2ZKbWE8nRiEs8+mrCh96tQXHzdmmFlG3
         S6AX0LVyPNMgxAmpHR9f79HccjJmKSbyu6qfcozPzmZmFYaQQTtsao+ANY5AtpvK5t+w
         +dVNPhdFVg+1auY+/dgYjMoRaOzQJepqCEy8Vw1qnA6/HGX9QVldLw3WqCrfGZUBmrZv
         KQMA==
X-Forwarded-Encrypted: i=1; AJvYcCW2QvGO2kI+nYwyga+AH8Tpeerip0Fi88W+viDrorHc3qWDeVMTvY5blAdRHQ1NKUllBOQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiKhEqQF4WxRhxlqgWygbWqWNe6zU9bcEfVk3lcO3aqMWnLSID
	8U3ZaKc89mOe4M/ObojEfIVpKyeQlK6k4atqzjX4QYG8Yd48eBAxSaLbkbJRrA==
X-Google-Smtp-Source: AGHT+IEeEfZlZQBmO8RZI8xNY8EgNRIjUt1ZXgq35BOYTCkW0tdPK9t40pOtA1wbfy30W9apcgwPGQ==
X-Received: by 2002:a05:6214:4198:b0:6cb:6655:e02d with SMTP id 6a1803df08f44-6cb6655e354mr40552846d6.3.1727697912026;
        Mon, 30 Sep 2024 05:05:12 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:11 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:29 +0000
Subject: [PATCH 34/45] media: i2c: tda1997x: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-34-81e137456ce0@chromium.org>
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
drivers/media/i2c/tda1997x.c:1976:4-29: opportunity for str_yes_no(tda1997x_detect_tx_5v ( sd ))
drivers/media/i2c/tda1997x.c:1978:4-30: opportunity for str_yes_no(tda1997x_detect_tx_hpd ( sd ))
drivers/media/i2c/tda1997x.c:1972:37-56: opportunity for str_yes_no(state -> edid . present)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/tda1997x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 3b7e5ff5b010..867c635fa37f 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1969,13 +1969,13 @@ static int tda1997x_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "-----Chip status-----\n");
 	v4l2_info(sd, "Chip: %s N%d\n", state->info->name,
 		  state->chip_revision + 1);
-	v4l2_info(sd, "EDID Enabled: %s\n", state->edid.present ? "yes" : "no");
+	v4l2_info(sd, "EDID Enabled: %s\n", str_yes_no(state->edid.present));
 
 	v4l2_info(sd, "-----Signal status-----\n");
 	v4l2_info(sd, "Cable detected (+5V power): %s\n",
-		  tda1997x_detect_tx_5v(sd) ? "yes" : "no");
+		  str_yes_no(tda1997x_detect_tx_5v(sd)));
 	v4l2_info(sd, "HPD detected: %s\n",
-		  tda1997x_detect_tx_hpd(sd) ? "yes" : "no");
+		  str_yes_no(tda1997x_detect_tx_hpd(sd)));
 
 	v4l2_info(sd, "-----Video Timings-----\n");
 	switch (tda1997x_detect_std(state, &timings)) {

-- 
2.46.1.824.gd892dcdcdd-goog

