Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF3D27934A;
	Tue,  4 Mar 2025 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741099824; cv=none; b=hX+90zhzTUgMnFmF9m2cEJpsWLOY1XH/mrswS+OQULSi7+meBmUanTWQBzls0zEQmclUbjFOz9KZnxH4C+pqKQYuKwZfAaepBa5ptho+mTw7Z8vvdH2k8J2MqtKD/Y872VNmx1Sgw/NMIsNWIy4hevUZQV4vQ31IjSsEk5KBDNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741099824; c=relaxed/simple;
	bh=wxuGA9UzLIOrg4OTobYhGzJKLbbcpwSezUJJ1dDX/1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUxRu+aWDzhVEKC1U1Fi9pHpWk00GVUcPZXIz7oncGTkZERM7AnIT+lV8UPgJ/IqmtLyyN0j9dbMefCDWSK+4IFE2RGdFATVlq+dCtyJH1cI+U4Gm3oQZI096Eez1ra9L3aSy0lXYXSdyJjwXmsFw9AsWomPhMUD2Cvw+CZldOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V03o+yDQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V03o+yDQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C512C4CEEF;
	Tue,  4 Mar 2025 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741099824;
	bh=wxuGA9UzLIOrg4OTobYhGzJKLbbcpwSezUJJ1dDX/1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V03o+yDQo3UKaGkzhYQLEv7z6AJOdfgSx6N7PVYr0Q81cx8qf73xKXX7KH7rUj9BL
	 wR7GXTamSdW1DedzgFCHlPimRbqnBjai74uiE5pKtOgTa+ObphUHYlMRGctpYsAYlP
	 /oNFz+Y+unMjhy5VUR2fNxAP9ADsX1jjYAA46AgmZbkDzd/jNR7t5MOp+S/R/HP0BC
	 UvU0faxqwjneeIXBSx1EalwdF6V9IePYprn9dHk3L1XJhPJdlcch88AQ2UQwswU2ZL
	 s887IfOCZSHCfrrGzQ/atdgrTCvCRUbzINK6ljSoB+8bXt0r/7JONcZGBJdHipK8aw
	 /oGu2fri5CRwg==
Message-ID: <cdcfdbfe-7186-4a29-a39b-7253070d889c@kernel.org>
Date: Tue, 4 Mar 2025 15:50:16 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property
To: Jacky Bai <ping.bai@nxp.com>, Rob Herring <robh@kernel.org>
Cc: "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-2-ping.bai@nxp.com>
 <20250304131314.GA2441686-robh@kernel.org>
 <AS8PR04MB8642D20F0F5A7E8622A7685F87C82@AS8PR04MB8642.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <AS8PR04MB8642D20F0F5A7E8622A7685F87C82@AS8PR04MB8642.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/03/2025 15:40, Jacky Bai wrote:
> Hi Rob,
> 
>> Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
>> interrupts-extended property
>>
>> On Tue, Mar 04, 2025 at 05:31:24PM +0800, Jacky Bai wrote:
>>> Add interrupts-extended property for edma that has multiple interrupt
>>> controllers used.
>>
>> Did you try using interrupts-extended? No. Because either is supported by the
>> tools already.
>>
> 
> We need to use interrupts-extended property for i.MX94 because for the edma's
> interrupts, some are connected to irqsteer interrupt controller and some are connected
> to the GIC. make dtbs_check report error, so I add this dt binding changes.
> 
> Sorry, Which tools are you referring?

Linux, dtschema, everything.

> 
>>>
>>> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>>> ---
>>>  - v2 changes:
>>>   - newly added entry
>>> ---
>>>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 11
>> ++++++++++-
>>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> index d54140f18d34..549afb8611a9 100644
>>> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> @@ -38,6 +38,10 @@ properties:
>>>      minItems: 1
>>>      maxItems: 64
>>>
>>> +  interrupts-extended:
>>> +    minItems: 1
>>> +    maxItems: 65
>>
>> Doesn't match the size for interrupt-names:
>>
> 
> The interrupt-names are only true for vf610, maxItems is
> enough for such case. do we still need to update it? 

They always go in sync.

Anyway, you did not get the point of Rob's comments: this patch is
neither needed nor correct. Just drop it and test again your DTS.



Best regards,
Krzysztof
