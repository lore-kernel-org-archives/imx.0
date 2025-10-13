Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5886D3090F7
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 14:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760364916; cv=none; b=dufC2vZUIVXJnVkWsIRuNpN6rbACVLIbrPFAxrzCvq8fvduXmwRXCdq39E3qS9fIobz+B4rQ+yaz/BHSnPzmMUkmZh7k8cL4+yAw1dnN2fg1lXNVLWZlLurHXYEt65rx5IRHLET3pYlU4uMLWDs9LaYpuZXl3tIA608yS7ghhMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760364916; c=relaxed/simple;
	bh=SRU041Bx6qBndiZAXSPZ90z0DuuZmjP7aN/HQli4PfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nb6O/Wwk54kLe+XFKBU/u7x6YsRpHCeLGzPR78ANYsUA7TqTKYNZLFN6Qe2DHT1A05KPj7k7CjTu8MCm4xfOFqDeg1dR+cI2AQXah+JSfQ72DEidEShEyelfDleBAmNjYBZFyYfevgRdMjx3WtTPn+fg2LJ57lUDDxHaTusmdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UxrtAYWt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UxrtAYWt"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5818de29d15so5335654e87.2
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760364903; x=1760969703; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=UxrtAYWtzWjFZzJ+a9lAAfIhs+ZE7mm0Xb/UoQ1N9Q9oH+ZHnn8DQkmZYg0njXkmsx
         5MfW6o8PfnoAgGTtXCw9PqaMdQkDbXiEbuvgwZsnUK1bw2HuHqiFODYUjpxiejJS87mU
         LsB71+RkVd/A+aplhtt4T4lARr/jdhV5OjjkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760364903; x=1760969703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nh8P+yO8NsicwjNOpOoZpCCNOToSmwS7+PssriFBCJo=;
        b=IheFpLq5xlDCpfWv03kNsF2H31BM4A+z2g1YCQsa7G7xyYTIDufVSeoN4wniaseeZr
         DliSzspgAQhH/DBNfXvfRm3VWiKUmCbjeisTha3enPZKD5FlthiY299HrWCvxWkP2hwx
         u+Ks4QGiodatk2TUH+0V1qBvt0Nd0Fe9kJfFt8scXjYuwPUcFuQtxbPUXCv4nthCR+2G
         Nb/85vwbJDGGMqnBjIkiz+fYwKvpRKwFZ7Hc0RarqnReYQJeRx7lHsRcVPBF3aXF9eUh
         MslTQW4bPAGXZOqwcRGHrOPGqPOHWv3HRfvvpl17xUMhRiTVa6rzjBPUCKzpRJjFMKen
         /iSg==
X-Forwarded-Encrypted: i=1; AJvYcCXaHeqRFoyw45TJDgHLzh/CYuPcipmj/VC5FRZ1kMt7oZMnQg7yI7tqg5WwLdhJqcF17ds=@lists.linux.dev
X-Gm-Message-State: AOJu0YyH9dt/pyEGaReFrzoC1JAYmX5eIgD1MaPeBqW4EM0BVLdrWlyE
	uXXLVLxDNI84K4QFhVen+Dny4qk5xwgMbTB+nAL/mshH4YRHr++bdLbo8c/E09SrIQ==
X-Gm-Gg: ASbGncthdh03OjsWa7cy1ngnXc0+Xtzdosnvg+99G+spdpcZFb1vIwCrPu12A6IzBTR
	4N4nSK/D3hhNY//wJUCRJEWbPOTY5bQj98wFDdVUCCowH7U9CzROkEdh5KNaRGZJQimu9jamySq
	SWHGcyIC0JPrf5Szdg1Fw3zu2CO0ZKc/gT8HcvrafTkavN3Hubk6SiknZpFulEX/VrsKTUVAXeS
	V25c/5PIMAArNTC3iqivOCp/EUcdZQlYeVzJ8e1dle/uTawPxEnUzASgiimx9/K1GwpTALZW2U7
	mCE72BaSOLNCzamVMJQBJDu9JoTTOEklbOvy8XOhJKMqmRY4FOX44viEud8ONa2Js7WTKZ7oW/p
	ydMIvCenBEKE9PRfeW4fz8kwEQAwp+5WZyxAhjY7BYgRLJEYl3RQP8K9Fq+f0YUiTRVnRnhJlM0
	RSfiQYbvFSa4cpsNu/ww==
X-Google-Smtp-Source: AGHT+IHTiQ/qP/uDKTsRTktboy2tz6+O6QgpLJK8/qSWk5/9SrQl1mdClJ1AYpOXCltPovAllg1/dg==
X-Received: by 2002:a05:6512:3c87:b0:576:89cc:95e3 with SMTP id 2adb3069b0e04-5906dc12458mr6541046e87.10.1760364903311;
        Mon, 13 Oct 2025 07:15:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (56.213.88.34.bc.googleusercontent.com. [34.88.213.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm4165256e87.25.2025.10.13.07.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 07:15:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 14:15:03 +0000
Subject: [PATCH 23/32] media: ipu6: isys: Use %pe format specifier
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-ptr_err-v1-23-2c5efbd82952@chromium.org>
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
./pci/intel/ipu6/ipu6-isys-csi2.c:91:22-29: WARNING: Consider using %pe to print PTR_ERR()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index d1fece6210ab25de4e8c7b5247f049cc1dd1e677..d858976112ba2bfc2907f9b88dc6c6434053f4a3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -87,8 +87,8 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
 		dev_err(&csi2->isys->adev->auxdev.dev,
-			"can't get source pad of %s (%ld)\n",
-			csi2->asd.sd.name, PTR_ERR(src_pad));
+			"can't get source pad of %s (%pe)\n",
+			csi2->asd.sd.name, src_pad);
 		return PTR_ERR(src_pad);
 	}
 

-- 
2.51.0.760.g7b8bcc2412-goog

