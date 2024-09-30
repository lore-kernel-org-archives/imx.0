Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C9C199FDA
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697896; cv=none; b=nLLtit6eJOW3S1wquI2PsOi9gAVjDbx8ngz868pjh9rwei6MRGrVubEj8FPo0ZxB7Yz4ghi5Pwocy15dpilSHuPxynAJ0u1hmgIH6ZBevyUJ918CMyDYAMwdiMPILKt/1Zu+gEku53VELdFseeM2l08oIVPWUtw1ylgQlrWbuek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697896; c=relaxed/simple;
	bh=Wy7Skzwx1Of9aMKIpNRDdVVt/EfLoQQHwwrlTgvOSQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m21ze9/1JyE1xLdRhTa6605Qvhq0awWml0wH7gYbgnaU1WDjTsnWUonItRP0Rw3feUjMGL38OSW1/aL1atBAdK7mdKcnT3Wkl1wuLctzj1tDUZ1GESL1pno3zSJEJdSJVgdKEU3lbf/YjXYs3/vjEpZ2zz1M8RezrolAharNofI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OpJAkCBS; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OpJAkCBS"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6cb2aac40faso38500536d6.1
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697894; x=1728302694; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc6yac9SyLlHs7WRhmQW1+HPAOFx8yEw2UfT0f5Qnn8=;
        b=OpJAkCBSMgq9uJcdtOa/XAcfWcZ+dbye8e3ZpmTSTv8/JsVS+3GFSfdkvUdpW034is
         HZ8K73JBEW4olwgIKnpjgrbLj05tremn6YGig4KHRxBLqt7ywJXfNiXHzG3atvZpyEP9
         g50CG1T8dVQZ7iMoCYdv6OITl2B0Fh20dHt4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697894; x=1728302694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kc6yac9SyLlHs7WRhmQW1+HPAOFx8yEw2UfT0f5Qnn8=;
        b=IrS+0WF68XJe+TZZyHdtnIHkXuEwkA69oIzuhzZpV2uIUf2kN1hPk9hLa8FXJJjuu2
         lDLdNdvrULIDjrfB5LT2se1vPutytrA5Ocma4a/liTmzGfnr3aSt+fj5Mk98rQnWvskk
         UhHM1poOuef1bRgch/goBOio4KWTLKejDaSonUCQ7JS8QpqxeeyRZDTQk19C9cpAGKce
         UQ4pCGhY3oJU/dcHGGjfTFnpQwQGqw7UF+PvdtMpPQXXUGAizW7l3Akye8QlyYzXX26I
         r5mb/sQJyyAfKRF5q6jihPxw8hRN8skQRw1wp0u3KV1jpzj5P+eu0pZmTs/hkVgGJmV7
         dqXw==
X-Forwarded-Encrypted: i=1; AJvYcCUX3iI6IAjHs1B/Q8NLtXgf2Mf1rrOSYspi9Hms2Ykz41Luzac8WJyB25bul3tscEaiGv4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlMc0m6FPa6S9naopAeeh0IFm3A/OUaMsmMleG+bhuftD3jk92
	5Iox6jH3ZL8RAkBaEsVDr9aQXt2SIU1VkLDOFRMNe/opy2tgz91V3CktGGK/Cg==
X-Google-Smtp-Source: AGHT+IHvTtSCRFSBPeJou8A8lJWRExB8EwT4CA/+ss3rMSh3j0C8PX4s4DLpZYrCskrdUJWUEmVJfQ==
X-Received: by 2002:a05:6214:489:b0:6cb:2de5:d7a1 with SMTP id 6a1803df08f44-6cb2f270becmr284661826d6.8.1727697893842;
        Mon, 30 Sep 2024 05:04:53 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:52 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:19 +0000
Subject: [PATCH 24/45] media: cx18: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-24-81e137456ce0@chromium.org>
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
drivers/media/pci/cx18/cx18-av-core.c:1013:40-46: opportunity for str_enable_disable(enable)
drivers/media/pci/cx18/cx18-av-core.c:1118:8-24: opportunity for str_yes_no(( mute_ctl & 0x2 ))

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/cx18/cx18-av-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-core.c b/drivers/media/pci/cx18/cx18-av-core.c
index ee6e71157786..5701abdf9427 100644
--- a/drivers/media/pci/cx18/cx18-av-core.c
+++ b/drivers/media/pci/cx18/cx18-av-core.c
@@ -1010,7 +1010,7 @@ static int cx18_av_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct cx18 *cx = v4l2_get_subdevdata(sd);
 
-	CX18_DEBUG_INFO_DEV(sd, "%s output\n", enable ? "enable" : "disable");
+	CX18_DEBUG_INFO_DEV(sd, "%s output\n", str_enable_disable(enable));
 	if (enable) {
 		cx18_av_write(cx, 0x115, 0x8c);
 		cx18_av_write(cx, 0x116, 0x07);
@@ -1115,7 +1115,7 @@ static void log_audio_status(struct cx18 *cx)
 	}
 	CX18_INFO_DEV(sd, "Detected audio standard:   %s\n", p);
 	CX18_INFO_DEV(sd, "Audio muted:               %s\n",
-		      (mute_ctl & 0x2) ? "yes" : "no");
+		      str_yes_no(mute_ctl & 0x2));
 	CX18_INFO_DEV(sd, "Audio microcontroller:     %s\n",
 		      (download_ctl & 0x10) ? "running" : "stopped");
 

-- 
2.46.1.824.gd892dcdcdd-goog

