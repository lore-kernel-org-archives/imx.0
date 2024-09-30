Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED419E7C7
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697913; cv=none; b=WFTM9Zh+iJaw+hCpqbBQ2flEkFIXS63iHtUU0sW1bklI/N5ib/x0mFMzrumYwm/z+zM6XqiuAeTuhkETuxaGrodCHIRs9jGzbV4ADWlMJQAUXWKmuQCac+WwZTjhtlhL4q5YZwRJQsiJGhZJEKw895DLEdWIY/yKqcIRY6FEnYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697913; c=relaxed/simple;
	bh=e8rYUX5LldEEYF8NKNEpIaRx2U0eGPd3BaBieyMSmPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUBCWDZHCUn3B2oVcEK99nB7wTfYCEEyaWsiuxt6VQ9ICJ3pDQ+L/RwKxIkef72bWkLuEqKejQLT9k6Ai+wGQMCcXeu5wEI9mvgMtxe3AX/KBA4378oA006Ks7Oftmw5BEmO0yTUCFqW5D38dRfgNSBcjuXc26wBrlRjCLkL1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NdjQuLOU; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NdjQuLOU"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6cb4f1137a8so13033256d6.2
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697911; x=1728302711; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8e26HE+3E35YBzu5RrV0IHIpztUFBPs/lzx1XUAlbA=;
        b=NdjQuLOU7NQzb6CUeHtscaQyo3tl43/MQrtLe1MF2aF5DUQpI2qN5fw9GXf3S72eWd
         BNXn848ZNuNZLV2wzBCz90p6jO+EEjJC6STQN3Ge67g122WPSzjGbkqa6sb6sHVv/6B2
         9tTbko7BKGTwIYmLQwtpIv3Y0NGVtRLD37tlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697911; x=1728302711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8e26HE+3E35YBzu5RrV0IHIpztUFBPs/lzx1XUAlbA=;
        b=PIPH/Vpsqc7PI7+yVrbNxP5RRylJBTHDY9PftOgoA5/wl3eX0Mebq//5e0rIZV7+SM
         LP1q5iL2GbH5E384BXL7r/Xm4R6DxeV2TOjMGvr/uqMU0pecW+CJszGZl5umKtad3+FW
         dYHIijpJW1OthUrBllqJxD5SpiaFNlAZ0KTT3T+gSV1AnwJZQVgH7+UpcDzDE/nP6jMv
         KJQxCO1gebK/9TRcClmWWnAgV02RMN2lwDs1M9X+ABhMhe2ObrxYWqbpsXRbmnQnDhhi
         Kw7pMnII9TG+p86Jz/muykVSeFwpMPbKr/BiVrYlGgJ9xk8eyAF0LWVJngq7AHjcoyg0
         TWeA==
X-Forwarded-Encrypted: i=1; AJvYcCV7qKTmXZWMorXHh0Bdfe7VHsnb8llUPXC8qL5eG98OG1hb/zn9g7nXZ/JUJbWwdBFXCIU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt4W7kA8l9YZHKcff768l4MGmBu4mKCNj17QV9JJtVoK8xm2rN
	b4LD8qnON6iN62HrPz0TU26Jb1GNgzaxGkrfDPhuzo/t5MksN6rzlGSzrkcAyQ==
X-Google-Smtp-Source: AGHT+IEpi/h9qBTzENrO9vK1BVrLpd+v0VWjCMyXcKhCb+KBXNEG/xGQiqpkb/xdSgfcL4ga0CqsLg==
X-Received: by 2002:a05:6214:2dc4:b0:6c5:5f04:3665 with SMTP id 6a1803df08f44-6cb3b6618e5mr175354206d6.48.1727697910946;
        Mon, 30 Sep 2024 05:05:10 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:28 +0000
Subject: [PATCH 33/45] media: i2c: ths8200: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-33-81e137456ce0@chromium.org>
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
drivers/media/i2c/ths8200.c:133:4-19: opportunity for str_enabled_disabled(( reg_03 & 0x20 ))
drivers/media/i2c/ths8200.c:149:52-54: opportunity for str_on_off(on)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/ths8200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
index 686f10641c7a..a6d2fb64f563 100644
--- a/drivers/media/i2c/ths8200.c
+++ b/drivers/media/i2c/ths8200.c
@@ -130,7 +130,7 @@ static int ths8200_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "power: %s\n", (reg_03 & 0x0c) ? "off" : "on");
 	v4l2_info(sd, "reset: %s\n", (reg_03 & 0x01) ? "off" : "on");
 	v4l2_info(sd, "test pattern: %s\n",
-		  (reg_03 & 0x20) ? "enabled" : "disabled");
+		  str_enabled_disabled(reg_03 & 0x20));
 	v4l2_info(sd, "format: %ux%u\n",
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_MSB) * 256 +
 		  ths8200_read(sd, THS8200_DTG2_PIXEL_CNT_LSB),
@@ -146,7 +146,7 @@ static int ths8200_s_power(struct v4l2_subdev *sd, int on)
 {
 	struct ths8200_state *state = to_state(sd);
 
-	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, on ? "on" : "off");
+	v4l2_dbg(1, debug, sd, "%s: power %s\n", __func__, str_on_off(on));
 
 	state->power_on = on;
 

-- 
2.46.1.824.gd892dcdcdd-goog

