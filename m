Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C542FD666
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 11:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761132908; cv=none; b=hhZ/fGH5P+v3ISlV5BEsTVqgDxyyOBX63MSbOE6kfIjEw1UUuknCaoCi1H82+2ranzmWcS2UNJt5rjhjz7VCKaeqpANFo+JQwqKBh2cs20aHlth5agaURUPqvU3xl/ZzPNF3ClJl065Z+MJoaJlWU5xvekuJdi4deSy9MLIKrkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761132908; c=relaxed/simple;
	bh=+1jzj1FdbPB3v8jHy8/PMSpKosEhgj1bHkqnLiEO5sY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=on6tr8Ux/rgPG/gkRm8DwiyzEgdluIon5W4uFwXqOqChi+1ALTHbG6sYKWq+s9KqwSXZLrrsVIKwFrD9EhRd3w8rF7JKv+NG9M+p0NRWpAYFiZQm7+6XtnFdmOCiIJ7sTia90LdXqzRFtBBijxxWCHLqeLnktJOQTAzeCXutqo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jx4ow/sN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jx4ow/sN"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3ee18913c0so1296901766b.3
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761132903; x=1761737703; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yO34qPsn7QHCTVDfDKcQas0jsSh3wLko8YufcBfx8as=;
        b=Jx4ow/sN9ZDu3JUcdgaFTEUZfnxuFDR0Ltb85xDTYh50/WLVcwpmYtz48XgIhTgTix
         vGJA5nFadeGQwLgvI295MTYUYmxoc/4sO5IY661SJEoLdSIr2gcc7TlZMzSQeITJ23+b
         5sqoAvnbw9p0KMX04uSWAwYGb7u7DBcxJeTRFPp7ftYHH1a65FSFoT4CBcQQVVEH0MP1
         mRZ2MhtGqQqMwR4dZaHKJtPbvSCFHijaXmEFaYOV4+3wuJAZWIRNoVTRb1FIar8Sn9jn
         z1rzd6/svvvLPBJvTtxhROVmbS0lnYNmNUP20O3LkhV5kpTpktE30rR0YMKi8yZRALmP
         ElfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761132903; x=1761737703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yO34qPsn7QHCTVDfDKcQas0jsSh3wLko8YufcBfx8as=;
        b=M7PEl/zSg7SXczIgtIC0hXgR2tk/XLDB8TeD64K3vvvSAuMYlneFKhcQK/3n8tAqQw
         pKXV1Henq3nPlOmYPABHn1bg3/UJYEU4vZ4x3C3NUS/rMWrGNS1y4pxMzKqvmnVGN5RB
         rjxusGQ0FM8yYDM3oFel8JZNLSzID/QIbiettk0XW2dqVPjLfko5HVaAyR9iPcbB6LtS
         F+78hIFroymEpwcAcaCq4DVYR45AlqMGoLsSm6b4EW+2wYsVKivtV3z5yeBE7MjcqCI4
         66o4d48W5qwl5gL5kCDoEysPREdSpMdGwiFFee/E0d9tCZ9HBfC+WcAC1OeTo3i+QiX/
         G/8w==
X-Forwarded-Encrypted: i=1; AJvYcCVcDrlb9i7HXztpAhHeJfEN2y1VnJ+2fedyv5RRSqNW8CYl0Ry/VhnQ6ge+OJr2HHhrjJo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6yYUmu4IL+bQr1Ob6sdodo4hXlXI/G8ioZ4oE38dJUVoxgJMF
	AtBwtA+GcJMA0IA3HKaZm+EGpCQL8ob+D5IiC+JiAADiCSYah5PUaHNbFo8/+KEM4WKaDw==
X-Gm-Gg: ASbGnctQYyVOZO7CYqdT/VqBSLODqjebMfcwdn7ZxhRd6RLGqo3sdNEU8iBCTDLasxF
	q27eq9sm2hhS/Zn95Cv687jDao7bRrj8hZVTwBLyfhnz6DyGV2ANR0r2yOt4QoXB9VuTv9F2JZG
	2jgapZ466MGZtXRTMLr3JZK8DhEwIKllzdI8whakTasn9iM2EYfm7PeLIMFjWi//FAaY/P8zJw5
	7YGVQmsCWjczEd/aNinSjldMDlwcnetalSjN5wDJsqWi0KjVgKBRzT4CvkZXKFJ/jEJjw+dFS+r
	PlDcjMBuzNvtL6qC4x2ps4YP5ry0KQpPN+Bt/DW8oQMl9LAhTaJ6W+SzwSxykfNXYty9uQjy2Hv
	SJMkaspBx7xC/c7J/hjNVDBrOwTMxgnC8o07XV1GrpWui/5nSsuzv70yHMtWD0dnLN47kuRpx5G
	aqLfGRKL0IkqPREzuHTrduFyWBtCVc2O/+zArFFs7CDio=
X-Google-Smtp-Source: AGHT+IHfqiWBy7zfGoCqLQpI11jm6dwQ/WE7NiaPb8Gr8GzjB9HYaKJgVjiXf/jFs4wJwPRiCS9gYA==
X-Received: by 2002:a17:907:1c82:b0:b4e:a47f:715d with SMTP id a640c23a62f3a-b6472a6a145mr2430377866b.17.1761132902443;
        Wed, 22 Oct 2025 04:35:02 -0700 (PDT)
Received: from [10.25.209.134] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb4dcf2sm1303250766b.75.2025.10.22.04.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:35:02 -0700 (PDT)
Message-ID: <804dd1f5-7e79-4bfa-b777-c97bb89a713a@gmail.com>
Date: Wed, 22 Oct 2025 04:35:00 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] reset: imx8mp-audiomix: Switch to using regmap API
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-6-laurentiumihalcea111@gmail.com>
 <aPJXdPVrofYGQgIP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJXdPVrofYGQgIP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/17/2025 7:49 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:22AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> As far as the Linux kernel is concerned, block devices such as i.MX8MP's
>> AUDIOMIX block control or i.MX8ULP's SIM LPAV can simultaneously act as
>> clock controllers, reset controllers or mux controllers. Since these IPs
>> offer different functionalities through different subsystem APIs, it's
>> important to make sure that the register R-M-W cycles are performed under
>> the same lock across all subsystem APIs. This will ensure that registers
>> will not end up with the wrong values because of race conditions (e.g.
>> clock consumer tries to update block control register A, while, at the
>> same time, reset consumer tries to update the same block control register).
>>
>> However, the aforementioned race conditions will only impact block control
>> IPs which use the same register for multiple functionalities. For example,
>> i.MX8MP's AUDIOMIX block control IP provides clock gating functionalities
>> and reset control functionalities through different registers. This is why
>> the current approach (i.e. clock control and reset control work using
>> different locks) has worked well so far.
>>
>> Since we want to extend this driver to be usable for i.MX8ULP's SIM LPAV
>> block control IP, we need to make sure that clock control, reset control,
>> and mux control APIs use the same lock since all of these functionalities
>> are performed using the SYSCTRL0 register.
>>
>> To do so, we need to switch to the regmap API and, if possible, use the
>> parent device's regmap, which, in the case of i.MX8ULP, will be the clock
>> controller. This way, we can make sure that the clock gates and the reset
>> controller will use the same lock to perform the register R-M-W cycles.
>>
>> This change will also work fine for cases where we don't really need to
>> share the lock across multiple APIs (e.g. i.MX8MP's AUDIOMIX block
>> control) since regmap will take care of the locking we were previously
>> explicitly performing in the driver.
>>
>> The transition to the regmap API also involves some cleanup. Specifically,
>> we can make use of devres to unmap the device's memory and get rid of the
>> memory mapping-related error paths and the remove() function altogether.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 95 +++++++++++++++++----------
>>  1 file changed, 61 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index e9643365a62c..c74ce6e04177 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/of_address.h>
>> +#include <linux/regmap.h>
>>  #include <linux/reset-controller.h>
>>
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>> @@ -19,6 +20,7 @@
>>  struct imx8mp_reset_map {
>>  	unsigned int offset;
>>  	unsigned int mask;
>> +	unsigned int shift;
>>  	bool active_low;
>>  };
>>
>> @@ -26,24 +28,27 @@ static const struct imx8mp_reset_map reset_map[] = {
>>  	[IMX8MP_AUDIOMIX_EARC_RESET] = {
>>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>>  		.mask = BIT(0),
>> +		.shift = 0,
>>  		.active_low = true,
>>  	},
>>  	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
>>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>>  		.mask = BIT(1),
>> +		.shift = 1,
>>  		.active_low = true,
>>  	},
>>  	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
>>  		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
>>  		.mask = BIT(5),
>> +		.shift = 5,
> why need shift?  you can use ffs(mask) to get shift.
>
>>  		.active_low = false,
>>  	},
>>  };
>>
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>> -	spinlock_t lock; /* protect register read-modify-write cycle */
>>  	void __iomem *base;
>> +	struct regmap *regmap;
>>  };
>>
>>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
>> @@ -55,26 +60,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>>  				  unsigned long id, bool assert)
>>  {
>>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>> -	void __iomem *reg_addr = priv->base;
>> -	unsigned int mask, offset, active_low;
>> -	unsigned long reg, flags;
>> +	unsigned int mask, offset, active_low, shift, val;
>>
>>  	mask = reset_map[id].mask;
>>  	offset = reset_map[id].offset;
>>  	active_low = reset_map[id].active_low;
>> +	shift = reset_map[id].shift;
>> +	val = (active_low ^ assert) << shift;
>>
>> -	spin_lock_irqsave(&priv->lock, flags);
>> -
>> -	reg = readl(reg_addr + offset);
>> -	if (active_low ^ assert)
>> -		reg |= mask;
>> -	else
>> -		reg &= ~mask;
>> -	writel(reg, reg_addr + offset);
>> -
>> -	spin_unlock_irqrestore(&priv->lock, flags);
>> -
>> -	return 0;
>> +	return regmap_update_bits(priv->regmap, offset, mask, val);
>>  }
>>
>>  static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
>> @@ -94,6 +88,50 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
>>  	.deassert = imx8mp_audiomix_reset_deassert,
>>  };
>>
>> +static const struct regmap_config regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +};
>> +
>> +/* assumption: registered only if not using parent regmap */
>> +static void imx8mp_audiomix_reset_iounmap(void *data)
>> +{
>> +	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(data);
>> +
>> +	iounmap(priv->base);
>> +}
>> +
>> +/* assumption: dev_set_drvdata() is called before this */
>> +static int imx8mp_audiomix_reset_get_regmap(struct device *dev)
>> +{
>> +	struct imx8mp_audiomix_reset *priv;
>> +	int ret;
>> +
>> +	priv = dev_get_drvdata(dev);
>> +
>> +	/* try to use the parent's regmap */
>> +	priv->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (priv->regmap)
>> +		return 0;
>> +
>> +	/* ... if that's not possible then initialize the regmap right now */
>> +	priv->base = of_iomap(dev->parent->of_node, 0);
>> +	if (!priv->base)
>> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to register action\n");
>> +
>> +	priv->regmap = devm_regmap_init_mmio(dev, priv->base, &regmap_config);
>> +	if (IS_ERR(priv->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
>> +				     "failed to initialize regmap\n");
>> +
>> +	return 0;
>> +}
>> +
>>  static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  				       const struct auxiliary_device_id *id)
>>  {
>> @@ -105,36 +143,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  	if (!priv)
>>  		return -ENOMEM;
>>
>> -	spin_lock_init(&priv->lock);
>> -
>>  	priv->rcdev.owner     = THIS_MODULE;
>>  	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
>>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>>  	priv->rcdev.of_node   = dev->parent->of_node;
>>  	priv->rcdev.dev	      = dev;
>>  	priv->rcdev.of_reset_n_cells = 1;
>> -	priv->base            = of_iomap(dev->parent->of_node, 0);
>> -	if (!priv->base)
>> -		return -ENOMEM;
>>
>> +	/* keep before call to imx8mp_audiomix_reset_init_regmap() */
>>  	dev_set_drvdata(dev, priv);
>>
>> +	ret = imx8mp_audiomix_reset_get_regmap(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get regmap\n");
>> +
>>  	ret = devm_reset_controller_register(dev, &priv->rcdev);
>>  	if (ret)
>> -		goto out_unmap;
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to register reset controller\n");
>>
>>  	return 0;
>> -
>> -out_unmap:
>> -	iounmap(priv->base);
>> -	return ret;
>> -}
>> -
>> -static void imx8mp_audiomix_reset_remove(struct auxiliary_device *adev)
>> -{
>> -	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(&adev->dev);
>> -
>> -	iounmap(priv->base);
>>  }
>>
>>  static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>> @@ -147,7 +175,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>>
>>  static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
>>  	.probe		= imx8mp_audiomix_reset_probe,
>> -	.remove		= imx8mp_audiomix_reset_remove,
> cleanup imx8mp_audiomix_reset_remove need seperate patch.


as things stand now, this bit belongs in the same patch as the switch to the regmap

API because of the introduction of imx8mp_audiomix_reset_get_regmap(), which

uses devres. This makes the remove() function incorrect and, thus, needs to be dropped.


since the cleanup is quite trivial, I don't think this would justify purposely

making imx8mp_audiomix_reset_get_regmap() not use devres in this patch

and then transitioning to it in a subsequent patch.


>
> Frank
>
>>  	.id_table	= imx8mp_audiomix_reset_ids,
>>  };
>>
>> --
>> 2.43.0
>>
