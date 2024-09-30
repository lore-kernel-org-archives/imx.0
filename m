Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691C21A01A9
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697924; cv=none; b=Vt/53PcVBIbXIFYMAYE0wybjAh+zCU9iVQQnVZfryg8ZInRi/abzwt5+azHgxi1uoXr9Ncf2lVmmxGqQFuNwlHomEcY19iJA8VGL21IJDrmV+vVeIhzyuSN0Gap/Ofhfb0n5fFZT5ZUC/IR+56eW5bm5nN6gO4dbjIMVO3HrSQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697924; c=relaxed/simple;
	bh=TM9r2XK6KcBa1f8v3+Lblr8O3iR5BhJ1JBXQeHslSjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDolI01Vvp/7JV5AYXZWdpgnFbF2oDflB9TCdkGH5QHAhM+CQIzaVOpTYXuLzkJVXmwKAE+ZQ/VUiMTqmNP4/MYRLv0SQain6bmfCB3y+yuKZCC0cwKjyKt32WbBvW4gZ59UcWEe6Dd42WQgdf3TCovVpRngTQgsWvBFeuOsuys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hyuXTRb+; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hyuXTRb+"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6cb3cbc28deso36414916d6.3
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697920; x=1728302720; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckz+f9oQpPUu6rIcK1E7/sklc7IJmpymEtGmVuUIyqc=;
        b=hyuXTRb+xQ3NcHjL1qE1tZPk1pNWQHk8s06SVEGmGhq9wg29KwoX38gKChj/hFFuK8
         Tjr6toyY2MYZnUAallYTOVcDEibKNjl25XuGLkqL52nOix2lfaORD1NdGKD1MVujdhI2
         DlXaYjDSjs1gJYwQADiMAxIY81wcY5kpd25/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697920; x=1728302720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckz+f9oQpPUu6rIcK1E7/sklc7IJmpymEtGmVuUIyqc=;
        b=ae8EMVsvMcIFZJdmSA+Mds5f0ZTn7nGqKho+qZyR0VALznMCQts80RLFxscB8I4C6b
         UuXj6dhKlL96+UNZ8UIJ11l79HgH0XSBTsG2zc2hy/b+d6Ojj6pScBdMIQl6ePLcBte4
         UojP43pfIUKMMbHjCSG4mP1n61hpQomCJwPPbLQxznfZUDHyxQeU9tmNLwUR3xYrLzG7
         iTMCxePtrWV50nADseDdqdgR1BjssiZ92tqxbBh3SGnhcSBEXGDyYmpabuEVcTScJAfR
         8QpxAbtVfAOmrYo9jZE6UNBuC3JcIY6bqaxD+5o6RNsiWa6MrcOqnRJPcvxGMTlI7/Um
         bBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe/9coqgKzrY1ufk7XwMPJzn0OKuGsvhsAe7d1XfnGkha84vGHfbHdlHy5/LKPSy1mIko=@lists.linux.dev
X-Gm-Message-State: AOJu0YySuXHSNhou1utkXdYno7F2jP04KPwr+M/jVijnZkIR8f1Loxcc
	yFK0bwjc6oaZhra6PQwTLfwwPxFYiziEUtdHAB1nd/Qw054ZlD15ENEStsfM3w==
X-Google-Smtp-Source: AGHT+IEi2P8ci2OPbo+jpkaZ22WOo6DK57pM4gbAU29+4tgFAAJdQKDCxefcZ9fdV8Kube5E0H3gmQ==
X-Received: by 2002:a05:6214:3a8c:b0:6c3:5c75:d2bc with SMTP id 6a1803df08f44-6cb3b66fab3mr198718286d6.47.1727697920467;
        Mon, 30 Sep 2024 05:05:20 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:34 +0000
Subject: [PATCH 39/45] media: i2c: saa717x: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-39-81e137456ce0@chromium.org>
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

The following cocci warning is fixed:
drivers/media/i2c/saa717x.c:1091:3-9: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/saa717x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
index b0793bb0c02a..2337cef45e3a 100644
--- a/drivers/media/i2c/saa717x.c
+++ b/drivers/media/i2c/saa717x.c
@@ -1088,7 +1088,7 @@ static int saa717x_s_stream(struct v4l2_subdev *sd, int enable)
 	struct saa717x_state *decoder = to_state(sd);
 
 	v4l2_dbg(1, debug, sd, "decoder %s output\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 	decoder->enable = enable;
 	saa717x_write(sd, 0x193, enable ? 0xa6 : 0x26);
 	return 0;

-- 
2.46.1.824.gd892dcdcdd-goog

