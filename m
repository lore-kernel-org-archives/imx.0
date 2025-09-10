Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694E72BE7BE
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 06:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757485554; cv=none; b=uvzt3uffy4MvWSdsxwkbBEoim0jqPj9zJ+76pCqs3/4tjExOxiU9ILS75gUXGSqfQNln+A9Wkqwuhr85ORJ1QubN1oREFZ1Dpkowj1fjcAsIEE4VbbrJO5M8+EwbhzxzU8kUFH84XSgYC5tQhOlaAetQRzgvBwtHTSzdOxxUnIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757485554; c=relaxed/simple;
	bh=VWAtzvK3K3Sny8PtwVN3QNMoPQMp0t++gaykl/2Rz/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eUVHR6VpqfW5FqhKaXSde2ExM8dwJJZ0UwDPafbrnJZUWpcZ0hKq1DYuv/FcEqLwWC7idxzsmYwa0wLd3dIHdmHXBVkuCQAU0Z/yM9G8jq5B+1LW7ndGcRHXZopYg2iQKHqL2miHRKrAeaETk9bVV1twEacgc6taCFDHaFMz1xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI3ocdxI; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI3ocdxI"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336a85b8fc5so47521391fa.3
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757485549; x=1758090349; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IIw0pPAXUFexyXSDcMgIaw6gPnjf6MWfiMx+63KO38c=;
        b=nI3ocdxIUUJXQSOicPDfe3SFWk0cuHIpPCgwu/EkBB9/1bwH+tin4AEV6jkTpMi7Ux
         JGwMirWp77BRcV9IhGpFP3uvctaRTHCIhiM1Z2LeWDXDRdEJLFs6hIBlS3aOevUfLbiK
         P6pebMcQAin1wXj3Ao3UjQ+s9ptNw/dRn7UEN/3buH5yGtdZ3/EUGz+i+F4z708HqVf3
         F6kOHrAHH0Xjqp9K0rpxjee2xiJI33bkJEDChMzExQXETNYL9HVeiXDflsDokv3aEEu5
         KJf+qTzy0TMUDnQtDYnSWhm1T3dc4+v5nyebGC25DtxZojMehOLffjvgVL+PUdB/lHTB
         Yc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757485549; x=1758090349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IIw0pPAXUFexyXSDcMgIaw6gPnjf6MWfiMx+63KO38c=;
        b=DTe6vJECFNCMqAtcDSHurb8gMSP6Rf7IpRH9HvcXYQEGjWh4hOGuEuYLcQke2laj8l
         wHyPcNc/QCnDUvhd/TzhCaefwo7XXnChjAhPMWVIrWdD350bBU6vlms8a8+olfD4m/Tc
         gaG9iAS7PdQxGiWUpEz5s3gTNoUg0L2IfNWNKC+Md30Curo9hPtLUyrsmyVyg1vdTm5Z
         i1mARfd5m56WX1nrxt+TJ0ORSizKddSg7f65YIzkkH8+UmgnWDyOQb/ToBmDTob3xtl1
         aTeUgjzXFf2P8EzqA0t+EZQZLJUnWLtmo8sNCRWCi/kpRYpBiq+UJH5aZufk+Pf19n/l
         n+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt1RlNSah3GGw1s8Ihd5tZ1kpLm6+9cY17ipA9Z1mo0f8P8/xrg3Py6cgx1mjciYLD2u8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBVWiiqko7NkD3NCyIrclslpBF2u7WbzC77z7TAu/7jSOoUrql
	dU0Af6LvazYI2OeA5gnGQXDYCEQgHotE5Tp9+WWFD+IOOmsRdk4Fr+jv
X-Gm-Gg: ASbGncueyNmXkiu9qMCVAMzvbGys/qFTC8YsclyBHkjSNiHd3A/1RezglUrk0XCKjL4
	7nd/iU8D/lvJ5VSl/t4x5TWdsuV6x8w5tM8BKXN+D7c3dgkxMIg1Z5e70AotY4+voL78f92lej/
	RQ1WHDY4PEpTs6vJiqkisPfpe/dG1U0KHXLV6ywbL6BgPS51hhC4iO5x89HCdf1laij975h0XEZ
	yEHjuQ9YXJuY6/gWGRJsw5Qbt5f5UNCtEqKdBbGgf/4UzRcGomSXyB/q66NSBMSgLP6H4pROv1M
	/XBSq4XpVJuTMpsORDjjjziZflzQOuA1PgXuSQ71aj9aZy+fLve9GY2U2tsArJu+cpP7k5UjDGc
	/EGG4lpEO9n8+udGb2t0RNiNL+8eAN7SenspLQTw4Y7IB2clJ6UbwH1fFU5G7FvftQDZ0yL6CjA
	qLJYqsjNJhDWoYB/Q=
X-Google-Smtp-Source: AGHT+IG+9jot4+WC+b5WAErCwWH7cNsg3YoQZcT7W2aJgZzs/Ue02mDKma185vlrfKseSgEMcat2PQ==
X-Received: by 2002:a05:651c:23c8:20b0:337:ec9a:a557 with SMTP id 38308e7fff4ca-33b42e68b16mr35440171fa.0.1757485549119;
        Tue, 09 Sep 2025 23:25:49 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032debsm44861641fa.42.2025.09.09.23.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 23:25:48 -0700 (PDT)
Message-ID: <f5736f7e-26ec-4a20-8f4d-82d45e719f3a@gmail.com>
Date: Wed, 10 Sep 2025 09:25:47 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange PMIC behaviour with rohm bd71847 on Ka-Ro tx8m-1610
 (imx8mm)
To: Maud Spierings <maudspierings@gocontroll.com>, imx@lists.linux.dev,
 LW@KARO-electronics.de
References: <56e7a430-79dc-4598-8e58-809759cf0711@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <56e7a430-79dc-4598-8e58-809759cf0711@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/09/2025 18:16, Maud Spierings wrote:
> I have been having some issues running mainline Linux on this specific 
> COM. Specifically with the shutdown/reboot behaviour seemingly being 
> inverted.
> 
> I have now figured out how to make shutdown actually behave like 
> shutdown. It seems like something is setting BD718XX_REG_TRANS_COND1 
> (0x20) to 0xcf. The only bit of code I can find that touches this 
> register is this:
> drivers/regulator/bd718x7-regulator.c bd718xx_probe():
> use_snvs = of_property_read_bool(pdev->dev.parent->of_node,
>                       "rohm,reset-snvs-powered");

AFAICS, this is the only place in kernel touching the TRANS_COND.

> /*
>   * Change the next stage from poweroff to be READY instead of SNVS
>   * for all reset types because OTP loading at READY will clear SEL
>   * bit allowing HW defaults for power rails to be used
>   */
> if (!use_snvs) {
>          err = regmap_update_bits(regmap, BD718XX_REG_TRANS_COND1,
>                       BD718XX_ON_REQ_POWEROFF_MASK |
>                       BD718XX_SWRESET_POWEROFF_MASK |
>                       BD718XX_WDOG_POWEROFF_MASK |
>                       BD718XX_KEY_L_POWEROFF_MASK,
>                       BD718XX_POWOFF_TO_RDY);
>          if (err)
>                  return dev_err_probe(&pdev->dev, err,
>                           "Failed to change reset target\n");
> 
>          dev_dbg(&pdev->dev, "Changed all resets from SVNS to READY\n");
> 
> }
> 
> Even with rohm,reset-snvs-powered set I still end up with 0xcf.

Yes. The driver is not - due to historical reasons :) - configuring the 
reset target to SNVS. This should be done by boot SW if SNVS is intended 
to be used. Then the "rohm,reset-snvs-powered" can be used to prevent 
the driver from overwriting the config, and to prevent the driver from 
taking the control of the boot-critical power-outputs. (This is because, 
when SNVS is used, the SW-controlled power-outputs will not get 
automatically enabled after reset - which may "brick" the device).

Some more discussion can be seen in this thread here:
https://lore.kernel.org/all/87bjs3auj9.fsf@geanix.com/

> I've had 
> to add the inverse in an else block to get the desired outcome.
> 
> else {
>          err = regmap_update_bits(regmap, BD718XX_REG_TRANS_COND1,
>                       BD718XX_ON_REQ_POWEROFF_MASK |
>                       BD718XX_SWRESET_POWEROFF_MASK |
>                       BD718XX_WDOG_POWEROFF_MASK |
>                       BD718XX_KEY_L_POWEROFF_MASK,
>                       BD718XX_POWOFF_TO_SNVS);
>          if (err)
>                  return dev_err_probe(&pdev->dev, err,
>                           "Failed to change reset target\n");
> 
>          dev_dbg(&pdev->dev, "Changed all resets from READY to SNVS\n");
> }

This would've originally been "The Right Thing To Do(tm)". Introducing 
it now in upstream would be risky - as discussed in the thread I linked 
above.

> 
> In uboot I get:
> 
> i2c md 0x4b 0x20.1 0x1
> 0020: c0    .
> 
> So something in the kernel is touching this register when it shouldn't.

1. Do you have the "rohm,reset-snvs-powered" set?
2. Can you read and print the TRANS_COND1 at the bd718x7 MFD driver's 
probe (before it instantiates the regulator driver or other sub devices?)
3. Please also read and print the register content in the else branch 
you added, before writing the TRANS_COND1.

(As I wrote above, AFAIR there should be no other places (in kernel) 
where the TRANS_COND1 is written. Are you sure this is not done by boot?)

Yours,
	-- Matti

