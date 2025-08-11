Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BCB228CA3
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754921732; cv=none; b=A6eyapE3gNckRmYwbU703JfYdDIdTqHRmL/ZRf3o1EnXP3bpxKiUidX5Ufjku72XQllvgq/WKqqxE32iW8Hhf0c6X8tI8qStfZiTA3tJAZNd0Xt2p+JoZhysbOtTrs8GW8F4Wf5uL1ezDIQS+PWk5o+rr9i6VcBnOG31dThPCSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754921732; c=relaxed/simple;
	bh=Wu9RZoJsH8KePvo+pFCRjMgD+CPUOFolr3ET8nVLo3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2ZRf7DE82NTYmzmf8+KwT/KfOxcv0zKpKYhU/PSEUEbK7uEN9IYlwypma6NfEDnF5M4HiFiZCtGrpkR7ojtC/I6ceoCKSYo80zQeGWQMkq0r1kOhe/FE22iO3on8KAxwi2PI6fYy5EWbOGUV7y//7bKxyjK4JzRSXsz9hs7Qno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KWkshojR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KWkshojR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-459d4d7c745so41139675e9.1
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754921728; x=1755526528; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZVyTjQ1s1YKbSECOiTy2rLTyEmtWvVLTZ+8yGWPUNs=;
        b=KWkshojRHPNe8qzfDQjdyTfJxYcVLJlHXgUvCbCGncIzr9K4jHqUw9AT55IJTpRdQE
         ZGF/itlqQT+XcEMUaxUXhkasjXRYgHr5fzrhxsQYsbAi6xsZQjrOHYLFqCvpdjXk7Q9Y
         gAFo6JDbvHcvqc9pBOP3YJjLfnQc697zN6e0qRWTLeo5hD84lZ8/cMFlDCmIGi6ILVoc
         mn9iT4NEcloxcpx0RdE3Uv1sVnv3d7UO8YTBBb5mLdaSDFuPkpztHqnUEdon+o8/m+tY
         IxjMrX6ET9hvKUrwDyPIhPGiIzhNwP5QXymwsxTYBEDGBFDComlfeSYiS+Tqaw/mBNBn
         AZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921728; x=1755526528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZVyTjQ1s1YKbSECOiTy2rLTyEmtWvVLTZ+8yGWPUNs=;
        b=hkBtF0clmTeaRM1aUPDrgxN4AraumWm1OuwV6i19swUZLn7LSd6dbWG/vpWWodQGe5
         LR9B6EQPrZkqy1nKE4/qwTBJqNIGoU5xHe2kdrA2HCGxbzgJw12V5Ys9sqI4Xfphht9V
         3V+cQemAluHFMZOcBhGJI5qyuwa/zfO6c3p8xO0YVeDQYRfKdnomxI5ExE15+6E7pFDm
         kzNnTwweUgdEWk9nKBm1wK5WRfxwbkFyk8O0O/Luvj4Uhabp8jE//vrLHWlGFRjAAdqh
         wXLIFo3nYjLAL/QE9CJ6/DCjOoKyrS0Vd1jtr0tMNH0OVyr4nVTeyN0zIyxpfcl/U09a
         EkMA==
X-Forwarded-Encrypted: i=1; AJvYcCWhyK6IrmIO7+7jnF2HJWULedYwefrNp8X7P2ComBDTzucxuiS9KHk8Wbyb3fbPQ8EHYbU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdftgKBSnMovHkVKm2paL7o/xUTTh43QV0LZ7CzEv5ToezZjr8
	s2WKpr8+MfeX0k7CKsEYgEEP4j+cXDCE/3XL8mkXjF3wGHmeKEmE5tb8CJJxXV5JTF8=
X-Gm-Gg: ASbGnctzsWMIkFrRuUnD0LFqgYrFm/xMgfKbEU1MC+wa9vUXCtdQLO2nQd3OjpcE9Hp
	RDpkuGw1vrv/OEa8llx3l7bt+2eZHP3K/beMi/ugwjh6R8JiURqywZp4fq5deaMBnT4DZhu4MPK
	RgtdGa2Xvt4frx7rvs4ukCVhwEyEA2L0yyEYd25+QoYUAbb6NzieUqARAdSQvjvSSIG+sVjY/gx
	R+mfnOKpE2SUHYab8mdkGiMh0kCT4wAR9C5Q/yAlaljFIngBbjnzadK1M+xidNYGmwpL3sSqQPa
	E8j8AFtyWGiqiFwsIB/rQ7DgzoRNNij+ZCUGq0iswCyXwDFQTDqHX3mYSYiBD3MJZ4k4lJRLw7D
	s8j8c8Pdk2AVfylAAxmKXQ81Wy8BomdHJjrIGjSIK7oIVjPFyOe/EZrqYpCZmPTCpX0I5d9I5x7
	eELXDOJA==
X-Google-Smtp-Source: AGHT+IH5e2VguXl/NE7RsmXIN0XcgUI7a0EiWf4IGX+6mTIqnY80BhVdae2lcK8a/X1KcW2Wv39mgg==
X-Received: by 2002:a05:600c:1d09:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-459f4f04237mr121012195e9.16.1754921727691;
        Mon, 11 Aug 2025 07:15:27 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e586ad64sm254198625e9.20.2025.08.11.07.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:15:27 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:15:25 +0100
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
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	MaudSpieringsmaudspierings@gocontroll.com
Subject: Re: [PATCH 2/4] backlight: add max25014atg backlight
Message-ID: <aJn6_c79tvy_1dhU@aspen.lan>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>

On Fri, Jul 25, 2025 at 01:09:24PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings maudspierings@gocontroll.com
> ---
>  MAINTAINERS                            |   2 +
>  drivers/video/backlight/Kconfig        |   7 +
>  drivers/video/backlight/Makefile       |   1 +
>  drivers/video/backlight/max25014.c     | 449 +++++++++++++++++++++++++++++++++
>  include/linux/platform_data/max25014.h |  24 ++

Who else included this header file? Can the code here simply be included
in the C file?


> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..371b6017953ae5955f4dfef921980dfdedd65d85
> --- /dev/null
> +++ b/drivers/video/backlight/max25014.c
> @@ -0,0 +1,449 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Backlight driver for Maxim MAX25014
> + *
> + * Copyright (C) 2025 GOcontroll B.V.
> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/platform_data/max25014.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define MAX25014_ISET_DEFAULT_100 11U
> +#define MAX_BRIGHTNESS (100U)
> +#define MIN_BRIGHTNESS (0U)
> +#define TON_MAX (130720U) /* @153Hz */
> +#define TON_STEP (1307U) /* @153Hz */
> +#define TON_MIN (0U)
> +
> +#define MAX25014_DEV_ID         (0x00U)
> +#define MAX25014_REV_ID         (0x01U)
> +#define MAX25014_ISET           (0x02U)
> +#define MAX25014_IMODE          (0x03U)
> +#define MAX25014_TON1H          (0x04U)
> +#define MAX25014_TON1L          (0x05U)
> +#define MAX25014_TON2H          (0x06U)
> +#define MAX25014_TON2L          (0x07U)
> +#define MAX25014_TON3H          (0x08U)
> +#define MAX25014_TON3L          (0x09U)
> +#define MAX25014_TON4H          (0x0AU)
> +#define MAX25014_TON4L          (0x0BU)
> +#define MAX25014_TON_1_4_LSB    (0x0CU)
> +#define MAX25014_SETTING        (0x12U)
> +#define MAX25014_DISABLE        (0x13U)
> +#define MAX25014_BSTMON         (0x14U)
> +#define MAX25014_IOUT1          (0x15U)
> +#define MAX25014_IOUT2          (0x16U)
> +#define MAX25014_IOUT3          (0x17U)
> +#define MAX25014_IOUT4          (0x18U)
> +#define MAX25014_OPEN           (0x1BU)
> +#define MAX25014_SHORT_GND      (0x1CU)
> +#define MAX25014_SHORT_LED      (0x1DU)
> +#define MAX25014_MASK           (0x1EU)
> +#define MAX25014_DIAG           (0x1FU)

Forcing all these constants to be unsigned is unusual. Is it really
needed?


> +#define MAX25014_IMODE_HDIM     BIT(2)
> +#define MAX25014_ISET_ENABLE    BIT(5)
> +#define MAX25014_ISET_PSEN      BIT(4)
> +#define MAX25014_DIAG_HW_RST    BIT(2)
> +#define MAX25014_SETTING_FPWM   GENMASK(6, 4)
> +
> +struct max25014;

This is redundant. Remove.
> +
> +struct max25014 {
> +	const char *chipname;

Why keep this value around? It is only used during the probe.

> +	struct i2c_client *client;
> +	struct backlight_device *bl;
> +	struct device *dev;

It is necessary to cache this, is it just a copy of client->dev)?


> +	struct regmap *regmap;
> +	struct max25014_platform_data *pdata;
> +	struct gpio_desc *enable;
> +	struct regulator *vin; /* regulator for boost converter Vin rail */
> +};
> +
> +static const struct regmap_config max25014_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = MAX25014_DIAG,
> +};
> +
> +/**
> + * @brief get the bit mask for the DISABLE register.
> + *
> + * @param strings the led string configuration array.
> + * @return uint8_t bits to set in the register.
> + */
> +static uint8_t strings_mask(struct max25014 *maxim)
> +{
> +	uint8_t res, i;
> +
> +	for (i = 0; i < 4; i++) {
> +		if (maxim->pdata->strings[i] == 0)
> +			res |= 1 << i;
> +	}
> +	return res;

Could this converison have happened during DT parsing?
> +}
> +
> +/**
> + * @brief control the brightness with i2c registers
> + *
> + * @param regmap trivial
> + * @param brt brightness
> + * @return int
> + */
> +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
> +{
> +	uint32_t reg = TON_STEP * brt;
> +	int ret;
> +	/*
> +	 * 18 bit number lowest, 2 bits in first register,
> +	 * next lowest 8 in the L register, next 8 in the H register
> +	 * Seemingly setting the strength of only one string controls all of
> +	 * them, individual settings don't affect the outcome.
> +	 */
> +
> +	ret = regmap_write(regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
> +	if (ret != 0)
> +		return ret;
> +	ret = regmap_write(regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
> +	if (ret != 0)
> +		return ret;
> +	return regmap_write(regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
> +}
> +
> +static int max25014_check_errors(struct max25014 *maxim)
> +{
> +	uint8_t i;
> +	int ret;
> +	uint32_t val;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(maxim->dev, "Open led strings detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(maxim->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(maxim->dev, "Short to ground detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(maxim->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret != 0)
> +		return ret;
> +	if (val > 0) {
> +		dev_err(maxim->dev, "Shorted led detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(maxim->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
> +	if (ret != 0)
> +		return ret;
> +	/*
> +	 * The HW_RST bit always starts at 1 after power up.
> +	 * It is reset on first read, does not indicate an error.
> +	 */
> +	if (val > 0 && val != MAX25014_DIAG_HW_RST) {
> +		if (val & 0b1)
> +			dev_err(maxim->dev, "Overtemperature shutdown\n");
> +		if (val & 0b10)
> +			dev_warn(maxim->dev,
> +				 "Chip is getting too hot (>125C)\n");
> +		if (val & 0b1000)
> +			dev_err(maxim->dev, "Boost converter overvoltage\n");
> +		if (val & 0b10000)
> +			dev_err(maxim->dev, "Boost converter undervoltage\n");
> +		if (val & 0b100000)
> +			dev_err(maxim->dev, "IREF out of range\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * 1. disable unused strings
> + * 2. set dim mode
> + * 3. set initial brightness
> + * 4. set setting register
> + * 5. enable the backlight
> + */
> +static int max25014_configure(struct max25014 *maxim)
> +{
> +	int ret;
> +	uint32_t val;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_DISABLE,
> +			   strings_mask(maxim));
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
> +	if (ret != 0)
> +		return ret;
> +
> +	max25014_register_control(maxim->regmap,
> +				  maxim->pdata->initial_brightness);
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(
> +		maxim->regmap, MAX25014_SETTING,
> +		val & ~MAX25014_SETTING_FPWM);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
> +			   maxim->pdata->iset | MAX25014_ISET_ENABLE | MAX25014_ISET_PSEN);
> +	return ret;
> +}
> +
> +static int max25014_update_status(struct backlight_device *bl_dev)
> +{
> +	struct max25014 *maxim = bl_get_data(bl_dev);
> +
> +	if (bl_dev->props.state & BL_CORE_SUSPENDED)
> +		bl_dev->props.brightness = 0;
> +
> +	return max25014_register_control(maxim->regmap, bl_dev->props.brightness);
> +}
> +
> +static const struct backlight_ops max25014_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = max25014_update_status,
> +};
> +
> +static int max25014_backlight_register(struct max25014 *maxim)
> +{
> +	struct backlight_device *bl;
> +	struct backlight_properties props;
> +	struct max25014_platform_data *pdata = maxim->pdata;
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +
> +	if (pdata->initial_brightness > props.max_brightness)
> +		pdata->initial_brightness = props.max_brightness;

Handle this during DT parsing.

> +
> +	props.brightness = pdata->initial_brightness;
> +
> +	bl = devm_backlight_device_register(maxim->dev, maxim->chipname, maxim->dev,
> +					    maxim, &max25014_bl_ops, &props);
> +	if (IS_ERR(bl))
> +		return PTR_ERR(bl);
> +
> +	maxim->bl = bl;
> +
> +	return 0;
> +}

Can max25014_backlight_register() be moved into the probe function?
There is no special control flow here so this function doesn't make the
probe function any simpler.

> +
> +#ifdef CONFIG_OF
> +static int max25014_parse_dt(struct max25014 *maxim)
> +{
> +	struct device *dev = maxim->dev;
> +	struct device_node *node = dev->of_node;
> +	struct max25014_platform_data *pdata;
> +
> +	int res;
> +
> +	if (!node) {
> +		dev_err(dev, "no platform data\n");
> +		return -EINVAL;
> +	}
> +
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	res = of_property_count_u32_elems(node, "maxim,strings");
> +	if (res == 4) {
> +		of_property_read_u32_array(node, "maxim,strings", pdata->strings, 4);
> +	} else {
> +		dev_err(dev, "strings property not correctly defined\n");
> +		return -EINVAL;
> +	}
> +
> +	pdata->initial_brightness = 50U;
> +	of_property_read_u32(node, "default-brightness", &pdata->initial_brightness);
> +	pdata->iset = MAX25014_ISET_DEFAULT_100;
> +	of_property_read_u32(node, "maxim,iset", &pdata->iset);
> +
> +	if (pdata->iset < 0 || pdata->iset > 15) {
> +		dev_err(dev,
> +			"Invalid iset, should be a value from 0-15, entered was %d\n",
> +			pdata->iset);
> +		return -EINVAL;
> +	}
> +
> +	if (pdata->initial_brightness < 0 || pdata->initial_brightness > 100) {
> +		dev_err(dev,
> +			"Invalid initial brightness, should be a value from 0-100, entered was %d\n",
> +			pdata->initial_brightness);
> +		return -EINVAL;
> +	}
> +
> +	maxim->pdata = pdata;
> +
> +	return 0;
> +}
> +#else
> +static int max25014_parse_dt(struct max25014 *maxim)
> +{
> +	dev_err(maxim->dev,
> +		"CONFIG_OF not configured, unable to parse devicetree");
> +	return -EINVAL;
> +}

What is the point of this method? New drivers shouldn't support platform
data so CONFIG_OF is required for this driver to work at all.


> +#endif
> +
> +static int max25014_probe(struct i2c_client *cl)
> ...


Daniel.
