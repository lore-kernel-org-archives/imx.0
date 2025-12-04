Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FEB304989
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865048; cv=none; b=DQprHT7iy21Ou9RKPjawgrH552sVvV8B3g/n31MjQezmSUqMY7Id7HBOgqsFWcaQfT1TtWvEiKRjph41UNPVA+QCS/aY7Ros338s1cpqlpldfR4WAbvE/8ZhEjbDWV4UfkEOg+21LUmEIb81ZqLSEZuGyp1bzCSnbOZwqZ0iGiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865048; c=relaxed/simple;
	bh=XtTJ7qlXuDJZzj6VLw1zDRFC4g0AQQg/n2a5j599URk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeAD2im5B47PkWre8p6UIs8dmAN988gFTLrxh1lXhqTUr0mHkkFeUzDJJIyaMcnUxJ198+W7J+UQ7kuDFKGnXejmtBnHNqbtZw87dWIxyTtwB0a1MBWnLGZ+s3GQqmS0OCjoRugwwYiiDgSHP+xmwPMCOThsGe3VBbV7hCxFSqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=g4QzYM8w; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="g4QzYM8w"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so9848635e9.3
        for <imx@lists.linux.dev>; Thu, 04 Dec 2025 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764865043; x=1765469843; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aNxmDbbdKqIboODXWdbYm3bL1ySA2CUYBdNtl6MTmVk=;
        b=g4QzYM8wnoiF/jyTU8Fkn6ZxaNn/SAgL4Yqiq+Z9Zr9O6ypmKZBp99iGOjVH0/42zA
         VLYPK02i0B1eh6hAuT0rvgho6chwvsV3Vbo7S4wXpnaf6hAfJFE0Y2usvHjkEhNcHGDi
         FrWnqQDWcq1vQ5hIk6b+9YbkpA7baVuMS6KtgXgA5XBC7UQjWuwv4WZvMQf0MgbaGvgX
         FiSxPKQiASdDilFsMv0ZeGjdFtRDZKZG2Qbp+AlXcfAwzSbbD9EmGQBSXwLl+deCVCCF
         BtcrTR/KvCaWpmuonHDPKkOn8u7QTjMBczBSTxomh4fsvInHXftoJ7wHoCuaubEsKeHG
         sHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865043; x=1765469843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNxmDbbdKqIboODXWdbYm3bL1ySA2CUYBdNtl6MTmVk=;
        b=pTABRsZtzoRn/oyUs4OcNDL1xtLyB/bvTM1bDZR096PGOHeaFRKI8K6uFABVYXMNxF
         LGr+Tl/aL6A31URFGp6IBALRkZEgn8UjGwm38cyzISdpFEFnVH6ytrld6m4t/F2QuoG/
         hJH2YcUMVyFwC4fnQOMS9SC3QmFs+0ZOkcBzdL7a8NcOrWLYWLtrd2b+RLAmzM3fgti7
         pCQuyllHblmDwYqNK5n9Nm7R7URFA+fWt7gVY3NH192EwNwC/hpkQ4PbcFuLQfmrjAxS
         0tQFmH65n2v8axAeCSxFTgliSSlteE4nVxv6CdudqVH7KR7I+wj39JyKf0aCiONkLYOb
         pe4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUO+8QCpgwN15jDbeKGZS1TpIPnPBH8YG5UGEDmAKe375NseDnsuNYRvrFZYgA9KcZVPeM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1O/ubtDqO9NevFLWu/qapclw1xeaQ5c00pL3GGNKNjViR0kYN
	pzk4bzQoEF32FGruJKm0KiscTtrz+p+idB95OSurLEsMpKix+/AfdYT3zDD/XymZXvI=
X-Gm-Gg: ASbGncvNe5B/OP29rXq15/mDo+oYkW+v00TW8xHHlS7g5ZSCI7ET9ByJ39nG1ay+vfq
	aar1kbTNZtPuEiYtIH5b5WhPAYfp5o2AGrVL7iQb6BDibqLZopOeKme68hI4oMnYShDQahUdKmb
	CGUxDVOB4/w0ymMa7K1VRhvqVzhz75US6GspfYJufcUB8s3fwghEBE2C/nh34iQtmXDc/eZMtOy
	7aoMZoO94WgHimF67oTerNWhcvlNg3MV/4mtmjK3UXG1f3BTC1j56QSW/E2y17jrKKvSAoMBbpU
	k+tySWLmZv/7gU9kr/p7HYBfepyoEGVFz48NkGiKPlMgw/kYf/lNbSMXu9umebPE6bB73ylY3eL
	59kILIZe2MUUYiSDhFKzgE+t/kwa3yllK/Kb+FXCrqTJYOorSOZbc5uiwB7SL2Jtkk5q2H/afOu
	budoRGas7ngaJJz12FwwbfkUNGQqiEF7Vz4y6Lx8dT3reFw24cv5YaKQBS/Lwkr4ZY5q8G4A==
X-Google-Smtp-Source: AGHT+IH6HRzgtWVSRwk2pLy54f/ZcykaKll9/7ioHYJyiAfAQ0RExVb1Rrhx4JL/zXiO1Ib8Xi1u/g==
X-Received: by 2002:a05:600c:310c:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-4792af34a44mr65294315e9.21.1764865043101;
        Thu, 04 Dec 2025 08:17:23 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f8bsm4033746f8f.43.2025.12.04.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:17:22 -0800 (PST)
Date: Thu, 4 Dec 2025 16:17:20 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aTG0EK_zuSB-U_bb@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>

On Mon, Dec 01, 2025 at 12:53:21PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

> <snip>

> +static int max25014_check_errors(struct max25014 *maxim)
> +{
> +	uint32_t val;
> +	uint8_t i;
> +	int ret;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);

Shouldn't this be MAX25014_SHORT_LED?


> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * The HW_RST bit always starts at 1 after power up.
> +	 * It is reset on first read, does not indicate an error.
> +	 */
> +	if (val && val != MAX25014_DIAG_HW_RST) {
> +		if (val & MAX25014_DIAG_OT)
> +			dev_err(&maxim->client->dev,
> +				"Overtemperature shutdown\n");
> +		if (val & MAX25014_DIAG_OTW)
> +			dev_err(&maxim->client->dev,
> +				 "Chip is getting too hot (>125C)\n");
> +		if (val & MAX25014_DIAG_BSTOV)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter overvoltage\n");
> +		if (val & MAX25014_DIAG_BSTUV)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter undervoltage\n");
> +		if (val & MAX25014_DIAG_IREFOOR)
> +			dev_err(&maxim->client->dev, "IREF out of range\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * 1. disable unused strings
> + * 2. set dim mode
> + * 3. set setting register
> + * 4. enable the backlight
> + */
> +static int max25014_configure(struct max25014 *maxim, int initial_state)
> +{
> +	uint32_t val;
> +	int ret;
> +
> +	/*
> +	 * Strings can only be disabled when MAX25014_ISET_ENA == 0, check if
> +	 * it needs to be changed at all to prevent the backlight flashing when
> +	 * it is configured correctly by the bootloader
> +	 */

Attach the comment to the if statement rather than the read.


> +	ret = regmap_read(maxim->regmap, MAX25014_DISABLE, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (!((val & MAX25014_DISABLE_DIS_MASK) == maxim->strings_mask)) {
> +		if (initial_state == BACKLIGHT_POWER_ON) {
> +			ret = regmap_write(maxim->regmap, MAX25014_ISET, 0);
> +			if (ret)
> +				return ret;
> +		}
> +		ret = regmap_write(maxim->regmap, MAX25014_DISABLE, maxim->strings_mask);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
> +			   val & ~MAX25014_SETTING_FPWM);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
> +			   maxim->iset | MAX25014_ISET_ENA |
> +			   MAX25014_ISET_PSEN);
> +	return ret;
> +}
> +
> +static int max25014_update_status(struct backlight_device *bl_dev)
> +{
> +	struct max25014 *maxim = bl_get_data(bl_dev);
> +	uint32_t reg;
> +	int ret;
> +
> +	if (backlight_is_blank(maxim->bl))
> +		bl_dev->props.brightness = 0;

This isn't right. Why would you change the backlight level just because
it is currently blanked (and sorry I missed this one last time).

> +
> +	reg  = TON_STEP * bl_dev->props.brightness;

The correct way to honour blanking is just go call
backlight_get_brightness() instead of reading the property directly.


> +
> +	/*
> +	 * 18 bit number lowest, 2 bits in first register,
> +	 * next lowest 8 in the L register, next 8 in the H register
> +	 * Seemingly setting the strength of only one string controls all of
> +	 * them, individual settings don't affect the outcome.
> +	 */
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
> +	if (ret != 0)
> +		return ret;
> +	ret = regmap_write(maxim->regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
> +	if (ret != 0)
> +		return ret;
> +	return regmap_write(maxim->regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
> +}
> +
> +static const struct backlight_ops max25014_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = max25014_update_status,
> +};
> +
> +static int max25014_parse_dt(struct max25014 *maxim,
> +			     uint32_t *initial_brightness)
> +{
> +	struct device *dev = &maxim->client->dev;
> +	struct device_node *node = dev->of_node;
> +	struct fwnode_handle *child;
> +	uint32_t strings[4];
> +	int res, i;
> +
> +	if (!node)
> +		return dev_err_probe(dev, -EINVAL, "no platform data\n");
> +
> +	child = device_get_next_child_node(dev, NULL);
> +	if (child) {
> +		res = fwnode_property_count_u32(child, "led-sources");
> +		if (res > 0) {
> +			fwnode_property_read_u32_array(child, "led-sources",
> +						       strings, res);
> +
> +			/* set all strings as disabled, then enable those in led-sources*/
> +			maxim->strings_mask = 0xf;
> +			for (i = 0; i < res; i++) {
> +				if (strings[i] <= 4)
> +					maxim->strings_mask &= ~BIT(strings[i]);
> +			}
> +		}
> +
> +		fwnode_property_read_u32(child, "default-brightness",
> +					 initial_brightness);
> +
> +		fwnode_handle_put(child);
> +	}
> +
> +	maxim->iset = MAX25014_ISET_DEFAULT_100;
> +	of_property_read_u32(node, "maxim,iset", &maxim->iset);
> +
> +	if (maxim->iset > 15)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid iset, should be a value from 0-15, entered was %d\n",
> +				     maxim->iset);
> +
> +	if (*initial_brightness > 100)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid initial brightness, should be a value from 0-100, entered was %d\n",
> +				     *initial_brightness);
> +
> +	return 0;
> +}
> +
> +static int max25014_probe(struct i2c_client *cl)
> +{
> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> +	struct backlight_properties props;
> +	uint32_t initial_brightness = 50;
> +	struct backlight_device *bl;
> +	struct max25014 *maxim;
> +	int ret;
> +
> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
> +	if (!maxim)
> +		return -ENOMEM;
> +
> +	maxim->client = cl;
> +
> +	ret = max25014_parse_dt(maxim, &initial_brightness);
> +	if (ret)
> +		return ret;
> +
> +	maxim->vin = devm_regulator_get(&maxim->client->dev, "power");
> +	if (IS_ERR(maxim->vin)) {
> +		return dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->vin),
> +				     "failed to get power-supply");
> +	}
> +
> +	ret = regulator_enable(maxim->vin);
> +	if (ret)
> +		return dev_err_probe(&maxim->client->dev, ret,
> +			"failed to enable power-supply\n");

Can this use devm_regulator_get_enable()?


> +
> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(maxim->enable)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->enable),
> +				    "failed to get enable gpio\n");
> +		goto disable_vin;
> +	}
> +
> +	/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> +	fsleep(2000);
> +
> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
> +	if (IS_ERR(maxim->regmap)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->regmap),
> +			"failed to initialize the i2c regmap\n");
> +		goto disable_full;
> +	}
> +
> +	i2c_set_clientdata(cl, maxim);
> +
> +	ret = max25014_check_errors(maxim);
> +	if (ret) { /* error is already reported in the above function */
> +		goto disable_full;
> +	}
> +
> +	ret = max25014_initial_power_state(maxim);
> +	if (ret < 0) {
> +		dev_err_probe(&maxim->client->dev, ret, "Could not get enabled state\n");
> +		goto disable_full;
> +	}
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = initial_brightness;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +	props.power = ret;
> +
> +	ret = max25014_configure(maxim, ret);
> +	if (ret) {
> +		dev_err_probe(&maxim->client->dev, ret, "device config error");
> +		goto disable_full;
> +	}
> +
> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
> +					    &maxim->client->dev, maxim,
> +					    &max25014_bl_ops, &props);
> +	if (IS_ERR(bl)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(bl),
> +				    "failed to register backlight\n");
> +		goto disable_full;
> +	}
> +
> +	maxim->bl = bl;
> +
> +	backlight_update_status(maxim->bl);
> +
> +	return 0;
> +
> +disable_full:
> +	gpiod_set_value_cansleep(maxim->enable, 0);

Why is this needed? It was only ever set by devm_gpiod_get_optional().

> +disable_vin:
> +	regulator_disable(maxim->vin);

This is also not needed if you use devm_regulator_get_enable().


> +	return ret;
> +}


Daniel.
