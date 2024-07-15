Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBE04643B
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 18:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721066521; cv=none; b=GVWoIwBeJoIsBjOKtU9ES7xUsu3bOp5a0cFKoLzFuKltFEqBxd4rTKoANCvJHgmEuBWevq+9VOK1n69uUpCKa9hshjJS7w90TTzuKKv4HMM5wIkHwNRIQkPqpm+662vkFGa/D/SOtrZxGXKkAHsNbI7+3PZP5R4GZX2ZlRejLiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721066521; c=relaxed/simple;
	bh=JwPBxHAWtoQoxygEw6krFcHWhPS6KH1JtDf73X5Skck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fE6Sg4CNhA+V78h7t2Y+rQYl6sfmNOWzH8/GmcCJfN4ioIrTUgovdeiDTKOoQUqo1rXrqUaYkmelW35B+cq7qCHz+PGbmzJQg42g8DZZp5bU58sXMVvPWwOKOpn6jiEXPCXlIK+TgvIwXk+GZXGIor+KVhIcnbgmzF4A4QrxMxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYew1mIy; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYew1mIy"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-78512d44a17so3418657a12.3
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 11:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721066520; x=1721671320; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vUWbQ2KlyuBvi5SiVJnONpg4b1PJ1YqEC0tuFG5cYeQ=;
        b=kYew1mIyBbO3+EHS6FFZec0yTgqpztx0DM26K9i2I6N4Np3iKGHXIWCF7K5+PPLQ+X
         38TuHJkOTSNwh41WAxwsU9BPigx6qx0NCHbBYNTFcuMxBjC+E7VLRroWA/Gi9tjFFRfJ
         i7P58UWcPkf+0pkcDecRorMK0E5/kSqgH7+jX0NhkaVdpcIC3U5FEalyyd+Is9osHFTl
         9uuGeuZhSTPhvavef+NFdipy/Ss9fuBesTS0oB6uDFkdert44AJCQq/GJqZRxZwkZMFU
         8NoVuUf5SFN4FUn1CTz1A4ul4DHgDcA+4EVvQlSc7hdDNp5wsG0mxoVlPvYkQvCfrA9y
         Xv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721066520; x=1721671320;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUWbQ2KlyuBvi5SiVJnONpg4b1PJ1YqEC0tuFG5cYeQ=;
        b=orYCXkbxm6Xb3rx2R3uGS1WgftPzcW4veMfTsRIQR2Vf3n4GkzCz2KYn8HHBtc3l4L
         5iw3roDJKJWY5dsY5Xc5AXs8uiBCqYJIqFVNVH8mOpsSNzM0kN7mdUB2VxwqGVZ6BEWH
         uaOGLiyh/XfkpV5GfbxvGZOD+3dpFo05EWMDMXU300uvGmGCXAgLi6Zj7LVAewx5vjqH
         y6ZzCyd+MGKmrzPmUcJY6RzwKIxGOHijm7iUNzIcrnHL6nj4wP5I1THLsR4iePd1Ix3r
         HMLwk8BctLg08RkpH2maUPqjByGfAQ8ZOfYd4qm5YagD/h9Giqc9TbLJJtUvtj/0I+fH
         qemQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpXBt+cOKDPmu6E43sNjRqYCrdg0a5D3nku9QLZi3pDBtrGLz1bWraSXSvdjWXbSlhElxWGrrRD/g5JvUHHmpioEvH
X-Gm-Message-State: AOJu0YyG/egwy2fKl7E22oxagf36c6r4sgMzGH9kmmxGp5ohJpFxd505
	nR6Qj+xgZGQznXfdQcuYccT+DWwZOPtvmCCfKwUG9DDAahzzthw2
X-Google-Smtp-Source: AGHT+IGJg88rQeW+DWBrT1E/rwGH/TnMyrRf/QhqqmTcdnNjL2JUOZMHA0cQaD/ZdXIvBV+FziWFbw==
X-Received: by 2002:a05:6a20:9145:b0:1c0:f23b:d35a with SMTP id adf61e73a8af0-1c3ee4903a3mr770780637.5.1721066519581;
        Mon, 15 Jul 2024 11:01:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eccc19asm4649745b3a.200.2024.07.15.11.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 11:01:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <57b1d9da-ea7a-4df8-bc02-a3c9db4f28da@roeck-us.net>
Date: Mon, 15 Jul 2024 11:01:57 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: alice.guo@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
 wim@linux-watchdog.org, ye.li@nxp.com
References: <20240715170717.2490688-1-Frank.Li@nxp.com>
 <CAOMZO5AqX25zduLXfXq6zU4SLRC_zs6ZU_D7ouA70iCdp-bt_g@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAOMZO5AqX25zduLXfXq6zU4SLRC_zs6ZU_D7ouA70iCdp-bt_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/24 10:16, Fabio Estevam wrote:
> Hi Frank,
> 
> On Mon, Jul 15, 2024 at 2:07 PM Frank Li <Frank.Li@nxp.com> wrote:
>>
>> Move post_rcs_wait into struct imx_wdt_hw_feature to simplify code logic
>> for different compatible strings
>>
>> i.MX93 and i.MX8ULP watchdog do not need to wait 2.5 clocks after RCS is
>> done. Set post_rcs_wait to false explicitly to maintain code consistency.
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Alice Guo <alice.guo@nxp.com>
>> Reviewed-by: Ye Li <ye.li@nxp.com>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> It looks better now, thanks:
> 

Not in my opinion. As requested in my other e-mail, please drop my Reviewed-by: tag.

Guenter

> Reviewed-by: Fabio Estevam <festevam@gmail.com>

