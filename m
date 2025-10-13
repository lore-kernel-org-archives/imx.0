Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39AD309EE7
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364925; cv=none; b=PYidOKBiF+ng37r11hA+K7zMOTfh8xF4lbV8KxbfCjsYRMl6toVcMtUFY2ovoTXAQwWyp339iAEvk7sCGSepYndyHI2inqS1oCjuvd0EtrCTWj/hjNzvIFOpUrj9bvxbTJ0VJ0aOWMw6E3LcgDKshUcx2qBkfHrb3tmTd+c6lxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364925; c=relaxed/simple;
	bh=skVdsDy23N9awwt8a/RTEZ0Qc6vg10QpvApVK58YUJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ati08CForFpFUU8rSrc/XFI1TXFZ3YjvqEHs/yJMPz7hqOLt3MgWJ0mztpD0fkYZIAyDg4YP0PfZRPD4mdRl8jc2HwLw4IosY3VcwmhX2RE8fYDtzIzRnFOI2AdJeW9eEgFW0acpdDHX5xsTgqipgxlR2w2YrIeVUSN6H5dilNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lqh6OIMD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lqh6OIMD"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so4681963e87.1
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364905; x=1760969705; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZ1y71tufxgFEEk7Jm6x6zTef8El2vgKtA+3jSIjqY0=;
        b=lqh6OIMDv7FrZbvPBMLJnqdPMbKi929eMnRNHIsQ9b0secNVk4WumCvIYH/06j27pO
         LRT6Q1gfxFsXXXg2dTp1EcUsg56m+jhys48x8W2M6cR0LmMn4rwcV/JiUh3j8MQQR7gr
         eIshPHvzQ4qiiaAfgZEyB6VT9UnU9l2kiAI3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364905; x=1760969705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZ1y71tufxgFEEk7Jm6x6zTef8El2vgKtA+3jSIjqY0=;
        b=Lo61eZUSPIST53K3hjNViVdEDLKvmlPEkxbhltffELFRoG1Srcw5ry0KyJf0gMVkNb
         ngvT6DM8WSVa9Gqo9yuMGOIeOCdg+bsJpUg4wBOZ1TGJOg16wbxoPuNp2oUMnVMoWep3
         Pde3D8h8hUn9ZgTwCIuPihrAlt+QobUsOlPvGzLY0419H65wmNkwKDAg6Nwp+VaUFco6
         kwdoQdZynS37XZwCzQvGs0KbJS7WM69mKuC0ZaY6mCfMKiDs8FTwmtgLQHoLevtprHPi
         DgOURsSFp8AguUuh7UFted8x0g747ZBU9YNNXUpHyV0xt5QR94YfRcPlhB8FadAppl29
         AWdA==
X-Forwarded-Encrypted: i=1; AJvYcCW7t7HLeAG2qZHmQBkB2UGiZwa7cTQswKCz2lbU1lFXgnhI0/SC4T5K186FFyqI/T7xIvI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRNAx2u+I4jtFACNa8AZlDgEZBDMfFcoH+RERzCdqvpX0SFSxo
	Pg21D5mPQaFfqv6YubYRNg0P0WN7M9fVRti7K1IPMSzWdzubZkW/00kMK39XHDmQIA==
X-Gm-Gg: ASbGnctRwoCsye0zs2Swb7/C2JtnafFd4BPSxmMCjT5TeTkeaGYnTScb1Q3IhthQy10
	kZl5reXl8BM3ZTM0S1SgSFZuGZQDewACNmP8tJ5QdotC4okNcIOaJFFgVZyiil6MEp7rSTKDaQ4
	UDTcEMNTSIZn5V0jyCBq0SpO30PuWQYCM6xZOYR+RVZt308UkwRoJZ9Eck2aKq+Y6RyuQeNzTL9
	8vZKAqzIMR+781/RGZHmVi3AkNaHEaXYuN5XqSG8rYiZza7sFsdnq+fgreXZ076NuLZYSUuQg6N
	cMltfY8Sj6kkMPFKbNbjVB9fTDtipeXJoNq4kORvG3s2ZKbmTTbSB7MBkWC3TS34HORcHm1XtIx
	QQ13Ee3fXC6nPqnp8hTONODaH06wUDOlN1v1M848lEMFmgoo4VssUzqr/igrI1VbDwmfsJnY6Tz
	Y/5K001dD5DaSyhYaFOA==
X-Google-Smtp-Source: AGHT+IFBH7uOHCgk463dX9utRYXWTvTjqks9NRSCe1XoUpKorvtzVnjNPhpyhsxKq9EgJCfyUEV3JQ==
X-Received: by 2002:a05:6512:ad0:b0:57b:1ca2:ab60 with SMTP id 2adb3069b0e04-5906de89076mr6151331e87.52.1760364905455;
        Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:07 +0000
Subject: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
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
omitting PTR_ERR().

This patch fixes this cocci report:
./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 6c64657fc4f3366f27bb63dea56f535519af20fd..2de515c497eb8557602ec946de527823f07ab11f 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -954,8 +954,7 @@ static int vsp1_probe(struct platform_device *pdev)
 		vsp1->fcp = rcar_fcp_get(fcp_node);
 		of_node_put(fcp_node);
 		if (IS_ERR(vsp1->fcp)) {
-			dev_dbg(&pdev->dev, "FCP not found (%ld)\n",
-				PTR_ERR(vsp1->fcp));
+			dev_dbg(&pdev->dev, "FCP not found (%pe)\n", vsp1->fcp);
 			return PTR_ERR(vsp1->fcp);
 		}
 

-- 
2.51.0.760.g7b8bcc2412-goog

