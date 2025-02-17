Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8953F154BFE
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 07:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777560; cv=none; b=a/2W+gHVHzznLYMS/6CqcP2auYNaQADsgrP0LOkiaek5okWsfXZ62PrHnhGiSVxwCuIRcsJ9vMRTkBcyfxVjs0BDVNmebpN3SDl0sNKPcrdcULSScu8ofZbi5yA1PtEV75xIHJ9EtCGAYf1+miQdmSsS5eI/uX/HNUPSJUH1Mgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777560; c=relaxed/simple;
	bh=iOSp9K3fulh0VbLRdj1Bcq7Vd9vXiDQNcOEL0h9MGOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNn5DRj0Mq176i6Nh+KsFYRpdcvLbRQLcC5Nm7MLOAV8wkdgDdT6qzLyD291pn+LlU4Lv8z3lh2UU5Ms6JuvQK0i0fNVrhFdgeImxxN40rKp4ksYBVhSbtA+vdnmSWMEPtaTZHlZ4ndgOgb/Wz5edYDfU3jbW92ZcNenkZpXIsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3w7HctE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3w7HctE"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so7330124a12.1
        for <imx@lists.linux.dev>; Sun, 16 Feb 2025 23:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777557; x=1740382357; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iuq9jtDgHZUGKQlgExINfZtY7T0OwXIUJbx8KDqcL2g=;
        b=R3w7HctEbXhKRD0Xq/yCFeSjoPx6o9dTW3j1IebcMXIg3QZaR2jCgCggz8BbWtxBKN
         8rDcgDC0rPk097QANz5Mn5X230oD1jJVqO55IbAo+zcWxYq7D4447ImPHLHSrKT/xV7m
         eMgj0TaQ/AjXiQ4RWdnbWiKPh3NiBzCwaAXIx/hQfzMZhl1FSyD77JMHBDzKKA9yJoIe
         yc1Er9QiFqCKB4pNo+BsE5+Focg9z1DDuNPkPREHENbxOCWffUZrjJLUzpZU44vOFUf9
         tTCGQTGsP0h0KPxuaCS0tvR4FcOImDSM4OYAwjwbTWMhe5r/JOoD0q/g0icZlRC6TG/8
         VhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777557; x=1740382357;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iuq9jtDgHZUGKQlgExINfZtY7T0OwXIUJbx8KDqcL2g=;
        b=XtamfyxkPlxX45LUVf456u/I57jwbSpHc4xbhQL4kIVrfnBSiCgHAi9tyrDmLy3GFp
         8WgRjsP0KXT4Xw0hT3RKcN+WH8pVsygtFwJX/+LznsBwOUkA7UZjkw4/Ud/CVCYB9gD7
         UeS6hNIwWy7s9yWvjRRoltIUbX8hn3PxUL+xrpCAWHFFeUtpj/b0SkWWlIMu8+DVthJ/
         +ehK6U/58MRj7QiPey/1Zh2nu4dt07sfaCzzvzeKkngbQJOWXYOTgRazdbMw85ejJBHW
         +neEDUdAnd1bo686Xr7q/wwatb8EY1w2ZNPu12LjqdtR3td2Ur5LwMxyfpW42f4j/nVH
         4YbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk4HtJ9wRtjvHJLTQGiOXDkywL1n4j331SRxvaMgNAe+tvB83onJvHPzJRLcJ7Cfu1kC0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyApgJx0UX+oR/1j6yASLRmuG4flRgJhCPdwWSRX2nZBIjFS3ql
	BkdWAdVnZPHY7WpcAYE7N+bT0RFrHpWMO32N5VSB9umZ57cNL9OR0LrNBU6oUVc=
X-Gm-Gg: ASbGncvkoLrv3EUXz2wXjuVPK7l0qVorx+vJsdGYy8akXjTLf7ZTODxltfNGI+zzOek
	JEQ3zEw9rkengRtLW0eTp8SyZFavZMmWqObJK9ennp5Koa/Q6/3op6rrdfhwrAGVAAUc19jGjZb
	JNj7yGNwS7+PKSPA2lUWjhkOOH55mHxZhzx+JkyDrhv+FkgtpeJO+p1ojCX6vUIX0AIJO+VMIKC
	zVHVl92T8xl5zgEnkPPz3gtFN9mzHjOExfH1ORFhBkc1inkZFevOJuyhcABbuVnAEW9+LG81Voj
	T8ZgsR8Jwbw7NZssxAea
X-Google-Smtp-Source: AGHT+IEcdCzKmfW6zdCdnOroccwgNmmDLOlJUJcE91OJUWqcSxVf6IhB+cxML7fRc8rv7wfAKU/7HA==
X-Received: by 2002:a17:907:1b23:b0:aab:c35e:509b with SMTP id a640c23a62f3a-abb70e435abmr973427866b.55.1739777556866;
        Sun, 16 Feb 2025 23:32:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb916db37bsm238238266b.165.2025.02.16.23.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:32:36 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	sound-open-firmware@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/2] ASoC: SOF: imx: fix a couple Smatch bugs
Message-ID: <fffa1613-72e8-4cd0-a4db-b6b13a5222e9@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix a couple of bugs which were detected using Smatch.
(https://github.com/error27/smatch)

Dan Carpenter (2):
  ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in
    imx_parse_ioremap_memory()
  ASoC: SOF: imx: Fix error code in probe()

 sound/soc/sof/imx/imx-common.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.47.2

