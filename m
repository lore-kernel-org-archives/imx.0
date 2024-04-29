Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF904D9E6
	for <imx@lists.linux.dev>; Mon, 29 Apr 2024 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714391349; cv=none; b=h4xme7ha+JyKl8dUzkZO3CrwtFKP5qGkhCbPXgFL55uK9UtqIrC2OInNCZXKBOe/BNr5LihYwQhZBf9hOqzqsCLCIJmOo/dQffLdMzV7ZBVs9Lo53GXDGqgAuSyWCSDgsTfqSTW22OwuYIlACjnE/5vjq3mbDhr6kHdZKI2p9Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714391349; c=relaxed/simple;
	bh=07XNlzH+Om30NPL+5RgZatpoAnoy8SZw09iGVLs1Juw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtCI10yMFaFa4mH0NkOpNJtdpPjBs8NZCn63tPbCR7oS6hLhks2j59brRa3AQQuTmqHedJWngn94/xlE2yMqhX0yPttuDbv1ZAvzNGlDTMNNj37qzb/Fy7U89Lh2g0PKA5eW5SO3cFoujt52KAet9Rn/83qaAPmyKaKQTGbx02U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A84uh4AF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A84uh4AF"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so4280068a12.0
        for <imx@lists.linux.dev>; Mon, 29 Apr 2024 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391346; x=1714996146; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbYwH1iwfsZOTjLTYa1sxRyjdfJ65pOFz+5ojKjybfY=;
        b=A84uh4AFI6IWnA2Sfxtgh0qQG+tUAApOtxa+ZW2IF3PexEFlUbSMQR8ejzmAPvZgXo
         8Pr+6k0uDD1n3/0+lQbSqwOzqfqfPlBxBGHVF0P+na6DuP+RQbwvmiAyKsh8EU+d6GeM
         3hng+DhQiLaj+8IQCGQypHlEwVoBLuBNrVlIA1HT0mUq3IHRnCJ0xYd+XgURazcr87Rw
         VBJnA1loy0VNB+bMsUPcwx0PbrRbQVEj2JvTTgq+r2FEki5jPJXpqlEu7TnwIVC0S7Ab
         KtydjsNB0czVMCVjoMCeGcVLDC9gZaJfknxiSIQKnsc3yeaMwHdXgZrFKQ37a8+lskVs
         bZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391346; x=1714996146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbYwH1iwfsZOTjLTYa1sxRyjdfJ65pOFz+5ojKjybfY=;
        b=O+NkuO16GkmyV/TopJzmBuHfxOLT41qQWo6DAiRt/VG4xnVNk6YpgPcnBaKASGzLpm
         7gxKHIRfPFqlKyFLJ21urlbIc5iLw3EHTWvmJxRSKYOYY8Oj3WRLKybOfFrPB3lSIuSM
         VOoVaJFr7yWtEO08gyaYJmesQ/uTz0Ojbxls2ACbnACFVTR3ACTwQKWVXpQSigenRECQ
         BHOxUUIitZDi9r4lTvSgOPKgD7Es+wpAov/DHoGSo/lOlgYcvdm2dikgJLsuxk0sZ2U2
         ZP1p+zQkKmQTKpF/4Ti74DsL1L+2CBOxDhcM/lrt09gD079UFhv6WM3a1xiEdN6YypqL
         wJzA==
X-Forwarded-Encrypted: i=1; AJvYcCVup/0R/c3f2WIRW145gWv6jXMiZSFJ854JRvh0pCKVtka8gBmXnVUtgfNStYpx3lULzwf4cPPAMLBiBEpyJNItPmY/
X-Gm-Message-State: AOJu0Yz9d6UrQJDsYPvAbV7I7jxPQve2JHeazM3eefLOz27Kv5OXv9JV
	SjvWsOVW5wzbWAQGwRUhQMydS9PqowdJJQIl5XUB6UZ+kHIek8/zrLtLxqftiDo=
X-Google-Smtp-Source: AGHT+IEcZNlFMX0KN5Zv3Mt9V9vUg/Vy8Fa9KRdDd7Hab4D4q7tKY2rb228nXG1TnPQpT2jd9cvgNw==
X-Received: by 2002:a05:6402:3487:b0:572:689f:638a with SMTP id v7-20020a056402348700b00572689f638amr4800369edc.17.1714391346466;
        Mon, 29 Apr 2024 04:49:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:47 +0200
Subject: [PATCH 2/4] ASoC: fsl: Constify static snd_pcm_hardware
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-2-c6ce60989834@linaro.org>
References: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
In-Reply-To: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=07XNlzH+Om30NPL+5RgZatpoAnoy8SZw09iGVLs1Juw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kklslopCBSQVS24U7RLVNAErQ+RmdZW+cnY
 2vP6DhzCt2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJAAKCRDBN2bmhouD
 1/OhD/9OuP5DVUEzlKoiXyRfzWiPWETGaurZlgqXePCKIhR7Aw4zgQNkrl7olw7V0PXD3AG+lxB
 kQuxk8MGNdzM5gRQ5QvitxieqGs7Q6wB65JF4E6nljMW38QLNdX8xK+9AWe99iF6Y3Ljii/Sa9d
 QmF2lRiKOifVy5b84Ro2jZFhzL2IRk6zPR+kAAkHQmlxNfAqjGJWJwRF/XQG2azeaVobrL7Z69t
 Wjv6ACChJ4RMAH1iMe6Rm9khR3AByTKQSi6OEgO9pC8lsiGxjucEMfRmQ+naf/VSjjcVdBfgaaG
 Q8eTW2nPWJFZoF4tuDX++42H/5gf4cMxpgTQ4b4rRU4czeBYwRLBULJOjAWCXps0jxBBniD35Rw
 aYXsnzH27A4T1myauv8wnF55tdbunLfRlYFeXh2/vGe09r8v1gY0ZsmXKw0A+GE7Q7UHYzTHU3c
 0iOiLeTEzwX5sjIlF7NAhYxIhvDLWQdOBOeRioCCqUk2retxoDCP7ytx55nRYTFY7Y7/PQlmLy/
 D0KFHsf7XdM7Q+FzJePSXI+QPgtGwuWIP5LkO7YQ2YwmQwUyNc00Iwo9H+JnB1acl7IU0c/nC/a
 y2Q3MIQjM8Gocdd/6jN78rhB/DEqkZppZX1UMVkC88/l0ZD2sNPIV0++IJ5qJ4rRR3c4oGObRaJ
 TcPObSVlxia1CEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static 'struct snd_pcm_hardware' is not modified by the driver and its
copy is passed to the core, so it can be made const for increased code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index b84d1dfddba2..128728b65a3a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -16,7 +16,7 @@
 #include "fsl_rpmsg.h"
 #include "imx-pcm-rpmsg.h"
 
-static struct snd_pcm_hardware imx_rpmsg_pcm_hardware = {
+static const struct snd_pcm_hardware imx_rpmsg_pcm_hardware = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |

-- 
2.43.0

