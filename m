Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D9016DC03
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 17:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720201145; cv=none; b=rvEFOldSflZInux4JwKPN0X2wNOEeoc3qQz7IC8qHQY0n1HoCg2ZAyZTls06NR1KYVzmRmedvAarxI50+ORVboy85SlYJQQHN386qqGvByJnAOmOTHMHqFLsnGoCc2sRtPJwHltEMP/yYq8EPHdffNQ/A3xZlUqawnzwfVTPvjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720201145; c=relaxed/simple;
	bh=mVgTE6Tr03GmKnHHkpuO3Mvjmm+k16ybrIW11uRgrJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omwrzyq7OCXlGYwtYuKc7gSwK3wDal/UgMzpXb0pQGN0Gdz0aG7v7SoQd9ebbaCmPkHttAM9z/ckROvr+WiLyOAUi7S7kXJpPM//czNkQq04gDfgTCXceYjZeCdLW2DImZ1yK2iC/HbEbWIt7uNHqlhau29usYLEfk+NXCakR4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLscUOfq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLscUOfq"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-367a23462e6so1035823f8f.3
        for <imx@lists.linux.dev>; Fri, 05 Jul 2024 10:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720201142; x=1720805942; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5cL1Ju/EnizCBwzcplcXLkNB3ZwaJ1qWpxsE9WHe5I=;
        b=BLscUOfqTfrQcHNF6W/W3mZG+9khfqXeMODwNOk52Bd3BUeSNgTJUXKeNBtdoahlhL
         UmxMAo2R9TmPp6oljqIUOH9qty9WiCH5ambYpv8mgCdy+snRoLii33WfytnRnq8n/Sgd
         QqTg7YYvBKUd0QJYDKE4y3X772iBBL8XJh3Ty/ZnXe4CvPW4ieF3Nm01NY6RAeTUGRek
         8KdGeOsRRhsIrMQr6k9Hll3gCKX6oRH5YnX8M4uU2l8yZE8kt+DbRFWVGccC5gLzYF+1
         F9feCxM1upjI74tiFc+0nBaeLvzrZyaE9jHN2u2sHuMu9J8tb3khk7/VgsP1+FN3fJgR
         d/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720201142; x=1720805942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5cL1Ju/EnizCBwzcplcXLkNB3ZwaJ1qWpxsE9WHe5I=;
        b=Hor53vQSbpvHoL8JUD6ARNMDeNh3anhZQr6KwQclOqms0zjx2d0hIriOyBTNOuddZ7
         EFny0E6MYhnxRYIE5saG0Ml3/MXs8s8cc9I2FNQxIav5zYGUDXJYEx/t56P7KFwfKtJU
         nwfpfYVFd+8Mkn6LyArOt3ftcy26Ti1x3e1sZJmkIxg3mrwO2VCJc8IxHD4Ca9RTuPpq
         fOptO/msafboacVsw0ijHKIyLzidLRKWikav4KVh9aXL6fTpN9H4VWPfb5By83glwgJB
         gtUmpGODXGwLC219Vs5ljnqrbJ0W7xGmHTnNPBRbOa2GdSuo9EfyOZqDMjx64ohv0JVA
         AZFA==
X-Forwarded-Encrypted: i=1; AJvYcCXaE7VpQoyLDo4y+BVelL7ZNHZ8lLOUy7ArzaDMKIXVKbLrNeyTjFpmoVD9SMfFH6Kl8kt7RLoz040lmCarnXYmERsn
X-Gm-Message-State: AOJu0YwIfO+oB3egU/TZ+7dNzpGMorZhkdTKMWakga2Mcye+KGFJqnlu
	WrgFDHjaDmjl8TtKQMNqyUEcIFgCKwpUgTwam+gaPCFEQL+I7f7y
X-Google-Smtp-Source: AGHT+IENnZ31Fhfxo1qbgLtZ4Qj/fNq9I79lumyu1cAhEbDMqCkW20hYNV/o+7mX8LgMIuYOdSrO8Q==
X-Received: by 2002:a5d:60cc:0:b0:360:9d4b:5b82 with SMTP id ffacd0b85a97d-3679dd66ebbmr3262790f8f.47.1720201142404;
        Fri, 05 Jul 2024 10:39:02 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-4adb-3312-ca75-bf55.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:4adb:3312:ca75:bf55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679b1e5f31sm4850466f8f.33.2024.07.05.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 10:39:01 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 05 Jul 2024 19:38:51 +0200
Subject: [PATCH 2/2] Input: fsl-imx25-tcq - constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-input-const-regmap_config-v1-2-f712a4494883@gmail.com>
References: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>
In-Reply-To: <20240705-input-const-regmap_config-v1-0-f712a4494883@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720201137; l=785;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=mVgTE6Tr03GmKnHHkpuO3Mvjmm+k16ybrIW11uRgrJc=;
 b=YpVzo0oa9gxnfpyIdCxM5sn9qo6yghDA/RAiEqND/2sS9iEP6Ju2WAMETewxVsxjUP1V2C7z9
 lsiDsntgMXSAo9kOzC7mZCDUN+i38dHKfPALPTtN9EVGjZ53BpYpkbv
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`mx25_tcq_regconfig` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/fsl-imx25-tcq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
index 60a7246c5157..a32708652d10 100644
--- a/drivers/input/touchscreen/fsl-imx25-tcq.c
+++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
@@ -38,7 +38,7 @@ struct mx25_tcq_priv {
 	struct device *dev;
 };
 
-static struct regmap_config mx25_tcq_regconfig = {
+static const struct regmap_config mx25_tcq_regconfig = {
 	.fast_io = true,
 	.max_register = 0x5c,
 	.reg_bits = 32,

-- 
2.40.1

