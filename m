Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F29C190051
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697858; cv=none; b=EY2u9/gDSWo0og0jRbsDWgosVf0MsFvAaEJ9tkaY9gPMBko+Y3VcHqOjf+wDgrH2Ssb0DurwaqE77Nr642xt5YAPA/KETAf2Muvo3fHJXyjHbDghJQesNefbYlczopnXOwB+KwKjrHdZTyp1fyXHQ/zPkDZJdC3lVwDPsDHoHJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697858; c=relaxed/simple;
	bh=8MgT7dP1g3olMOrBUhOPMpyuDlnQim8dCackH8O66yY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cu5CG5uUPW/Fap+N5j+GpfbPvajankZTPtVBvnaoqfGDYV0zfoLJMZ3cp3Vu661G2OOU0Uc3Az8h/zJjJM1NUlYiI/3pO4c5OoSfiRUq88MotohzD2dTK4XBZIgi7mvN39uOOYa+4HjCrT8XDxQg8jQi+wFvV/IIbSw9XqXSyHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eX539iI7; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eX539iI7"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6cb3ba0a9a2so23997916d6.2
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697855; x=1728302655; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsuMyrkoVqVku50v1nfIbGtDSp7S7nG6aU9K9Rp04Bk=;
        b=eX539iI7gOXOtdSGVCztQ4c8ClmR8IwQIAXtuWoERMAKFz+gCNLQcWYv0sDgcx/yTF
         e5N1AvbYY/LCWwXCNJVyEr6Thoxqj0sBsT7Y29jWUI0BMCOzLYqSOjgYXErrVAn1pIxi
         6onnyFnh/jX7w1gJWTnVH8XHM1GSU3eqegdhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697855; x=1728302655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsuMyrkoVqVku50v1nfIbGtDSp7S7nG6aU9K9Rp04Bk=;
        b=Fre5pKbOA9i1QkfqoUYsEc2PQ3lz2rB8lSNTt61V9DnmF4q5TGwM44DzH0TnV9Pk2O
         adjCu8fWtgsx4N9zsCY+GlAQVDP9x+aafiQylfJLaJVVIe+Q3ZLoVJsYAnxeYtQP77/C
         h4V42yQCOM6zhV7lKy9rumYbawcFwdQgiHW05h9r2eVCFI9D+HfTQG4gugwUycA/Y9Em
         +H+gaOGKQG4YPTm3lrPrPRpnMKQdtp4YiwZMtKG152kTlEybQel1PTKEg8SdaBS5TCOJ
         kRnBGt3XDoQJcNWtPas9WGWTleupN/uLTHVqw9AlR317HnKs0tIHhUpJq9b4Po28SxmK
         wMZw==
X-Forwarded-Encrypted: i=1; AJvYcCXenihIoS2wiVK/E3Qh8Ec9vNAWT+hrMr9kCKe2K3h+3c3/cqcBIejU7zDRVtakTytbwvU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyS7xbkmR8koQWhWHWfpznjUC+kg+54l5dxzOaMhH3cNnZ/r/Sz
	gF6/tD847tw1lrypX2Y4IagMo8M7pCdQrAjUwdIHVk0E7UZ3nn64eYxmlQLmpA==
X-Google-Smtp-Source: AGHT+IGbIk2oHMQ7FRb0GeJel1Jh9P6FVq0oOGmExjq89yc9rCz3p632i5Dvmp6LRIkRrX30gKUAOQ==
X-Received: by 2002:a05:6214:5990:b0:6cb:3925:ec95 with SMTP id 6a1803df08f44-6cb3b66d1a1mr155459916d6.53.1727697855060;
        Mon, 30 Sep 2024 05:04:15 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:13 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:01 +0000
Subject: [PATCH 06/45] media: em28xx: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-6-81e137456ce0@chromium.org>
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
drivers/media/usb/em28xx/em28xx-i2c.c:579:3-29: opportunity for str_read_write(( msgs [ i ] . flags & I2C_M_RD ))
drivers/media/usb/em28xx/em28xx-i2c.c:590:2-28: opportunity for str_read_write(( msgs [ i ] . flags & I2C_M_RD ))
drivers/media/usb/em28xx/em28xx-video.c:941:4-9: opportunity for str_enabled_disabled(flags)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/em28xx/em28xx-i2c.c   | 4 ++--
 drivers/media/usb/em28xx/em28xx-video.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-i2c.c b/drivers/media/usb/em28xx/em28xx-i2c.c
index a7eb11f7fb34..62fe49876a32 100644
--- a/drivers/media/usb/em28xx/em28xx-i2c.c
+++ b/drivers/media/usb/em28xx/em28xx-i2c.c
@@ -576,7 +576,7 @@ static int em28xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 			goto error;
 
 		dprintk(2, "%s %s addr=%02x len=%d: %*ph\n",
-			(msgs[i].flags & I2C_M_RD) ? "read" : "write",
+			str_read_write(msgs[i].flags & I2C_M_RD),
 			i == num - 1 ? "stop" : "nonstop",
 			addr, msgs[i].len,
 			msgs[i].len, msgs[i].buf);
@@ -587,7 +587,7 @@ static int em28xx_i2c_xfer(struct i2c_adapter *i2c_adap,
 
 error:
 	dprintk(2, "%s %s addr=%02x len=%d: %sERROR: %i\n",
-		(msgs[i].flags & I2C_M_RD) ? "read" : "write",
+		str_read_write(msgs[i].flags & I2C_M_RD),
 		i == num - 1 ? "stop" : "nonstop",
 		addr, msgs[i].len,
 		(rc == -ENODEV) ? "no device " : "",
diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 4aef584e21da..ff017c187aff 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -938,7 +938,7 @@ static int em28xx_enable_analog_tuner(struct em28xx *dev)
 			dev_err(&dev->intf->dev,
 				"Couldn't change link %s->%s to %s. Error %d\n",
 				source->name, sink->name,
-				flags ? "enabled" : "disabled",
+				str_enabled_disabled(flags),
 				ret);
 			return ret;
 		}

-- 
2.46.1.824.gd892dcdcdd-goog

