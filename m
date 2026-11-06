Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993224;
	b=EhwoBOBwByxF8ww2qSMXugIhu5gBoyHHpsZPfH3uw/67PiXN89BLrleJsd103g/uKZMP
	 ZbcrwMmgNb+GHHnyfnxlFx77EKgbOl6p3xDFGvTdEVS040UwhHP/5oCsIfGwyPMQOOU/J
	 bYSLmCDucY9b9Zq/sRL0T+5lYshf8oooewGjKRBXch+9UgVT0TWtv2Zq4PnpupdOiR8ph
	 Qe/GoTV/QmlEwvopMV4BqnO2SmJ5A96ur66fm30c1vtgnk39I7IpQGQAbhTXcXVpf/cDu
	 qEgrcZnKAOuqFw14lVyU6Zo4VIdZxq8rr1SU1CScNCl3jVSno8rqlXEGXpBN6jeFy6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993224;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=QZ5nNzUoS74KZwDflFqEIaSrMQBfynDlbjgfN6yh+Y8=;
	b=C/Rdw71Z5cIwMZ5t6wCNBbjP0fpkzxQ0p1Y4jh7/Ybtqsxex2XgmXyNcxZ3tk4SanwCG
	 yvhGn8/2xekXy/gjIhYwHvTvqBQ0Xxe+/yoIDYWOuJtIoDmmP/jGVyMGo3XCeepUC4gUH
	 qJzszJH6au7tLB7Rs117n0Z/Ic312TN7gjgCjxj/6yxhxiU0KvJ6trUYHu3ndV82Zd+SB
	 CBjA3pDdzAeoTvsDMDDXnwtm3tRsCrlOu2VbBP2uWHoUlqxzRL7iyRI06FdnXPI7Kr+6N
	 95XrYbvhMhZhde6hjlMQsMTlHIGgbQ+lsoSlmVVNz9ZT/XQn4Gu7bmH0yN7HFi60Mcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b="HPq/+bW9";
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B53606A326;
	Fri,  6 Nov 2026 19:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B53606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=HPq/+bW9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793993220; x=1794598020; i=wahrenst@gmx.net;
	bh=QZ5nNzUoS74KZwDflFqEIaSrMQBfynDlbjgfN6yh+Y8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HPq/+bW9kKUZBctSD5Yi9mCwGeHXQhhpsmF6S53IOIxZ/K3Nxl6nuoan5H3bJVxi
	 P495l1Rhhms6oB/CLzYT1neTSwqqDT1B9F0XMUiyE82miZBsu3aoEiC5+OCbxZjxn
	 gYR21qsllL51jLL9ATj0Zf5zXGbkzNciBBP8MrriO/m3nXUDN3ENTjHyLXJ+eO78K
	 eZt411wrK0WiQeKnPOcUmP/3Sg0RPD5lHLPmqw6598FNPrbeaMhKZq/ZXv/VaY+iq
	 HS5s0auzfex4rjyV3+EvYBjsU3JM0LmLhfNJVJoXRKqS2KL6jAg8SXRqU1FUCWHxv
	 ttbJhyZB524E5VXE5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Hdq-1xMeR42NRq-009LmY; Fri, 06
 Nov 2026 20:27:00 +0100
Message-ID: <695aba52-0307-4d83-997e-663781b24ba7@gmx.net>
Date: Fri, 6 Nov 2026 20:26:58 +0100
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
Subject: Re: [PATCH 1/3] dt-bindings: mfd: nxp,bbnsm: Add NVMEM for GP
 registers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Srinivas Kandagatla <srini@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 mfd@lists.linux.dev, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20261101200140.141642-1-wahrenst@gmx.net>
 <20261101200140.141642-2-wahrenst@gmx.net>
 <20261102-translucent-elated-pronghorn-cbb73b@quoll>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20261102-translucent-elated-pronghorn-cbb73b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cJE6pKHkWLzO6Sjmeg6XmVw/NckLVNjdcCsLHityR2WdCGlret+
 8vYNpiF7UZXrJGivEaDKM/A2I/tOkTBHMZsN6rf2Owd2V5zrOJ/D4MQmhZBd5vcQzGU5FlG
 OwblKavFAGAiULkScrI2PcWznGZW3qV+dTBd3gGp1NLpJAYwAIKvAe3l97P1cwZpun2pBJ4
 TWHE/PAqWlADvhPfMsfvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pIktMsmAxqI=;YCllgzpffR5+l9NktUn1ygh8rB4
 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
 A05gsBFzNZRZ8LCxqYUS6x3JUVw==

Am 02.11.26 um 08:28 schrieb Krzysztof Kozlowski:
> On Sun, Nov 01, 2026 at 09:01:38PM +0100, Stefan Wahren wrote:
>> +  nvmem:
>> +    type: object
>> +    $ref: /schemas/nvmem/nvmem.yaml#
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - nxp,imx93-bbnsm-nvmem
>> +
>> +    required:
>> +      - compatible
>> +
>> +    additionalProperties: false
>> +
>>     rtc:
>>       type: object
>>       $ref: /schemas/rtc/rtc.yaml#
>> @@ -88,6 +102,12 @@ examples:
>>           compatible =3D "nxp,imx93-bbnsm", "syscon", "simple-mfd";
>>           reg =3D <0x44440000 0x10000>;
>>  =20
>> +        nvmem {
>> +            compatible =3D "nxp,imx93-bbnsm-nvmem";
>> +            #address-cells =3D <1>;
>> +            #size-cells =3D <1>;
> I don't think you tested your changes. address/size cells are not
> allowed - see your binding.
>
> Anyway, empty node makes almost no sense, so fold the node into the
> parent.

Sorry, about that. Is this what you had in mind?

=2D-- a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
+++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
@@ -20,6 +20,9 @@ description: |
 =C2=A0 =C2=A0a PMIC or other voltage regulator device. both smart PMIC mo=
de and
 =C2=A0 =C2=A0Dumb PMIC mode supported.

+allOf:
+=C2=A0 - $ref: /schemas/nvmem/nvmem.yaml
+
 =C2=A0properties:
 =C2=A0 =C2=A0compatible:
 =C2=A0 =C2=A0 =C2=A0items:
@@ -31,6 +34,9 @@ properties:
 =C2=A0 =C2=A0reg:
 =C2=A0 =C2=A0 =C2=A0maxItems: 1

+=C2=A0 nvmem-layout:
+=C2=A0 =C2=A0 $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
+
 =C2=A0 =C2=A0rtc:
 =C2=A0 =C2=A0 =C2=A0type: object
 =C2=A0 =C2=A0 =C2=A0$ref: /schemas/rtc/rtc.yaml#
@@ -69,7 +75,7 @@ properties:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0- compatible
 =C2=A0 =C2=A0 =C2=A0 =C2=A0- interrupts

-=C2=A0 =C2=A0 additionalProperties: false
+=C2=A0 =C2=A0 unevaluatedProperties: false

 =C2=A0required:
 =C2=A0 =C2=A0- compatible
@@ -98,4 +104,14 @@ examples:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D <GIC_SPI 7=
3 IRQ_TYPE_LEVEL_HIGH>;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux,code =3D <KEY_POWER=
>;
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nvmem-layout {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D "fixed-layout";
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D <1>;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D <1>;
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 calib@4 {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D <0x4 0x04=
>;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };
 =C2=A0 =C2=A0 =C2=A0};

