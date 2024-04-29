Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DA252F63
	for <imx@lists.linux.dev>; Mon, 29 Apr 2024 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714391351; cv=none; b=UJ3QEEclXe/7utxbqlVegrstgZTu1annnBULP2JZJr6kKf+hza22wom4sq4Jezl7/KC5bh1tdIELCeNN4rjhVCZjMi7fG4cIcdt2UM38AXJCOD88AtTobp4wGlu+o++EvXQf3YQss1ahC9xza7gKMOAftFWC1I8a6JphO0GiDnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714391351; c=relaxed/simple;
	bh=L+z19Mflj6dbjsuY/oyg7M2Nl7bx7birqfaMqqiWFh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sf5t/kIx9JL19bL3bjJ+NmmWXFyKc4nHnGeNwGUJ6thUl4ZAD7cIauDuSCzHXt83+ghR1/E6Fmi+HDv6Qi5NSRnKRv54gPiE+/IeCZUWLunjiyvmqdsPzLY2dZRs4iqaHoeNUuEZyf8t9PFqPqt6nmap7ppYBYv8pD7rJAoW9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aXXb+zx4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aXXb+zx4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so6696975a12.2
        for <imx@lists.linux.dev>; Mon, 29 Apr 2024 04:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391349; x=1714996149; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2TryCs7KoAc+knf+2Iegg4aToZXu71FrGOJZxalZRo=;
        b=aXXb+zx4b4YXOFyREej1cCUp/eQOj/yOX58SdF/ql9uBi7kZYqtNenMrCO35C7cl2G
         8JyDe5eOAcgvJi8SuW92rjqdlRc1Q70cXieY1V+yGYCK8OTPLIh5SYwF8vNM4OLgGv6y
         KPXq0Ir6ljDEo8hVY9mhREcwvTDb9vH6EHLqSzBDCNgD/dL37TbXtlHI+cacp6QSpRek
         uBUpxs5WQAhMwwkKlmdqEswsrGwh5iiximtUHOsx7MlUoTX4ZsjepnZQR35c263Qg4N6
         FeLvlvUf1CvUu3ZUVRUp5sKm6ETGSUSi5OuoyyGq755XVR/dNqdyJd2pNMV2HZubhYyN
         a2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391349; x=1714996149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2TryCs7KoAc+knf+2Iegg4aToZXu71FrGOJZxalZRo=;
        b=CDFN8uJSyA0VmrMmR1bUSCFthcs4Ps/TyGAljtdKun03S/Houn8Q0KzHQAwigKQVx+
         s3tNFNRNDRrtmvdMTxSiyDV8un5uucQG2ug2/778xho718WKzYHSAjEpjsOCvhHmRZ7Z
         1VCtexH7PRk3SHYrtNKwrMkDZPdyPaW4um93eS91eVO9bbkTmTB2mmnGE3kPzOHuw/a6
         FLa/Azt9mRgNCnr7s7SYJviT/snUluZxU3vPZzE4KBm65ztZT4tPqSWJZBdnuRbhV6AN
         djtRG4PcbRuyWaI89DcHbzvg1fnVg9rKqPGD5Cb+9B0OoDmgQTxxaVYJqtyysMpnUB05
         JHdw==
X-Forwarded-Encrypted: i=1; AJvYcCXPrTPmrV+MFuX2Hy4NRU2LzDCXIIUxZMihzhv2/Bu1j6iqwSVe+ModvSPTIVxF4GITji/C6PMFNLnAul0Zu8fERX4R
X-Gm-Message-State: AOJu0YwmxVto44Gw1F8m33PBKv4Foxdf4EuDHCBhY312GP3EF/hz7jga
	++nkM7n9ECZAYhxuBFXd3ktbW+GwIRnCHZghE+vzruQO6aUKvb+uNYSG9NdEhnw=
X-Google-Smtp-Source: AGHT+IE7Wa1uhxiwDIcwEN93hp17bsG0rm9iXFrpgirDNmmGz9BzEYEL+4mFW282MhhBjXekfPbkUA==
X-Received: by 2002:a50:c34d:0:b0:572:4e6b:958 with SMTP id q13-20020a50c34d000000b005724e6b0958mr8878245edb.2.1714391338535;
        Mon, 29 Apr 2024 04:48:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:48:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:46 +0200
Subject: [PATCH 1/4] ASoC: qcom: Constify static snd_pcm_hardware
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-1-c6ce60989834@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L+z19Mflj6dbjsuY/oyg7M2Nl7bx7birqfaMqqiWFh4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kjQtqus+caDsWogKmeSbNLXw+geB1/pDh6h
 zr4LbfsFbuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JIwAKCRDBN2bmhouD
 14b0D/0V8sY+FV/qujbJc2MZicjp6syHrzotc7cYVvSeV+dkb439YYh+NaGaaqpeJUxjyJb2iwN
 g80bspO9f4x8zDrj33iaDX6i3PTrzUfqIdX9sdjRVTV3Fr4uwKC3aCbsFa2Vxiv17HN44sBJGNk
 xcWehLqO4B7ywwZItmOd80D5xro3XPgXNLdKOH0MdqlZklYl6hO+1xNLiPfWpip/W612624D8iQ
 9cP+3JFtg/WOs8bs1pw19ck/erjsxcK5agwdvb8/PBDqzGw+thqtLTiyhfNYkK84HIQRMnr/HAB
 zZ2imnBm+Sq/JYviHRnhDisoAwtJIMJjkKz5LVikIN/ZncgetLX/XtHcabi9PUe8u1UVTlQI35t
 p8N0ddiiugWxBSwUqeB0l/oUYVGD25BM7rw6FvLyxGRRbq6wNHIF2FM5L+CvTbf4Cjj7en2yqIe
 YAmbAszVP1IJinxReJfTLotoI8eOEInUmx5Oi6/RtoiA8PrGDx91vg9sv8+GHiPKwyUq86gzY56
 lnNPaYQ7rkZ3xUUxNfiaxz3bU/Xfdd5mCFC9bVihIo/K+xYvtE7VpBIULyS/kS+qAUaKjOPuTWS
 nSbxB6Ep7ZaUfi/J8Le0Job8rTy/m6gU/Q+TRR6KLg0Fp6FzUP4wqvblu8wCjozXsnk7ZvM43r7
 Qo+Ozchtl/HeR4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static 'struct snd_pcm_hardware' is not modified by the driver and its
copy is passed to the core, so it can be made const for increased code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 00bbd291be5c..3c78440a2f0f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -85,7 +85,7 @@ struct q6apm_dai_data {
 	long long sid;
 };
 
-static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
+static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
@@ -104,7 +104,7 @@ static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.fifo_size =            0,
 };
 
-static struct snd_pcm_hardware q6apm_dai_hardware_playback = {
+static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index aeb6a9d479ab..3913706ccdc5 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -103,7 +103,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 	.fifo_size =            0,
 };
 
-static struct snd_pcm_hardware q6asm_dai_hardware_playback = {
+static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |

-- 
2.43.0

