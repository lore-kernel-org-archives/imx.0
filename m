Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9683D66
	for <imx@lists.linux.dev>; Fri, 31 Jan 2025 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336230; cv=none; b=ZOWaalmcgqThLFTfhNjRCoSLDBg5v+KYQf8KyWFTGOhT7Xq6NOLobRNmIBVLZjwNysuKRebYdPwkZQXCSmIwcuOtA7WMnp5E+XzB47Sc4sQLrfSASnAmtMJcI5LGRZsMlF/6Lja3hWtADIX9Q54rwGLrCvu03a9DECwVJvAeQOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336230; c=relaxed/simple;
	bh=u6io2rkyrFfSD/kYmtPdN1ftqCVznnHTgIspLZw8ZWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxbcXDNrK1jn9OBxbtAsBF1eLt4qKJ3lz53mK5Zmmz2CwTPiaDKX8nbSK93ySOHRWzSic29QAbuSy0M5bdBSX2OxDeWP3CNyjdsT/wfB2hkYV8hhWq2SohI2NxoeF5vkUi3OeAc7VlJ9ShnHGnu9jurO+9w9/R1vThAPfBohEhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ2qU661; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ2qU661"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE48DC4CED1;
	Fri, 31 Jan 2025 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738336229;
	bh=u6io2rkyrFfSD/kYmtPdN1ftqCVznnHTgIspLZw8ZWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dQ2qU661FPHJKZ8CGbJQ00jNbDWLh35+RxPf/WAC4qdzKnDUb8wsVjf2Y9FOYse2E
	 hJV2a28l464sHVuXMEaPpI7nvl6lGnml9z1wAwE6yQAU/Gfp777VWW801FcKUmgR3p
	 2C854HL3ImYjuOXToABkIYbjKb2dh1DzVGDeu++KxeeJST+z13IQKxGZq5/VP2i4Se
	 kQVdf1lhEJtt3flIkp7r6Ev+Bn6lz3JVIKqmFenac6w6WewjHNqqWGp+cWULfm+L3G
	 VMRwNPlrJuPpPeVS1oOJUhY0jera6Z/UvhHqJTnro/ucngT5ZlS+nU1sIIOzJH2Gjf
	 Z7yrpBwD1BY0g==
Message-ID: <40676b09-82bf-48b5-9a06-3057cd595815@kernel.org>
Date: Fri, 31 Jan 2025 16:10:26 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] reset: gpio: Add self-deasserting reset callback
To: Shenwei Wang <shenwei.wang@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 dl-linux-imx <linux-imx@nxp.com>
References: <20250130215306.60589-1-shenwei.wang@nxp.com>
 <dca86a09-b763-4a0a-bb46-9cf6043cffe2@kernel.org>
 <PAXPR04MB91858A6F0917109DFF33110B89E82@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <PAXPR04MB91858A6F0917109DFF33110B89E82@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2025 15:58, Shenwei Wang wrote:
>>> +#include <linux/delay.h>
>>>  #include <linux/gpio/consumer.h>
>>>  #include <linux/mod_devicetable.h>
>>>  #include <linux/module.h>
>>> @@ -37,6 +38,17 @@ static int reset_gpio_deassert(struct
>> reset_controller_dev *rc,
>>>       return 0;
>>>  }
>>>
>>> +static int reset_gpio_reset(struct reset_controller_dev *rc, unsigned
>>> +long id) {
>>> +     struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
>>> +
>>> +     gpiod_set_value_cansleep(priv->reset, 1);
>>> +     usleep_range(10, 20);
>>
>>
>> No, because this is some arbitrary value which might or might not work.
>> If this gets accepted, next person will change it to their own need.
>> Then next person will revert previous change... and so on.
>>
> 
> If the arbitrary value is a concern, would moving it to the DTS be an appropriate solution?
> This may give the user more flexible.

Sure, as discussed when this series were upstreamed and as discussed
with Sean's patchset. BTW, Sean's mentioned need to revive his work, but
I think it did not materialize.

Best regards,
Krzysztof
