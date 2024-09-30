Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941A19C57D
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727697903; cv=none; b=Py3fWNtvcQdgr8QV2oZoVL1xr3kFk83wvP0pZOEIYettpigjRzeDklbRNNzB9ofNR8IHOe2gWPZvlbNaTOZkL/cXVkq2xUDUs6/blUZuNU6q4Em1Jvc1RrBdF3bwk0ebn6owow/Ip344po+CFossIoDCsIGBQBYM37++EzG4ONU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727697903; c=relaxed/simple;
	bh=eMOK5aR0wLanv4sEh7pDMzrsrhbN/JSAh3wt+zLwIY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BpwOzD5XMdW31pnPxOHTxORr3t2qvlJEV2n7yXLJ8+dWTkMYVPNmJhMMLhr+Cnp7jWUat8Mft7Pwb7eCx081Ej15iajTylyKPDug7/F+26GsO1UffS1v/Sf/GSuiukQRPhjr8Fjac+YgZIDmkOgdS8cufCiF4uKrDOHP8ncVjJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XVLzGdQO; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XVLzGdQO"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a99fd0535bso372447985a.3
        for <imx@lists.linux.dev>; Mon, 30 Sep 2024 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727697900; x=1728302700; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtS18Z/ph+22OpFMjBj6PDOp8BDjMiQU1mRrp+tqPao=;
        b=XVLzGdQOP3cGAG36YoETPTTOadU55rKlfA42PLF5FyKJq6zybJsV+/tlr650J5abMD
         ggXvD8yhcPWTFsoMAWTQlZDNLj/BzAaTW1xIt2x8ePZnnJPt/h1HX9CTWIkVLzBoKs/J
         6jm0/SKiKa9PR/i4QQmqIECYN/hxhkWx6lIR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697900; x=1728302700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtS18Z/ph+22OpFMjBj6PDOp8BDjMiQU1mRrp+tqPao=;
        b=vPTm3kH2NEcu2nVAT5y0ZetbhHEctEp9r8DERkllmOdrrpXPkJ9I5OOylsoIwi2OAC
         BDM2bMP6AdW2Ddnb3+SLBPbopDq2tBT0vjiqMUMhyGv4wFRHnJjVxXUA3PMg44ykFszs
         iUtq+eIkEfzSeof2tkkqxSxOX8Dyq4P9Ib2eftPSLTeEVLYuVnjgG/UZMf+euSOV8Ct1
         copNFNFSq8pjSITNKO/O1ytiej5bMQyEbrv36WvBlcdAUmd195ldIPOS90bDsCoDWxed
         60HUdckI5MkANB0/hj16fHcvkjGVDx9h1O3QAMSt6Znlg2ANGHFGHqfBLCciuQCFcdz4
         ZUjg==
X-Forwarded-Encrypted: i=1; AJvYcCUg2WU60frWx+n6UVsckmKFfAweS1hWgPx2fGGpEZ6fVmUoLXlCxuskjkl7Izs2kaGbFZg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy282E2yTxy63NocyO4oJZmR/Dck1eCUnGbtCzoblfqY/he3sFi
	UkuVZ02rmL9eHgi9AUyQdbR2jraVTfNvLp+nt3rqWP95nKNA4x+38n1vn2Nh8Q==
X-Google-Smtp-Source: AGHT+IHa6kByUW3tXKJTo1om4uBb1NLh+sbjdquYal1McTRlR2Y5X69QcY3HAZ4VU5M0CeLNOC2NrA==
X-Received: by 2002:a05:6214:448c:b0:6c4:6217:da9c with SMTP id 6a1803df08f44-6cb3b5da202mr213240066d6.17.1727697900493;
        Mon, 30 Sep 2024 05:05:00 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b694369sm38822536d6.144.2024.09.30.05.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:04:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Sep 2024 12:04:23 +0000
Subject: [PATCH 28/45] media: b2c2: Use string_choices helpers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-cocci-opportunity-v1-28-81e137456ce0@chromium.org>
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
drivers/media/common/b2c2/flexcop-hw-filter.c:119:20-25: opportunity for str_on_off(onoff)
drivers/media/common/b2c2/flexcop-hw-filter.c:12:35-40: opportunity for str_on_off(onoff)

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/b2c2/flexcop-hw-filter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop-hw-filter.c b/drivers/media/common/b2c2/flexcop-hw-filter.c
index c5a3345c99e9..d64a03452e22 100644
--- a/drivers/media/common/b2c2/flexcop-hw-filter.c
+++ b/drivers/media/common/b2c2/flexcop-hw-filter.c
@@ -9,7 +9,7 @@
 static void flexcop_rcv_data_ctrl(struct flexcop_device *fc, int onoff)
 {
 	flexcop_set_ibi_value(ctrl_208, Rcv_Data_sig, onoff);
-	deb_ts("rcv_data is now: '%s'\n", onoff ? "on" : "off");
+	deb_ts("rcv_data is now: '%s'\n", str_on_off(onoff));
 }
 
 void flexcop_smc_ctrl(struct flexcop_device *fc, int onoff)
@@ -116,7 +116,7 @@ static void flexcop_pid_control(struct flexcop_device *fc,
 		return;
 
 	deb_ts("setting pid: %5d %04x at index %d '%s'\n",
-			pid, pid, index, onoff ? "on" : "off");
+			pid, pid, index, str_on_off(onoff));
 
 	/* First 6 can be buggy - skip over them if option set */
 	if (fc->skip_6_hw_pid_filter)

-- 
2.46.1.824.gd892dcdcdd-goog

