Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8E3421EFC;
	Wed, 21 Jan 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989430; cv=none; b=YKwmyvckUVznIIbju81lUgMrDpuopE2oUkE32pP5nzCpt3Sksssr7sL0AJAbJu6dnYRuPDDN+AgyQ3ImUtDpePmpfA6WCllGibcyKZl5O5D9DBy1XfS2LwbzIZIf2Xz0rsJ0iRL1MK3Kpj6iYJdbQozKXVfBOUdDHTI0qFl1Vew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989430; c=relaxed/simple;
	bh=XNJAbMF/tk04TOLbUK+w8TPnDQmAIYgon71m03EKDDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlEsXQ9HiOrHKfb+LrJE0nQlmEItX3hkmrW73Co1OnT959l5IYidWcydgo9O8Kk4s69iTigQrIC+LaMW+QFWRGMM5pcDFbEhgyHbrxZeP3QY/W5nNFnld7JPHNT83WKldCbJ94bwMPJSClDkFYktfmxw2ygzYJMidbbJqhaSHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bK4Ks+4g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bK4Ks+4g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A89C16AAE;
	Wed, 21 Jan 2026 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768989427;
	bh=XNJAbMF/tk04TOLbUK+w8TPnDQmAIYgon71m03EKDDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bK4Ks+4gcOyOJY9ZSGMCBJsypllc/rYy5THajl5wn1DCtPL9KZhQOy0PyNBAhOSfK
	 wToUOJthyqD66wpggiIYpy+Ys0nsn2efmtXTP1jlK8Q8f4CYxOoESbLAnn/X1n2OE6
	 v3G4MdOOu4q0Ygg6zA2rfCd9zyrZqON7cVW7jdlkuByqTUdgcXK2Xzg2Xhax4eZQPt
	 pJ6J10VR6UrCSGmtI8SBAsEq5Ap/bJAG4y9gRUBlJYkvT15T1vXWWLdQbLOEh+bxsb
	 oGfFfgU6E5AiS7V4lwL21ftEpESY9lg9W3ybmS0GoRioBCQN1vB+YVPCXoROjvXifr
	 GACQYd4dqaacA==
Message-ID: <27e88ef0-afc9-4108-a136-754a90ade0bd@kernel.org>
Date: Wed, 21 Jan 2026 10:57:01 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
To: Sherry Sun <sherry.sun@nxp.com>, Frank Li <frank.li@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "dario.binacchi@amarulasolutions.com" <dario.binacchi@amarulasolutions.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "Markus.Niebel@tq-group.com" <Markus.Niebel@tq-group.com>,
 "matthias.schiffer@tq-group.com" <matthias.schiffer@tq-group.com>,
 "y.moog@phytec.de" <y.moog@phytec.de>,
 "josua@solid-run.com" <josua@solid-run.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 "primoz.fiser@norik.com" <primoz.fiser@norik.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
 <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <2394637b-f85b-47b7-ae30-f7ac2be49c59@kernel.org>
 <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/01/2026 09:05, Sherry Sun wrote:
> 
> 
>> Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
>>
>> On 21/01/2026 04:18, Sherry Sun wrote:
>>>
>>>
>>>> Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
>>>>
>>>> On Tue, Jan 20, 2026 at 06:26:03PM +0800, Sherry Sun wrote:
>>>>> Add DT compatible string for NXP i.MX93W EVK board.
>>>>>
>>>>> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
>>>> b/Documentation/devicetree/bindings/arm/fsl.yaml
>>>>> index 93ad6f0027d0..1769f243d70f 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>>>>> @@ -1432,6 +1432,7 @@ properties:
>>>>>                - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
>>>>>                - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
>>>>>                - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
>>>>> +              - fsl,imx93w-evk            # i.MX93W EVK Board
>>>>
>>>> Is 93w 11x11 or 14x14? can you add suffix to keep align existing one.
>>>>
>>>
>>> Hi Frank,
>>>
>>> IMX93W-EVK is the official board name, it basically reuse the  i.MX93
>>> 11x11 EVK board, as described in the cover letter and dts patch. I
>>> prefer to still use this name (imx93w-evk) to keep align with the board
>> official name.
>> It's second case, previous was frdm, with the same argument. I don't care
>> what you prefer internally. You must align to upstream and all NXP boards are
>> called soc-foo. Not socfoo.
> 
> Hi Krzysztof,
> 
> The soc name is imx93w, the board is basically reuse the i.MX93 11x11 EVK,
> so do you suggest we name it fsl,imx93w-11x11-evk or fsl,imx93w-evk?

If SoC is imx93w then your compatible is wrong. It clearly says imx93
(no "w").

Best regards,
Krzysztof
