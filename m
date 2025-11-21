Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA6A2E719B
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763717394; cv=none; b=TDa05TdkckktZ8Q7GoLZmMdd/KCH/WCM/7j+3AyFCQkqmOnDl5kxAVc/Rr3R6n4KQDCw4DF8Q5fOT971r5ijV8OCTSF7tR3TYMJgbqflvmgEOAEeX6LI0hSJhN3NxdahW7jSF3ALIoMNv6pzK3PHwuawTO03+aJpKsHSkf5AvU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763717394; c=relaxed/simple;
	bh=uSbYcEm1WCPNJwx8UqPV/i1enY5q8gnMalq46Q7qZW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnMlHN37MQEjyrGfEBjljog4iAAVkbdT/oMd+Sq2Hikozxr7rtLwRyph3Ln7uCeM1iGcO3GJT9mX/TALMFJ4kwM4jh62C/0T31vs4DCEhRaqlSOB7E/s8NhuW+BX1jTC7UcMlfvF1jiD3MbqAMulm6h7CPxb4YLmgOdAuftPqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpyJQ0h7; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpyJQ0h7"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6408f9cb1dcso2738678a12.3
        for <imx@lists.linux.dev>; Fri, 21 Nov 2025 01:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763717391; x=1764322191; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wl2xu8XKN1gPMV9ACQzl23UL67KsRhgGQiSjpamCaq0=;
        b=HpyJQ0h7Gnmyg5m7GG5ulDJZSVn0ez7epOaYRUYNxqIJykOw2Z+nQ9y7CNGt0QnM6S
         riyEn6h8/1g4t9FWk1R/oTqYb70m+zU62JHU2qFgDwuDW9pCkU5OSfxyd06HS4HhvxLx
         bRSopKAamWmzKLM4WGXqwYnDz6o1PUuIUZlgNLab2oRH89b3npsJABK4Sf7hXNgabCEs
         rLMAYqSReBcM27rzPpnvplEMPc2cRbIH0uXnxwHWMjI4L9vsRFyKNBtziJKLFYm7GOc4
         PoIcCtS+GQyf/TaHMKP99kIZulaSxvsvt76xwR7VS91OEuNAkylJKyXn+mE/2YcAQUWZ
         AXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763717391; x=1764322191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl2xu8XKN1gPMV9ACQzl23UL67KsRhgGQiSjpamCaq0=;
        b=kIxFK99atUMS7R6GgSY84n/zY/JyPprR0fK70bPhDO3EPymgcQxNn+8+hBpPRFM0aP
         qVs9b6XJ2y/1hFgYSNZZshYC0r8GilDqB9rttqhoEBmfl9DQ5QPSUOID/wlBesivPI7Y
         F6YYBcrI2NW0mQ4y7Guln8sFRcHwMuKyIngPX+0/Pb+CQymc5LtlkFzAhLnYmskNKoGa
         mJs1zwZqmbO+qj0q6F+IKu/cik7zCmIpJSqpW5CyHalAmtvy49x7sSQhYuTgNpSEhx4G
         zCIxTlIrtPqPjzy+3plJm2stEJcFcl1EIof/z9cs4NTLVeov/2F4luiCTAU3F9YfwHRH
         b2/w==
X-Forwarded-Encrypted: i=1; AJvYcCXugi2CLH/hWY8TjeakFulQbS9Oi42T6cVIwinUD6B6bpcv/oscmMxJ+Z4fXYRUhSC7dfQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+YGsfS/06jVT29Dnv0ZZzdycToXOfGvwdGHeD6z/Eo5tfB/Xu
	gJYozaNHBIQVJ0VjcOeTad8o1DHyQi+abJqbc4J8fNQKRVcGI5Q+8YoN
X-Gm-Gg: ASbGncuLRiv+NZP7Vq2UAjUx8iAYTrT0dzq24TXV1o2hAZISuTCQwzyQ5kCgnEMDoUX
	G3WfQTkvAr2XEHne873AWSBoet4StFkUJYdD74qFNjJYMXjz3eM/dKQGHGN1MO5tcTDLAX/6RXi
	DuHISRjeu8tvZ8f05gg1EoKz791gHC+jf0wd6VxzYH1FGHTWOzjqFqOEjB6Klja0eDWxh5HgQvR
	Pd2hNg0ccwwSUgm64Gp7BpNZW2Gt9K2jAvgAl9aDpfTCkD9x3AIg7QWjqjzL8OzJ1Jk3g2wN8Na
	5RslAcxte9Fcz+VI/HCozk2Yc+pmhm/JobmBGEwct7Ztb5ppQaIDR7xisiOIHggzGqQlfFPnZkL
	xuwSQDhXkLsTF58UyYb4shcKTOeHonqoKbkRNsogLXc7lWfbqYhPDbiMtxWZofqFvCHgrPw9o5U
	DMmJW07f7riNywDdN1FAwEOR4CJBsAy0/biDCSrfqp8F0=
X-Google-Smtp-Source: AGHT+IHq8hk9zncY5NjxJIA+5dLJtbgJgeFMs63IXI+ZjuoPAQXsuFcRPpdcxS7UMwvUHeWvXnedJA==
X-Received: by 2002:a17:906:fe4a:b0:b76:277b:9a3d with SMTP id a640c23a62f3a-b767170a37emr166265266b.29.1763717390579;
        Fri, 21 Nov 2025 01:29:50 -0800 (PST)
Received: from [10.25.210.163] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4275sm402635166b.37.2025.11.21.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:29:50 -0800 (PST)
Message-ID: <3959e908-ae61-4424-a8ef-89f655a4de8c@gmail.com>
Date: Fri, 21 Nov 2025 01:29:48 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] reset: imx8mp-audiomix: Extend the driver usage
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-5-laurentiumihalcea111@gmail.com>
 <8b225c56612ff01845a90388be0945c7d0b3f0d2.camel@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <8b225c56612ff01845a90388be0945c7d0b3f0d2.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/14/2025 8:02 AM, Philipp Zabel wrote:
> On Fr, 2025-11-14 at 05:37 -0800, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Switch to per-device reset map to allow reusing the driver for other NXP
>> block control IPs.
>>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index 35df9bd5f71a..d3396f37d1ff 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -24,7 +24,12 @@ struct imx8mp_reset_map {
>>  	bool active_low;
>>  };
>>  
>> -static const struct imx8mp_reset_map reset_map[] = {
>> +struct imx8mp_reset_info {
>> +	const struct imx8mp_reset_map *map;
>> +	int num_lines;
>> +};
>> +
>> +static const struct imx8mp_reset_map imx8mp_reset_map[] = {
>>  	[IMX8MP_AUDIOMIX_EARC_RESET] = {
>>  		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
>>  		.bit = 0,
>> @@ -42,9 +47,15 @@ static const struct imx8mp_reset_map reset_map[] = {
>>  	},
>>  };
>>  
>> +static const struct imx8mp_reset_info imx8mp_reset_info = {
>> +	.map = imx8mp_reset_map,
>> +	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
>> +};
>> +
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>>  	struct regmap *regmap;
>> +	const struct imx8mp_reset_info *rinfo;
> Since only rinfo->map is used in imx8mp_audiomix_update(), you could
> directly store a
>
> 	const struct imx8mp_reset_map *map;


hm, that is true, but I wonder if instead of replacing "rinfo" with "map", it would be better to

keep "rinfo" and add an out-of-bounds check for the reset ID in imx8mp_audiomix_update().

Something like:


                if (id >= priv->rinfo->num_lines)

                    return -EINVAL;


we are stuck with "struct imx8mp_reset_info" so might as well fully make use of it?


>
>
> regards
> Philipp
