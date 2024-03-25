Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9FF13D26E
	for <imx@lists.linux.dev>; Mon, 25 Mar 2024 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711368798; cv=none; b=nOE/Jhq4OVZFJMbIzKommAbfRMVTfPbb+YrI/U+HfcQPYYiyZjTc/F7SE33ymDAVZn32CMOSAG4WJlJ89kYH1FCnigH5ACWKkXBpW4DN0sFlHwdhCO5jaoRK0GhKu6tHP36k9hvXLj+NlwSy4ZlE8YAeWN52/WGV3QOAKLtbVYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711368798; c=relaxed/simple;
	bh=Y261fPoQrbBoemY2RKvVpUj5qEW9Y7SPZnhfg+JQjFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qBka5J/HsQSKA9AViHZB5wK0wtIOWyDEO3SifCOVktOLmOzbGHm0ZNe+PXSMF7p7W24wxQrMYR0EgC4t60+ZPvYaGd5E+mGsm/YdURYveKvjNpm4bI+PoL+HyKKv97h9sLg/Wi6Jp3S8AEJ8epOKPDng//0f7fE3bJNiE2MUgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CjEY+pps; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CjEY+pps"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56c0bd07e7bso984657a12.1
        for <imx@lists.linux.dev>; Mon, 25 Mar 2024 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711368795; x=1711973595; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ipFCRrveYtGWb4EOo5Myx+NUZGxZHRAV0tdi7T2Ti9M=;
        b=CjEY+ppsKfN/BE3hEw8iSTNw60ZEgiYY9zkiijbzyY6dPoE76rqJPAk3fMq1426Ajk
         5bUPJ+sHMcLXeTm1Q1FIVnMnhorzyN2rgwjngnnlqERtWfSfIW4iffDB5vbo17OEmhSr
         Hypgbyrqrs+yDj5VDCmZM4M9NYxTOFhwuT32bG8EjgOA08iuriek+c/RlmLKX7OThcs/
         GKjHWtIyJX9cVnEYM345w/+BfMin+r+hhXA0lkGiRpL+GV4UlgdWyYCMMICyyW5X/qEr
         y32C0xj45OIiIZLjLyaPsc2XmHZH3AKkyuq4UuRMLgeLZYMmJORwLexGuCO9t2JdSrCE
         nLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711368795; x=1711973595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipFCRrveYtGWb4EOo5Myx+NUZGxZHRAV0tdi7T2Ti9M=;
        b=REUWLxztfeII89J0avkn47meAtNXbg0Jgz+QWNLHjmLWkxy4xMpPPnLKJ7Stl0xEPe
         S2H2sVLmAAKdNN6uXsn3YDNHm7gQHRm7J5IxKUKxczm8fq/kkZd/qS6BWARfKg7biMBl
         g6/Q3KkJ3MBusIP60S3L/4ICvXEtxgXmVoTChdb6tP96QTUWvEpSMAMYsMdlkxh3Lnok
         o95A9RX9E9qkpnOrhJ4I91adLh9n4pfg1jFOfywsTDv3mZVUDeL8Aw9SIG7xe4b3/Da2
         S+qFSgcN874glveL8Gn/cfUj7EQyDauhH1XN7dDPZRMqt/pc1RO0h5ZD/wv+dGNQbPM0
         owCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW4dW5iZ55SYtDrROQP6jxjN8+2nBL9z1wCX6qduHuKYKLApEt9ex1EC7vWXTt8cz9SV6AqH4xWY+xoO/8gTd0BJAr
X-Gm-Message-State: AOJu0YywlGkchjo5fK1zWUcCXtp6NthgSjXEoC3rvWwAej4BmoCyzBBq
	WqQd4rm1bXzocf7LQ8JbsHNgW9QkYAVxpsN6mDo4vcvHzUs/v0ti/8d5ocQQMVw=
X-Google-Smtp-Source: AGHT+IEfDeXs5TGryAPesJAZqhwQHd544lKGZxOwlQRpnuPNFF9iuYDdj2eyl+H//7SEV1qB5PZLfw==
X-Received: by 2002:aa7:cd14:0:b0:56b:fa9b:4e8e with SMTP id b20-20020aa7cd14000000b0056bfa9b4e8emr3318600edw.42.1711368795042;
        Mon, 25 Mar 2024 05:13:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id c13-20020a056402100d00b00568abb329a3sm2938050edu.88.2024.03.25.05.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 05:13:14 -0700 (PDT)
Message-ID: <b5cc609a-b3c5-4994-bcd5-e25a43d33cff@linaro.org>
Date: Mon, 25 Mar 2024 13:13:13 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] mfd: rohm-bd71828: Add power off functionality
To: Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 mazziesaccount@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
References: <20240324201210.232301-1-andreas@kemnade.info>
 <20240324201210.232301-3-andreas@kemnade.info>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240324201210.232301-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2024 21:12, Andreas Kemnade wrote:
>  	struct regmap_irq_chip_data *irq_data;
> @@ -542,7 +560,18 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
>  	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO, mfd, cells,
>  				   NULL, 0, regmap_irq_get_domain(irq_data));
>  	if (ret)
> -		dev_err_probe(&i2c->dev, ret, "Failed to create subdevices\n");
> +		return	dev_err_probe(&i2c->dev, ret, "Failed to create subdevices\n");
> +
> +	if (of_device_is_system_power_controller(i2c->dev.of_node)) {
> +		if (!pm_power_off) {
> +			bd71828_dev = i2c;
> +			pm_power_off = bd71828_power_off;
> +			ret = devm_add_action_or_reset(&i2c->dev,
> +						       bd71828_remove_poweroff,
> +						       NULL);
> +		} else
> +			dev_warn(&i2c->dev, "Poweroff callback already assigned\n");

Missing {}

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

