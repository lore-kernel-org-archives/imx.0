Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E44D211A18;
	Wed, 22 Jan 2025 12:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550679; cv=none; b=QeVULz4I8QBjim6Af6XB6JDRm/AJBNMYOmraL/s8EzyLyJTVFnqAquhV7hUUqWltU1YayNZWVm77MDJWwMxOvxd0HUfVjBJo9lgKgKDgbZbANhrFfzhZx71nb/+cFU1SKnvxH3k8PO+ImEN7zdBwlduRnBSNC2nN0L2jKhV0KP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550679; c=relaxed/simple;
	bh=iH9Nwh81chy+CHhQ5bMOenLErLnoG0ScuKC6ksTWUv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urL5A6AhYfeSpvkChsaUCABoDnFsZSk8zn9u3ZcE9jYjuEalR+m5g/E/XAZGtg4eHXPFLz0hRNjQZZtrqrB4/MWl7GluHQZzhHqlUgoCdCuDGBK923Mix2Pee2vkN53PljGFu6EJeCR6Dv9yIRIjM6Zprc+ZgMmiMIuzYohkQV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsJyP1tk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsJyP1tk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92799C4CED6;
	Wed, 22 Jan 2025 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737550678;
	bh=iH9Nwh81chy+CHhQ5bMOenLErLnoG0ScuKC6ksTWUv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PsJyP1tk8tlX7Ryb/c6qPchSnyERc3fgaYHkKXkfgeBUJYewerBbJrKwEQAgRPXV0
	 GoTVzZgkbYlQDsIRpU/z951Itnf0dtf4qMkpITu1cyxarz3nXQcMYQoaEEXtHwmErj
	 aVm8wXOTVreknm7hAihxXaj1EBrXvhYVFJHsZVyqJ+oQZVmMbO3TXZlGDXb9STFRh+
	 xZqYy4tqs0OoEBOOc5YJlGYsxZO7iihnrLyiy8iQrzBuLeVgj3RZN7KFQwi1FTdQ8W
	 lzfnukoTC8uOIopGfOjP97wDmdBufw5VDCEjtQ5bR/R9B2WcxESKkw5QMvS15N9Axh
	 wGfkeJ4s+olcg==
Message-ID: <d79c4d59-2186-4846-a202-aeff6d14d0c1@kernel.org>
Date: Wed, 22 Jan 2025 13:57:52 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v12 4/5] firmware: imx: add driver for NXP
 EdgeLock Enclave
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
 <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>
 <2fb2db33-9d45-442a-bfb9-55173751f20f@kernel.org>
 <AM9PR04MB860468CF15C1CC4B8EB257A695E12@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <63fb9cc6-b57c-45bc-8da2-7bcb871d9887@kernel.org>
 <AM9PR04MB86045B01999B7B2E91434D4E95E12@AM9PR04MB8604.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <AM9PR04MB86045B01999B7B2E91434D4E95E12@AM9PR04MB8604.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/01/2025 13:55, Pankaj Gupta wrote:
>>
>>> NAK. Node can be called firmware and your entire driver collapes.
>> The macro is updated to verify the correct-ness of node-name.
> 
>> NAK, do you understand the term? I provided the reasons for NAK.
> Your suggestion is to enable the driver for all allowed node names.
> 1. firmware
> 2. secure
> 3. secure-enclave
> 
> Understood, will allow these names for the driver.

No, you just cannot have such checks.

> 
>>
>> +               (!memcmp(dev_of_node->full_name, NODE_NAME,
>> strlen(NODE_NAME)) ?\ ((strlen(dev_of_node->full_name) >
>> strlen(NODE_NAME)) ?\ GET_ASCII_TO_U8((strlen(dev_of_node-
>>> full_name) - strlen(NODE_NAME)),\ dev_of_node-
>>> full_name[strlen(NODE_NAME) + 1], \ -
>> dev_of_node->full_name[strlen(NODE_NAME) + 2]) : 0)
>> +                               dev_of_node-
>>> full_name[strlen(NODE_NAME) + 2]) : 0) : -EINVAL)
>>
>>>>> +     info_list = device_get_match_data(dev); +     if (idx >>=
>>>>> info_list->>num_mu) { +             dev_err(dev,
>>>>> +                     "Incorrect node name :%s\n",
>>>>> +                     dev->>of_node->>full_name);
>>>
>>>> Nope. "firmware" or "secure" are correct node names.
>>> New check is added to validate the correctness of the node name for
>>> this driver. Replaced the message of " Incorrect node name..", with
>>> the help message.
> 
>> You did not resolve the NAK.
>> 1. You cannot reject correct names.
> Ok, Understood.
>> 2. You cannot add undocumented ABI. You could try to document it, but it will 
>> not solve the first problem.
> Ok. Will not add the ABI document.

Hm? I said you cannot add ABI without documentation and you say you will
not add the ABI?

Well, I NAK-ed this patch and consider all future versions having
anything close to this NAKed as well.



Best regards,
Krzysztof
