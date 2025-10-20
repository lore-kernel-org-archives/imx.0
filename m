Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A021D5CC9
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969224; cv=none; b=EsOvkHh981LMw6zqxwNufu/Y6GYrIVFQeIJp2O+YMKkFmYdnoTcLgmf2leFxk9ifC6jUkcGnXUNcp8R6HKzjaEe6PCIcnkPChB4oCPlXoxlbjnfIGzluZ2I9gssA7Uie5tu2Q+G1ZjhTBB2GxhxHCw64ZUjSzIEMrDlu06TJxTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969224; c=relaxed/simple;
	bh=iYFkl/nxfDRLe0SeNUr0Hl4oXg6cy9/Dzz20ODXL4b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BS+hJMUpgODvWfe0k1gud4sffOzQDL6ucu5MKIc6SxP1Lrb+9ibhmFEF/cUoYge2ZdODWt4jlGVK7oo7rF9oUe8h7CWyAdNtceX6AU5mYMeKPi6+eRxQXNmSvJqzV8+E+qizMr6MTglezSyj/gsZseTf639Tdj33i/yIsdPZmCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkcAPMN0; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkcAPMN0"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63c09ff13aeso8096096a12.0
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760969220; x=1761574020; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kZeqZ1f1Kjlwt5WlxnlLU6u8FvqUbW9sH2W37ltY2w=;
        b=VkcAPMN015w3k/LNc7EGux6yTP4oq3E0G1i4vRyrQHlWylRyOcyZkVV0W+1yQDB0ME
         cJ2Ngg6P9Zr5d/8N6Cd69UcmkDNMUDB5IePqapXUUR8595k71Zeeq4tZZsIM597IW2he
         B0FwyPOLtXsgVIxP07RNoUUlzmsJOXA9DaCyuWAcUenp0T1Vb7G5y1xigtzr4Edrtops
         ggYwQG3Y53J1we2VeoiW08OHf+1YzaaSAOwlrhokNfKRdysPmd7AOIfQGc/9ixSK6K/4
         7DFlnFmcno6mZXfo3Ou/bMEc/eO/KTQ0qczesjHD5M5KtHh84fmULNecfQS68+rXpKJa
         chYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969220; x=1761574020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kZeqZ1f1Kjlwt5WlxnlLU6u8FvqUbW9sH2W37ltY2w=;
        b=o/ArRA72Zf+Bw0bbLaDnTPfw8EfXjJJC+STJymJ6bHwZSMt6KYNFQsRas8Vfm/Y0LY
         Pqoa+WNfFT/LkgHhbukbDQ5op1LrJ+AvQpuS/v4+iH/gIRsQgJ6ehFuSU/EzIqz0yZ5O
         MAnr7Yx1ahl6rn+KJj9EvAOFeHXfSvsonKXDlGzn1ts3pdrTaJzZ3Tudvfe37uWdR43L
         lCcL+G7VD10oeI3CpWF7enlLHXvRKh/wTsxCBML7Ypw2EVbsOAFM1J9lLsWFL7uIlZy6
         kKg0sM397lPqfWNIi96l2k1GH6oA7ILd6zTQ3J4ui7Euk4UKag8CU+hHJTKm8lGxDbei
         tQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs+ypK+kX51lEXmKY9GOp0FkPRWgBCoXhU/4HTGsMdSvOn6VWhxvQ/y33SXrWazDWKPIk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/vdnggSvFC/ea+j8VQ28eMO2RM4mNzeedQkC7oa18yUODQZ9Z
	SaKZHgMUKRnP5I/yGogvStX7q56OyB6w4CpJK4mQ2Dn578TPo4sSyzYr
X-Gm-Gg: ASbGncufi9FfsTj4lxNyhnkM1R3pJG8jmJ4RIinRJWlER0cB2xYhZuRc+sVQKxL2SwV
	YHysoloofHxAu2FlPfSAzZ+Zx+fCPUPLAVmq//2TKqjkdDd+U03DWQkiN99oftParuHBUJJAMoZ
	jTvYjppBxC5VQsSjJJPFztc+QYWmelDviwxN3sgYw5rlBNnFk3KppuSqHUv0dm8QbCWY6kUdaaC
	tjSTR34bTOV1z7MCdbGm2CNxPY0ZXFeTvrYbFruRiwtMvl+Y54OHXj8dxx589M7q5ra+tm1APPb
	0/0hUCMKHMnhXK1LaXsysvbCKouIT74OLULjs32lOMtnxAvWutaBHPt4j43rwNqaBmF5Ar86MxJ
	TdvBf1rbgEMNHtvjJi6V5Gt3MHS7EApNnwMok9QuE79673N6EvQArvdcg6EfUK/ZZX1Y9gui+XI
	cnrn8gL0WRj/C+qpTow7DzNeeYQ7LVlP8Bdg38c21FlVhPEBWPM+yrqA==
X-Google-Smtp-Source: AGHT+IHVJ/TkOaDWREHUGoT4AMJTtZpCtqwsaqdgZXDvsL2iueitwKCDkh+1+uFs2HpKPMVPG6Ccmw==
X-Received: by 2002:a05:6402:848:b0:63c:1170:6572 with SMTP id 4fb4d7f45d1cf-63c1f6d94edmr11212098a12.37.1760969219915;
        Mon, 20 Oct 2025 07:06:59 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c49430272sm6767614a12.23.2025.10.20.07.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:06:59 -0700 (PDT)
Message-ID: <1bd36f10-aeb7-47d0-bc9a-e2078d5aeb86@gmail.com>
Date: Mon, 20 Oct 2025 07:06:55 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] reset: imx8mp-audiomix: Extend the driver usage
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
 <20251017112025.11997-7-laurentiumihalcea111@gmail.com>
 <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/17/2025 7:56 AM, Frank Li wrote:
> On Fri, Oct 17, 2025 at 04:20:23AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
>> which allow users to control the assertion and de-assertion of the
>> reset lines tied to some peripherals present in said subsystems. Some
>> examples of such SoCs include i.MX8MP with AUDIOMIX block control and
>> i.MX8ULP with SIM LPAV.
>>
>> Some of the aformentioned block control IPs exhibit a common pattern with
>> respect to the assertion and de-assertion of the reset lines. Namely, the
>> user is able to control the state of the reset line by toggling a bit from
>> one of the IP's registers.
>>
>> Linux can take advantage of this pattern and, instead of having one driver
>> for each block control IP, a single, more generic driver could be used.
>>
>> To allow this to happen, the previous approach, in which a single reset
>> map is used, is replaced by a per-driver approach, in which each auxiliary
>> device driver holds a reference to a certain reset map.
> Can you shorter your commit message?, basically, you just add
> imx8mp_reset_info for difference auxiliary_device_id.
>
>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index c74ce6e04177..c370913107f5 100644
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
>>  		.mask = BIT(0),
>> @@ -45,10 +50,16 @@ static const struct imx8mp_reset_map reset_map[] = {
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
>>  	void __iomem *base;
>>  	struct regmap *regmap;
>> +	const struct imx8mp_reset_info *rinfo;
>>  };
>>
>>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
>> @@ -60,6 +71,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>>  				  unsigned long id, bool assert)
>>  {
>>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>> +	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
>>  	unsigned int mask, offset, active_low, shift, val;
>>
>>  	mask = reset_map[id].mask;
>> @@ -144,7 +156,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  		return -ENOMEM;
>>
>>  	priv->rcdev.owner     = THIS_MODULE;
>> -	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
>> +	priv->rinfo           = (const struct imx8mp_reset_info *)id->driver_data;
> needn't force convert from void*


not a void *, "id->driver_data" is kernel_ulong_t


>
> Frank
>
>> +	priv->rcdev.nr_resets = priv->rinfo->num_lines;
>>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>>  	priv->rcdev.of_node   = dev->parent->of_node;
>>  	priv->rcdev.dev	      = dev;
>> @@ -168,6 +181,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>>  	{
>>  		.name = "clk_imx8mp_audiomix.reset",
>> +		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
>>  	},
>>  	{ }
>>  };
>> --
>> 2.43.0
>>
