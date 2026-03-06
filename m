Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2B3EB7F8
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812548; cv=none; b=tjN+KcmcW0Hg47D9UOikJKh0bXYoCuExT4DL7TNoZRclt8p1grou+5vklKRLL8KtcZTDw2dBl7FwFU62947n/a63kbUhLblqcrzp7w3nf4QmwR7theaRWwQ3za6vtCxCJ9K7fn/anE/1uwG6ftjo7HrJrHiOBMru7wbzaN803VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812548; c=relaxed/simple;
	bh=lFgjW46ILrKHSoXB9q3w7P43GTXK8kj8mXndX9HX1/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BLuZq9G+wimRJj71tLTKlSP8cytsQf0zVRGO2wXF2NFXn1g2jY9+g51myUaM0j98mnLLQVSYiROq0JZ+1/kmsplo+BQD36Yd5f0dGIw8qxeRsMZohShMqKQR4aHVnk9cTNCFa78IrSomeJLiVEIzMZO6Af0thkrRd/Rb8FGOlnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niQBQI6h; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niQBQI6h"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2be1ab1fa7dso506705eec.0
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772812545; x=1773417345; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=flU13GMtw/+0UhfCUKIM3vLWYjN35HhW1mCsxDikv80=;
        b=niQBQI6hIHEvCNRxGg60xbucCv247rVTz9wPXRi7Ohb7+BH+8SDJ4fkh5vqJ4tJoBl
         gnzC5t30UD1/vS38h4kZu0XUTMgMcuVQEJIRQ1c0kZYrKFCaKGNt+xnd415kjaFCxVhg
         u2jaL2CntFFLEbhlzsQgsGOvB7aZHEP5Aj0Ioe+rGsiT73h/m+6FfqkBDhnXU1hM7xXc
         yObVdLRDdam292vblbipi/muegshg9E4d0+LrmGUEdfE58oHXH7UabouzMdz7cA1UGeV
         ZPF98jdFCRhxNsbvIW51j9MzV38l9I9v9d3hz+zQHX84z3YxiWY6uZlnkmGSbwRtkPJU
         tE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812545; x=1773417345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flU13GMtw/+0UhfCUKIM3vLWYjN35HhW1mCsxDikv80=;
        b=Me8t9BP/u12/wYRo51NXn+CmmhvSP+WEduBfeuMBSRuGqoNNt+lrZALrQaphaksyKk
         82OnasqNxezMcFQ7avtRE2drtYvHc9CgvpvFSLV/m5lRNLh5Dh8aR4fFX9pfQ5tYEnQm
         M8kLVM7WWNH0TneIRluVGDbjKFlCt/UWW4E3KoLEi2Bp7XwALB4Pw6s/r9qfo9v/sTZ5
         z0hYz3G55F3M9uxHk2TvLd+6CDW35vdFiCcc8+kpFLE07HL6XjD/pbONGt4PbMBlL8gm
         jvvP6+cVb0/QlPbonWdklytmZx3xYXkt7MkM0jD1kaS86P4+JPjtoIs0TxZJ0jiYYuXE
         9c6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+rcX4PZpX1E4EDrRB7ThQB3ZjRMWPeu5dM9VGBT6RivV17wdO8zN+yawyMX2UgQB9yt0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOTG00ZuUIVMsu2syM4rg7nFzubjfU6l3PFnLQwHBlIqWB9j6l
	/G95P8QsntmACsZnVJAucjbM1laWFDDaFo2tBYlxaq923uARPyrPoafd
X-Gm-Gg: ATEYQzw3Lwqi6U3mh9jPNPdhHtGCJNT+MRGwBMj+j/RUa68Ptb1wVtNkm93F3/qbosH
	dwro1w8AGz74HB5hYDwuZ5A7P8nBKP7T/ii0s37OgUei5s+M1KEmkdoaa8Lo6kUjYKvrVIZts05
	gmCPdHB4DZKJtZa63y0hUzpDA6MQVg48dTndIF6Dv1lF3ch7kOdNMteleYeW2yJRrBiZ6dVtWU+
	jLQe0pFLPZokNkxjwxsGdsetfCemir4AhyuX2mnQ83f1O4mLBJP7IzYteJxHU/DH/ktaoV6I6Vy
	WwYdGcf3EGzBzd/zn4NQaDY28QYKu75O8xY5bJV9oMSsDkPN9EwfSQBgeaXDBNnYG9/p2+6whpq
	utJ4VJ+Bb3J+hLh3cri2pVoWSJLtJQLmCCxO0rJLAruih16bpBpXxSdEnX4903d74cP2qjYp9l4
	H/LN1V31sR9StzgOX2uDQstI+OynAl8bBTN8ENmHITunZOLQ6No3/UjgyP0PDY+NPpPWlZuhe1Y
	5xj7HhGF4A=
X-Received: by 2002:a05:7301:128d:b0:2be:c4a:d31b with SMTP id 5a478bee46e88-2be4e02c09dmr1176487eec.18.1772812544584;
        Fri, 06 Mar 2026 07:55:44 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948411sm1369071eec.21.2026.03.06.07.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:55:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0aaa530c-ff61-4e49-81ca-fd3c98a29f58@roeck-us.net>
Date: Fri, 6 Mar 2026 07:55:42 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] hwmon: emc2305: Set max PWM state during shutdown
To: florin.leotescu@oss.nxp.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, festevam@gmail.com,
 Florin Leotescu <florin.leotescu@nxp.com>
References: <20260306133439.564033-1-florin.leotescu@oss.nxp.com>
 <20260306133439.564033-2-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260306133439.564033-2-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/26 05:34, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some platforms rely on Linux to leave the EMC2305 fan controller in a
> safe fan state before the system restart handoff.
> 
> If a soft reboot is initiated, the controller may retain the last PWM
> duty cycle written by the kernel until another software stage
> reconfigures it. On systems where no later stage immediately takes over
> fan control, this may leave the fans running below a desired fail-safe
> level.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> ---
>   drivers/hwmon/emc2305.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e..d631d972c40e 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -714,6 +714,20 @@ static int emc2305_probe(struct i2c_client *client)
>   	return 0;
>   }
>   
> +static void emc2305_shutdown(struct i2c_client *client)
> +{
> +	int i;
> +	int ret;
> +	struct emc2305_data *data = i2c_get_clientdata(client);
> +
> +	for (i = 0; i < data->pwm_num; i++) {
> +		ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i), EMC2305_FAN_MAX);
> +		if (ret < 0)
> +			dev_warn(&client->dev,
> +				 "Failed to set max PWM on for ch %d during shudown", i);

s/shudown/shutdown, and newline missing

> +	}
> +}
> +

We can not do this unconditionally. This would have to be configurable.
The driver could use the optional fan-shutdown-percent devicetree
property for that purpose.

Thanks,
Guenter

