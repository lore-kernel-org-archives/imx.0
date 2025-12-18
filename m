Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3404A313E08;
	Thu, 18 Dec 2025 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766086006; cv=none; b=DWeL9/LbFEolVGRxpYpX+3Nucu4DdjXO49XuxLgJovVodGLjfFUQ3zIclkvJxMRtWkrGKu9RB7roL0TU4imMiI4YYSAlAQDweWZBAFCGAN0bySlztqqv8pyUgsmm9WD7WE23DgI9IWJyr7myb325caMZD104zUwsA4wDfk2DGKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766086006; c=relaxed/simple;
	bh=8ougrI2F0o6tZCTw9ybr+PvkeZpYBrHjnd8HgfDiNkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOv+PapPYr9TNytRZhOFHWeQc+mVLhPf61ejGol/Ty8V/QxF/yUAL0perStFt1W/+dbo/mP/NGqKI0gqIsJg04k9GFnV8dUWla+CUdvn1z7IEbmroqhxsiCrfmPnUH5H5g57WW1ETJSe77Qf+oJBICqf0e4SPXn6MNkz4JxtLgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTapCRAE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTapCRAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DE2C116D0;
	Thu, 18 Dec 2025 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766086005;
	bh=8ougrI2F0o6tZCTw9ybr+PvkeZpYBrHjnd8HgfDiNkE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uTapCRAELi9WA5wcbSRhHNKgOTwYApwQOZnW+kab86opSG+800gSNesmWBJ7cngW6
	 roMgUOp1Wtk6giYTh0cyLo6GvFm/apnGGMG/JTDwVhw9ZS+eYvQLmU2SZan8fu0oJo
	 mJtdMe8GwYSXPfBaoN/sa/44o6rCWZ9koR6f6SG2NKXE+VhyJrrGxTkLrTdmdtoGOr
	 GHQWZO4OmYlQGngMGtXfXvVm2+N8pKqeRhhhtnqOPJfQLMDl0HvYJiQRUjni3rGG00
	 6CJD9JwZLxMBqha5fiM5fKEIIje/1aKleeFnKiQPnqK5GZWAHQrjqFYzusF6kSvnCl
	 +cT7i34KoL2Ug==
Message-ID: <7127040f-55ab-4bfa-8795-1df76085470c@kernel.org>
Date: Thu, 18 Dec 2025 20:26:35 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
To: Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>,
 krzk+dt@kernel.org
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215161706.2ea3wtu3xlwcxxar@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251215161706.2ea3wtu3xlwcxxar@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/12/2025 17:17, Marco Felsch wrote:
> Hi Liu,
> 
> On 25-12-08, Liu Ying wrote:
>> Hi Marco,
>>
>> On 12/02/2025, Marco Felsch wrote:
>>> From: Liu Ying <victor.liu@nxp.com>
>>>
>>> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
>>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
>>> field. Document the Parallel Display Format Configuration(PDFC) subnode
>>> and add the subnode to example.
>>>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> [m.felsch@pengutronix.de: port to v6.18-rc1]
>>> [m.felsch@pengutronix.de: add bus-width]
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>> ---
>>>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++++++++++++
>>>  1 file changed, 92 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>>> index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492bcbabc8a560d8e707cd 100644
>>> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>>> @@ -26,6 +26,12 @@ properties:
>>>    reg:
>>>      maxItems: 1
>>>  
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 1
>>> +
>>>    '#power-domain-cells':
>>>      const: 1
>>>  
>>> @@ -40,6 +46,60 @@ properties:
>>>      minItems: 8
>>>      maxItems: 10
>>>  
>>> +  bridge@60:
>>
>> The dependency patch series mentioned in cover letter has two links in it's
>> cover letter.  Reading the patch sets pointed by the two links, we may find
>> Krzysztof's comments - the child nodes of the blk-ctrl should be completely
>> documented.
> 
> Thanks for pointing this out.
> 
> @Krzysztof
> Requesting to add everything seems not feasible if everything added
> should be tested too.
> I don't see why everything should be added in one step, since the base
> .dtsi isn't added in one step too.

Because otherwise we do not see entire picture and people post incorrect
bindings, claiming they are complete picture, like messing nodes with
addressing and nodes without. So sure, if you do not want to post
complete picture, we cannot review that complete picture, therefore YOU
MUST POST CORRECT CODE.

I will not be taking excuses later "we did not know that such code is
not allowed". You must know all rules.


Best regards,
Krzysztof
