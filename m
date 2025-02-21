Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EBC20F08F
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148084; cv=none; b=JKkIh/6LrkSdBQh9gjo+bEBvnlLlrfM+AAtFVCDJbZikDptHQTBE9UQILlD2wNC3Vo4MTF8DvMj1cPPmBZfXmfDpZtjRQl7cUWoDa6SIUyVdAXZzlYMKG1rL7J0hNlRE+FYiKwp8MvtCPcAHcmA3XAGls9BDsTfZrfDl3DM9/kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148084; c=relaxed/simple;
	bh=a1RRpP2MB+JIaxSkAwtrtiD0G1RvbN/tgAOlFZspAEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAWc10FYprLdfdurImj+U0ZcyB0WeFbnSDucogkSgZyIoh3WAhQh3VMotpbGsLL2xZZdFRQZqtSaZly5KCxAx882NKQMSreoEhi5mx6Akc/KYCofFw1MPPsf1AfIxQNepzmKrOniK+lQ25erRNdt4Ypxt4kLQak+5TgcrYkmrzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=As43lp2d; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="As43lp2d"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abba1b74586so327895566b.2
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740148081; x=1740752881; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33rmgJoFPyAjchun4vSBkR9dkd/0PhCNL1EX9XyW8Yc=;
        b=As43lp2dF81bXzBX3s77id8h21w4GIt5Ik+KPwkK1IoTSAt/J+/o7RhlcQOm/s2HYD
         Mzqyg2XPMR48rlBPx+lUoxkj/nVV7MFJZeBXnm83aNTPWz+ma2Ffy4cMvgBUg0HZOzBQ
         FX8MMftx4hm2fQVSjVScAwWQWWaD1pj2T0BI9fl8unohkizXKed98LFIn+//SiYbX+Ns
         G/1jxpykK3zB5RzQbhlNtACsSPwafd9Y02zGmj/CmnDRMK/EOEv+WXun5Qo72r3XE6mA
         py/8BQBqvUdWyCo7W7hmwHk2jj7kgDvrCEp5zLDK18K81EMsM/JSj4Jc+Qk3pxHeHhPj
         qTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740148081; x=1740752881;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33rmgJoFPyAjchun4vSBkR9dkd/0PhCNL1EX9XyW8Yc=;
        b=sw6zMkpNDJKPD4z1KRTRfTByKWkh5vGUTHGZTqUupxZLu40LIlC17k6zey++wEfWTw
         rtf0o8eMSg2izEQ/lRNDsEYZ7DICZb05hACHFVfOwm9k98m/xUPZZkAfyvIAi0TyE2Ri
         okYy1HvmAT50bgRLc2Ac1cB8f0+C8kIMZwF58sdArnpA8KtejaEnnUo5jI4dg4ef31o1
         7nIU4KH8C/Yo9k97/ZSjHYuMJNi71lixRJ1jQwMB9HM3Q6TtQ0Sc+n2I2B24h98l0z/n
         2yYKK7k9rLvJLzqRyZTS5ozbvBGIDfjdyQumj9lKxDRrP0fdfqTwxi4Hk5lnl9vaxrm8
         JT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9FijBitpTZmR+Y8PQXp3/jYwXZAT1ybKgskc/VoKjbSTUrT1WxCOq/U7mHoxGeYhEMZA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7uL4Pc/RwVJ3vX9/i8S58i1RbGBDQ6IEO+Rl0QKplKdVmLHj/
	UaSc4e5mIszz58+VE3doLTAgqpbMhOxmyv0RJwmUqqbj5YqRt/1J8u8ahg==
X-Gm-Gg: ASbGnct+1hGcPhxZ9PS/8cLLBX6+fgflW3CTSyYszp+KsVBZzPDIsw1ofkMp4qJRw5c
	dnsmHZJssq0dEujsiAoDEczAPQxxSqvwZht0hdDq2x1nDwW7TzS8o0LFaNsspboNBgRR0+j4bmt
	BjN1ZVD1vteEBgH4zDWhBIUbN4wBs7TpSR68kRcLhJx5FTgQgrXPKruuUZVLuUVAOsDrDU39uNU
	CitkPj3Y6VOvR4R3OnkdPdRUUM4YGKBffxJt7R/eZ1Vv2gJNY0Lp8qs5pQCsz8jeIOMt5WbM6Vw
	XeQWJzlvxqcewgenno/dTyKVBUwfZF4q
X-Google-Smtp-Source: AGHT+IEw3WpudhQNFplJ29sjVHEYhC6rE/IVFnuZuPPiVWQyE+QjVu6xQp8nTv/VJK/U3W1OrZNliQ==
X-Received: by 2002:a17:907:7758:b0:ab6:4fa6:71e2 with SMTP id a640c23a62f3a-abc09a46c0amr310992766b.22.1740148080426;
        Fri, 21 Feb 2025 06:28:00 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba9bd6e22sm850995466b.121.2025.02.21.06.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 06:27:59 -0800 (PST)
Message-ID: <aa67bfed-2cdf-452c-bd36-2c5647ae96ed@gmail.com>
Date: Fri, 21 Feb 2025 16:27:55 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support
 for Virtual Channel IDs
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250220230818.275262-1-demonsingur@gmail.com>
 <20250220230818.275262-2-demonsingur@gmail.com>
 <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <Z7g7iCUlsUN2LBIW@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/21/25 10:38 AM, Sakari Ailus wrote:
> Hi Cosmin,
> 
> Thanks for the patches.
> 
> On Fri, Feb 21, 2025 at 01:08:09AM +0200, Cosmin Tanislav wrote:
>> Multi-camera systems often have issues with receiving video streams
>> from multiple cameras at the same time because the cameras use the same
>> Virtual Channel IDs.
>>
>> CSI bridges might not support remapping the Virtual Channel IDs, making
>> it impossible to receive the separate video streams at the same
>> time, while the CSI receiver is able to de-mux streams based on VC IDs.
>>
>> Cameras sometimes have support for changing the VC IDs they output
>> themselves.
>>
>> For a practical example, GMSL2 deserializer chips do not support VC ID
>> remapping in tunnel mode, and neither do the serializers. Allowing the
>> cameras to have their VC IDs configured would allow multi-camera setups
>> to use tunnel mode.
> 
> We've tried to avoid having virtual channels in firmware and in UAPI,
> I'm not yet entirely convinced we need to depart from the established
> practices. Let's see. Apart from that, please see my comments below.
> 

Can you think if any other way of handling this? The most useful way
would be to have it accessible at runtime so that devices upstream of
the cameras could assign the VC IDs dynamically.

This would be useful when having more cameras than the maximum supported
number of VC IDs (4, without extended VC IDs), and streaming from them
selectively.

For example, for 8 cameras, you'd have to prepare your VC IDs in advance
to fit the streaming selection you want to make. If the cameras 0 to 7
have the VC IDs 0, 1, 2, 3, 0, 1, 2, 3, you wouldn't be able to stream
camera 0 together with camera 4.

Dynamic configuration of the VC IDs would solve that usecase since it
would assign VC IDs based on the routed streams.

v4l2_subdev_pad_ops has a .set_frame_desc() that could be used to apply
an updated v4l2_mbus_frame_desc, after retrieving it using
.get_frame_desc(). Cameras that don't support VC ID remapping would just
modify the v4l2_mbus_frame_desc to restore the VC ID to the original one
(similar to how set_fmt() can modify the passed in format to what it
supports) and the caller would have to handle that situation how it sees
fit.

Does that sound better than sticking the VC ID in device tree?

>>
>> Add support for specifying these Virtual Channel IDs in Video Interface
>> Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
>> Although the CSI-2 specification allows for up to 32 virtual channels,
>> most hardware doesn't support more than 4. This can be extended later
>> if need be.
>>
>> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
>> ---
>>   .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> index 038e85b45befa..414b5fa8f3472 100644
>> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
>> @@ -231,6 +231,17 @@ properties:
>>         shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
>>         busses only.
>>   
>> +  vc-ids:
> 
> Other properties aren't using abbreviations, at least most of them. How
> about "virtual-channels"?
> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
> 
> Shouldn't this be 32?
> 
>> +    items:
>> +      maximum: 3
> 
> 31 here, too.
> 
>> +    description:
>> +      An array of Virtual Channel IDs. These are unsigned integers that specify
> 
> I'd leave out the explanation on the data type. It's redundant.
> 
>> +      the VC IDs used by the device for its data streams. This property is valid
>> +      for MIPI CSI-2 only.
>> +
>>     strobe:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       enum: [ 0, 1 ]
> 

