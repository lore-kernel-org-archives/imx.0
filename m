Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF68198831
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697880; cv=none; b=nCQylDk2m8QN+txjBRJdSUrwLs2ukVNtmPBASZsBTX3FizoB1O1ygugcQ/Q6/kQ7fjORhHTHKheRTuXMHKJxg5/RsMoPo+OvMvkl2rZ6yT6aSxKOMysYFV9DymUsVsFtiRoj6vKSv89bSSYOWKyO1vYATuoeXz9YLgC0/NOTS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697880; c=relaxed/simple;
	bh=dK6Sydo8sH5iuoPGo1uJmSzzE0aPjCjllccB1/DFlKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqGhvIQA9mUy1hAf3pnHbL/DCLCTAsbPNYUps/gFQmZPp4Xrub2MyZ8dJH9KLorayGiF+67MdTtD8NsFzZ79AMyBT5pm7m5oB1v0JB4pqlh7AjwjKP2uijZ/K8axO0B+MUn8R+TtewUF446AMqp5V0qxy+mMcL0K7IhywtWB5VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e35PK9z3; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e35PK9z3"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cb37b34a87so30616866d6.0
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697878; x=1728302678; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W54Rxedr36zEnsk929u7YgHxA5FxY+YC4oIk0CEmtoU=;
        b=e35PK9z3FTjMC6tEQKXV96FQwIHDHmCRMwLJ4slKkiPjnc+ak8eh7wmnKx8MAR6zTW
         zZ6IC6DErGH+Rx/h8Jq7GVb1f3pc5VvavHmUhw866LluYkcvg+nk8F3UAPILpxloVqAB
         I4DC77itxkZPFJl40d+axLoebxcfSeoGZuqeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697878; x=1728302678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W54Rxedr36zEnsk929u7YgHxA5FxY+YC4oIk0CEmtoU=;
        b=GBzjFYHj6yfKAnTm+XJjWCIZQbvDc3plijYEFOZ1eVY5YgJbl+iPELIilNG5EemfsV
         NeKfiwXS5DFn3Tho/C9uGnKTaXbV7mnq9PyJNXlxCPHCpPO7eGxLilFgOad47mT6+3YW
         LPoaX/v+JYrAOotZ4jirWymk6jEwrjHH9giamUqtotg2SZgYUkTDX02iQP7dOx+r3Xp1
         L9a6KguRzp6xFH0g4fzsZyYa35XhVgfpmlRdw2yKG8pI086itjNFLPsNtlRdkLYICAC8
         QSf6e0vtI9E2hmo5QY1FgNWErPnwHJvDZto7/pfN0bJTWa3IfHtoUyHqsWKx6e+BIuMf
         b/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYO7YeVaSbKZKAcGmJRswpaxeH5cmOtI1cc+WS69WNBqsZcm9KzzT4OQKjTVRBi1IhMvQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjCiJ2tr8s6WLxwEZT66/NI8ASspCTFeAvuSyf1O0ALqNRUTHU
	06xjwngLmxUYNCARYdlsIHv9eTWJnCs0tAtBMzdYqHZ8b9A0Y0sIDp04fzkz4A==
X-Google-Smtp-Source: AGHT+IGgo8OgcYFtsubdwQ48E/Z3+k42qUYOU3xS8KlzOd05WOz0ImPebYZJQvx35b0omDgntAq/gQ==
X-Received: by 2002:ad4:580c:0:b0:6cb:3b6d:2775 with SMTP id 6a1803df08f44-6cb3b6d2d88mr154770176d6.17.1727697878145;
        Mon, 30 Sep 2024 05:04:38 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:11 +0000
Subject: [PATCH 16/45] media: pci: ivtv: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-16-81e137456ce0@chromium.org>
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
drivers/media/pci/ivtv/ivtvfb.c:809:3-57: opportunity for str_on_off(( var -> vmode & FB_VMODE_MASK ) == FB_VMODE_NONINTERLACED)
drivers/media/pci/ivtv/ivtvfb.c:609:3-57: opportunity for str_on_off(( var -> vmode & FB_VMODE_MASK ) == FB_VMODE_NONINTERLACED)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/ivtv/ivtvfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
index 90c584cf97c2..bd07afc68191 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -606,7 +606,7 @@ static int ivtvfb_set_var(struct ivtv *itv, struct fb_var_screeninfo *var)
 		      var->left_margin, var->upper_margin);
 
 	IVTVFB_DEBUG_INFO("Display filter: %s\n",
-			(var->vmode & FB_VMODE_MASK) == FB_VMODE_NONINTERLACED ? "on" : "off");
+			str_on_off((var->vmode & FB_VMODE_MASK) == FB_VMODE_NONINTERLACED));
 	IVTVFB_DEBUG_INFO("Color space: %s\n", var->nonstd ? "YUV" : "RGB");
 
 	return 0;
@@ -806,7 +806,7 @@ static int _ivtvfb_check_var(struct fb_var_screeninfo *var, struct ivtv *itv)
 		      var->left_margin, var->upper_margin);
 
 	IVTVFB_DEBUG_INFO("Display filter: %s\n",
-			(var->vmode & FB_VMODE_MASK) == FB_VMODE_NONINTERLACED ? "on" : "off");
+			str_on_off((var->vmode & FB_VMODE_MASK) == FB_VMODE_NONINTERLACED));
 	IVTVFB_DEBUG_INFO("Color space: %s\n", var->nonstd ? "YUV" : "RGB");
 	return 0;
 }

-- 
2.46.1.824.gd892dcdcdd-goog

