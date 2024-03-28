Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEF13E6D5
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 22:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711664018; cv=none; b=LpWvaF04cx0D/DUUgpW2ENM7vvd92s5jDpCOJy3HDBU9xF8OpuizNIArR2Ym3DG9RWRHdfngYXLySlTnFETMLu2WBPmR6UV3qYYoh9fI1KK2vT4LPAgE5ojJ9x5UJZLsezdtJvpanqwgyLzfzhfO7MdLIS2funkPvaqbabC3k4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711664018; c=relaxed/simple;
	bh=2lMT6KNPvKzbBMwVwrI0RDmqQ5yOjbh0txjmVUXqLU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gv4thLdtFzd9tCbwTJblyXd/OlX2CnBrds0YOXPQA6eYm+15PfFt+PDbZUMny/R0cgPq7L4p5nTQuzd50Toid9tUK3Bg62JNRQJzmbXQImnPSz9k0D0LQXP0w+yd4fo+ehY9yRHX5gVE47zpzRKlgQ2PjIhsHs+sIvELvaq/jXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsdxDJLi; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsdxDJLi"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso16849161fa.1
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 15:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711664014; x=1712268814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZDt6XPS0X9RrCsopZrtOFphc1SwMJgyr4eQSlHmJ/w=;
        b=FsdxDJLiE72c0fxo/3dbkDYsWnQK8b9Nl2OT6z1fzIPos1eU7C1srC523nUBygLHGN
         aLL/ojR5qBIwgDZNFlNppw3qzdt3VsFysCYRj5Tu++peTmP37iXj8YimaU/PZ/D6LUgg
         3H6Xmz2PboXXV6J6bqgy/5yK/eDWeOiQcqPSqk9IsW2fPNdjXUinOaXCu5vwhnt9qITP
         Q460Ks5ByxtTuFpBGTSF9fqG02IO4IvmDYT3SDYsKbEIB9jxT1RDQDn8M+7RGH8jgl27
         ulMdqEM99wqrBroxBkWLrNe9XlnsLxHay0lR76Y33baX1g7UqyW6LlCS2axCwmgfgE7W
         30xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711664014; x=1712268814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZDt6XPS0X9RrCsopZrtOFphc1SwMJgyr4eQSlHmJ/w=;
        b=avYxB8XPKCL2M8Xn6MD0q7IKd250DB6absy56uDrbaXY1TnR7uPEh3Ftma7GhOK0N8
         Qs9ZZkB1pQoWm4smux3dgtsuY6lTtQYpe2m1KAtzn4PLWT8EOTFIsrRg3Hl+n/09JBUr
         9IyU2N9st0CaMt7Jd9KkknqLCwd8GrjNXv+QVB/jRmnDxXM079ZxxsJ37TMfLkjvUexP
         Zc2nPFdQtaJMO9C1lcQGxfMnOi2bc46v/B4dUpYqFQ6GAT623WkREfOHygbzUYtlv7dU
         g8281SLIS8lBha2q8AjLAjUG3iG96a4jEwCkTBuGaRF3EpS47a1lX2Y9u88+7zqdfYaK
         tNLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDzAj2Z7QA+vsa/gyALSpRqveFc7hQPdCj2lfjbyRlkbcSLrcRPQYHir9X2nS3Khl4Vs3Am2MpaePzKhkp5JhrQt6n
X-Gm-Message-State: AOJu0Yz0vAE9tCxtM3Vst83Ug2Z04m4xPHIBnpz0EVKa961PIHMSbVsD
	imSEudq9F+4RZnU3msZsN9GdXKQchZ9GZtMlOBFI9AiX0Hmvnfim
X-Google-Smtp-Source: AGHT+IEQXyiCKApTwZRRWL08M7GZqI7Ri9/gYPz/35OH0zL1qkQi4HnbVQl7wV1Kcip+ZffOmf4zUg==
X-Received: by 2002:a2e:9d45:0:b0:2d4:707e:623 with SMTP id y5-20020a2e9d45000000b002d4707e0623mr254372ljj.37.1711664014152;
        Thu, 28 Mar 2024 15:13:34 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.208.244])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b00414688af147sm6666778wms.20.2024.03.28.15.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 15:13:33 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	daniel.baluta@nxp.com,
	iuliana.prodan@nxp.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	laurentiu.mihalcea@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: SOF: imx: remove imx8_*_clocks API
Date: Fri, 29 Mar 2024 00:12:01 +0200
Message-Id: <20240328221201.24722-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328221201.24722-1-laurentiumihalcea111@gmail.com>
References: <20240328221201.24722-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Since the i.MX drivers no longer use the imx8_*_clocks API
this can be removed.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/imx/imx-common.c | 24 ------------------------
 sound/soc/sof/imx/imx-common.h |  9 ---------
 2 files changed, 33 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 36e3d414a18f..2981aea123d9 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -74,28 +74,4 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
 }
 EXPORT_SYMBOL(imx8_dump);
 
-int imx8_parse_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
-{
-	int ret;
-
-	ret = devm_clk_bulk_get(sdev->dev, clks->num_dsp_clks, clks->dsp_clks);
-	if (ret)
-		dev_err(sdev->dev, "Failed to request DSP clocks\n");
-
-	return ret;
-}
-EXPORT_SYMBOL(imx8_parse_clocks);
-
-int imx8_enable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
-{
-	return clk_bulk_prepare_enable(clks->num_dsp_clks, clks->dsp_clks);
-}
-EXPORT_SYMBOL(imx8_enable_clocks);
-
-void imx8_disable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
-{
-	clk_bulk_disable_unprepare(clks->num_dsp_clks, clks->dsp_clks);
-}
-EXPORT_SYMBOL(imx8_disable_clocks);
-
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/imx/imx-common.h b/sound/soc/sof/imx/imx-common.h
index ec4b3a5c7496..13d7f3ef675e 100644
--- a/sound/soc/sof/imx/imx-common.h
+++ b/sound/soc/sof/imx/imx-common.h
@@ -15,13 +15,4 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 
 void imx8_dump(struct snd_sof_dev *sdev, u32 flags);
 
-struct imx_clocks {
-	struct clk_bulk_data *dsp_clks;
-	int num_dsp_clks;
-};
-
-int imx8_parse_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
-int imx8_enable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
-void imx8_disable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
-
 #endif
-- 
2.34.1

