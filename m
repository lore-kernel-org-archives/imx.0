Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36702199234
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697890; cv=none; b=pJP/Bw+nQ0NNiiMJqnuQapovdoGvMgO6RSfVkHUp+5pFaCdNztVlDORZZBUwVb8nEPIRwlRcEFmIBHKvLTxCpkcqM9mgcVyXzb9IFLotFJk+b2onpy7RVbyivPhor19gCP6m+4MWiVQy1Zg18TCDwIJCGIHSQvdQ6ovB4ChJzBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697890; c=relaxed/simple;
	bh=0dMrYdJQZDwFbZRFwFBopbceAxAW6UVmiIWzGdnbBBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S/CSZjZKufJ4DDdh/zT53qKbuvhHZaz5vm4SiwZQqDEpQdAQ2+4M/1oFv7h27UK53mMx8DP5AGoGPf/A4vz/QhVwS0C5FdJNAJ5qzTk8hZcujPU72inhO/sMsH/JyO0gNxg65tMH4zPjHQQrDVhVcYMzVkJN+VeDxywm29OCOMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZdTb8zPn; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZdTb8zPn"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6c3603292abso43945346d6.1
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697887; x=1728302687; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZdkoyJRGbtYAtgWDyhzmqUrZ4ojuNTD42Wgr3aJHzg=;
        b=ZdTb8zPnOrdqbAVOyMTleEYs7MpNKq3/CjGkfuHDFCyPJnVBg9UUYjzVVE5mMEIXFn
         7nEeuI1zB+M7WAJE/Jvr7k9zkDStC7GhaTAOwGSgX/32U3/NB5JuBA333C3DnIQtAQ6A
         ddKgNEE4GMl20QOQuhGck3ycQdjo0YvYl9//U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697887; x=1728302687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZdkoyJRGbtYAtgWDyhzmqUrZ4ojuNTD42Wgr3aJHzg=;
        b=dY548nxG0+41eHIBpI3qH78w1OpdqStAdZ9I9sVpq5DjI/awDTf9cnH/g2v6eaQnDn
         4t8Z/OhfVd9ZSusSqLAJa3fLmDcNDyS06IEscp+1+jkY6lMHzCd+lsddoFyt/O2fri41
         t0lAAq5jYkOlErlAbqTxu3m75Qn/OEwoGgTLkCePKFYMJG95068yI1lG8KCPa6tq0vbF
         OXqe9nKcgA0KJWqoJYOVcR+RhIxiizZ8jzsLyRtTBIy+bTO0o/Xeze8WuL3FTilDuque
         5Xo7u0VTuG8GbSLBLYIz/7kQvu/9hKPnrrgmi2Lhu2dKxXmO8H5LAp/vFMjWeMXNNzwF
         LoBA==
X-Forwarded-Encrypted: i=1; AJvYcCVcvX+7QrmPDGCGucgHqjBpuna348AJQWudrBdNwtNOpG0OCx5C9uXhG83F7f+MC84yxzo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxEjW8FWn2e6QIC+ATdIzOqM9RzN5edsIl23BcO8hsSNzY9sz3
	4SUrSK8OULCv/3mOJKrQVNM0hamh7TO8DFIse64j2boVMQl+Iy9bV41uexuHgQ==
X-Google-Smtp-Source: AGHT+IGDig2qhJHVIgkos7cydvwLVCYXpIPoGe1fBfPazyzsBzvK7ByCA43K6ayYB6dav+TXdoGUKw==
X-Received: by 2002:a05:6214:4c03:b0:6cb:410a:ef5d with SMTP id 6a1803df08f44-6cb410af56bmr118016106d6.5.1727697887257;
        Mon, 30 Sep 2024 05:04:47 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:16 +0000
Subject: [PATCH 21/45] media: coda: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-21-81e137456ce0@chromium.org>
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
drivers/media/platform/chips-media/coda/imx-vdoa.c:120:39-42: opportunity for str_write_read(val)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/chips-media/coda/imx-vdoa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.c b/drivers/media/platform/chips-media/coda/imx-vdoa.c
index c3561fcecb98..abdff181d417 100644
--- a/drivers/media/platform/chips-media/coda/imx-vdoa.c
+++ b/drivers/media/platform/chips-media/coda/imx-vdoa.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/videodev2.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include "imx-vdoa.h"
 
@@ -117,7 +118,7 @@ static irqreturn_t vdoa_irq_handler(int irq, void *data)
 	writel(val, vdoa->regs + VDOAIST);
 	if (val & VDOAIST_TERR) {
 		val = readl(vdoa->regs + VDOASR) & VDOASR_ERRW;
-		dev_err(vdoa->dev, "AXI %s error\n", val ? "write" : "read");
+		dev_err(vdoa->dev, "AXI %s error\n", str_write_read(val));
 	} else if (!(val & VDOAIST_EOT)) {
 		dev_warn(vdoa->dev, "Spurious interrupt\n");
 	}

-- 
2.46.1.824.gd892dcdcdd-goog

