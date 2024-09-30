Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204B4193403
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697876; cv=none; b=ASP5BmuVJRibnS3YnYVQZddcQW7rU3ge7V+KbKitPVXyWOOmBRK6MC09lM98ga/A20+B9IswnHHnrWDo8A1PV8/1lVJlHwxUGDSAHJwbRrJLQiFWL+N0wrprrwwStKreuGHy8HnNPn7IHyf3MTxEmPrdomKJ89TPIVX3xWTbWUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697876; c=relaxed/simple;
	bh=SCFl1C9z2VTb+qQWM91xmVqiVRgT9zj6Mxth/Q7JwNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gA9L3t1DgVMcKrxnOT2HreEUijrGzwCiqn8hFLM+yaFJnnnz6igJLWbg5nKBqdRjOLvOooUoOz12C80IMAVSuMuBJrSpawe4wJ7g8tumwQbzwPQ08YQahnTarzXDAEpZPSv63T0sjorWM3O/rgL9WLUr9GkvQ9YCFJKEx/tXC+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ACa8NFAZ; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ACa8NFAZ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cb399056b4so32325576d6.0
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697873; x=1728302673; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROQ1HhB5eUHGQkR1Zb9xX876/ICgPqUa0J3DMNQ2iR0=;
        b=ACa8NFAZNKqaQ7hdjGXVIbjCFVcLiJMbFYmNgSia/OhjLrGknLsZunL4PWKkI9g7ge
         rDu+p6FqI2HqVtT2MhaC054hs6U71vyBHRqG+iVYRIQ2adC3/mmORlxRTZbHX4rBRpI+
         6FxjqcbHTEpSo8gFYJCT3XjvUXevEEmvbnUMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697873; x=1728302673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROQ1HhB5eUHGQkR1Zb9xX876/ICgPqUa0J3DMNQ2iR0=;
        b=lGCQoJXcAznXPbDLymhxhL7a3xsSWL3peJv2O8wYEJ6Oojumuqxkf0p8XUBWl+EjFX
         AeIDvRWbjv3w+iCQZ1RzaPGC9JZwzNOxhohrOvdRRUDfISTOdX6qImgBN/ws+9Ik78l5
         GonDG+rsU1OMGV3NxHwzHJcQ0GhSgx7tLjXeNk8WjqnsleaCmj3aQ6CuQkMQ+y8VYY+R
         CmqCGQ1D8OgeyJcZMgvtTtTZKzx5cmtT3TeiTDOGwbA0o4xxna4FIVWbLC3w6SKFXfFW
         BjkcJw3NhGeaYYF2QAe2cV4fGgvUOZZY9MVN04KFCYq5vhWzwFk0okmDo+d/YsYPrU8w
         BggA==
X-Forwarded-Encrypted: i=1; AJvYcCUTATehtEM2ncit4c4vBx5qpHOWtLqlvtkdRbBjRZw9eQerl+y4eXgzHWum47HVYCFj+5A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaLw8srd3VtgrZdJZBQmfRO8S+TUmRbQI/rQx0wXTb/TNmYHLa
	g2l9qYrtZ2t9RSkcynYK3uHFdZan6haiX9fFHW2TIoq5FODcCjeI78CiR3cqTQ==
X-Google-Smtp-Source: AGHT+IGlpLvOiABRGPfPC5tWhysrrPiJ2yte8Y1JxuD34Gtndo3CQ3SWzVD7Qrk2mRRfbUS2vxDpnw==
X-Received: by 2002:a05:6214:458d:b0:6c7:c63f:b414 with SMTP id 6a1803df08f44-6cb3b6407b6mr208576446d6.33.1727697872928;
        Mon, 30 Sep 2024 05:04:32 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:09 +0000
Subject: [PATCH 14/45] media: saa7134: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-14-81e137456ce0@chromium.org>
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
drivers/media/pci/saa7134/saa7134-cards.c:7984:7-16: opportunity for str_yes_no(( 1 == rc ))
drivers/media/pci/saa7134/saa7134-dvb.c:93:31-33: opportunity for str_on_off(ok)
drivers/media/pci/saa7134/saa7134-input.c:919:3-12: opportunity for str_yes_no(( rc == 1 ))
drivers/media/pci/saa7134/saa7134-input.c:898:3-12: opportunity for str_yes_no(( 1 == rc ))
drivers/media/pci/saa7134/saa7134-input.c:934:3-12: opportunity for str_yes_no(( 1 == rc ))
drivers/media/pci/saa7134/saa7134-video.c:622:10-15: opportunity for str_enabled_disabled(flags)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/saa7134/saa7134-cards.c | 2 +-
 drivers/media/pci/saa7134/saa7134-dvb.c   | 2 +-
 drivers/media/pci/saa7134/saa7134-input.c | 6 +++---
 drivers/media/pci/saa7134/saa7134-video.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-cards.c b/drivers/media/pci/saa7134/saa7134-cards.c
index e80fb4ebfda6..79cd61fb0205 100644
--- a/drivers/media/pci/saa7134/saa7134-cards.c
+++ b/drivers/media/pci/saa7134/saa7134-cards.c
@@ -7981,7 +7981,7 @@ int saa7134_board_init2(struct saa7134_dev *dev)
 			rc = i2c_transfer(&dev->i2c_adap, &msg, 1);
 			pr_info("%s: probe IR chip @ i2c 0x%02x: %s\n",
 				   dev->name, msg.addr,
-				   (1 == rc) ? "yes" : "no");
+				   str_yes_no(rc == 1));
 			if (rc == 1)
 				dev->has_remote = SAA7134_REMOTE_I2C;
 		}
diff --git a/drivers/media/pci/saa7134/saa7134-dvb.c b/drivers/media/pci/saa7134/saa7134-dvb.c
index 6de8a02314af..d0e58a0156f7 100644
--- a/drivers/media/pci/saa7134/saa7134-dvb.c
+++ b/drivers/media/pci/saa7134/saa7134-dvb.c
@@ -90,7 +90,7 @@ static int pinnacle_antenna_pwr(struct saa7134_dev *dev, int on)
 	saa_setl(SAA7134_GPIO_GPSTATUS0 >> 2,   (1 << 28));
 	udelay(10);
 	ok = saa_readl(SAA7134_GPIO_GPSTATUS0) & (1 << 27);
-	pr_debug("%s %s\n", __func__, ok ? "on" : "off");
+	pr_debug("%s %s\n", __func__, str_on_off(ok));
 
 	if (!ok)
 		saa_clearl(SAA7134_GPIO_GPSTATUS0 >> 2,   (1 << 26));
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 8610eb473b39..239f0b9d080a 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -895,7 +895,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(1 == rc) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_SNAZIO_TVPVR_PRO:
 		dev->init_data.name = "SnaZio* TVPVR PRO";
@@ -916,7 +916,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(rc == 1) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_KWORLD_PC150U:
 		/* copied and modified from MSI TV@nywhere Plus */
@@ -931,7 +931,7 @@ void saa7134_probe_i2c_ir(struct saa7134_dev *dev)
 		rc = i2c_transfer(&dev->i2c_adap, &msg_msi, 1);
 		input_dbg("probe 0x%02x @ %s: %s\n",
 			msg_msi.addr, dev->i2c_adap.name,
-			(1 == rc) ? "yes" : "no");
+			str_yes_no(rc == 1));
 		break;
 	case SAA7134_BOARD_HAUPPAUGE_HVR1110:
 		dev->init_data.name = saa7134_boards[dev->board].name;
diff --git a/drivers/media/pci/saa7134/saa7134-video.c b/drivers/media/pci/saa7134/saa7134-video.c
index 56b4481a40e6..1c02fb04abdf 100644
--- a/drivers/media/pci/saa7134/saa7134-video.c
+++ b/drivers/media/pci/saa7134/saa7134-video.c
@@ -619,7 +619,7 @@ static int saa7134_enable_analog_tuner(struct saa7134_dev *dev)
 		if (ret) {
 			pr_err("Couldn't change link %s->%s to %s. Error %d\n",
 			       source->name, sink->name,
-			       flags ? "enabled" : "disabled",
+			       str_enabled_disabled(flags),
 			       ret);
 			return ret;
 		}

-- 
2.46.1.824.gd892dcdcdd-goog

