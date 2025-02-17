Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4C194C8B
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 07:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777584; cv=none; b=iQIIVGA6byUcSk7othXzd8bxbrfXyKrTd3d0aY52fYPSckGUBt5a+xr4dLWsjC1aN/Tj6AU7V0TmeNw30Dztuz/Ds/BapmipHH3Qel00/ku02Ugji0erTQNTzZIRZK1ES4AKDLIqIvl7+PloqGj1pOVZYARglbRFl3IQaFLpRMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777584; c=relaxed/simple;
	bh=FfWHZuQZXypGn0iKgdsEA81WCv53fdyk91H2fpR73eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxw/cc+lNesgZzn55wre51+CP5HCohQKcMNkUsdR+FR2tseOveOQexrMS7xBUSBE9A5txuUxKJ4WpdlBjc0foSulpCkTskYj3/Lv7MfA/PrczD2jn8N3187e71WBEGsW+ATp44v6zdgk9GZn0h/1yidc1mdGCF58e0LHoAlpePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXQQ7YGD; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXQQ7YGD"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so2036430a12.1
        for <imx@lists.linux.dev>; Sun, 16 Feb 2025 23:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777581; x=1740382381; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rEayik6VOEEEPJcIMY5xwgGCKxgBYCRm7JNtr3cWVws=;
        b=IXQQ7YGDrwdF6AQpGz6PclB/SX/1jefnYSfhY3NYG+4HZ5xBrI7WtdhpyKfRqyaqo7
         iOim452kqY0+t26ePxFVj0fJtNr2MRZHHFTWcQ6AcVrMbapTPopSDpbKk5r+D68rxe3I
         i0itwLtU/ZnNiLETkQf9IMgpE20gu4mr4fMRx+Y+7AQmwcLefJBSC9S6B2afs83ELnNr
         uTNrD/g94mfCxHLI6+cqn7WTodREOP6HpKT30NV47TtASWlhep4c8okUaAJSaE9WUaaO
         uUUWz2vb09SOl75sVo8fTF+wRQjrYiAiIBDHCeoKRSmqcqZjMa15GU77JwTOzqlzUfLQ
         Evlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777581; x=1740382381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEayik6VOEEEPJcIMY5xwgGCKxgBYCRm7JNtr3cWVws=;
        b=H3FiblxwsE8LxBds7ybdZdC4IKVn+T8Pp7lykK4IqKje3cLUmLkFH0XWYzoI9HbWz/
         xuq2FbyhRicMEM8uczIF8E+EqiAKfTfPm2zktdcQ8heyfrECNB0ll/HJiM4Ok5tioaof
         q0jX4SnZJUQjEQ+Y+MKrFoiutUjIrBEKYCciryFgukyWio65OOgiIcdzUq7MoZBI1lG4
         Kl7zm09TaCJjXlovYlAu1nLTnkcoyDGQG3c0S1hPxdZ4gJlZmmigEYKYLASkpUxr+8l0
         y7dBaThnS8wxQUA0do/FMVAVoZN+BLPcA+exv/eCDiyfgjwXFQz93MBsbALtjWObj838
         y5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNoZv4cbOI2JrZIj7NV+8k/qvsvJufO7QQILY3IlezQlf7cHtJtY0nBI090mFezWMO10Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdWTJLtpMuN4rGCBqPpeCea+Jz3fwQJRvLXz/mAcmZf1MrOGvu
	vPv87/bVPE/NmsccJI1gxKXW3mzwyzZDzSeEiqQocCEmNfAZwDh3kNVm/Ef3zz0=
X-Gm-Gg: ASbGnctXi7c2kq7j01txOS2bGg0scLifN5vOU61ExzL+AG4FY+p9W1PPT9wzbvmu2Ep
	vPhPlNeEhw+0XKrxGZtIfKuIU5FXxtVaLEQC5g6nDThqyeeXIFm7AMmrKFAbzwBfreL6Zl5RCJD
	3e8HTamYKRVHGc4v/jwnXvcKj/HRfD/d687P9Dlsl3tw7Vslfp/YvRHgVUuY37xaGMtl2oMz5BD
	VZNhBY9kYw1pvdsK+xjTdEU6eae4Ykxzm094qDZo1cruQ8UyvOQN8Xogg3k4Vk8C/cR3oaqPAE0
	fSRXiEK+mrdBK6/wWLll
X-Google-Smtp-Source: AGHT+IH5auVQWVVUALzd7Oc0j1nTT3hXLvhxHDF3eAMDVv+bnSi3aCKfLrXYNuutS90Ras7QTpnZRg==
X-Received: by 2002:a05:6402:2384:b0:5e0:36c0:7b00 with SMTP id 4fb4d7f45d1cf-5e036c07d5fmr7098145a12.31.1739777581089;
        Sun, 16 Feb 2025 23:33:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece2867a1sm6812015a12.66.2025.02.16.23.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:33:00 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: SOF: imx: Fix error code in probe()
Message-ID: <b30ffe7f-21fd-45f9-9528-d6d689e04003@stanley.mountain>
References: <cover.1739435600.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1739435600.git.dan.carpenter@linaro.org>

This accidentally returns "common->clk_num" instead of "ret".

Fixes: 651e0ed391b1 ("ASoC: SOF: imx: introduce more common structures and functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sof/imx/imx-common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 5a385d140bc7..b8df8bbacad5 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -424,8 +424,7 @@ static int imx_probe(struct snd_sof_dev *sdev)
 
 	ret = devm_clk_bulk_get_all(sdev->dev, &common->clks);
 	if (ret < 0)
-		return dev_err_probe(sdev->dev, common->clk_num,
-				     "failed to fetch clocks\n");
+		return dev_err_probe(sdev->dev, ret, "failed to fetch clocks\n");
 	common->clk_num = ret;
 
 	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
-- 
2.47.2

