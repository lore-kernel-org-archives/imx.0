Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B40619F41C
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697920; cv=none; b=TeMmTZb76nMzh3VIICZjt4xJNukbJGo95v0Nl26W/fAbFOI6gxc107mfvRycrpq4CRjSd7VOlTj7oGAXHSpe0UbSqViCCtRShjsXfGDAVjRih2Bxbvfe5Mk5JroTa2B9sqmsF0HDCdt7TTBXIGdC37N4gzaqE5MSwRjDjvJ5/wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697920; c=relaxed/simple;
	bh=aBtuDT9YPo78PM4HWkajYyL24yWOJ9YEO0Dm4FdZ3Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XsOUiWwoJMHHN7UBgNR90uFBw1cGqA1XPtjeTmVHn1ye3LQxEhWOdvYdGrVQkrRPdKJ2fgxX/Zx6Hs00fa4t/Z09XexznLt5dhn2/865Q+IvmObugemvU586ZSjdYcG4N0/7wAxZIko7MqcXe0WeAvzxbkCYRdPBTPco2DQw708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HVM3cgGE; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HVM3cgGE"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cb2c5128d5so31327106d6.0
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697918; x=1728302718; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJx29BD9yZboyGEAUyw+4rBBbXZtXq331Q8okj0vBtk=;
        b=HVM3cgGEbftgIiZZTQni7Y5RfgA+E1VYUI7Y0N0i7O5+/ZLK1CauPuP5GJLFCw/EGp
         64iCCtIP7CaMeyGnZWF0Oowrp6exTIGhk3Br40RQNIo4Ft/r8iKVplOLSp9jDClx4kEB
         bsK/gp5BiOohPw+6UiYzzBdAMNlU8aAkMLNwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697918; x=1728302718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJx29BD9yZboyGEAUyw+4rBBbXZtXq331Q8okj0vBtk=;
        b=Zux6guIfHLQjnPXbeuXqKZsBVx6r2XBpbWUu6iY/7dG6IAHGXuXhei+rT24MwcJyOQ
         daSX7fYGqdg35wNM+uDdr3qroMabVUQ/wQ2zy+0VIQAhqY91DZxVXiMUfhC9FfQO7wlh
         Agmg6tkxk2Rtq3Jz40I3XYp3dzG/FIHFdnxtr19f6Q4hyjXKEhuRbNXBbHMgq/JWv0Zw
         Nly5MLhEj6PZKksvXEcDvKg2TWh4DDlogwrmITwEkOiCeMGqXJ72J4gGrbPisOwFryEQ
         YUxrEmYxnk0FlooNZaGsC9j3NzkA01X/wrSgZSWXYxUTRY2wlCoB8Yl2TIVYqm7sInUf
         Qz/g==
X-Forwarded-Encrypted: i=1; AJvYcCVSMIfmJEIEujLvzfaC1Yd/UD7cIglq8auqsr4pLmmeMUCClVt6s2M0YDws93kns3n8rlY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzA4LqCVqEMcYCPmR/liHOehcjpKoyZCfwQ5IEae7tGRcAYfm1
	/j1c8WZ+ySJL4E24Fe7R9IS4HR+SODfsQMy59v00vdSa8vRwa/OSJFG0AqlAswNirIyYcdg5L3I
	=
X-Google-Smtp-Source: AGHT+IHvBkaWPQbVKiD/u2iOrMRkK3daurGtkkhjknrAX1KIWB3cA5A9a8FHevVPAdBTGyigNIjY6g==
X-Received: by 2002:a05:6214:3a88:b0:6cb:2e94:3e24 with SMTP id 6a1803df08f44-6cb3b5b7edcmr189314226d6.11.1727697918247;
        Mon, 30 Sep 2024 05:05:18 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:05:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:33 +0000
Subject: [PATCH 38/45] media: i2c: max9286: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-38-81e137456ce0@chromium.org>
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
drivers/media/i2c/max9286.c:1333:3-9: opportunity for str_on_off(enable)
drivers/media/i2c/saa7115.c:1366:3-9: opportunity for str_enable_disable(enable)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/max9286.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9fc4e130a273..d0f542343344 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1330,7 +1330,7 @@ static int max9286_poc_enable(struct max9286_priv *priv, bool enable)
 
 	if (ret < 0)
 		dev_err(&priv->client->dev, "Unable to turn power %s\n",
-			enable ? "on" : "off");
+			str_on_off(enable));
 
 	return ret;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

