Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507295;
	b=BiWH9iCFK2e4ZXBZ8pqjZrdguzzDjfWB6Otz+YRKrMgD5zAc/0iqIjEZo884twhnWp96
	 a0MeAA1RiLghiqCfVP8khpH7URUeguKhOJ0zHUrmXFJx65TJz6k773LaC5eU3KQAIbcoC
	 eE6AEOYw/srbxeNvUDs4ov5+QoI8dGtzLYWNBDby1DCbpEdXDDazs8yXznwnzMtrj9ECM
	 10TqFkfXfgmSplgYNLEdoNNjfdecBJ1F4M0DK5EMSARSjEXkgzjb2wPmsx85xmsJsRDa0
	 mDsl21LsWdJRT8AdqC7rxWUD1eL4l/UiC4Vat+v4tI2jNl57rRi8U4GnA7ZQKihvFgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507295;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=obZm6fYxDBkvsgsqatxSsEtySSvVtNol2JAwOQdxyP8=;
	b=bI27wN78WKs8fiPqwUX5qZVUK8yHBmpahjeFxx7kuWIIbws1F8RdH7MzH2CsQxLaIgmh
	 Hzol0L8DUwaODQZM0eCkjHJ4HNSmalMgDvmFSbEgajvUw3iF+OB8vXMAiWJY3FtzkiNb6
	 OSdzxF0egDJRr+Vfzz4I7AZKIg6f8tutgk5eEi7hOimEvA6Xu061p73fewneFeJzOkqVb
	 SoW6m3qZxuB5mpmo3b0u+uGRkh0wjRJj5hGtptmp63WZk3WSmCFtb7qnEl2p7mx6geHJE
	 4D8mNbYI7nnavFmEAYT+8wKOiM4KmSRH9Jxj9lvXZNIvAvtYa490uyEmAwthWKCq6Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KZIpTYXr;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FF4606A336
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 14:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2FF4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KZIpTYXr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B4321087B7;
	Tue, 20 Oct 2026 16:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792507288;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=obZm6fYxDBkvsgsqatxSsEtySSvVtNol2JAwOQdxyP8=;
	b=KZIpTYXrLOZeb0sWyDSqtRamX8N7fjSjraNOOVWlArE4s24uLb0AYU+UyW1juMdh/ZkGJd
	smxH2yDoOk8ZkWPYrAiSAquObI+DVKplBXgsANRlvr7sYUP4Jq9rFR2aAtRObeqWtj4A65
	RIO78yCfyJvsRNMnGKyQP8ykSis8A8fjfhfA/BOsenJ+s+NQBhZ4B35lI0xWX88L385IAs
	8w5WzVK2R0jWVWrmM5Vc1ZBrbfkuyd1lE0WYd376dqn2pH07IeLYOdBDMG08IjIxxi74ym
	m3yamkl3pp9LxSRe41HKBvL1u484D9TJtuLQRm8JonNtwsCrlDMhPTIQBCzmJQ==
Message-ID: <087bdc09-cf57-444e-aa29-f977998b0024@nabladev.com>
Date: Tue, 20 Oct 2026 16:41:20 +0200
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
Subject: Re: [PATCH 1/1] dt-bindings: spi: Add separate binding for
 dh,dhcom-board
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor@kernel.org>
Cc: "Frank.Li@oss.nxp.com" <Frank.Li@oss.nxp.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Guenter Roeck <linux@roeck-us.net>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 Frank Li <Frank.Li@nxp.com>, Ashish Yadav <ashish.yadav@infineon.com>,
 Colin Huang <u8813345@gmail.com>, Sanman Pradhan <psanman@juniper.net>,
 Thorsten Blum <blum@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>,
 Eddie James <eajames@linux.ibm.com>,
 Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, kernel <kernel@dh-electronics.com>,
 open list <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20261016205718.877668-1-Frank.Li@oss.nxp.com>
 <e7095176-44b8-4838-8443-2e515d34cb25@nabladev.com>
 <20261018-freeway-twitch-e813208aa9af@spud>
 <fd15f846-94d4-44d8-a42d-5f13a7b18794@nabladev.com>
 <20261019-cycling-unnatural-c1adbfb5c9d9@spud>
 <05e66d8f57a44c9aa87cac1c35e82184@dh-electronics.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <05e66d8f57a44c9aa87cac1c35e82184@dh-electronics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/20/26 3:33 PM, Christoph Niedermaier wrote:

Hello Christoph,

[...]

>>>>>> +++ b/Documentation/devicetree/bindings/spi/dh,dhcom-board.yaml
>>>>>> @@ -0,0 +1,46 @@
>>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/spi/dh,dhcom-board.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: DH electronics GmbH on-board CPLD trivial SPI device
>>>>>
>>>>> This does not look quite right, since compatible this is used only on:
>>>>>
>>>>> arch/arm/boot/dts/imx6ull-dhcor-maveo-box.dts
>>>>>
>>>>>          model = "DH electronics i.MX6ULL DHCOR on maveo box";
>>>>>          compatible = "marantec,imx6ull-dhcor-maveo-box",
>>>>> "dh,imx6ull-dhcor-som",
>>>>>
>>>>> So the whole
>>>>>
>>>>>          spidev@0 {
>>>>>                  compatible = "dh,dhcom-board";
>>>>>                  reg = <0>;
>>>>>                  spi-cpha;
>>>>>                  spi-cpol;
>>>>>                  spi-max-frequency = <54000000>;
>>>>>          };
>>>>>
>>>>> Should probably use a different compatible.
>>>>>
>>>>> Christoph, what device is this on this board ?
> 
> There is no device connected to these pins, only an extension connector.
> The "dh,dhcom-board" device was used only to test the hardware and was
> unfortunately forgotten to be removed. In the production version, no
> device is connected to this interface. It should actually be removed.
> Should I create a patch for this?

In that case, I would suggest to remove this whole spidev@0 from this DT 
with proper Fixes: tag .

[...]

>>> But in any case, the compatible string should likely be fixed here, this
>>> does not seem right. The dh,dhcom-board was describing some CPLD/FPGA on one
>>> of the evalboards.
>>
>> Ye I don't disagree there. "dhcom-board" seems not nearly specific
>> enough about what the device is.
> 
> There isn't actually a user for this device, see above. It's only used downstream
> at DH electronics for a connection to a PSoC chip. But even for this purpose, it's
> not being used correctly. What should we do now?
I think this patch can also be dropped, the dh,dhcom-board would be left 
as a legacy compatible for the CPLD/FPGA on the DHCOM PDK2 board (where 
it is not described yet, but should be) , and the dh-dhcom-board should 
remain a trivial device, since the CPLD/FPGA is connected via some 
parallel bus if I recall it right ?
