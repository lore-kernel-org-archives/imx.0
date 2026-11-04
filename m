Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786948;
	b=GPeSOUvhyZ6BdJ5hWZg7RM9RprDHTuoNoTWi7P9Zu8jpjdXMiQn9rAJ6EBxFnXjXe+Bt
	 2c3yiP2lZyOfaklQpJL6IJTY1VbDo8ObjUQoPe8dM7HGMPzX2jmumCgZvMv9y/xKfH3i3
	 ApWo1GGLRpGzcOFRO5bOkM2DhOa241/c7Y0XlIYKOM/iwLxnxJ7FeDyiOPD/MfPm79gZg
	 laha/CNgwiVM6Py3NcCOmCHnjJ8XNPldoz1caf10ZjLq+B1po95sFj7kH99Z4OYNSt7Ym
	 OYCaZvCt8ppgZH/xro99Pq8kpWI7zg4sqk/sSAply9M3FCTAXgBT/SrpN5nT0nVEYIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=9m08hNGJrQqFFcpwSUCA13zd6OgCwpmeyEz6J70Gtdw=;
	b=lWmVtuCrPzbFTtMHZDEhwpq+SEhp7BZgfvVSLuek3AW9KoDlXCRNnPwnSB2PJ65JGuCS
	 8H76nvKNjqC/QH/O7Vu+cnRqg6ko7HmqkAHb54HzOn3Bpfsb4Gn5hV/ps3SybKtIfUbKg
	 RTzFRu2CjaDY9ED1DQKziaNFHqoyVpEB5dM2HqWuzTbg00+yKAQMdi9FdBDW00b3yoPo2
	 Lp5sFqp84M6AX0FZ7YpXLbaPWTy2+pG29bSDHBibMpoCrOxttvZUWPwJMqbAQt5r3qHw2
	 tqVXee9h+1SavD8hvaCbsvmQYXKSvpItFixWMuPOO6WbokSKtpJzO0CzhicGTYNOj0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nseor1rx;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68774606A326
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 10:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68774606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nseor1rx
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so3947205e9.0
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 02:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793786946; x=1794391746; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9m08hNGJrQqFFcpwSUCA13zd6OgCwpmeyEz6J70Gtdw=;
        b=nseor1rxfNhXlYAIs79nxDtHHj5EQmxSpqwPXW8mI9xhPhjZvU7wtmq8ucckVfggBu
         i4cumzq3sjYZ6AQwXVrjUvUCVT2IqbIy+bwDJa8lHueSKMpnCLbGGBib682Df1ibSSoD
         9t//aJ0JgKGa3SCjM0XI/pCGMdAtGVutgxrVPVguozt8+UsLYF8a5rJ9sxGJ3JKs4CkI
         NJfh9GqEkGExW/AwQvWy8uRBvyDCZn6SPDw7o7tnU7FnnCaYVI2UriQG4qum37nUChqt
         3dyYaBZ0rMvFIIe4ra9YK9IUJqF2MSHz8o3P484Z/p8yngYRrtcLQcWWdkVOlsXSdV4S
         Yw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786946; x=1794391746;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m08hNGJrQqFFcpwSUCA13zd6OgCwpmeyEz6J70Gtdw=;
        b=12QHk6lYksJWAqv5f+ZM2AOREqR2oP9LKfXtUZxvIFaut7QkRkdvq1pfDfysV2zDd5
         8zTSlnInUyf4MYX1AHAHAtcF75g3YvBiHCI69TVrNljhu5uS3oXD3Z6UjgAtNu3r40RL
         ISsSWzy62rSfhwuivyWJY4Qqavtv4rgbTVXgZpVL1jkpJI2LQ3+lwrQ8npTSgSga55k6
         P7kYTJhrfVLSAbA/nJrl09XO9vvsi3WfpiCcuDrl0cDGZlTGgiLl29AaaQ/c7teTFufF
         fVqHiPTcsdV9x9kvozJ2RPeKSp7MmWk3xK+w48RdD68HrSDtU6SdXJ7ycz6cZS+94N4j
         UhRg==
X-Forwarded-Encrypted: i=1; AKwUvBzdlbaGbV72PIi4WcJWO0tDuoRkONxZi7YC8fCOW+kgkU72sOARcf17fEnwkzJ5H/Q9Qh0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZowMRQV8kLRNgzy32QwcDr36MqJb4fuYeoivvaLppnbKOjtWN
	l9hpoXJXVh25hFamVk0/q7+1+V7ndTjBe0XGgthb75KbigT5d390dzZMoZVM7ZCO3xw=
X-Gm-Gg: AYBFou1HWfl6JQ1dFi7iNovQh58f+1VWze4SCr44N1Tw5rFGrPj6DJuk+WhanFuOvki
	zKcxYKYPsstA097NLr52M1OGkwIL4KTrRUiYSH1NPfkA1/Oy4YQP9ZJn+1wJOHTecOZSRbil50A
	l+3eOb9n844P327P2DaRSM5egBz333QU28J4h0jBDcXCP1T/c2gCt9vHV4xNn71zSpIIVDJu5LG
	FCCvHrHCQ1dUR7BJP2AvzoSNbMR88K6fg6oHxehc/dP9/H4+Q/6dy0NzpCyO/ROvw8wbdN/KZUh
	u3+U1jDOSvCIqlPGwDZnJQfm42xIRGBqwn+taZgdCBO+yzHe1k5102JrYUY0YoKrfwpXKUW+ev4
	7LDll6ust+6+/NAuHSmQ5XIz6rc3uY7pssyaycDMD8WmlJCETkenXU50ieq2sZAUG4HOu/S74J8
	q8y5j20lKCpRDaxopE0uzMbS8p1dt9eRoIMCKOBgbR26ddlVUJGOs0/cJZ8LUX6Hev4hnNkLyZ1
	685awb+UXicszIN2zQ8QvbMMpWh1yRHf3qnrL07RvttODSuJkuy+yz/+u0o+P3yDPP4zENC2kHt
	xtC9EBN2qCwLRonHhu6xxBEZyYw=
X-Received: by 2002:a05:600c:c48e:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ac16bc4829mr363600885e9.10.1793786945653;
        Wed, 04 Nov 2026 02:09:05 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4134ff2a3sm39589745e9.2.2026.11.04.02.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:09:05 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: fsl: imx-sgtl5000: drop codec device reference
 after probe
From: Valerio Setti <vsetti@baylibre.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104022815.1484320-1-vulab@iscas.ac.cn>
References: <20261104022815.1484320-1-vulab@iscas.ac.cn>
Date: Wed, 04 Nov 2026 11:08:52 +0100
Message-Id: <179378693284.334584.13927162303295738761.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=wL/4+5mCyg+xHnS2SrTRtqVLLJgE36IXiOGlWrvNvw8=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmvWWy2cK3/fMdg3YIfc7e99+hZeW+t+as5t+fmfrjrt
 Ufc7vq2Ix2lLAxiXAyyYoosLNPv/S4oVXtonHCyAGYOKxPIEAYuTgGYyMp4RoYVm6M7BY1U7+87
 E29+9dDXyEd5h26eMPjcvrpz48t1a3/OYGTY5KYQV1DCM2NZXKFpseyp2lsnU37m7v729NqmlOU
 qU1UZAQ==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

> imx_sgtl5000_probe() takes a reference on the codec i2c device, but the
> successful probe path returns without releasing it. Only the error
> paths drop the reference, so every successful probe leaks the i2c
> client device.
> 
> Release the reference once the card has been registered.
> 
> Fixes: 81e8e4926167 ("ASoC: fsl: add sgtl5000 clock support for imx-sgtl5000")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
>
> diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
> index 8bcf54ef709e..8ce333eb47fe 100644
> --- a/sound/soc/fsl/imx-sgtl5000.c
> +++ b/sound/soc/fsl/imx-sgtl5000.c
> @@ -177,6 +177,8 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
>  		goto put_device;
>  	}
>  
> +	put_device(&codec_dev->dev);
> +
>  	of_node_put(ssi_np);
>  	of_node_put(codec_np);
>  

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
