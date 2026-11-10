Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370467;
	b=l8dkDUno0xBCwqkPdrjJexVQTmKkQ2f2SnUZ4Bgo1QXHmhNk10L6TvzyXxk53neV/M9B
	 9zjCuOc2pO0eRhJmLIuTA5/a6IHeBZIpzDuBgZb7+vNcWVIogP3c699W+RhRNipEGeEwX
	 cnuFqSqy58fSq2raDY+kLuGMMYYsOGgYMVhvAL0vKLR1hbngQznFElKjZ4uDLKD14SUwJ
	 ahp58oQkQXy72MGpuaYgZKgKxp0vPzQaUGuJ51CLc09/T6AF/DI9X9wy+ndroEieR/QGU
	 UTwC3F/7GyLnt+1YTuyKSwWQkpBiNuFKuKuXX89F2H8vhaGFkXScqm6M19OfnVSboZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370467;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=5LxM/zW32Rd01ubKGpE8Na9mT8q2E7+7oK0A4eJKMjo=;
	b=rhQjwQa84zhrvOG8Sqswq6acJAVBMf3b6G7wbTZsUMN7+gfzdjHEnTP3O3F9VOWs7CqY
	 L5Ip7/TY1ehjnWKGC16Ctf0JS4HybB+rFpsuolpqFBVgqS0PoJ90DC1d6eHbUJGgO5JJg
	 7ofvN+uDVapVL+IDLd+59hGbXKH/DpQzcZNW2Fa0iZUSApT6EXOvGZcPzEZvBPPz/Bgsc
	 yq7QFDqXGlDOXQp4dEpL6vO57onGj7Y+z+5oPIxMQ02J+n/NSq4q6BSI+a941acbcuiHB
	 lNl3lOnUEvINDVw5Meu/LeRPgCTb5C3upJmsat8NnsCR0PZ5QlUW9kAYNFUhTHWI/eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=jBG5EcGP;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726B7606A320
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 04:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 726B7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=jBG5EcGP
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1EB710DCE8;
	Wed, 11 Nov 2026 05:14:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794370460;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5LxM/zW32Rd01ubKGpE8Na9mT8q2E7+7oK0A4eJKMjo=;
	b=jBG5EcGPj0USytRC6I/igvoroGRuYoLBX87GgPWn1WWLEuqCxdpNV1dQcgXaz6EI6VezNI
	+Xdwsbx3mvxUat0M1o3GZquUuPcHsTI8tMSBX3ZOdW4TR6vIbcJvXDq79M8J0zVf3y04Ox
	rkx6jDo2yPfgUas0yemQuiFq4j00ys5J6++dVnDRVuwrnfP5fIpDFgBsLEcTRGXzYzUTzC
	o/OjJ1MlWP0I6VQYpCR8L+PIKF7lE0j4yKGhbh/IQln8a9Dib/aMr2LCus8Vh2WHlyP1IO
	/ap7ToQ2aImYknUFIPFs4f15heXThefab97+6SpdVno6nTDYqsWxxTy3/vJrlQ==
Message-ID: <0865fe86-3ea1-4ebd-8ded-642eff159b97@nabladev.com>
Date: Tue, 10 Nov 2026 14:59:51 +0100
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
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip ATA6563
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260930214729.809649-1-marex@nabladev.com>
 <d8c3ca76-3d93-4abc-8a78-d23e0f018975@nabladev.com>
 <auGdT2kdxwfbB_ol@parshuram>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <auGdT2kdxwfbB_ol@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/28/26 7:59 AM, Vinod Koul wrote:
> On 27-10-26, 18:18, Marek Vasut wrote:
>> On 9/30/26 11:46 PM, Marek Vasut wrote:
>>> Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
>>> It is pin-compatible with TI TCAN1042 and has a compatible programming
>>> model, therefore use ti,tcan1042 as fallback compatible.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>> ---
>>> Cc: Aswath Govindraju <a-govindraju@ti.com>
>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: Frank Li <Frank.Li@nxp.com>
>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: imx@lists.linux.dev
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-can@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>> V2: No change
>>> V3: No change
>>> V4: No change
>>> V5: Add RB from Krzysztof
>>> V6: No change
>>> ---
>>>    Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
>>> index 0cf5fa21106b6..e97b1bc0a2e45 100644
>>> --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
>>> @@ -18,6 +18,7 @@ properties:
>>>          - items:
>>>              - enum:
>>>                  - microchip,ata6561
>>> +              - microchip,ata6563
>>>                  - ti,tcan1051
>>>              - const: ti,tcan1042
>>>          - items:
>>
>> +CC Vinod, is this patch OK with you ?
> 
> Looks good to me, I will pick this after rc1 (monday)
I would like to do a brief reminder here, so this won't get lost, since 
rc1 is now out and I don't see this in dmaengine.git.

Thank you for your help!
