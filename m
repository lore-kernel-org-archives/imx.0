Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18571F3FC6
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669458; cv=none; b=N6CtJk90kMvW1Dazb9GjH6uxqwg7QCLxRrl0J69/8x0CfCnsHS7SWYcmZLIljmNMSJfNlaxO7Qa7APyT0UnoN/sepBLQVJH9SCZrhNpdAQ1endizmrQwFLoCtALUyERRca6VPjSVzrkBHZOTtb31MAL7R6gUYfwmuFZJc5PwMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669458; c=relaxed/simple;
	bh=SPCcFqbrzfIHwolmZbtkAZSKbGxU/6xQjBXOl8gkX1o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Na6Fu5RNGLOM02p4xNcybDRTUwR/NbHo9j5k+BYVTVsNoiBVlKqf/+b4xjeKHBb/b9S3BFfbpdTXTQoasPm2fSPvOFOFkPRJJmE0zkUWAC6WRWlPl4wgGkzNKgWw1sz59BsCs1B2W06Od6KoWuNDJJBOIr+bCByQwpd5cYCuzNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XOdWoMX4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XOdWoMX4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so37365535e9.3
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750669454; x=1751274254; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGJGLljVH09RHHvcPmR2xlgcJlbWSurnIEnT57zI1pg=;
        b=XOdWoMX46TpRhv9qOFm6QLnIsp8lLAagLxFy6/DagVRsko0FmbKXZiNUNSdqqy44KN
         0JLdF6mKM81kl4Mj0eT6nJEi/byBt+hkLGKW7p+aOQRi6A2xbwd6IhVp//avKa3xWQ5I
         h2hSZBhbngVBEKcmIheHbCovwYrLWA+tfYEgIkPN32LfR1HkZSh4SOgC9vR6VXmH52kK
         EYlcEpP+mr6/0ZIRepwtxjlHFSrZ87Z6VGLV4uzdvg/TW3zw+VOaJnhAOYKR+2NT5fpU
         Ejnd6vbIgJtpBzCHOsncIMBci41goQGNOrSb4jYkKBSX6vZg15celac5XVEjnbId7Y5u
         llmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669454; x=1751274254;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGJGLljVH09RHHvcPmR2xlgcJlbWSurnIEnT57zI1pg=;
        b=v8D/zkV3T0d0e6Vt5j4VAa7GfiEczG2EjHgwjSKNA5i6av5j2EBRdGqSjuNHlbNzPB
         EAm1bh14wu1cJsIXjcV5Lk5x4UQVj5PWh2kOcG/+bZmd0pHRNtwUvYvBqSdfXxpUlYGY
         zsD2Gyr3vwEP4KD9yZn9oERMx06iz/zpHwZ57dQLp7hikN/dgNwy94BZEDIcveyb/THA
         04isIqoTLkLNG3s7YjwGlk/QASkP0hmtR/JP1aA8lrPnALxJ0hyXvgxY43FOvJY5ruCy
         8ACfXGpo+ZB6Y9RJWLKOK9uIvhUR/nP/z3yCaSo8z6I2bUT5cwHCMsrUfo2jjgtOwlYk
         IuRg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+/om6ifhtiC14XevKUW1Zl2UifgSGx5D/BGEouqWr+LOnYWExZJBjrILcow4x9VgTO0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyke/ILvQlARf5j+Xm+1o83MpjuiPXTBJ56N9bgoxTBXS01IH9A
	WwIm3jlpWTS2FWT4EHuEvFlEAh4pT3GI5sjz1SHV6iZQqJoeU5A7rALo5aTXUufvB2k=
X-Gm-Gg: ASbGncsvY+Uw/BwyfUCo9GH7v09n3BcsxTVM5Ze28rU+FxqcfaL3eCAlt0NCaC3CojH
	FofJOUjg+GNbS8taRzG7Wm998vi3S7S7vqgv3F+YyMlQegOSr+fxkMfs8GiqNzlFc6Ass8cIiRj
	sGy34rr6HAegkviBrl2H2VdjaWOTfHloR79uklyEd43XTC0fE5uWdwRSk11z0M4LmeGegNOFpGD
	4ybHQjI7IbGGVLXs8cmApnczhK6XG2ut5cSUs2TxMxSWAuv00wShFNAEOLw5DcfqL3EnU/AWIRY
	ot5ixaI3a98wIVxWmg/CJifmoMAGTzHNe9JQgAOsWMKPNE6XxB5+RO8RsqgD
X-Google-Smtp-Source: AGHT+IHPFVP2GzxWqyLYPOcDDU16rCAlS0TgolK5wkPSR8zZb2Tfrc8wGwUYkTiUhGSu8NLF6anogw==
X-Received: by 2002:a5d:5f4b:0:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a6d12a41a1mr9212783f8f.16.1750669453679;
        Mon, 23 Jun 2025 02:04:13 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:dd07:164c:d535:3e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6d117c66esm8705949f8f.47.2025.06.23.02.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:04:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Philipp Zabel <p.zabel@pengutronix.de>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-mips@vger.kernel.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/4] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
In-Reply-To: <aEmzRrhQC+olmywj@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Wed, 11 Jun 2025 12:48:06 -0400")
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
	<20250611-clk-aux-v1-3-fb6575ed86a7@baylibre.com>
	<aEmzRrhQC+olmywj@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 23 Jun 2025 11:04:12 +0200
Message-ID: <1jikkmkewj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 11 Jun 2025 at 12:48, Frank Li <Frank.li@nxp.com> wrote:

> On Wed, Jun 11, 2025 at 02:53:58PM +0200, Jerome Brunet wrote:
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>
> Actaully, you also remove unused struct clk_imx8mp_audiomix_priv *priv
> at clk_imx8mp_audiomix_reset_controller_register().
>
> Please add it into comments.

That's merely a side effect of removing the boilerplate code.
Like for the other changes of the same kind, I don't think listing the
symbols removed would be useful to the change description

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/imx/clk-imx8mp-audiomix.c | 49 ++++++-----------------------------
>>  1 file changed, 8 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> index 775f62dddb11d8cfd17a4ebf7a677ef399c5e617..765fb1f5bd4fa2b039d7414abd89471438ee41dd 100644
>> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
>> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
>> @@ -230,61 +230,28 @@ struct clk_imx8mp_audiomix_priv {
>>
>>  #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
>>
>> -static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
>> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>>  {
>> -	struct auxiliary_device *adev = _adev;
>> -
>> -	auxiliary_device_delete(adev);
>> -	auxiliary_device_uninit(adev);
>> -}
>> -
>> -static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
>> -{
>> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> -
>> -	kfree(adev);
>> -}
>> -
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> -{
>> -	struct auxiliary_device *adev __free(kfree) = NULL;
>> -	int ret;
>> +	struct auxiliary_device *adev;
>>
>>  	if (!of_property_present(dev->of_node, "#reset-cells"))
>>  		return 0;
>>
>> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> +	adev = devm_auxiliary_device_create(dev, "reset", NULL);
>>  	if (!adev)
>> -		return -ENOMEM;
>> -
>> -	adev->name = "reset";
>> -	adev->dev.parent = dev;
>> -	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
>> -
>> -	ret = auxiliary_device_init(adev);
>> -	if (ret)
>> -		return ret;
>> +		return -ENODEV;
>>
>> -	ret = auxiliary_device_add(adev);
>> -	if (ret) {
>> -		auxiliary_device_uninit(adev);
>> -		return ret;
>> -	}
>> -
>> -	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
>> -					no_free_ptr(adev));
>> +	return 0;
>>  }
>>
>>  #else /* !CONFIG_RESET_CONTROLLER */
>>
>> -static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
>> -							 struct clk_imx8mp_audiomix_priv *priv)
>> +static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
>>  {
>>  	return 0;
>>  }
>>
>> -#endif /* !CONFIG_RESET_CONTROLLER */
>> +#endif
>>
>>  static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
>>  {
>> @@ -408,7 +375,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		goto err_clk_register;
>>
>> -	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
>> +	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
>>  	if (ret)
>>  		goto err_clk_register;
>>
>>
>> --
>> 2.47.2
>>

-- 
Jerome
