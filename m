Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E916F09C
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113818; cv=none; b=X9pPstRErx8S/hPQV/fuNZBlM04qrxo72NNHaL3LdjrtYfNBivz1DhfonS1rpIBw+SimA1KXQ9JKVrJXOjOpoxXSnYop0LZaU0hWsSjwrFDZ32A2id8iE3/GmvmJft9GOCJd0gvCV2mX5jjTponT4I3mdB1dFGEVButiL9uNCS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113818; c=relaxed/simple;
	bh=A8h6qBLOlBAO4Nf5Z1u5nWAte8uqhP5kHvTzaAaJZ+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AAjF9BhZAokWlj1jw3ecQvjLFiAD2TztgZqtUC2qSc484D75PGrmTpSIl/CBL3lz5LBLTK4b6yNU7NQolwwvM8yMjbpxQcEYdHxMo74YXXkh0NmGdFFskWRg1+1RzyM0cFO5+2dnmDpZHrRYujfB/UbEcUsM7RABl4eywZ39j2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZmvebz0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZmvebz0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso5759055e9.0
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113815; x=1720718615; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1DvuUcSFwNO6KhZ/DbrjWlR0SnoFpdvXYRD32tmG/+Y=;
        b=HZmvebz0tJQJctHnLiQpNmtyGaX294SJEV+fcT276a5d2M9BPQrvqvV8Vh+gSbUZaO
         kUnRnpdUQGPk4RETvShFNFvTry5kgD6XFH7wW1LT7rTdX7JfxA1t1G1lYoUVYMgX0POo
         TGv+lZJMORvnHfIrQ+5FC2VTK2jLC2mhp1tTRxDVt0f/SdPWsLsXOTWVXCqU2c8U9aFH
         Uon5LHYdVJ4o2T810q0jHmOnDHuLS0sPHDJqBm7ZjE5FyKqKGB7uH9f7jeSnSldGypIK
         AMz42lZy8p9uaC3IiMrlP2vbSDE472eJ4E8V4dPxtf9FNYoAU6M21PoTl6f1dW1XWqZg
         vDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113815; x=1720718615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DvuUcSFwNO6KhZ/DbrjWlR0SnoFpdvXYRD32tmG/+Y=;
        b=WWFnBkScvYweiyEmojBA/O8bvyrsa9ec4RtC3ZHV5pxNo9edJWt+rNcSqKcKxjcsY5
         CbYSd72T1f1h9ZL4xvZtaAPWVHoZQpdOV+bMRQ7vr3PQ/abOw1BB5TEEoAbS8ylVW2lb
         r4bcuXKSMFt4jzd0x/InjN2y+sGbvx5l9DG/bjwDPHpwPRRwnxsNcIFhmXu5MWci0PjT
         wHNTkljchrOx05cZtpSyRAVBF+jC4wzts8lzGOdjaeBvib3SR7BZys80MLHh77Ubigya
         YfZb6sY+LvTo1fkxTd+dQvO7+gTcEgLp+SwBoSugQDnfcdci3yB07UojjrKY2uRmpAh3
         tzHA==
X-Forwarded-Encrypted: i=1; AJvYcCUc6F69oiDOZ7F43IviN0hq2Noz48XoGiwIc8jQ9Agr1HcULKw5xpp9uazhMTgcMkO7cbZI2IIM3p954Gs91MMbwCKD
X-Gm-Message-State: AOJu0YwdgNhBPy2yut9+IdssCNccsby8/a9H/6XxJitVU8pH2jdbgHyy
	O+4HQ1VBSES4/5eRRQiBZmM2fhMKdqrXrRRFBV45ZiXENpLVvDrY
X-Google-Smtp-Source: AGHT+IEc8Rc1QEIwVEXfc7Rpogc9rQkSUkCFNEJZBG+Iw/peGXh8S4XAZEgN4bTVwF0KQdZg/ByJHA==
X-Received: by 2002:a05:600c:3b8c:b0:425:d61c:77b1 with SMTP id 5b1f17b1804b1-4264a469699mr16561885e9.35.1720113815196;
        Thu, 04 Jul 2024 10:23:35 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:34 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:15 +0200
Subject: [PATCH v2 05/24] mfd: tps6105x: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-5-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=722;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=A8h6qBLOlBAO4Nf5Z1u5nWAte8uqhP5kHvTzaAaJZ+g=;
 b=ZiS7T6T4IQrp0Q5cFzDm9V7HK3fd//OdoA4bcGAGfdiPsK9NjQwbEsdd/FBGaaLb32Comgql0
 LQcTPmwFMOLA4zRWYd/7xWC357cvLXcrja6ylouWSP+uIMonhxpIKWF
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps6105x_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps6105x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index 0da1cecb5af6..e2f6858d101e 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -23,7 +23,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6105x.h>
 
-static struct regmap_config tps6105x_regmap_config = {
+static const struct regmap_config tps6105x_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = TPS6105X_REG_3,

-- 
2.40.1

