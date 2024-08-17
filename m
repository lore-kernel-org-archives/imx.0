Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128C33D5
	for <imx@lists.linux.dev>; Sat, 17 Aug 2024 00:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723853001; cv=none; b=Q3pUKOAbVvZ8q4STPTqm3c6u8B9bleRu/40SD9jwWo8eFHzO2ri3aooHLqC2a0J8sQdyK1btyA4S4VXSOMDEs61o3w+cz4lcJdDvO74/5xNycoKNGOm9fhW05I+hdnfgr0iniv8aC+eM/NgGq2j/uWyO5B4cTH4PpISe7FvkdCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723853001; c=relaxed/simple;
	bh=e9uuSem2Kttw0m8S7Y1E660rH26HZu7IWsbSCqaPph8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eL5idn7AIEMAShe6cMqpOVzlYiHgdEX4iOchOQzVV6PVIL+w55c7kEf/ILevt/yq51c6UTzh7qBbbYZKCgNXDHmK8M/DgHYklvSWJdrmcC5tHZMKHxqdEVG5Cvupvnar+M3ikUrTgEIGFf7zT4xy5hWl+Y09hGULwhZFEPm2Jd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQamK5VA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQamK5VA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20219a0fe4dso2907145ad.2
        for <imx@lists.linux.dev>; Fri, 16 Aug 2024 17:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723852999; x=1724457799; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SPfZ22bi83kUBgSTIY60cQDgzuSRqnjYzRmmA+o3128=;
        b=UQamK5VANmgK9fKiaVfuRDLFjKpF9qOEN2JhKLMtcTvofZ5kBG/Tx3G/07Ugfsu2ZX
         x+x0bMeaYuV5Sgm1+uwHhaYQaxTEze0iiF0jD8V6z2MgL6BhjBwSFJKHcJNW3I6B3vQG
         3WJXQ1v1TddaewbRmGnsM5wnOwIqBSD1uo17WGlEbhLoTJcSd5NtC8F/HhTwodvVEmYd
         rzTiIdXKvW8L2Cw/qboNgVfnevEj50mdMejz4UX8vc7RxRVF8J8KYFRcz7Esi3FhajWN
         zXwMTY4cwTX6L/1c7UI2pSk7N6IH0ZWbIMy9TfmMfyXvxGnwDkUzKFop56Y08E24aq4E
         udvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723852999; x=1724457799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPfZ22bi83kUBgSTIY60cQDgzuSRqnjYzRmmA+o3128=;
        b=KCd2kPA+PC/CxJ8OB6TMk8Z3yGxgKtpmjGLLpwinEtFT/hdyGP1TML3q2AmMHAYGou
         hxtDcbA/WRDKT4ZvGopThi0Nu58p0AGjah5Ca6N/02Y6Ga39WWLZX5XSel6zvnD16eNU
         EL8AyNOpb/bEDZNCkWFIdG2FgsfmdfxriYtP5sziJR9bgFPDiWDUdW/87xtd8vAmmfum
         JFADjSwhBQXTZPCFjc9KJgol4PSZCQ3bNED/qPvF0xh6wHHbHJ7967Uerflfn9DM5Y+p
         ZuYKhxusjnewN5/w8bHLcYN0ZLbFQjdb4U82rG7Ljshp4ZZ1PqoojjCGPJGxvcf7xPr8
         RRaw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4d3d9T3CHz3sR3CpD5dCxdgTt6BTKTAH9yIDZVL9ldYAELulBDOhKILXbjevHFkShbU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVnSpAr+nv9l5DiZ8j+IWmO1Qqg4J0yAOFpMVYUU1WZRFy4dwo
	sA10ff1Ur4SmvEARHcSh4IZsClADylynSPrfQpJ3PmtX5vjdW8cK
X-Google-Smtp-Source: AGHT+IEN34pnTG+VDuE3PZEwC9pxMHZGn96deX05SD0fOSmE/9as7/OVPtl/gwkUEC/mZXDFDadKZQ==
X-Received: by 2002:a17:903:2347:b0:1fb:8e25:e631 with SMTP id d9443c01a7336-202194465f2mr16608935ad.8.1723852999301;
        Fri, 16 Aug 2024 17:03:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f02fb470sm30534565ad.9.2024.08.16.17.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 17:03:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <71d341e0-d988-41a9-bf61-c691537749fc@roeck-us.net>
Date: Fri, 16 Aug 2024 17:03:16 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: hwmon/regulator: Convert ltc2978.txt to
 yaml
To: Rob Herring <robh@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
References: <20240814181727.4030958-1-Frank.Li@nxp.com>
 <20240816215555.GA2302157-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240816215555.GA2302157-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/16/24 14:55, Rob Herring wrote:
> On Wed, Aug 14, 2024 at 02:17:26PM -0400, Frank Li wrote:
>> Convert binding doc ltc2978.txt to yaml format.
>> Additional change:
>> - add i2c node.
>> - basic it is regulator according to example, move it under regulator.
>>
>> Fix below warning:
>> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@2/regulator@5c:
>> 	failed to match any schema with compatible: ['lltc,ltc3882']
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   .../devicetree/bindings/hwmon/ltc2978.txt     | 62 ------------
>>   .../bindings/regulator/lltc,ltc2972.yaml      | 94 +++++++++++++++++++
>>   2 files changed, 94 insertions(+), 62 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/hwmon/ltc2978.txt
>>   create mode 100644 Documentation/devicetree/bindings/regulator/lltc,ltc2972.yaml
> 
> I'm on the fence whether to move this...
> 

I don't really understand the rationale behind the move nor the rationale behind
the rename, but then I don't really care or mind as long as no one claims that
the _driver_ should be moved because the devicetree bindings moved.

Note that "basic it is a regulator" is a bit stretching. The driver's regulator
functionality must be enabled with a separate configuration option; the driver
works perfectly fine as hardware monitoring driver if SENSORS_LTC2978_REGULATOR=n.

Guenter

