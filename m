Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93C2E765E
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847259; cv=none; b=DbQaKnE4XYAVie7CywkdlYoYwNxix5W8vT2lFMgxnSk1mDTlFyuoXmw4mjUXjGn8zjxp0lpeHNcEtWmQBrss/1u6JncfwAQSghGlOIJhtFoyFDUGlKdkc0NdyiM2029+jTwIQFtXhn2/XbG5PyTncqgzQWilnHHtq8WaWDvr2hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847259; c=relaxed/simple;
	bh=Wqi2mO2fmQYFGAwZhuS4EvTXv9c8e4vGOynXydsCYEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkvQ8t/ZqsaRk/4JDN9Q+kkLF6R5T2HZ2Gcxy84s8oP2d5l6sM+262HN9H0fDvFNjOE5VwXQklabenhPJm2iaWwtIt2er1IGu4UXXRh2RP55B7HduYYll5ydSmYCCwMt2KnorK6WYx46TtY4zLHnbRsORUf9GJGhxzkCW19GuYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Ry1UB3Sr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Ry1UB3Sr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c51f0158d8so1058500f8f.1
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755847254; x=1756452054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IvJwbcOsjvAx4Cb95HKEUrId4UgDZ83tfHPDy6XNbLM=;
        b=Ry1UB3SrsMZt6mf47umJmG5dLlVizFQPFxXXAMohB3AoWyigWwblWU7pCdv4isHhM7
         zgnS7tUaE1mcgcTmFAVCNeHC7+Dl9v7IffZPY+Nz8eCxtOgctnRCDNJX87LNqHVE0sck
         83cFtjd3L0z0qN3a0shjwfkAgyMz/1KqJOtGKEh2WAqVPrA0Ra30xBb0K+jIZK16EChB
         nXxb+QvokUwUpMfPAT0P4awYBkAjJzBAIDbsR0R0cJfxXZqsqJcuL2ubdxehUhcF3BWf
         zseAjSbLYUWv38fdC6kpOC1aJp5DItjUDYK0LdHP/8mIU7PVWbtmVj5ti8WuYNhYw/Qs
         kHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847254; x=1756452054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvJwbcOsjvAx4Cb95HKEUrId4UgDZ83tfHPDy6XNbLM=;
        b=QrbZVHb4KwUAYdynBkXPk6CJ2MntOJLry9BtI7vywkmNo/TCYtJ73KxV0MPuLMjJfw
         GuVMFAfd+UoBILsVKcqJ2AKINH5+kb23KimVdsBjeli3fdKIcrMznhKi7mHE1HtWoatT
         uBnK6p7Htv1qwSEtqa2X7BgwAoramahjGr7aNOcErOVqnK/to9O/KUs6/sNMaq+ClQl+
         CTuMBsAsKh0oko1s7C8pSrB7gJL4IhauRp+sRMEaTnEWYYQDcqqEFNKqaUPn34R2dUqt
         8lKwoTIXWLcUcjimSRnrByl+9oE5jlWd9HNQ2o47V7hs4g3w2SmkBWhQvQyGuvw+lVOV
         NYRw==
X-Forwarded-Encrypted: i=1; AJvYcCVvikQr29Rc8CukjbyE1lPcvbVO+tX6R6v/G75YyT5bO0YLb3yKUDRdEZdfrIxs4qMx+A4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDdQfqUu9tS6TteWhJPvJEx4JxXdocKFTYIJOfw9Kf7SCoV710
	wX6ktjP3TRL2QmFOUHSmRfo6BiGeh/RLYrBNoetrmT5ui7kWB/fl86bMcki1mQTeJEI=
X-Gm-Gg: ASbGncuAUrbZ3fkrXEPBpWoC/asFKUIQBZ9GFIdiEjAnM8S6dUoQvtWURvZbkclCnoS
	bmZiRh8iA7MbH1/oYloJa/oJqI2TZqAK1aXOdgH4FyYaVY6gK4kCB1k4iThk0zYpXJ/CeIX1v2A
	ESFpk6S5HDjunV0XaNPkFR59AhTaYo0Civf99IsDtYdNjaFM1npdQSXCfR2He3OXM7eUknHuW7g
	pxbi2eGvF6QDgbsyDZEUeLfESV8/72PJAwapAiqCI3YmInyfK0cwsv2bw5gKZaCHeA3jxoAVul6
	YsgQNBqBnzjvZrijmYWCzgF70qIiij3PO67m2M1j3MIoaCgjIFtl0KpohFdNt2yPuz0jBsSkGle
	2UkGJmBnwIPK7OqUPqDTJPxtPeduFaGKoC5H7V9MYJ6pjDZ4mXaC/0glDmvEDpQ80Zb/MpjVoLm
	9Unz679A==
X-Google-Smtp-Source: AGHT+IFLbHL5Jfp1HiEMgBzb/cWVZllJl0fqqVCyRz90kU9u6d+rKWlXzqxgMmKXZyGMMiOGZn0oyA==
X-Received: by 2002:a5d:5f4e:0:b0:3c0:7e02:67b9 with SMTP id ffacd0b85a97d-3c5dcefeda4mr1234311f8f.61.1755847253747;
        Fri, 22 Aug 2025 00:20:53 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c576b7sm14060427f8f.63.2025.08.22.00.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:20:53 -0700 (PDT)
Date: Fri, 22 Aug 2025 08:20:50 +0100
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
Subject: Re: [PATCH v2 2/4] backlight: add max25014atg backlight
Message-ID: <aKgaUtcNoOsga6l7@aspen.lan>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-2-5fd7aeb141ea@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-max25014-v2-2-5fd7aeb141ea@gocontroll.com>

On Tue, Aug 19, 2025 at 12:59:00PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings maudspierings@gocontroll.com

Looking good but still a few small comments (below).


> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fe5e0615cf6d151868b56ebb9544b175b09dfcee
> --- /dev/null
> +++ b/drivers/video/backlight/max25014.c
> @@ -0,0 +1,395 @@
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
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define MAX25014_ISET_DEFAULT_100 11
> +#define MAX_BRIGHTNESS (100)
> +#define MIN_BRIGHTNESS (0)
> +#define TON_MAX (130720) /* @153Hz */
> +#define TON_STEP (1307) /* @153Hz */
> +#define TON_MIN (0)
> +
> +#define MAX25014_DEV_ID         (0x00)
> +#define MAX25014_REV_ID         (0x01)
> +#define MAX25014_ISET           (0x02)
> +#define MAX25014_IMODE          (0x03)
> +#define MAX25014_TON1H          (0x04)
> +#define MAX25014_TON1L          (0x05)
> +#define MAX25014_TON2H          (0x06)
> +#define MAX25014_TON2L          (0x07)
> +#define MAX25014_TON3H          (0x08)
> +#define MAX25014_TON3L          (0x09)
> +#define MAX25014_TON4H          (0x0A)
> +#define MAX25014_TON4L          (0x0B)
> +#define MAX25014_TON_1_4_LSB    (0x0C)
> +#define MAX25014_SETTING        (0x12)
> +#define MAX25014_DISABLE        (0x13)
> +#define MAX25014_BSTMON         (0x14)
> +#define MAX25014_IOUT1          (0x15)
> +#define MAX25014_IOUT2          (0x16)
> +#define MAX25014_IOUT3          (0x17)
> +#define MAX25014_IOUT4          (0x18)
> +#define MAX25014_OPEN           (0x1B)
> +#define MAX25014_SHORT_GND      (0x1C)
> +#define MAX25014_SHORT_LED      (0x1D)
> +#define MAX25014_MASK           (0x1E)
> +#define MAX25014_DIAG           (0x1F)

There is no need to put raw numbers in brackets.


> +
> +#define MAX25014_IMODE_HDIM     BIT(2)
> +#define MAX25014_ISET_ENABLE    BIT(5)
> +#define MAX25014_ISET_PSEN      BIT(4)
> +#define MAX25014_DIAG_HW_RST    BIT(2)
> +#define MAX25014_SETTING_FPWM   GENMASK(6, 4)
> +
> +struct max25014 {
> +	struct i2c_client *client;
> +	struct backlight_device *bl;
> +	struct regmap *regmap;
> +	struct max25014_platform_data *pdata;

This appears to be unused.


> +	struct gpio_desc *enable;
> +	struct regulator *vin; /* regulator for boost converter Vin rail */
> +	uint32_t initial_brightness;

It is important to keep the initial_brightness for the lifetime of the
driver?

> +	uint32_t iset;
> +	uint8_t strings_mask;
> +};
> +


Daniel.
