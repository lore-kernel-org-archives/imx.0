Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F71A7AF3
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724874064; cv=none; b=nfq73tkLYv5rkIdz0Dx9w3VNjZoJlyPhKGOLvH9eBh5T3YQX/sRzY38DaGnHRjcaAgTGKG4uHSn5ZO4txsYZCJCi3rEeVE2MeclH9x2H58EyO4T+ft+92tPtEkhEx2vr0lO24yKuyraxbKPNcuNRmr6+v9FWn0sboRV7tCDWEfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724874064; c=relaxed/simple;
	bh=MXhQ9Hgtws6rY5qwqhJGDFzt+GBAaEl1yDl+z/rIagE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loKlC0kBs9scepRfyiBfGaLuMgGBfT9ih+lIdRzoVR3gwSSg6HviNZiJnbGTH/9biee/HlRXc/eUYocKQI4bM3wX+RoQ7ScoyLffioI2Rc9pNbyjmWCVernXzyoNLVelA0pzX19CZXDt4XZeaHRCzm8tyA0NkKTo6rJ5BTOBY7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zx6IliHG; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zx6IliHG"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d439583573so5234594a91.3
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 12:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724874062; x=1725478862; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ce1N0tTiPtR4rouCUzpG0LMPRDeIiFvwRX19g+i6YHU=;
        b=Zx6IliHG2ukEWAY6VkLDbwkoyYDjlYHmjbTstz8ZjjUikai29lbyPUm2SPlrj2twg9
         D6Levp4CcjKWPKz2qAxZxgaF6S/bIaG9oWjhStJj+xpw/+XwpspKFI9TSh9uDPrUxDE4
         h5Jprp4lnRO55oil8x/rHreVMAKfmp/+4ysMvtT/LjT4frzQlOZSisagFISjL0+q0Z2U
         BgEgiy24ZMUAcL5F0UQARFu9hSzj+fWAwInKZ6rmuB/JGrv/+dC8SvIfNGrT1XXR7HUH
         ERTr9r9VmmIQzcdi2fIQU0sE8p1luAev130rig7BV7aCgjp5WCe9MBUj0MYKEyQr7KJc
         Y+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724874062; x=1725478862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce1N0tTiPtR4rouCUzpG0LMPRDeIiFvwRX19g+i6YHU=;
        b=L5Hx94aSSI/fBF2+qBWyNg1Pc7vW8HNuEDpSAn9haGsiZpesXtfv665NoeHub1j4Ub
         c3obewD8lzlfO14RwVJWyMhqllANU3ElR6DFoMAlBbreXiH42EKCPSnltMJA73lTCzx+
         W57tlGXxHetn6duouYus1aJNY9pThmRIsuFzpz1pa/633HB7I42rdlstx1hJ7XhPcwsj
         7eIj6gBRhtyc9gjJAuSJBcXkZTfPNfGpohKa3PjloUDGIpV2J1jAkcoJxvhmZ9EllAaH
         /W6UgwUiPmD/hcxuY9xxwNqNEbqrYZAPwTR/MDkI1QubBCoS9+Cv/GdHhKD20GvZ9Xd7
         7G5w==
X-Forwarded-Encrypted: i=1; AJvYcCW5cp4Vqow9JoPL5enGU3QXWGkGATHQiNv5LmEFKy2Iu4r/Jd8v0O/XdR9RGa3ESKLhiB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPvOFZUZAaP6DKsrRsr/aAmC+5GpL86P+WIdLO9amf2nR0KdNR
	ipk7ar7pAOJ13qGUhBN4yPe1qwFzi5qdnIpqHzy8NM75oz3OdYLC
X-Google-Smtp-Source: AGHT+IFJ4eNMqEsFokIt6tr5u4WccKvoFDiG25BeHIQhhWeO2V7WYEfddZEzht0kBa1BPr6IUzbeOg==
X-Received: by 2002:a17:90a:4201:b0:2c9:6f8d:7270 with SMTP id 98e67ed59e1d1-2d8564a4b84mr354549a91.42.1724874061586;
        Wed, 28 Aug 2024 12:41:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e80absm2316029a91.13.2024.08.28.12.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 12:41:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e0fc65c0-45b3-4948-bb00-f34db59fe011@roeck-us.net>
Date: Wed, 28 Aug 2024 12:40:59 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] dt-bindings: hwmon: Convert ltc2978.txt to yaml
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, broonie@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, jdelvare@suse.com,
 krzk+dt@kernel.org, lgirdwood@gmail.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240828164133.1131959-1-Frank.Li@nxp.com>
 <54243e7d-2b54-4934-a530-173ac06180ef@roeck-us.net>
 <Zs9uAbUPRqkcRdxL@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Zs9uAbUPRqkcRdxL@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/24 11:35, Frank Li wrote:
> On Wed, Aug 28, 2024 at 10:06:25AM -0700, Guenter Roeck wrote:
>> On 8/28/24 09:41, Frank Li wrote:
>>> Convert binding doc ltc2978.txt to yaml format.
>>> Additional change:
>>> - add i2c node.
>>> - basic it is regulator according to example, move it under regulator.
>>>
>>> Fix below warning:
>>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@2/regulator@5c:
>>> 	failed to match any schema with compatible: ['lltc,ltc3882']
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>> Change from v3 to v4
>>> - keep under hwmon directory.
>>> Change from v2 to v3
>>> - put my name into maintainers.
>>> change from v1 to v2
>>> - maintainer change to Mark Brown <broonie@kernel.org> (regulator maintainer)
>>> - update title to (from ltc2978 data sheet).
>>> octal, digital power-supply monitor, supervisor, sequencer, and margin controller.
>>> ---
>>>    .../bindings/hwmon/lltc,ltc2972.yaml          | 94 +++++++++++++++++++
>>>    .../devicetree/bindings/hwmon/ltc2978.txt     | 62 ------------
>>
>> I still fail to understand the rationale for renaming the file from ltc2978
>> to ltc2972. I can see that 2972 is currently the alphabetically first supported
>> chip, but that is, in my opinion, irrelevant, and it will change.
> 
> Conor suggest use one of compatbile string as filename. I random pick one.
> I am not care about filename. If you like, I can use lltc,ltc2978.yaml
> or other filename.
> 

The rename results in a disconnect between driver name and the associated
devicetree file. I fail to see the point of introducing that disconnect.

Guenter

