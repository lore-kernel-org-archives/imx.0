Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594BE31A81F
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 05:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770269073; cv=none; b=bJmxTHL1qb86i3KFIMmxStn7qujE7bJdibqFmabsk/wmD/lmKC0YVZC2/XtKwz2OfLCRe2cP+b6EBt3D+RUuofKdMWSwyE3bJTOBgkxCZBQsDeURUolEUL+MRsw8jb7wwGwv9qvbAEv793+wadfoFQW1L5AH/IDs7ddJgle1cUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770269073; c=relaxed/simple;
	bh=PpFoTrEob6zmU8S7w2lrzqtIJeJYrJEyv/fehN/5IOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LZkEQ/rK7r+V5tLDJZk2Ug3cFqjlMVmpvS0OomPeldnGiH/heM4xqmf0nKETmc79G0m9uLHo1NHS5NcKVz3Wo3eXdT5ETMrmoYl3XbjYuLbwgTvTfl/BfJJRJA0NiBgiLckEqkBqXSzp++fV313FPaVCfDdOeUE6Sw+CdkI2duw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=Si2xnvMA; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="Si2xnvMA"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7cfdf0c8908so360703a34.0
        for <imx@lists.linux.dev>; Wed, 04 Feb 2026 21:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770269072; x=1770873872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q36RarQ5zuLWjYNX7YesQ+nnj2Oub0jdvj6mHXnRkNk=;
        b=Si2xnvMAkSmvZjZotZns3Uhp1zKvetzs3zTeRmEi6uEiTNI+iNODioqow1eBGWEKWd
         Mlw1BFrixQnqIaARqAAp0U3YOukDSneQzqXr3LcO2i/3vS1CV50UPQUUb9rluMj0r4p1
         bfKK1sPOuz9AcOH7hdDWOT7i3AbojCbIrvMl6NRtPQMBYIIUFbgOsPJrxXdIuFzTrsTy
         KxTR3+j90D8TT0Uq6Rx9hjE33ptRNYMN5v2nphFCrGIJyboOoAJGkq/5xgeVCFVK0Jqx
         aYZNgNDcl1sfPAt7hXquRtLWy92IRInsOamFTW6UicjoYmDZuW0PwYFGIWLAGIcEVXfl
         7ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770269072; x=1770873872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q36RarQ5zuLWjYNX7YesQ+nnj2Oub0jdvj6mHXnRkNk=;
        b=SvsE6zTC1SJyhUCvQAx4ZQ8rHbuleNt76xSYEvZBFKA6bE3h+5yBdP9yDxt1KOuGO9
         JiEb94hoy6e2tG5fmnY03zfUzBBlx+43nCQme1jKIoX6dSxZZ94CeVC+SwTbmgnUAPOb
         k3f8jDf1yWEUs7CIx4it2IcJCXV1BH+qfsSlOvj1iKcNsM7BOKux0LHNqpfZSotiCL1U
         bE+CCIBiETHrrNvLfuBkc+cfo+fIFLm+nwJJ+QNIjtOfiMn5I1jDAKeE8OW7xh5gWr8R
         GqhFusnqBd72v9FQngm6TJEtraYmtV+jqTPxE+um0H+nioBXSTPWgTmiOj9QFaNbOBqv
         MYGg==
X-Forwarded-Encrypted: i=1; AJvYcCUbPaUF2gybONwNm7egsE/4qbSnT0DRmBgbIAA3ut2HtyFE+UDYIz3W2tSlsmMW0b2aS1g=@lists.linux.dev
X-Gm-Message-State: AOJu0YworFzAQN4+atgm+Vzwy++bzyTyaQBDrOyAeIGMfxaevBE+b+84
	L6pbCb7YffFL0Ia5VN/FcKhXCuOuWIw8dAkv8CUyAAonO2RcygK/uxDrwbf04ah0is8=
X-Gm-Gg: AZuq6aK7ys/gDHchxH4jbSbY4QzCbGhCUaGvrA8h+jPoKq46W+h3UnjUW3PbYlPfNWo
	oWuTVFJ0UMVX48xLkvdXElAbZMNnDPqNLZGcBIG6bX7+D0KWCy0g4m1RXS6v5P15FPo3kfZ6jfz
	+zHpoiLHKE/Zs5nFs3KBGYWjA5Fyd5UPSuMLXom/PfyOQ2asni3/7wKJUdsLCfjo2ZT0esJe60s
	ytiIYquX+u3ayTqQr0hvt+ctn470dxhCrx1+S4H2blLqZ7Iy7r2wa3ICDWpdj0eZJir6ZfU5zLA
	FYJsBpkrg6N+KsDiPCfgqExVJaFqwkX0rNcFtYX/xR0KimlWg5Xxd3rUBr/huC9wwvN9iq+BLY+
	gDp42xVh4Ntr2GI9MF8zuok4PqknJudhTQcet9lOWG1fiFsFJmjr+5HgEVVVCb8VYL9kLblCXKY
	zT5ATZarRM44ERyoAWv7NW32td/juMTQ7RVIxc0Z3JZN2u3ULJMBq4whkMhGBODK0qL7eyv3pU7
	EAFNrT91xnCreYt8XrZnRm4rIYSiYw=
X-Received: by 2002:a05:6830:2649:b0:7d1:87ef:2b01 with SMTP id 46e09a7af769-7d44899c6a7mr2655061a34.10.1770269072338;
        Wed, 04 Feb 2026 21:24:32 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d45bd28d81sm98644a34.6.2026.02.04.21.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 21:24:31 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
Date: Thu,  5 Feb 2026 05:24:29 +0000
Message-Id: <20260205052429.4046903-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_rpmsg_probe() calls snd_soc_find_dai() without holding client_mutex.
However, snd_soc_find_dai() has lockdep_assert_held(&client_mutex)
indicating callers must hold this lock, as the function iterates over the
global component list.

All other callers of snd_soc_find_dai() either hold client_mutex via the
snd_soc_bind_card() path or use the snd_soc_find_dai_with_mutex() wrapper.

Use snd_soc_find_dai_with_mutex() instead to fix the missing lock
protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 53f04d1f3280..76a8e68c1b62 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -145,7 +145,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->dai.ignore_pmdown_time = 1;
 
 	data->dai.cpus->dai_name = pdev->dev.platform_data;
-	cpu_dai = snd_soc_find_dai(data->dai.cpus);
+	cpu_dai = snd_soc_find_dai_with_mutex(data->dai.cpus);
 	if (!cpu_dai) {
 		ret = -EPROBE_DEFER;
 		goto fail;
-- 
2.34.1

