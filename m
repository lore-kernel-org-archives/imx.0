Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9374BE1;
	Mon, 17 Nov 2025 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763365699; cv=none; b=SxjYCbV68hGrMGuiUJ0giDmGwUkW1QkXPbyyIoNtE0d/NM2WLg2N1C/SZZJpxzPXx2Ajez1mgDK+vfGrQc2HHrvJsul2yjCMGFSm6PzHZz4Ip2ACytymR3rrHef+dnOeIhuLI1qyHHxwjRsfWNHR1o6HtFxzct15klRgWHV2ufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763365699; c=relaxed/simple;
	bh=8Gnzf34GugnrnJDwOXJR9a33UMXiR8b/56uE7imixgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwSQXBvug7qFqagSerBxyggXrBXMR6OSI/eXRXVAlYiaUd0SkyvNMsPQB6VfIv3hAE0cB2HtBwERsN4p1SdMeRnDdMgqhzhLKS8GwYRW9muO2NAip8HocMyjZiw5QqSI/2Qrwc57fKtEsnlQnZc/zmyZVmd9NYg5imPoYSO5egI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ztb4/PcX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ztb4/PcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD15CC4CEF1;
	Mon, 17 Nov 2025 07:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763365698;
	bh=8Gnzf34GugnrnJDwOXJR9a33UMXiR8b/56uE7imixgw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ztb4/PcXMEKuIJFU9NUp3ZX2rC0V9zLjD3lvlRkbP5EGi3RSFDco6C5w/hJGv+OWV
	 YsWr+RhEnSJl+7irFaUnaQbQTgwxr7HvjIAP/QNoc8/3vTrRLwVXQs9nmRPosPQ/cq
	 xGGlyVFJ4uVxWfkggX3ylUZKkSa9JF7gaHR531M4yDHNYvOze8TpD8+MbculaWtox7
	 6Qws+KiTF09Zr8a1/1btplaVmmZP6askJrdKgztFHzdh3HmIUQgI8aRhc69IMUhyDA
	 haKlfYZny91D0atktE8QAjaxrfo1NyzGIJehdHY7k8QV6zQrsyG29pr0t4BfBvb46/
	 lGedAe1U844NQ==
Message-ID: <285a5651-b621-44ba-a06a-523f94e949b3@kernel.org>
Date: Mon, 17 Nov 2025 08:48:13 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: moduline-display: fix
 compatible
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
 <20251114-disp_fix-v1-1-49cbe826afc2@gocontroll.com>
 <20251115-liberal-lori-of-youth-a9c3fd@kuoka>
 <03a64900-8ef3-40b9-94bf-c953de824902@gocontroll.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <03a64900-8ef3-40b9-94bf-c953de824902@gocontroll.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2025 08:33, Maud Spierings wrote:
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> On 11/15/25 12:53, Krzysztof Kozlowski wrote:
>> On Fri, Nov 14, 2025 at 03:11:49PM +0100, Maud Spierings wrote:
>>> The compatibles should include the SoM compatible, this board is based
>>> on the Ka-Ro TX8P-ML81 SoM, so add it. Also add the hardware revision to
>>> the board compatible.
>>>
>>> This is a breaking change, but it is early enough that it can be
>>> corrected without causing any issues.
>>>
>>> Fixes: 24e67d28ef95 ("dt-bindings: arm: fsl: Add GOcontroll Moduline Display")
>>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>> ---
>>>   Documentation/devicetree/bindings/arm/fsl.yaml | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>>> index 21b7168d61f5..8949a98acd87 100644
>>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>>> @@ -1105,7 +1105,6 @@ properties:
>>>                 - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
>>>                 - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
>>>                 - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
>>> -              - gocontroll,moduline-display # GOcontroll Moduline Display controller
>>>                 - prt,prt8ml             # Protonic PRT8ML
>>>                 - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
>>>                 - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
>>> @@ -1163,6 +1162,12 @@ properties:
>>>             - const: engicam,icore-mx8mp             # i.MX8MP Engicam i.Core MX8M Plus SoM
>>>             - const: fsl,imx8mp
>>>   
>>> +      - description: Ka-Ro TX8P-ML81 SoM based boards
>>> +        items:
>>> +          - const: gocontroll,moduline-display-106
>>
>> You need old compatible here as well, you cannot drop it.
> 
> The old compatible should stay in the above section then right? Because 
> the old compatible never matched the pattern with the SoM compatible. 
> Should/can I add some deprecated tag to it then?

You could deprecate old list but there is little benefit of it, but the
point is that your final (new) list must include old compatible because
otherwise it is a potential ABI break.



Best regards,
Krzysztof
