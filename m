Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1C3AAF41
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 15:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104294; cv=none; b=mjUbrYM9VF8/tPKzz8XDeO9Q6HB5AnRjLMJ/kHq5ePM64tbQanAigHXVkP/Ee62vAEr2VF9XzPF1tJspAOgXitn/UskjulaEMtxL8NKFIF8VwymL1IR/FIFfckSGp7hBlUEAUOjV1zrQibYbDW7EYJfBNfKz9mHTknIh6+C3hBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104294; c=relaxed/simple;
	bh=42a7FeYTUqyvHIggrb14edhLBGxKxj9yK2RL3MdOSbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELWeRVrZz3Zb/Xd8leyKFzfV0TIb1eGoL/dQhVTGY/Sc/AzkG2G4j+crfMNylAnYd1GkOICXvkV7rgShs3h8gXOGHaqU80GFx2QAWorTaQDHyn3VbkpDXGZQmA+mW/FTzu+HQ8/dKsXU9P/61W08y8oJlkxq2BuGdaRRbK6lSCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYJQFNNU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYJQFNNU"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so2010644a12.1
        for <imx@lists.linux.dev>; Sun, 30 Aug 2026 08:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788104292; x=1788709092; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciRQvpR+Sh+544fgrHeR8zv7MW8fKoH4Hb2ESodOcd4=;
        b=dYJQFNNU9xwrC9WfFKqVHAlzW/SEcDt/OtNFmFDBYP4EQ5YUCewo6HQs1bYJi94+Lm
         +vVw1n+zvRY6PXimydmZXBHLZNjc1g8OFLitmROnakKJDOnOTLzLFDMvM+DWB69L1OZw
         TT7wla19ki6rm3X47lAAhtf3KXPp2PdbpiYYGFrklYHMFWjgWdXTKlDqcYTLeq0XMEDP
         v+FGepBtRFAufCymIiVA66fKXPqjistXYuTDWYXKztVGhki8lPxWsVwrFBUVEyBWaEPl
         gIS24n6PMOrqGiZDsff4K8HS4mLHJoGjLL86GTCHxsHSdQBbrK9l55AwRqZKASMN9kZH
         dCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788104292; x=1788709092;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ciRQvpR+Sh+544fgrHeR8zv7MW8fKoH4Hb2ESodOcd4=;
        b=PWyWAcGFXblJ8LOH+P1T6zhLd/LecgZ19ax4RUjN5qsJppRzvwBqRGuS3gVUHmC+f2
         X8Hrs1trGtg3aJNGwPTwB+eKtLG9FiZTC1JXuhlUSaJQEzj21nwo3HU8GaDXlI4PrS2d
         zSqZsx97ezWSBV47EqqTmVWnFchxdP9nhVzinvbPa+r+BShr0C7dmkk7RfYUaZfIlUat
         rzHMXLVcZxe8TnUEY7dEnrqGLVMHoayJDT8DlsQ1UVh9bNQ9h8DiS7TpZLM/g5UJVWlb
         IuFSFW1zIfiFxXNO0bNOhNCegqSrRb/0L1j7y9fYRmn67Z43SoYN6O0A01++BoYUZapI
         354A==
X-Forwarded-Encrypted: i=1; AHgh+RoeOtXTFdfNswNGh0RToWmHp3MKXd0iwZABvwdM1BPN0FRMkCNcLV7q1aY8GAzEGNgRGlg=@lists.linux.dev
X-Gm-Message-State: AFuF++lr0+T6zKrgjD6STyBzz/CCwKhr6qvqCPGxRf5tqake3Cr8BC8P
	PyOtZVmpvVcEsbpN31Qs9VdQzinDfhfVP4rEEW0boZj7Le2L2fC/zD8C
X-Gm-Gg: AR+sD11ZFZGvZ15CxWK77om3u5Ey90I3uAUCOfPYMXQSZrJsJaqMBGKDAmKPOp5CQXp
	cSQvgQmi74hUVIUECrVRPb3P+rtPNDA3MQHdMlH1RUOW2EX0N1ByO6wDeJd8cBAdAbP8MoZ0VoX
	HC/ywUzG0dOLV5sL12B8/ChSG2pVRi3YgGfRbBLghmwPaN96vuDkUiowrJeW/Sav9jVs2VTqknt
	so8RnZ+0mqYOrIUNhzGDBeRmVJ/ffIEzcvIayOsv/eiaB0v97+IIc7Q8eXVbjCRXtfhCuN2mW5N
	9KYj3QnBIulTDyYieR5EdrvgbG+sT8gz/EzA/Zm3++7LrYpQzV1yvRX9UdbQa1uOaAJAvIRo7vW
	suzGK/bX8QEQrvDWG0155BrGBnPciY1YD4TjVc7EmFCL381uaKHP9dDqgmk5gdpB+QmNIV1m4kQ
	S7+zbnJuHuP3VghjIIWdug/LUWhyMn53Wohv2lkyHquGXEqWb3rWqYSpOki40Ko7nFIEt/z+W0x
	OH+MGnjW15UJ3cIQRz4j0hsrmMGWCDnKxEmWLw/ldH8VfqM
X-Received: by 2002:a05:6a20:7345:b0:3d1:60d3:99f8 with SMTP id adf61e73a8af0-3d266ebc963mr30705222637.5.1788104292060;
        Sun, 30 Aug 2026 08:38:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36ae4ccsm3055626a12.19.2026.08.30.08.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 08:38:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <77319f64-75d1-48d6-954d-7e1891362b08@roeck-us.net>
Date: Sun, 30 Aug 2026 08:38:10 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: hwmon: tmp102: move ti,tmp103 out of
 trivial-devices.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Wensheng Wang <wenswang@yeah.net>, Cosmo Chou <chou.cosmo@gmail.com>,
 Colin Huang <u8813345@gmail.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Dixit Parmar <dixitparmar19@gmail.com>,
 Antoni Pokusinski <apokusinski01@gmail.com>,
 Eddie James <eajames@linux.ibm.com>, Thorsten Blum
 <thorsten.blum@linux.dev>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
References: <20260826211422.3299728-1-Frank.Li@oss.nxp.com>
 <20260830-alluring-goldfish-of-cubism-eef6db@quoll>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260830-alluring-goldfish-of-cubism-eef6db@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/26 02:53, Krzysztof Kozlowski wrote:
> On Wed, Aug 26, 2026 at 05:14:19PM -0400, Frank.Li@oss.nxp.com wrote:
>> From: Frank Li <Frank.Li@nxp.com>
>>
>> Move ti,tmp103 binding from trivial-devices.yaml to ti,tmp102.yaml. Both
>> devices are single temperature sensors and update "#thermal-sensor-cells"
>> property to accept values 0 and 1 (passing no argument is equivalent to
>> passing 0 as the first argument)
> 
> Why updating the property? If there are single sensors, then what is the
> cell for?
> 

It registers as temperature sensor with the thermal subsystem. The documentation
of #thermal-sensor-cells states that the property is mandatory and "... Will be
0 on sensor nodes with only a single sensor". I don't claim to understand how
this is supposed to work, but the thermal subsystem code looking for it does
seem to suggest that the property is mandatory, even if there is only a single
sensor.

Thanks,
Guenter

>>
>> Fix below CHECK_DTBS warnings:
>> arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: temperature-sensor@70 (ti,tmp103): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 5 +++--
>>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 --
>>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> Best regards,
> Krzysztof

