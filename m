Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA0B265CBB
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364898; cv=none; b=QO28vcCn+sNvW8wA+sGOceC7/J0Z/r8pzkG4IOZrAwxQRpm2j2w1HLpp2iMm7u2I59Cqfp2cDfPMKjQjlYr9PhwULP4W3LWDlZSZA2O7etpYI0sxprKbiKscNJ32pqXBdMi0cBUYA83WMwENuhiBMBP3y2hfBXNOFJ8lycPZa28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364898; c=relaxed/simple;
	bh=L4Qw/JWLTT0dmHppUcAHgP693zq94oqrBxXz4v7GMl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHvvzzsdAFPCjkHGPRwXYhGIH+XNOKfObmetMnPHi890+0mllrgiJaxjLftrWTL6z66jPjey5pBQzgku2qw0BUG4c6hZRcEYefrSD+ZCxhaI3NoJNTw/QE5PC3SUrvBALoNNDMUa7AuxM2OArfXNqun54APH1FMUmrutNX+LC6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WosrX+kj; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WosrX+kj"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57da66e0dc9so4294417e87.0
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364891; x=1760969691; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=WosrX+kj6h0daO71YYlROXXUZpmfBqzeZltnkCB/k5AEoqpjfbxnt88U2q+jQ8Fp03
         /snVw0Gd9VF6zkft5IUhMNTYz8n6++oy/sPNVqgOP9wIqWeRS7Pz8xwHKkWpLu3y++GN
         GjdrtmD9+Tq0WbhxwXskVzXXuXldN82Pb09Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364891; x=1760969691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K2/B5MPGejpyktnrayd2M4OnjFiC4FIJq+++ipUzUw=;
        b=si6IQC1QO3t7pbjzO58ffdzqJIV4hZeFHk+PsPCtx9FDLVvvjmkWeXEwb0Pjerkr/I
         gf39ayjbG/43opQxRwSkQDLKgQTiEQShfe8+FTixWBhYs8R9yENKLQ1N5iYXUNkjCY8q
         NhVarIPits+QPQGkisf9NyD4RRQUCjXuRKhEjnT54CjVpz465d09NQ5MJP6ISWSaZeqC
         fCzdyRoiPQ9YEJqqioSw6UenIXefB8gf4fogKsHaGRqkHEg/hs3E6zlKCAjFNwOzY4sm
         iZpQEG1pWYDrMhFnitgVkH5dvO4cNixJw3ifnlSKCd3VAScRf/TJJkLAN0dEcgPnc3sS
         UyfA==
X-Forwarded-Encrypted: i=1; AJvYcCVG162F8YbvAC5cIp1PJuGTTJoJp2PnIYpd8pDkFc/p/R/PgU4G6WVUm3LNkqkBrbLYFOI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyS0YAZfpMEpG5FmWvlE+1AW8MUbx7qwqr7Qn9qSk+vkhiTdJRH
	so8APXqJrxbYa2+XMoLPrbLbA/e3D5+xbmi5AGjWB6ZUfsJynZUkK8bNqHtwfHARZA==
X-Gm-Gg: ASbGncu95V0qY2RG+CrwEfusevg0sMc3NjJ2qCx5kYzwrwDaQv/zZGq+UzzTdYq0wIx
	4gZAwOTC4NkLXruYfc7Gk6WZGMm7L3PeKWgWVvzPYVM5aQB6I9XpmL7BsrVz4T9OKGmdzI3Np4j
	+EH+iGa7mJpTkY6A9OE0o6Vvv/ITW0TERI7V4jongWD/d+lAVD8G07ec+Kip49nKj5q5y2xvORb
	2432gBNLJa4xqYaoMmfnkw7GmpCx2180E8NyknzhubSkOuT9cBLPx06gDMSaWOfvcda5PeyRWN5
	jEwEM+wWqqZSFEBFo8uljYEpmuMYbpLbnJiatCPqdrPA4czpbdclgcwWPe6mL6BYHE2hPgYZyBA
	6sl/u1lpZm2u2w1youRRgKPqR5EAGNbiJ+HU406DfBnBnlULZ1ps6WNvHckKU5CYfrlYh+w22Kx
	NojtLavYzURO/esjlbGYQit/thp5yG
X-Google-Smtp-Source: AGHT+IG5qmXDx4UbLHB42EHlB1t6C5RYlcWqyFNneQm/x2WKvXaXI+FP3no4d6C9H/LUJRdom0BMRw==
X-Received: by 2002:a05:6512:12c9:b0:57b:c798:9edf with SMTP id 2adb3069b0e04-5906dfa81aemr5323251e87.56.1760364891242;
        Mon, 13 Oct 2025 07:14:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:14:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:14:42 +0000
Subject: [PATCH 02/32] media: dvbdev: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-2-2c5efbd82952@chromium.org>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Leon Luo <leonl@leopardimaging.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The %pe format specifier is designed to print error pointers. It prints
a symbolic error name (eg. -EINVAL) and it makes the code simpler by
omitting PTR_ERR()

This patch fixes this cocci report:
./dvb-core/dvbdev.c:575:48-55: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 9df7c213716aec54bab7fde2c94ac030696fe25f..8b980d371a45e4fec5368a7e90d4c42518b72e72 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -571,8 +571,8 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 			       MKDEV(DVB_MAJOR, minor),
 			       dvbdev, "dvb%d.%s%d", adap->num, dnames[type], id);
 	if (IS_ERR(clsdev)) {
-		pr_err("%s: failed to create device dvb%d.%s%d (%ld)\n",
-		       __func__, adap->num, dnames[type], id, PTR_ERR(clsdev));
+		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
+		       __func__, adap->num, dnames[type], id, clsdev);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);

-- 
2.51.0.760.g7b8bcc2412-goog

