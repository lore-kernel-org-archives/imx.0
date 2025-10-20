Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA0C29ACF6
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961600; cv=none; b=kXGkhdPmtyLgtLyidxrt2qioaHF/SDfiqMJmLk5VGS1K1Cw3a8hpLxzLk18EH0AElXRliKhlu1ZJqAEcLmNTuknQDoaklKMK6qxoXd/fK0xqJ6vE8gCbKbnyhVSJPHGPxh/q9UNpPAbjXwln9E1awH2PXSaogQTTdhne1FDO5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961600; c=relaxed/simple;
	bh=+tJtGhzL8/nlJ0ZRUo4lnx1z48ZNBBmtc/H2ux9Ns1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAglobGXgIkX+sHLE7fppmEP+O2XRKUlCxBuBFP/HJgDOtLDnp0BISyECxDfXqHCrosbi0DUIVaOElYgOV6wkYHeXvw/vzwLfMKIjdq8WGe3W9ewpewPzEKmUjNWma/DylKbHQrM6wAt28kgosl5mzv1OqBU9JnD02LRRCRIMDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4Ok6KIf; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4Ok6KIf"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b403bb7843eso786190166b.3
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760961597; x=1761566397; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r9qU6FzgzJIkijGhPwFvDcu1xBSrqOMq/g46aIW1/Vk=;
        b=k4Ok6KIfjcUyV9OTGfQtxHdiEQd7f8hTkjqdVIPl3QsH6L6DVFo8ABo+359ndiQTIh
         Zxz98OuIRiyHOLdtddyyVzmQNhVv0JIRvck1aaLSuYKWS3YGuaVr6qrf8Tw+pIxeKa2r
         +7C6EszZm3jqqwYhyZtvEPTvVLtnJHC60qRMHLkLQ6QDOlYnSCuPeUKzX01D1FlVkJm3
         OfRQfRzouCU1pLo84WbHVh5FBGvn9jTRom3UvrQU63ndspDN6ET0lzknPlpoKIxgCUPH
         8E3cJcBnr0/TU7ZWq4Dgam5AvpJPHPZv3PeP99UA+3TMzP8oAKT8zoL35lJDtz1QUwmk
         2LIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961597; x=1761566397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9qU6FzgzJIkijGhPwFvDcu1xBSrqOMq/g46aIW1/Vk=;
        b=Gnw9xJGE923zJ1AZ1DvKsV/nsgU33U41jNKNzJBmeTM+TBdMonEkr0ENucFZFPgMM3
         hmmux7t02GwmnvqmVzB0rqCsULq1mlGc8257AtUa4AqkwNozgjSmNaTvVSiDr2xoey7m
         LO/4rjqyvNfYl1somIPXiaJqGKudgwAWGDejq7zdUFcl8IBEqzQ+ZI0rc0a96bjN/O5p
         u5Q2/Q2MIp6pUahDPbsUiTlqVtomtyvrsC7vOEB3sA/zosRVQ5m5dDeWgOf05U/I6lQy
         47709ljfaL/+o9LCDO1m9VlXy8D5p5bNiBblRDFB/ZTzxVRKG9A8/0kf+UeiiTkZHWJD
         uAdg==
X-Forwarded-Encrypted: i=1; AJvYcCVmEPUS1mDu5Op2m6C+nqIFOqNnlQfeei7lCN3JSHcOSi0RXjB9BlyAPRD89zRfWs6QcxQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf/EyzQIbqhE2vwvZ55pP7Hbthwi/1WwuQVRj5RtWOCGCVNx9P
	MPf2pzv1ceb/J1YGiFfiCSHbZEcC7+QFIyeSIVxQDgkqvJiEJEu/t6sh
X-Gm-Gg: ASbGnctJgImCh1zOSvWVyWQjQeG1JZKYrJH/JEX1L03/qz9mC0RXxFg9FhFeibFKiqq
	qvYre7pADv5C4MmPdEURKZeXpXL7SeP08rEmb2YnmayYftTgXFX/nAm6DrjlUdHnd/iRWSNcgni
	IeqAn3B0fwrB0/uv6EzdbHhWaFpGZ5bsrLqvRoiysIYZBH2Z7bOKV+2iglULj9SMLIHk3DBd0Rt
	BXqhwtqg4URY9MkQTrElZw1rwwBJJO/NgT2zeUa2p+XNCcj5sDkzcTCbipsbMNMPIBtrCD1cY+W
	XDVcLf6OxD302dv7UFXvc87QJ4wtQ0/q6cuIUvaKxeoPDfmnSKx1PV5hkeEt0+VsAtJ5Cd1x6e4
	cJtJTOud9gruiXRk6qNB1+nRmgZWE+62XzPBzsAUWArqsySzYR60FL1nYfsB/BJ8YpcvpWHxoun
	BntGdSMIHnj2/QfhBiGs/TZKi7HVDt6yPm
X-Google-Smtp-Source: AGHT+IEBXKsErf4ichcBkQA9FZmSnI5DZeli6KgMkaabKrVEZ2rxSHwXbSqWavZ4Sb3eNG/IyTW7tA==
X-Received: by 2002:a17:907:70d:b0:b42:9840:eac5 with SMTP id a640c23a62f3a-b647482e03cmr1529682266b.61.1760961596496;
        Mon, 20 Oct 2025 04:59:56 -0700 (PDT)
Received: from [10.25.213.231] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725d80sm777107466b.67.2025.10.20.04.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:59:56 -0700 (PDT)
Message-ID: <7b4936f5-77ea-4077-94bc-38bb5c63f4c3@gmail.com>
Date: Mon, 20 Oct 2025 04:59:52 -0700
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


yeah, but the commit message is not trying to explain the code, but, rather,

offer a bit more context to understand WHY we're doing this. However, I'm not

fixated on this so if people don't think it's useful then I'll just shorten it.


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
