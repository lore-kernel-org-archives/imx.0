Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439412;
	b=iAco4q12SALh77T53Y375ElJv3iAs36CFumtORw8R/X1zEBwbXX/+jVUjHqaMiwJpXjG
	 G/f7SdVt3e68oQEn3tNO0vOXBY+xVlDruK8fD4kZrE0ISlA3zB/KNPz+W9BUjiNe4KoeX
	 qAxRsnHU/f/kSpqcRt/awIlWjW4OqruqTOBQjPOzq7hQGnJQBXjTuiBevIXyJYZdWdsbK
	 kZLgB91g+8iM7IcgbW2qwCZboA5Ac0AUSGZ8bz0yjm+vCUuqORR9iiPq//xQs2dr7Qa7t
	 z5o0mlO7oOQsO0DkEmQxJmRZp7VtaQlqd6pBDepiwD3ftAV7OBY/rKa6TJxxxEI01Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439412;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+3y6Gl+AMYAPKZ5GKJkPS2Y5iAYxufirKNhQH64c5DQ=;
	b=QG7GLGUgojeHEcRKqGig0UnTJlyxeXWg/gLjgG8uc71z9rmVsO5epKZY0WhU1o/d3Tzh
	 LbH/UXBR6Zv0vIspSjc/Zv6xtdGIHV8MdbjxrS3Z9oF7Sqy2tob37WEO4eITvDg/I7Xpp
	 5SUlt5aEbY8NwpuquYuNHcvyl10VujXsbbeaSBUdPmFKlsqN5sa8pISlT5/TN/tUML05s
	 HZm4R8reyP9ksROJtIPuX7gFBW2OlBLpZG+zGwHdMspWz1xxT2Q9XdgyhqHsAUyeZxg/J
	 5QBwOOukajvoGsQ6ndYVNbBCYFJBbYJ/mRBeRtz15oI2/+xiX/jYBuDBkPKPKCoBZgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6ZTL8F1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85295606A31A;
	Mon, 23 Nov 2026 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6ZTL8F1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908091F000C0;
	Mon, 23 Nov 2026 13:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439412;
	bh=+3y6Gl+AMYAPKZ5GKJkPS2Y5iAYxufirKNhQH64c5DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=c6ZTL8F1ik8PjE34Coitaq6FQJ6wV46b+weVq1QlTAObPkUZj5mf3sCUYANSlnCIU
	 2scvOvmgSMM30FR91zAOT7d97MIf2dWHDUe77M8wX4TQAwNvmXhjoeVw7F0AYNJqkC
	 vl0R8oKxCPpIFoNVed6KmCRG4yfJ7t2lvyc7RMsRIzrtpViqCgw0DLpAYerVurJGQT
	 sGNbwGMau6638bx9w11+IOJtNEcswlh91nbw9YK5D4RxZBbATw1KWMompgffiPgSEd
	 xP/kCr/4Ys+O153GFAamMURlNyNp69Mj2iTcZ3/Dq1zXaR2kMnyb6edtr/iq3WjsO8
	 AEeffnG7GT5iQ==
Message-ID: <5a1930d2-65a8-4822-b6cb-21440d122eaf@kernel.org>
Date: Mon, 23 Nov 2026 14:10:03 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] dt-bindings: fsl: remove phyCORE-i.MX 8M Plus FPSC
To: Yannic Moog <Y.Moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Benjamin Hahn <B.Hahn@phytec.de>,
 Christian Hemp <C.Hemp@phytec.de>, Jan Remmet <J.Remmet@phytec.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "upstream@lists.phytec.de" <upstream@lists.phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-5-4adcf8b4d373@phytec.de>
 <20261120-intelligent-victorious-jackrabbit-4caf35@quoll>
 <0ca6fb6acea9fe40cf2190f3a67d6376f9bfaaae.camel@phytec.de>
 <4a325394-9d5b-49cf-a3c0-6b945e6cd241@kernel.org>
 <93ece91784725dd2f37a40a7edc59cc9144e18d7.camel@phytec.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <93ece91784725dd2f37a40a7edc59cc9144e18d7.camel@phytec.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/11/2026 13:53, Yannic Moog wrote:
> On Mon, 2026-11-23 at 13:33 +0100, Krzysztof Kozlowski wrote:
>> On 23/11/2026 13:28, Yannic Moog wrote:
>>> On Fri, 2026-11-20 at 15:39 +0100, Krzysztof Kozlowski wrote:
>>>>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml
>>>>> b/Documentation/devicetree/bindings/arm/fsl.yaml
>>>>> index 2d21a1949d949..ae823a7670b02 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>>>>> @@ -1227,11 +1227,6 @@ properties:
>>>>>  
>>>>>        - description: PHYTEC i.MX8MP FPSC based boards
>>>>>          oneOf:
>>>>> -          - items:
>>>>> -            - enum:
>>>>> -                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
>>>>
>>>> You just changed this line in earlier patch.
>>>
>>> Yep, afaik I need this order to avoid errors. 
>>>
>>> Strategy is 
>>>
>>> 1. introduce "current" binding
>>> 2. introduce "current" dts
>>> 3. remove predecessor dts
>>> 4. remove predecessor binding
>>>
>>> What shall I do differently?
>>
>> That's pointless. Commits are one after another, so just squash them. Or
>> explain why do you need any of such strategy (as exception of kernel rules).
> 
> Okay, I am happy to move the bindings patch between the dts patches and squash them. 
> Thanks.

And you do not get any renames, obviously... Your try to avoiding errors
was actually a way to hide breaking ABI and breaking users, so a no-go.

Best regards,
Krzysztof
