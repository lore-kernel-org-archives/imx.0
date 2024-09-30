Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132D519F474
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697919; cv=none; b=ufQsEQRpREzuN6pQqQ8GV8EGnnj83RaeZC+S/pNNBY5TJ3PGM+tLQ1JUtzpEmSs+wPVO3dAVbVYaCrm9n/jFsb6PN5Px7ADlWiV9DAqRWUD1XV6+fsGav7v3jbQnV1kTw0R7Whc1XzpwbiJ+7co0zt5EWz9Pwxo2cPZLGta+y4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697919; c=relaxed/simple;
	bh=seoZG/qn3lQcbBj3ynNAVC3sP37LRPVbxYubokeh8WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MArP2BSCtlrP5NyXUUVp+6tJXwiN6130c8JYr5UlobsIPmTh2CeRx4Gtg1cRKE9MUwPFmdEKYeM/MZsVd9+1lWYwhLc8FootkmLOxg3pOKv6MiCfsLiAM1qqj0mIAN6Rhaf9KdaLe113MVMBaOs5MehU5G6DQChqr/sImrUD2GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NFA+SRb1; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NFA+SRb1"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71100987d1cso2586438a34.2
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697917; x=1728302717; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VS7D6fkzy/mB93t3oLBUPb5JuZ0mJyEpuRoOfQlLof8=;
        b=NFA+SRb1Q4n+OJBk6dHum66LGBvnSWSbkkxEn2FKMYK4WYXRljdi/MMguOxZS76qaN
         hUmbtlb/IvX2zm2OHaZ1ZHp3oVMADb+ac4ef8+WwlIpARsdhzywZt+0tvRKUTwpDxAmx
         SFGgJ5hKthcSEr3znC6WSZP6Tf8JIzaPSuWJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697917; x=1728302717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VS7D6fkzy/mB93t3oLBUPb5JuZ0mJyEpuRoOfQlLof8=;
        b=Qbjg7n3am56SBBFzf3Wuz0GwU3r7Qkfsq56ZJibFGov304+AHlB65tQSyLDAFPn28/
         ZId0H/GKob2C8MmoDy/acJ2rXywJswLrgpDgN8g9+ynbUXlidb5rZh5rxRVuoB9YY661
         cv8G+rir1uNROmaZcMfOhAZIKvXhLYGXRh3EAzUBlJy4DByHwsyv4bTEshTxHl31dF0f
         ppPi3Bim+9xoZE1H9UC8AGE1DOx3FczfEb3MM4uHGW8ITlB0DFg/TsCwtnzIfat86R8o
         5X5WvEuIgoEKyTmbXExTKpny3F+H6hrcNz/9lcKZafENxwZED2NmTYmVAekn4q68N3cN
         QFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVSVIbenj+U7MrygONIcvw0QuzlCeuVkCIkiEXNjD3DJEFfLEtyJUk4usjXdCVr9OuoJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsWgs0ed7cB8wNSTp+feI/R9KjfhSZKiOJv7c/80vnKfLlxBBl
	a5mLq/i7A9ahGjJEU0dzG9dtCrUEdCoU1uw2hhcPjT12yblYsYGmuhK8o9I1SA==
X-Google-Smtp-Source: AGHT+IEsGDncZXqIOKaIooO2hw5tICb0OJqubpFFkQiHlkBn39PImu6hgDgqbreQ/CasmuZpa2D32A==
X-Received: by 2002:a05:6358:5288:b0:1ba:580e:dea2 with SMTP id e5c5f4694b2df-1becbc86414mr292235955d.17.1727697917163;
        Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:32 +0000
Subject: [PATCH 37/45] media: i2c: msp3400: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-37-81e137456ce0@chromium.org>
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
drivers/media/i2c/msp3400-driver.c:341:4-21: opportunity for str_on_off(state -> muted -> val)
drivers/media/i2c/msp3400-driver.c:342:4-27: opportunity for str_yes_no(state -> scan_in_progress)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/msp3400-driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 4c0b0ad68c08..c7807b17add9 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -338,8 +338,8 @@ static int msp_s_ctrl(struct v4l2_ctrl *ctrl)
 			val = (val * 0x7f / 65535) << 8;
 
 		dev_dbg_lvl(&client->dev, 1, msp_debug, "mute=%s scanning=%s volume=%d\n",
-				state->muted->val ? "on" : "off",
-				state->scan_in_progress ? "yes" : "no",
+				str_on_off(state->muted->val),
+				str_yes_no(state->scan_in_progress),
 				state->volume->val);
 
 		msp_write_dsp(client, 0x0000, val);

-- 
2.46.1.824.gd892dcdcdd-goog

