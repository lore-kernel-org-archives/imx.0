Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0140D18E354
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697848; cv=none; b=C35jJMe/qcHYTuTyofLb5w8QqxfqKyhsajGmIug1VvU4LuMeqv1LxQgtkclceVlJUZYpVuqCWUQY4n35evA6qTYT8favy5IEhXbsyhtj2cAjcvonaM82O7STSETOD/tdj+YJijXXrcDxUECZl4UlopHWAX4AuHyp89tN+5n7E+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697848; c=relaxed/simple;
	bh=5CcZFwY67VUyfBGEeXQ3+4Q+ziORs1PEInvOEq+lE04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ChMLxa/n0bPqNPkm/rQMipv9oMvgN8JtFSXoeht+QkU+eU0m2gpKMnqRnGEiV8/Ba4Lkq/TZunkmxV1AJe+RGsQ8ffEBnGbtXIMpmMGad/6XncNY6DWXFqsn3b8dn3uAXEb5GPUgZw3tHFcQuqSXI30r9m4HALb61XsLU869y7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lpofV1T2; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lpofV1T2"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-710f0415ac8so2401678a34.1
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697844; x=1728302644; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/d/VxAIFFwk8ny3jYVhNIfPO7NwT5z32rk28KK4f8Y=;
        b=lpofV1T2EL6T+1tcJkFR9MC0Te4sqQFn3TjuiuL/MuRngfsSW9nNtvsfhWg/rloOU2
         0dEClCyrTfw/KknsaWbOzCJ4WY700VuqxK362W66qKjtSXaR9M68srm1Eu3AgxNzBM5/
         IrTnnr1bElnsHxiTqiDqjnZmFkC+OV8pP4Ilw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697844; x=1728302644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/d/VxAIFFwk8ny3jYVhNIfPO7NwT5z32rk28KK4f8Y=;
        b=w3CAxq4VAfVgAvzv857a3yFnNPIj9PYWq6zPzb9n4/ixsXj9qor0pjthePCCoWuGFw
         jFarXvd2G7kABmp+m79f+PwLpbfQP5N8Ifig+Q7jxyr4cMIUB3ws0Sy3r1I18lGylfFJ
         AWpXVlnZcP6z6x1UIj+7bONyFJ6rQQSh5W/kxZVxoyJtvqYl2RlXQqkpU/5iqmrInS95
         grUOl1dEVgosd6s7fx44Mj5n3+XeHQ2q7KgDDC+IXLbti0G4XiYD8al0+tgUtszkDlZc
         f4niy/nBZqUUhNvS9dOiJ6a0ttYBhotPLF9VArFD+q04yGakd1/iSe7HgOdAuy1AAb7c
         jMpw==
X-Forwarded-Encrypted: i=1; AJvYcCWuAOuft9YKTRuFR37ryoF/rVqHGXS2i7xQ11Pq2Pq2Q0dwmI3+7D3pcEZpIeW2EsYR+Ak=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKT8+wzi3+RVqWm9XOROv4bUHg2D6XlRMevpSOMhuj7k7nFb4A
	IM+AKOwZ2DWZL0NQmDyjhDSknCHQUOC/7ZdoonbIgtHzOGxvVh4ppCD2fkj4Nw==
X-Google-Smtp-Source: AGHT+IG/KAG5rLZearz2Wa+2ErVyBcttWaRGk175qbpKywxFfy3PRamVmOosYeNbd61Fqm2746wGGw==
X-Received: by 2002:a05:6358:4314:b0:1b1:ac2e:af69 with SMTP id e5c5f4694b2df-1becbd0a143mr332064355d.17.1727697843926;
        Mon, 30 Sep 2024 05:04:03 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:03:56 +0000
Subject: [PATCH 01/45] media: staging: ipu3: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-1-81e137456ce0@chromium.org>
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
drivers/staging/media/ipu3/ipu3-v4l2.c:290:3-31: opportunity for str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED)
drivers/staging/media/ipu3/ipu3-v4l2.c:305:3-31: opportunity for str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index e7aee7e3db5b..443067ad0a50 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -287,7 +287,7 @@ static int imgu_link_setup(struct media_entity *entity,
 	WARN_ON(pad >= IMGU_NODE_NUM);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u pad %u is %s", pipe, pad,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	imgu_pipe->nodes[pad].enabled = flags & MEDIA_LNK_FL_ENABLED;
@@ -302,7 +302,7 @@ static int imgu_link_setup(struct media_entity *entity,
 		__clear_bit(pipe, imgu->css.enabled_pipes);
 
 	dev_dbg(&imgu->pci_dev->dev, "pipe %u is %s", pipe,
-		 flags & MEDIA_LNK_FL_ENABLED ? "enabled" : "disabled");
+		 str_enabled_disabled(flags & MEDIA_LNK_FL_ENABLED));
 
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

