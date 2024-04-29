Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED3952F9A
	for <imx@lists.linux.dev>; Mon, 29 Apr 2024 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714391353; cv=none; b=XYjTrh7Zb9Lj4RNZmzAdHUxsjoIdFVmGTmqcM2mcol7jMASKpOD2W37DSYW+RByABtqDTY5GMncLYfUZLITXS6E3EtEyjTsZ3qXP9Yfg+MXjww/mgCs4b3PxM5a2kKfeZotQxqOtGAIYwyXKoOCMebdkF5AY6QCJdpK6JHF/I+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714391353; c=relaxed/simple;
	bh=gich1JRWEld7frP5eaWjzjWGBaaM+RGhkK+WPH3Hgf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cg03P/FPv5W/30UWAkmJalkfxQazST3fZCUT8391CS7eiv+UsnuHJdxdj6dH7GPyjQ4l+aNHRe3jrpLqOlhzDQOJIdics0hymRly2e3oK1cxhkI/dY3xG1CHAzfdEasQ2J/BVmWqNKteCDYtgMx9YSApi6/OenR5BVCcyE6A6nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m4sEfBQV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m4sEfBQV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso5487723a12.3
        for <imx@lists.linux.dev>; Mon, 29 Apr 2024 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391350; x=1714996150; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=m4sEfBQVVU8ZJK5gBv9pKg4gRH8E+RiGSTg0xN4HLgw0TKzMcs+S61BzcgQnAclso7
         DvJ0OxaRoJqUYL+zrVztavycnRRU5pbeVTqqriJicXmlnF9Qy4OH+03E2Ufi3FiwIhT5
         +pVprecLxEN5iHoUyP9GaDnQWyMmkdnq/rvcVrvC5220QpywQAjxLHZw/G7EogInQQPa
         wW5N1cj4FExu5J1OmZVXSDi0YDaIv0a4nQALsfV/QyUR+uw5BPt++bEXMbtFfRNXc71P
         vji0PZTRE2l9uJ8UpHYlUIKWd3NZuxl/mExCs/B1UeOuC32ywpJLFtso+qHm+DLTlVtB
         lb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391350; x=1714996150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=YDkW5i29kbazxkOThRI+gMJMMckiT6ZBfI9ym23a1wURCmHdS1UO1LOCjx2CftLIu6
         AiSIdfFi/RHxdTZT59tZD81os5wokWyVAezv6h7+xNFRx2QAXnyqHIGqua9lZDzuPo4V
         gSh8m/3RFKLsfCj+8i+Rk6hEOP5kIkjOJoI/LvTQ5DwA371Gjjg5VZnHUWBoBd7QCAIM
         U8589/wXpQsurzz4p3hSGA8xQTfNKYT5QdmglNFfuaqc39kalGpA/5oPFjA4XOm7DQrf
         jzt5iacPXkRyMOKupcKsyPean+72rnePWd9Fmth7WO4q22fqwYY5wubrPSdrL6KQI0vY
         pGFA==
X-Forwarded-Encrypted: i=1; AJvYcCVia1Oq2ckleOP/jOmm/18NgQnHt1ql6Oz0MVxV/Rkuz8JbIp1EbeYQUad9AgsX1TZsSIS2XOG1mkiXjfWBIFSt3nL3
X-Gm-Message-State: AOJu0YwzDBKW2jqI4BZk11Q8lfDtz67QXq53Sco8d1lU3kwneqA7TZ1u
	DMdAFeqnxj1nxNkhEulkpuY9VTLZBiyxbuFtmYudRfioJ+P82JC0LpGtPEVShUk=
X-Google-Smtp-Source: AGHT+IG+PpPYt5gJrRGC1b559rFwqcY02Y7afPcoTHrR3gteiPesqjrrRq6V/qr9zfo7soqjuK3G8Q==
X-Received: by 2002:a50:8ac7:0:b0:56e:2452:f867 with SMTP id k7-20020a508ac7000000b0056e2452f867mr4484403edk.37.1714391349889;
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:49 +0200
Subject: [PATCH 4/4] ASoC: uniphier: Constify static snd_pcm_hardware
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-4-c6ce60989834@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=778;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gich1JRWEld7frP5eaWjzjWGBaaM+RGhkK+WPH3Hgf4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4km9txiF1WGA7UWw3CfsFA6VB2MZtNJU+MOU
 FKjqCQu/4qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJgAKCRDBN2bmhouD
 16ccD/9l4cVT56DbQ4s528ydZBWtzc/oqXGu1ZQbNITz14ONADT4bPlxkanL2O0tMltrVTrFj8N
 yCn7wufeyWdt6hobAeT2jnVzkG4kPP2xuFUJiw0pKpgPViDQYQQvypq31/wxF5wzMSJkrW/UClZ
 bBWRtRqsGDuBrUvJ+KQT4y0YzBjxTyieyo0MR2V6ctFh3XKFCW31u2lJSH7xSxiRcyZCeFVyLlC
 I3C0yBX1ofQrBohBO/sGp1xIkY542Vyyb0oYn2HCEiuCgP+2aJz9Uzd5nzG2D8ifsfCZDe1W2fJ
 BBo+ylftctAuKNbBXptE6DiZ/sueGCmNlIOLx1y4jtFbODWgFIG3M8WIB4tB3LimjuI00JTUfdJ
 EXptaN0tyS1nlKORVjO5N2bDN4aaRB+nVEKlcVvOlSMWicMUHepZnzKDP34A+zXPSaKHDyLHiE6
 IaPAkr6rUUVwEK/bI6iC/VKCp4A9TaeQKOmbab41FPXLFr7kS8Vy1KNyrpgxyPSRSQsSD4KjYPp
 4RUTHpCPh8X6nbbbHv2nUUnpwFIGATLbI2x8gsubcs13KPkg57nn3JNnaNhEcr88Vl/3vU652O5
 7AbhSRpcdk7w/Zb9QhAm45Osql//C85WJu45trFQ7Ntpn15eubGiD1sld2555lrF+y4UGAHWksS
 xblzapxOFjAtX0g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static 'struct snd_pcm_hardware' is not modified by the driver and its
copy is passed to the core, so it can be made const for increased code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/uniphier/aio-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index fe272befd967..265d61723e99 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -14,7 +14,7 @@
 
 #include "aio.h"
 
-static struct snd_pcm_hardware uniphier_aiodma_hw = {
+static const struct snd_pcm_hardware uniphier_aiodma_hw = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_INTERLEAVED,

-- 
2.43.0

