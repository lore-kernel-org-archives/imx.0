Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A0D3859E1
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437633; cv=none; b=W8HMo+Q4vIVPGbg0wQ4VegEmbqddg48JePqnPLfUVL/v12HWvia/ZEdO6yaBmPz4PA2kFiTXDE2Y988L4ZFRZdI3kWRw1DHTiMyIavFardYRvmHk1OTTO2TOk4oj6MrQsdRoiCPAFwRWk/oJ5xquuFBmf/gBy3n9I2PhxrimPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437633; c=relaxed/simple;
	bh=xSIZpSl0bzT5ncKHIOJrQHcDCKTg9OSZ3st72BWj5dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Am07/rMrq3ARnK0ThYaIIK0f+H5hXXHQotM9jddZHk5Ba3FkZhKO4zVfr8+QmEmEJvg8w4QDi6khAHBgh7nup9qIv5+45nT3eH11m+Ho83nqEAfUXxxjmlerrfcMQ0zmt7BERRWV+7cumcHJsB4OIOZkyVNA7OfrhKlTmVdO5GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lrsaw564; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lrsaw564"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-389e87e3452so62049521fa.3
        for <imx@lists.linux.dev>; Sun, 01 Mar 2026 23:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772437629; x=1773042429; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e68qiM5Z/tLR2me+b5hOCaInO/EcJkXq3qS1H6cb7Bs=;
        b=Lrsaw5647yjCysf/HfgbeD+J5CEnzJSDaXBcmh/i8AsVIfuPW8kbnoO8xO/Fg2bffS
         Wo4zWWD6Vj/LvJw5BIAeJ7Djo0ZURZW4+js+njJhRRs8GswUoy+mo20ePQm60FpoB+tL
         DwKAbKdLLxWzO3vvh6a79eMoYrLovkDNQ+Cak6RE3k3KnHDWbZUyVIvxpdl/lYQNY5M0
         XB+f2PSIgUrOwvUIIFpdlBhwR0CdM3bQu/clJ3ycPop8RY3eZVzWzVpwMnhOQtY4tjfD
         qdwUvy3KOBOEBL9epBlwlg4dkS3IHBUk8mU4Iia4i0pP5zIFpoUFl06blx4mIMB0psnv
         cQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772437629; x=1773042429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e68qiM5Z/tLR2me+b5hOCaInO/EcJkXq3qS1H6cb7Bs=;
        b=pVvgeVwEv4CyVVQw276x3DqPFCYwD9uG6d07ohMhiDvCaRxavn2oG28Xux2pgvUPcv
         99vWPFT5CIOrnWREhQNM/OuOX1km146Q+7/A/tALbw0KSRs6EddZh0H7psChUTfgSCYb
         nfvVAqvm2Gc88gQ88YU2wiBqR+TPmfOrUHfuFv5PGg/jixIOh1c7Dc6ZqFuE6HeRvgUY
         2DEedDWHs4c6LL5WGRdf7wzSh9vhDUnJNIgCZ2dZVJT7ScU9p7KUJFdhcxXbVIwTx9fk
         SXquXichoIKbhbosrFfq0yAH4tPOQYqMZrFdVXtPFaO+jEeh9Lf7fmaBGSRJykVNC++l
         MHnw==
X-Forwarded-Encrypted: i=1; AJvYcCUyEPdKj4eJlCn2DOCSjtV8nxsZS3GWoa+WVhFxr8pbfI2eoW4WLjb023Op06O0A75ePHU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfGznSAXvx/A0fjy2aBdrIL05HQ4M33NeNRzfZ+pXxsT+ete9u
	8l9g62MoS7GrKKPBxH+kOCcsKZTEUW6XbO2CqfeTPdkp9EKmmX8sSFyA
X-Gm-Gg: ATEYQzxb5VVM8wNAQW0ssw5JbOZS8xwX4J4Mr+L35/BjFbjN1jV/5aVIRY5RGir9LiH
	4Yv73yf7UnkOkh0oT1t1mjRa08t4lkesKn3XY2FygOHl/lDuf4shPOXnKoHnK/fsIOKyqaeGc/O
	57xR9UEOj/7LNHT1Fxt+TWW4JLl8nOe91QJIsfa5habqGs81No/zC5BEs2TLieEvQ1E+Hq4o7Ap
	bqdwaATGOeA7xkGCvbghqEoKy1vdMaTyIj//BnkXb8sx8ap2bh8ABRpFQ8Vi+0XL0Lgk1F6+0pI
	z9XUfP9mJUN1iceq7X1NA1t6GJ2nPWshhRO3lJOvzPYm43LWZNFKzVU0FcWTFp6H5WG/prNEFDi
	CgVupPaHIB5KtfTAp2x7wwzCfX5dTVn8u1FYiBeNkI7h0uqNPRXwgyngoYRVkrxDirYprlPW54/
	9pZbD16fWraNq0aMp/99gj4EHSkg==
X-Received: by 2002:a05:651c:1c7:b0:383:1c5f:84c7 with SMTP id 38308e7fff4ca-389ff130e18mr78428611fa.12.1772437628986;
        Sun, 01 Mar 2026 23:47:08 -0800 (PST)
Received: from [10.38.18.76] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a319f05sm3299418e87.50.2026.03.01.23.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 23:47:08 -0800 (PST)
Message-ID: <ac23aec1-6dce-4dd5-8990-9fad40998478@gmail.com>
Date: Mon, 2 Mar 2026 09:47:05 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 Matti Vaittinen <mazziesaccount@gmail.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com>
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/23/26 11:05, Bartosz Golaszewski wrote:
> In order to stop i2c bus drivers from dereferencing the struct device
> embedded in struct i2c_adapter, let's allow configuring the parent
> device and OF-node of the adapter directly through dedicated fields.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/i2c/i2c-core-base.c | 5 +++++
>   include/linux/i2c.h         | 4 ++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9c46147e3506d15d53b9b7d6b592709de56e41b9..dd8cec9b04c64b8340d20e018ab5ba28f1f7f5c9 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1561,6 +1561,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>   	adap->dev.type = &i2c_adapter_type;
>   	device_initialize(&adap->dev);
>   
> +	if (!adap->dev.parent)
> +		adap->dev.parent = adap->parent;
> +	if (!adap->dev.of_node)
> +		adap->dev.of_node = adap->of_node;
> +
>   	/*
>   	 * This adapter can be used as a parent immediately after device_add(),
>   	 * setup runtime-pm (especially ignore-children) before hand.
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 20fd41b51d5c85ee1665395c07345faafd8e2fca..72677f29aff161530bc3c497d1e07144a44eb9e4 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -761,6 +761,10 @@ struct i2c_adapter {
>   	struct irq_domain *host_notify_domain;
>   	struct regulator *bus_regulator;
>   
> +	/* Device configuration. */
> +	struct device *parent;
> +	struct device_node *of_node;
> +
>   	struct dentry *debugfs;
>   
>   	/* 7bit address space */
> 

Hello,

Automated driver test system bisected this commit to be the first bad 
commit, linux-next next-20260227 was tested. Failed tests include driver 
tests for ROHM PMIC and accelerometers, which are connected to 
BeagleBone Black.

The failed driver tests all fail to first i2cget and the tests stop 
there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file or 
directory".

BR
Kalle Niemi

