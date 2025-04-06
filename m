Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D687F9EC
	for <imx@lists.linux.dev>; Sun,  6 Apr 2025 21:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743973740; cv=none; b=qsVvF5bJVQzYvTFygpRYllozajoIoJlmk8eDiXVbBIZhr+YAw8ogtRnqzdVlGBY8nJ8/J/VYhRibveq5tlG4I4k+OLLnGS5NDZOS4A2srb48eII698zWU0C31+Ildcv1QYVS0iqs45wXKWgy+pEr7k9oUwny4ieVp7BvpvdKoTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743973740; c=relaxed/simple;
	bh=gNVT4boTweoATyBcAwIKoTgbb0/FKU67SzYhH3omknQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZKNW2vteIvdeAS4yLNbqJOxK2MZX8k0Wqhqc5AvJ5AT2m9dZ/bUN3xUkbiHH3uGnHP87WNHEr4e62iTS24WvEGeSr8D1Vg0Tt3FinXp0DOz7m+hwqlPdOFvayrckKqQfuNLO2EFA4emkfc/1R3iTHaYrR14PYnC9xkpeVUx9I4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RO6RLh10; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RO6RLh10"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d587c61a1so258260241.1
        for <imx@lists.linux.dev>; Sun, 06 Apr 2025 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743973737; x=1744578537; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=;
        b=RO6RLh10gxLeOXVvi1wn44oPp2YM/60csVQulcaAZcjULW+/iuPmxg+SNxcCixEtYm
         mAmNAFOTdXkGftYSJZuHYT69OmuQi5BkCGFeneGlNRTKPn8hMgdhWNBZLgDavYGMErLO
         3H2YQH7ZIGTP8cdjcbENrInjo/4Yhz0ejKLaAwyjiby464iEjQXUdYRm2wckNRLstf0S
         mPgD5veEHODkXmwzhqsZ/IBZ2172UAn5SlpaBQuOFnw7fyNYARnSi0u4SGseVrC6B99J
         ZiTBOp2b9D1I5/HxotwI+E/j3y1xkmYYXnNOs1Ed48JO4CN7JgKTjBZcp8FXGL6pdTYT
         Sw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743973737; x=1744578537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO0kiqoq6Pl2+MksHXiWbGo7Ymj7pCMwZir/Mc87ed8=;
        b=bOBm+VX4CDXOjt+VHZflgYA2YBbsSbBp00XOmVYszxBsv+JJOLhvYUoSBaKa+CRQ7O
         DSckM/vWdnnGdVTeZYMy1XeKNb6mWMXZpTDzV13GeAymAu0gTjkWScD4XGgfIMYN44jL
         6ntRX631bYiFrwmbPBe72fKIcnbUWgkGiasWaxgaGd8YnLbo0xHSP8MLjjaWv5Bc85oO
         u9sc4tZp/ajsYvOvR03pXejLNqnzS2l9/RDj2v8VVe2yQS5fsIQhjtWFauEBx7qswx0f
         ZLjBSO1F1P1SWlQ/oJnnfVJPBBsup1MST8aE4CGsCyMnezGfEvZ59CiBHHVCeQriBmah
         ALLw==
X-Forwarded-Encrypted: i=1; AJvYcCWnCZzXGlMfJGuhtwAS5SAHZ7Z9hMk3VrBgvHcuzW+TZHqFSe+H8hXuWjyqx6ouf7SDhTg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7ArCXolJSdPRdltLi0fKS/JzDQ1RwwXYIUMvRBeSwjD9xu+LM
	o+Ujzdcge9SuPNRGFa0YSCKHmZES6AzB7zafvMfOANuEfuBzQMs=
X-Gm-Gg: ASbGncv5LFBnIrNmS6AbERB5DMOZ2+SBI9CC3T3ZvAYNXYK/+T9WxrBgmNjly8IcU+g
	1SRgFgrsNyaj62U2bzZCUQcbs4rv404VwZ2HJSupWB19yE1NEuQ9Dldcnxgp9FRKXKlbQeYYWYE
	G+KYMpJ8wInvq9hckgY8cpXr4NonkNbs1M2YX1VQV7QS94DDPhqhwKHgR/gB9ZTgggh8HiRJa8O
	z6JvwnKyV+Ux6mPjis9wg1DGu9vQfixzXC98P4CgrIQsnLhnwxEgCx0IbdYpI1d739y0HqxpRnP
	g8YRxwIp/NQjDOyo4mTXdXU9FBx4yXnltl2BaU6erKMizf1IOUsJ
X-Google-Smtp-Source: AGHT+IGTpGiCEbxTarSt7y732oj9f2PCf4kNvnO3XFvF0pPA3Ka+/n2IuVGjqKpGPACv04v8yPFYeA==
X-Received: by 2002:a05:6122:46a0:b0:520:3f83:fdca with SMTP id 71dfb90a1353d-527642fd2d7mr2662608e0c.0.1743973737408;
        Sun, 06 Apr 2025 14:08:57 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5275afa73b5sm1615080e0c.41.2025.04.06.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 14:08:57 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
Date: Sun,  6 Apr 2025 16:08:54 -0500
Message-Id: <20250406210854.149316-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Incorrect types are used as sizeof() arguments in devm_kcalloc().
It should be sizeof(dai_link_data) for link_data instead of
sizeof(snd_soc_dai_link).

This is found by our static analysis tool.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 sound/soc/fsl/imx-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 3686d468506b..45e000f61ecc 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -544,7 +544,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link), GFP_KERNEL);
+	data->link_data = devm_kcalloc(dev, num_links, sizeof(*link_data), GFP_KERNEL);
 	if (!data->link_data)
 		return -ENOMEM;
 
-- 
2.34.1

