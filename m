Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8AA20124F
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740128142; cv=none; b=MI1FNpS0sfLUkCXzvr1yT5s1pgnLwtYQCQDHzO4daRoXzp2cUril+ngGyao5j01n48/0RIRRLFYqRn+VWRv0E78BrP3bx2BEiATACZqlVwhUt3H3xBPIBcGrVuBhIAy88KvfMmG3slJe+WrgADCOfr659cu8GHGdxS5O6pEk9PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740128142; c=relaxed/simple;
	bh=/T0ySwxp4mZLQQcazkrub5eHoCD6jJrDkL2LKn29irI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsK+63/XlYzd7gIKYqr++3wOtWUgpd9saIO9N6a1ua7dbZcCnt3MwDhOCs4tZR0iC78WzGcEOV5vedYxCylc89/lV/lsyBdcDOfM99J1NUwlNr9S5DqGuAX5/DOrHBDpEWxQ2aDpPoRUVz/iGXL/IZLAmrIIfkUtfRU3hhSKQTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdRDa3Lv; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdRDa3Lv"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5ded69e6134so3042263a12.0
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740128138; x=1740732938; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3zIQr7oAH3qfopPECTGfwB1lTfHa8/ihWNr2XkHhkA=;
        b=KdRDa3LvF8BjNVihVNp/dVAiOx10Nw7yGHQQ4/QfMuWy3y96htIa4fM5rJ55OOSXdm
         /HSTAqWvuGRWIXMdHTOHm7N118vp2PeG8hYwVBST8xIsnT+Mff3f0o99alAbRBeg3QKt
         Cod7iqpjMntmzQZCKJ/MQ9bjKolDddze1KAGFS1XR2ypt+VT/oam2p7LsZzuXUezA84c
         rQT7W1Knhz+YxpaoczibEwZGbm5WY+FUEpjDpBYkC1ebgrmP39jxyA4Dp5D5rFO+5MbP
         UFpdgwIA/Jk3J5DrjMAchs8DEcOuVKQqoF5dXZtDXBEEXgKx2lihA7VKFYzCTL87TECy
         yeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740128138; x=1740732938;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3zIQr7oAH3qfopPECTGfwB1lTfHa8/ihWNr2XkHhkA=;
        b=OSuGHJ3GL6NFTfoXZzPoky7dDci4dgtiEXiX+0dKf8NJF7CQ2HYPaXb9rRqEW/7nU+
         uSVqj0S/cA0KE17JnS/ZQANSg0dfOfqWFhfE8FNXIOmExuST98HODlqiazj4IhnVA4sZ
         VYTm94Y4GSeyKYwLF23g0mVYy5Ui7S9yJfevayrOo1fL2vf4x4vgu0rexqRZg2E6626F
         NRP3mrP9eQpeCMeWeCM8YfQfwf1rGXoIAuSy+eNcy5iOPPRl+i0VXu4lLpUntGj2cD9w
         S3uvc7HHr5JwvE5smSvXrSBiTjPciF8nmHu40zf8WG6QwjaEHEfM0RzUMGXlA/zRPOl6
         9+PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWietf2NML++KJf+pvAn6yLj4mohwsdFkJAILQeWVjWr5Y0luQy7q7/61uBmKHWDK1XoKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRxnQble9I5HAZPS/qsTlw6knbbU+rq2wS8MCSg94ud9RUZpaJ
	aDNoEMLWm0IQ6WEIpPOvq4uu8hVglYwAg1VUTWeGrIN6H1DbUT/f
X-Gm-Gg: ASbGncs8MTSGwxZ5pov/r2P5le1yDW7lVC12hZ5TyRIMcbKtfQH5GvQPYzWi55JFbRG
	Xwn4+bpjQblpeWAGdlbBnZgp1DyyVh9Pbu2JI5ojWUybZugAnRrR/oYYEHVBWKqZy9B/UDqZdk1
	zfVzUvc98K6HgqCb4/wyrnHgM3OLdZO95BhjzOw8jrNsSVTMee7NStZUxUo0uaoqFDr/J0lQdBy
	Eh9cSh2YxQe6SrHaXE00ERUBH8AqM2l9ZxCDLtDrDm6qt//xeoBx74DEU4TtFUpNqWr3kxf7VLh
	As2F0TGVdJ2gdQOBXJ7SDSfRKs2UaZEE
X-Google-Smtp-Source: AGHT+IFmTTdAgUDzbiHX+T9rWqsmdcKpPchN5TpDb6Tvrcof3AwRJCep4kmOdcOa6E6Gwr6wzr7kuw==
X-Received: by 2002:a05:6402:1d4e:b0:5e0:b542:fb32 with SMTP id 4fb4d7f45d1cf-5e0b70f002bmr1915674a12.19.1740128138254;
        Fri, 21 Feb 2025 00:55:38 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c58e2sm13515163a12.20.2025.02.21.00.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 00:55:37 -0800 (PST)
Message-ID: <51294a91-afd1-4e62-b320-88ee233fbfc9@gmail.com>
Date: Fri, 21 Feb 2025 10:55:33 +0200
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

Sadly there's no other way to handle multi-camera support for GMSL
devices that don't support VC ID remapping. And upcomming GMSL3 devices
only support tunnel mode which doesn't support any type of remapping.

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

That works for me.

>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
> 
> Shouldn't this be 32?
> 

For the moment I picked 4 VC IDs (2 bits per VC ID) because any more
than that doesn't seem to be supported by CSI receivers, since most
do not support extended VC IDs.

Also, from the MIPI specification:

The Data Identifier byte contains the Virtual Channel Identifier (VC) 
value and the Data Type (DT) value as illustrated in Figure 32.

The Virtual Channel Identifier is contained in the two MS bits of the
Data Identifier Byte. The Data Type value is contained in the six LS
bits of the Data Identifier Byte.

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

