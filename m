Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381C328257
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769631901; cv=none; b=UqyPvNjfaVOLdfzU81b0kiR9ypBvbztiUHDZKv7RMLKc20qg8MOveSw1H/skC8lZqlmBQqMJCoNHv2voKwxHwrE8yrW2dI0WlQxry+mJaEVg2UkMzmAthBVENHZTzQo2KER3mKJf2psvdcfDkfnAR51D7wHyjkAssPhSjBXa4yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769631901; c=relaxed/simple;
	bh=TLdJZat0NqHxM6cAaIaO03kfgfUH8hhW+XaWOdcNM/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NB7pJ4sWrfIrZgyI2q3a3NmtbPPkDpXV/byR6T9sBswJZ1DcwwD5gNgdxCud67aes8Q23XIpnzEnqTrBxJQEgiSX86e36b3WF7NapidSBoH5fq3+h4pz1gVCWbSDpIK0XDXioohoBkY1zLQjIEcpsWp6+yoDOpS4v0vfsoiUCzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=QwJqePQn; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=QwJqePQn; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="QwJqePQn";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="QwJqePQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1769631892; bh=TLdJZat0NqHxM6cAaIaO03kfgfUH8hhW+XaWOdcNM/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QwJqePQnpoyfxiYfPX59X/nUITxCuJRj/q2+l43J8XXedWaeNGSQxMOPb8Xlev59Y
	 odYQEEo5H5N1Em2cdwyHlkxmPmUCdYYeqw4dm6BQWCXpV0vbAJTJHoCWq9ndEum7my
	 0QC13Z1wMXA1G7h2YOgVGP7KqmBpePs8Jr2Qpre+roNPTRCJ0+InoBHg3vpiCnWrl1
	 AlUD+Dw5j84RiVdm69zr+7C8wVkokNqu0cSlYAJD4jYcax0NfCXlPSHbpMbi4H4MiO
	 r8Ik+9lstFFz0WCYRaYJ7t2x6WBi9gNPylTWUaUcXX68/CHg/VfMmvtdLEZSPlwjWR
	 0SZE8B+U9BmNQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 925903F025D;
	Wed, 28 Jan 2026 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1769631892; bh=TLdJZat0NqHxM6cAaIaO03kfgfUH8hhW+XaWOdcNM/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QwJqePQnpoyfxiYfPX59X/nUITxCuJRj/q2+l43J8XXedWaeNGSQxMOPb8Xlev59Y
	 odYQEEo5H5N1Em2cdwyHlkxmPmUCdYYeqw4dm6BQWCXpV0vbAJTJHoCWq9ndEum7my
	 0QC13Z1wMXA1G7h2YOgVGP7KqmBpePs8Jr2Qpre+roNPTRCJ0+InoBHg3vpiCnWrl1
	 AlUD+Dw5j84RiVdm69zr+7C8wVkokNqu0cSlYAJD4jYcax0NfCXlPSHbpMbi4H4MiO
	 r8Ik+9lstFFz0WCYRaYJ7t2x6WBi9gNPylTWUaUcXX68/CHg/VfMmvtdLEZSPlwjWR
	 0SZE8B+U9BmNQ==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 0E9A03EF50D;
	Wed, 28 Jan 2026 20:24:51 +0000 (UTC)
Message-ID: <f213bdb9-7104-495f-97fe-8190af3ec577@mleia.com>
Date: Wed, 28 Jan 2026 22:24:50 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v2 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20251015184846.2509016-1-Frank.Li@nxp.com>
 <b75b30d4-e33e-4620-bc37-56b36612364c@mleia.com>
 <aXppf+3Nm7zsYaWE@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <aXppf+3Nm7zsYaWE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260128_202452_620815_0EA6268C 
X-CRM114-Status: GOOD (  14.46  )

Hi Frank,

On 1/28/26 21:54, Frank Li wrote:
> On Wed, Oct 15, 2025 at 10:48:47PM +0300, Vladimir Zapolskiy wrote:
>> Hi Frank,
>>
>> On 10/15/25 21:48, Frank Li wrote:
>>> Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
>>> warnings:
>>> arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
>>>
>>> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>
>> I'll take it for v6.19, thank you.
>>
>> If you have any other changes in the queue, please feel free to send them also.
> 
> Vladimir Zapolskiy:
> 
> 	look like you missed this patch.
> 

You are right about it. I consider it's pretty late to send another PR
including this change, and thus it will be postponed, I'm sorry for it.

-- 
Best wishes,
Vladimir

>>> ---
>>> Resend
>>> - colloect R-b tags.
>>>
>>> change in v2
>>> - move to nxp lpc32xx.yaml
>>> - fix ea,lpc4357-developers-kit include lpc4337
>>> ---
>>>    .../devicetree/bindings/arm/nxp/lpc32xx.yaml  | 22 +++++++++++++++++++
>>>    1 file changed, 22 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
>>> index 6b7f5e6f99cfb..1e290f16a7a50 100644
>>> --- a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml
>>> @@ -22,5 +22,27 @@ properties:
>>>                  - phytec,phy3250
>>>              - const: nxp,lpc3250
>>> +      - items:
>>> +          - enum:
>>> +              - ea,lpc4357-developers-kit
>>> +          - const: nxp,lpc4357
>>> +          - const: nxp,lpc4350
>>> +
>>> +      - items:
>>> +          - enum:
>>> +              - ciaa,lpc4337
>>> +          - const: nxp,lpc4337
>>> +          - const: nxp,lpc4350
>>> +
>>> +      - items:
>>> +          - enum:
>>> +              - hitex,lpc4350-eval-board
>>> +          - const: nxp,lpc4350
>>> +
>>> +      - items:
>>> +          - enum:
>>> +              - myir,myd-lpc4357
>>> +          - const: nxp,lpc4357
>>> +
>>>    additionalProperties: true
>>>    ...
>>
>> --
>> Best wishes,
>> Vladimir

