Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673758;
	b=NBl/b64Y1TsyrjrDzieVU3qIsZ1Zn6fc6AWCPOvbBx99SnMkwEMoCbE1XF3NZGvO/RSJ
	 brfXxecp4tcnN5VLZc0r6euKK4Em+pBe8rcmzGOOWgw21JVl1vQdTzEOag+feAfHtrJZ2
	 THQbTM2uh99/DWPFV3uDDlKNuShyKlcjFL2ZG8cYdV1XysdHSyVm7Qimt4cdZXQIFXLrn
	 Y83HXneHm12EUW4J8ZfF4nFcPFtKuRfnsHCnJifNtAIY8hJpJdmnhf3MtVYtyp+HTpNSY
	 KUTUufW8TCtj8Vaw+5BWc7GtgkqPf9q9E9714iTw3fz9XxA1X/MzvvveH8pguB8njhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673758;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=drmG8Nei2eFEJ87SKq5m/aoRCFf+pZY8Bds28IJxne4=;
	b=YEbwkbwuxTVeQKpVbr8P3ZvI0AobEFQEqymM9bli1K45mA7n2LSmdg9vN8rE7dZFVhjs
	 4Xe0MU/o5IEfiOUeQ0k88DdQr3guNVnQ3uCL2WVzJl/s4POe0QfPJe5M2SqSv8sZMSjmQ
	 HUm4k0Edh+3k7poKsl+G2b8qRzTEMbxhSSBkB1kqLwoyhv06ZdJluPgWKIAPZz8kvrgwG
	 52tyek3+3SqWTLrlHl2T08xYL4Oz/QdhQPKvL9VaF+TTgKP/pieH+ooKkqDSwTJ3ViD28
	 u9zj4VWheIIbleZ5R4MnUmlK63yBIl/PIs3jWwJTRbSkbO32yM+MzUPUG0B2gPeq7gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=M5BMlIdT;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADCC606A319
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 12:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ADCC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=M5BMlIdT
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 106A710AB2C;
	Thu, 22 Oct 2026 14:55:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792673751;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=drmG8Nei2eFEJ87SKq5m/aoRCFf+pZY8Bds28IJxne4=;
	b=M5BMlIdTRHNvNeZk/cfo4PdmWuE5r6IkremRUT+EYDRjPd0zBjn2ePQNEbTByN4XTAr1JA
	pSNnJIdahnZ0GHLptr5mUVHekmlmAQy3pdc+WlgFWaLfZVYkCfi5Zw0m3T5xAaHkITkmLK
	7xBlEjwqLp8vZ6wEuofKnrkDW4NkWGlK1poYoGVosi4jJAJS4YVryjfmoNwChlyN0XHGVg
	WNz5i6FparAqD25lgf8MzKw6lCNtiuwfpkjSxosN+S1kBc5j2fl8BVaZr6752l2zz2Er6G
	O4/HwhmMgopdQ8FXcfdr1Da025S8nQ2h85m8AwhEgtKikxPuVWWBxhkGRBa4HQ==
Message-ID: <948d901e-ee1c-45f3-9946-30cea28a6128@nabladev.com>
Date: Thu, 22 Oct 2026 13:34:24 +0200
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
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 kernel <kernel@dh-electronics.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
 <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
 <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
 <20261022092536.GA232648@francesco-nb>
 <794745ff1c484257bef4f17917f3cf0e@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <794745ff1c484257bef4f17917f3cf0e@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/22/26 12:58 PM, Christoph Niedermaier wrote:

Hello Christoph,

>>>>>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>>>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
>>>>>>> @@ -60,14 +60,6 @@ &ecspi4 {
>>>>>>>      pinctrl-0 = <&pinctrl_ecspi4>;
>>>>>>>      pinctrl-names = "default";
>>>>>>>      status = "okay";
>>>>>>
>>>>>> Drop "status = "okay"" too , since this controller will be unused ?
>>>>>
>>>>> you can instantiate a new device on the SPI bus from userspace. up to
>>>>> you, but if I was a user I would appreciate to have it enabled.
>>>> Good point -- Christoph, is this the (use)case here , can the user do that?
>>>
>>> I don't think that's the case, since there isn't currently an SPI device
>>> connected to this interface. Nevertheless, I'd be interested to know how
>>> to instantiate a new device from user space.
>>
>> Documentation/spi/instantiating-devices.rst
> 
> This is a relatively new document, I haven't seen it yet. Thank you very much.
> 
> I'm now leaning toward leaving the interface set to “okay” so that the existing
> SPI pins on X10 connector can easily accessed in the future.

If you connect anything more complex than a simple device, you would 
anyway need a DT overlay for this.

> @Marek: If you insist, I can also remove the status line.
Either way is fine by me, but consider the above.
