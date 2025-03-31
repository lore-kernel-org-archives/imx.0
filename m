Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F45E27726
	for <imx@lists.linux.dev>; Mon, 31 Mar 2025 11:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743421525; cv=none; b=vBVLBF2n3lj+b1FeOkEL2PSryZvUt9Q6vq0iDwpCAjnhMN0qaxNHNMm9yJ+I+Wa6HcjV66G9qbQ72nHVz+Mvq3S1PsTS3r6ACxsODV9IYSPf/KWZ6+4w4WMsVN4VkWdpTwEKtQRqeWUl0ALraCZnFPR07ue1NfRAhrR2RtrrQ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743421525; c=relaxed/simple;
	bh=ECVyOQ4QJgwuY3BsSBfbArAjbpHavCxYsK47PAeOlRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H85Qob29ClSDtzzRKa09oqymmtD68GDvF3emxtTc/6vIuhktmQPoXF4x4PXJpksdsggGp1eyKwskoaIMXQtKks7kq1iV0zuG1+MY5xU+lrq7u6A1CzR/pgjRSM40Ftn4epwDMfNm0EjZGHt1W+9otCwJgoxMRw2fcTaoTGae5QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbscQP/w; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbscQP/w"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso8066785a12.3
        for <imx@lists.linux.dev>; Mon, 31 Mar 2025 04:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743421521; x=1744026321; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WZetRp5ukCN3RFrLbUEaBdA30WIpXABNZMPxGA5CMM=;
        b=PbscQP/wbJvwxTWUA5EHid1xH2fG/ztIEIwrAn8wOipK6QJD+XoMag5AbRznW0xv5K
         VM7bpBUIaolItb8vk9YlYOEWs+yocIG8MPZdf3naBh8g5pwFSP2b3XPf76MNbjqibErl
         M1QSnzHOKzyZyeYla5X9PTPpq/ve9VpsMk1AqEpbmRjCN7v+y64Y6F7Uv4qSujPjfuvv
         +42GeBHoHsnaoDA39HSg8YabVeyoqxADy1CG29cz9xPC9IlQcbIcky/YcZoqknLs+kwP
         ib/MNepesCEBo/rbUPjJSenRZd6CMnxDMXMUEkEUm5e6UTJ0qrWIqQ5dgqjADTE36cxd
         iSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743421521; x=1744026321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WZetRp5ukCN3RFrLbUEaBdA30WIpXABNZMPxGA5CMM=;
        b=XuPHTRCI3/u/JFhMTes1DJtrWL+7kBMfZU5WoLT1O5xbqnxnAGOyIS1T3ATnv2nDqv
         hoHoLulQC0zaq01TPlC3bz28vtRHZKQAz4NWZ6TicJxMhb2AmQWy97TDg8mUMwB+FrDU
         AGOM0Yvq7kSCHOMmUFkICaFwsCGKvbNBTNlSRbSc+PtmMZE+J0NimeqLveYIumSnUfXI
         FSyHkidDc/XvMXLOuCa8nkJwMphS/k/q62381dmpLLMXkNOo82nYA8I+ZbRUi1SvBD6p
         dg2DwysHnveThh4zQeToV7gxLTlMtxtSptt/ENHfKosUVGXhtUw546h8XBWvfE4KEvxT
         4b4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyLOlM3k7GZM9b0GxcDxdOy+5acwQwqyBr0Q027ydSIpnTgtKBt3RhrXjDlsh+m+cJHsU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXT+kiqxp47jLxOLWws6mKetbctsKbtgPFRoMFL52APgDUumWX
	eQnpfenIxbY9+aPQK/sXVJyCxc9umE9Ln8eZnbOVQ1IpD5FXULpz
X-Gm-Gg: ASbGnct7yLyv5vZrdWWI+DKH6NVlzjdv/1fzHUBTY55vI5zlkr/I+YvjEgSMnWRDOzb
	b6zaJUqetdp0HSJk8gqAJk+qkxBAelH+sYz9gntfYV3aWdW5aQ3g3v/X730PCByl0F2IRs5eGro
	HpAehIVN9zAD7CYLoUi8Ytz96LsgbJ98TEzfQY8EHYQ1rcjneK9p1as3/lpqqIjGyQBE4WpZ8a/
	mqbGoNHXIUfhMA67EFZzhoY1wLziGSz/AXx8WN0BwvoHlSnDH8CyEl39YZgOuw9k7A7BUi2DVGH
	s0fg5gBFXWNNpvy/yrm0X2p/aYp7gMmDnX6e7KtqdSxmAOTuWSX8EgFuaMQHxs/UtzJWLHk=
X-Google-Smtp-Source: AGHT+IHcwdKHyjGn7qgKGCjwufvZuSvuzHtrMAol97MyCW4LRBy9QxYiA7v5eA7QLgnV+kdOOMmuBg==
X-Received: by 2002:a05:6402:2709:b0:5e5:ca1b:c425 with SMTP id 4fb4d7f45d1cf-5edfd101725mr7051020a12.17.1743421520816;
        Mon, 31 Mar 2025 04:45:20 -0700 (PDT)
Received: from [192.168.5.165] ([92.120.5.14])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc1493d9dsm5532289a12.0.2025.03.31.04.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 04:45:20 -0700 (PDT)
Message-ID: <e0d328e0-bc54-4763-9c55-694c0fd93746@gmail.com>
Date: Mon, 31 Mar 2025 14:57:46 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: bus: add documentation for the IMX
 AIPSTZ bridge
Content-Language: en-GB
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.li@nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
 <20250324162556.30972-2-laurentiumihalcea111@gmail.com>
 <20250325032303.GA1624882-robh@kernel.org>
 <2301b0f7-1a76-4823-8d3f-d346f8f8e865@gmail.com>
 <20250331064152.g4hlw6pbpzbnlsmp@pengutronix.de>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250331064152.g4hlw6pbpzbnlsmp@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 31.03.2025 09:41, Marco Felsch wrote:
> On 25-03-28, Mihalcea Laurentiu wrote:
>> On 25.03.2025 05:23, Rob Herring wrote:
>>> On Mon, Mar 24, 2025 at 12:25:52PM -0400, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Add documentation for IMX AIPSTZ bridge.
>>>>
>>>> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> ---
>>>>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 107 ++++++++++++++++++
>>>>  1 file changed, 107 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>>> new file mode 100644
>>>> index 000000000000..c0427dfcdaca
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
>>>> @@ -0,0 +1,107 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Secure AHB to IP Slave bus (AIPSTZ) bridge
>>>> +
>>>> +description:
>>>> +  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters
>>>> +  issuing transactions to IP Slave peripherals. Additionally, this module
>>>> +  offers access control configurations meant to restrict which peripherals
>>>> +  a master can access.
>>> Wrap at 80 chars.
>>
>> fix in v4, thx
>>
>>>> +maintainers:
>>>> +  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: fsl,imx8mp-aipstz
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: bus
>>>> +      - const: ac
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#access-controller-cells":
>>>> +    const: 0
>>> With 0 cells, how do you identify which device it is?
>> we don't atm. We're relying on the default configuration.
> I think Rob is speaking from DT API pov. What the driver is doing with
> additional information is up to the driver.
>
>> we don't have any APIs for AC configuration so I left the
>> cell number to 0 thinking that the cell number might depend
>> on the API.
>>
>> if need be, I can set it to the value I was initially thinking of in
>> v4.
> Which is?
>
> According the TRM it's a bit tricky to define the API since you need to
> describe two different types:
>  - master configuration
>  - peripheral configuration
>
> One which came up in my mind is:
>
>   <&phandle TYPE ID VALUE>;
>
> e.g.
>
>   <&aipstz AIPSTZ_MASTER 0 0xf>;
>   <&aipstz AIPSTZ_PERI 0 0xf>;
>
> One could use a defien for the magic value of 0xf of course.


so, my original idea was to use 2 cells: <&phandle ID VALUE>, where bit 0 of ID is used

to identify the IP type (master or slave/peripheral) and the rest of the bits are used to encode

the ID itself.


I think I like your idea a bit more though (i.e: have the TYPE as a separate cell)

because I think it's easier to deal with/understand from the DTS user's perspective.

