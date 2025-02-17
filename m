Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBFA15382E
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 07:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777573; cv=none; b=RAwAzJLwmcrIfg1XC5UU26IwizW6N4ofKSXaUaotsL8boDXotn+tFdabJ4IUcnPxRCbBW5t2CxumfjnwcWv4AWnLrwId25Cm+hiJt7ZVh+coCAsuc86npFd5boCXql51GMSg3F8XRgAEsqtWeY/759buD3s4pu/NYRr+V9Gcs0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777573; c=relaxed/simple;
	bh=r6aBwQGIKHihW7+Ag844yt6fSqk0SJomx7ZY5GraGU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJIsyqkNrYpQ8+CxSnCg+4UUGjylP7CBEuUYsrIbLtAb5MF5UJJit0yZOfyqkyPEBIIL63y+dhKRQOr9qBs6EkNymo6oD8MDCOhyYhZ2j18G0mbn38FsM0awtNkSQN/tPwFj/FmPHPaNGOlozblb2EoM0gxf6Dude0QlpQcuKGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/O6A9D7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/O6A9D7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abb7f539c35so301421666b.1
        for <imx@lists.linux.dev>; Sun, 16 Feb 2025 23:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777569; x=1740382369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wMllDSNz6y9GDkrgwRaQVDA/pIhA4eMkvxsotewnFzc=;
        b=j/O6A9D73WHzNJweBZ8RffKgtX6bo4ZP87r5Gr5J2ROEMVMfEm0a9wLPiVXPhNozsZ
         fXJreaNpzpXD8UeG56Uv+35gHr8TAx1Z22lPFwcK66KNrlxceWiWZ0me3YQX+H2dCSgY
         dI5cf6suPqJakw4wD7E880ms8lnqbEFPbSrYv4XQN02cWgKPgPzQxgn77BRR+re/xoCs
         j+2pMTEIcdCVEw9Q9EjnCdhKYVw4iYIuaz47qtrGcYAs8h06CPxMdPdGB8TzyMShHpth
         RFKOXziKuMO3z1pjr/w3lPsmULrsNBObAIb7fEFnSdt0YsvpFsDngnGUyJ50frn38wgv
         m4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777569; x=1740382369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMllDSNz6y9GDkrgwRaQVDA/pIhA4eMkvxsotewnFzc=;
        b=Xc2ZFmoBNmGR7ewtoJtLqkQAI+qxgL7zRAIushZPrmRUjE691vrJ018aeoMM8YMtHN
         r5FkrVoH+DjVcqkwx74a/9YXk3P4biaJs3ESWdO/N9fmWnx4OzzRT/35IpVEhy03JsyX
         H32tB8HkeYKXFgJFEsQGOMTlN9o1yoz1hvt39f55gMAZJvYct9uqeFbjtlKF2dps7tqK
         3xqxT4j5kb5+J6t6pl+Yp/wcjAVuXtScpQqQYKzxlimnKzMFotoKCbvM8NX8/vizG/ml
         TP5e5VAqQaJ4oGqT8AENH0aSJesYEk7H0nf25T0wQ9ygBZf7anf+lNhU2GNWFGqvMyS9
         NSfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkgcDyCnlMtrYbBSrpID0BuVkbtXKodZhr4seNjARnHWogKOSh1W7gXcWd+I6kCNVU79o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRWE1+6sGHUj7lMI6ujyjdJUBnw8Drvt5liE9hG8Ls7GR16xve
	tptK+ebT7ySo9aX1leIL+1LzTYtLiAgfZYxgx5XpZt4VbM74GWrgeCBxrFTgqqk=
X-Gm-Gg: ASbGncvAxJLVLAUMlDK3LE1AUUyMb2EMJvikLS+CcYQP6xLKmcqAwN+2VGo5Z/R4ADk
	lUymJcVCx0tlgpXhFc2+ppT3wyl00LoEWVRR4ejvb9ft4WBfQPr8p4vSdLfYN/wv37tV6Ry40PT
	fKC1F9/HW/gyw5Mp7VpBPu6ak4N4ncvoQhj7riQIVRSY+QEyVMtT7BGhxh3Ax+JfASf3TjZjGRk
	XIuwq7lLImNH0tL2p+LW1Q9RszeNC4L6NSh/1fcjCoZcy5uqp/Ow7HXvH23RJpewMam2lV3ZJ6B
	zo6QyyLtIhXGw2AQ/0Ps
X-Google-Smtp-Source: AGHT+IHJ6d8K2hnOLwZegjEVoeae7Dajjoxiun/dSlgu+G3MOV8fyQIllsHLSF3ttg4CQNHc/VyvvA==
X-Received: by 2002:a17:906:2454:b0:abb:9c8a:fbcd with SMTP id a640c23a62f3a-abb9c8afde3mr235343866b.53.1739777569229;
        Sun, 16 Feb 2025 23:32:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbac867bbfsm7724566b.137.2025.02.16.23.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:32:48 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:44 +0300
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
Subject: [PATCH 1/2] ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in
 imx_parse_ioremap_memory()
Message-ID: <68973636-eab8-4d82-8359-ae2c8f60f261@stanley.mountain>
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

The devm_ioremap() function doesn't return error pointers, it returns
NULL on error.  Update the checking to match.

Fixes: 651e0ed391b1 ("ASoC: SOF: imx: introduce more common structures and functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sof/imx/imx-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 82057af1436c..5a385d140bc7 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -338,9 +338,9 @@ static int imx_parse_ioremap_memory(struct snd_sof_dev *sdev)
 		}
 
 		sdev->bar[blk_type] = devm_ioremap(sdev->dev, base, size);
-		if (IS_ERR(sdev->bar[blk_type]))
+		if (!sdev->bar[blk_type])
 			return dev_err_probe(sdev->dev,
-					     PTR_ERR(sdev->bar[blk_type]),
+					     -ENOMEM,
 					     "failed to ioremap %s region\n",
 					     chip_info->memory[i].name);
 	}
-- 
2.47.2

