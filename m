Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7213E2045B5
	for <imx@lists.linux.dev>; Fri, 23 May 2025 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016138; cv=none; b=YqWOELpfC8qEGOyO3wCC2g0CKI42rjCgKzWQSXrtoUKC5DBNKYHHkaedIENI5HyMo5WZb3kKeUYV57Kcd5yuQNhIDw6pcPjbdtdRvRMBnS1YSLV+FHVjy3fIUM2FtLmb7eXRhhAfHtuz7T1yFQTkwYOXHFttMM3ACgS70+Z5nsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016138; c=relaxed/simple;
	bh=ULx+MNjibrCmAVyg9aLR5Y84x3CqoG0b7VwA36zAdG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXfzRReXvLe9xYs19ON35qQ4iXvaxKeZy2QSEG96lqtyKn7PW7uiL0lCqlw4OVTIXnVmfwUZcg7a1EaDquNiUIQX/X/AcjNiWcCYmMnTwG68eQicMeSdXsvPTrt4a1y7fWBhbm+BRNW9E8rZq2snFQcOuf3Np1to1TIpWZoGKBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjR04K/5; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjR04K/5"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30e93626065so106735a91.1
        for <imx@lists.linux.dev>; Fri, 23 May 2025 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748016135; x=1748620935; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EgG2pX3ezAqX6Y8tW/0RzIqPZ6C4NQ0/ki8v2ugMunA=;
        b=TjR04K/5n95itNcFxSDAVl+qn2DtXaI4qpX4ihZA4UBdt/Mvx15z1rQGpPC3OEXAmr
         KAfbFcFQpSsQUp2pUvnI+Ox1bi+sg8epUApsKJRyJwpBNi06v4gf5hjYBthqpq8ELj2z
         LNgOXUSzTFgQRMWwOY/gEY5OxhxYJbgUYRTjlXejvlWjXlGRV9SuiuY4XfT11uTaPpJ3
         RM7zblfpW/xrXqC11BtGD1rvTAiG0rFpdzMVN5zaDj27XSA+ZYpHKMMcsOzZgGuvtqbl
         QNDqqGv0OWCWxF8aerDHkqVmQMllZHkZMRPpllx23uY/knvPLb273bD+1BiBmKzHBcpx
         s1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016135; x=1748620935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgG2pX3ezAqX6Y8tW/0RzIqPZ6C4NQ0/ki8v2ugMunA=;
        b=ChwifANMxe2YOZbKhADEREFdL30rhzG6ota9kQFNzh5dP0U8mwvndrjjW5zHGEZRg1
         1oM3XjwjL2jc3glWrkI/DOX90jtu6GcnxzroHmb1ba/8kKOPoiPisYp79iT4jrEgcILH
         tFgUKNUXY45H42Dz7oeZ8u6rrR8AkiISXLj31AbSrlWAnZUtnIPe2wuqSv0mygtZsGaM
         NKw5V1xUZ6venK2CX1esYQosjPdD97GSxg0scbhVhSG59zjjzciXc0w7CWQ9JOJFMCDU
         lnwMBmC33GAsFjwwQu16EcDVnw/blfcEuuFCm3RtXU8fF1SImKrsU3EJbQRiQ5XXkze4
         ciPg==
X-Forwarded-Encrypted: i=1; AJvYcCUmp5kAw1ZolvngSo4QCt450TIJ3bhHZk56segx9m5pXxU4wKoCovADrNUfwvWDOTLj4Oo=@lists.linux.dev
X-Gm-Message-State: AOJu0YynJGZWWEciN6qyV0p2dmVG4gJyR3E0//VyhQ8dzERdJbh868gc
	RuL0UHKuGAlLo02YGI4awSpsP/0LXuImmLH8cM+HfllXxXtAQU7YBwfT
X-Gm-Gg: ASbGncsMqBNlufn2lnXuxoHNSJDyVE8KqXdU/sca5g+20Xwe1hqwKdOPPs4YcpE3qAJ
	kLwrux6M3YKr2K2OK0Waqm2hso+oOs/4bkZEShY/8jUbCJj2Nb5+7WeHrMLVjJbsbetFUrwjxxM
	7JQxljycryeYOcUThpnmsuRYQ6rMzMyUVdMIJJ8ypxkDeQouhr20BEIpsrCyeKPzHzeZ+D0JvpS
	uNIEpNiFBYTycbf85HClrJeVZr72Cx8ZfF97sfBrv+rwvts7mYMCp1OCGWqLoaGsWoCRMD/TYXs
	etmXAIeEUNwMPXwsY95mdct9zCEV2btE8sjCMAUPbdWSCNQRGVq1Tt39C+qAUmtQ2/z62fWMTaF
	vcXCsicPHxNIZqh2q6S7fzYep
X-Google-Smtp-Source: AGHT+IFo+VP3pNMQn0GZxFiYSiIjmsMlFpQYtLb4nAS6aNmwszH5V9z/6JT/Uubv2tthxBg4GNH7Zg==
X-Received: by 2002:a17:90b:57e8:b0:30a:255c:9d10 with SMTP id 98e67ed59e1d1-30e830e87f6mr42819646a91.8.1748016134484;
        Fri, 23 May 2025 09:02:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365157d9sm7520384a91.47.2025.05.23.09.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 09:02:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e11aade8-f646-4d94-942c-6186f06fe783@roeck-us.net>
Date: Fri, 23 May 2025 09:02:12 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: Add compatible string
 adi,adt7411
To: Conor Dooley <conor@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Noah Wang <noahwang.wang@outlook.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Michal Simek <michal.simek@amd.com>, Fabio Estevam <festevam@gmail.com>,
 Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
References: <20250523151338.541529-1-Frank.Li@nxp.com>
 <20250523-fridge-scarecrow-982578c16bf0@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250523-fridge-scarecrow-982578c16bf0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/25 08:30, Conor Dooley wrote:
> On Fri, May 23, 2025 at 11:13:37AM -0400, Frank Li wrote:
>> Add compatible string adi,adt7411, which is temperature sensor and
>> 8-Channel ADC.
> 
> Usually for iio devices supplies are meant to be documented, and this
> device has one.
> 

FWIW, the driver supporting this chip is some 15 years old. I don't think
anyone was talking about supplies at that time.

Also, this is currently implemented as hwmon driver. Is there an effort
to move the driver out of hwmon and into iio ? Fine with me if this is
where things are going (one less driver to maintain), but I would caution
that this will result in an ABI break for users of the hwmon driver.

Thanks,
Guenter

>>
>> Fix below CHECK_DTB warning:
>>
>> arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dtb: /soc/bus@40080000/i2c@400e6000/adc@4a:
>>      failed to match any schema with compatible: ['adi,adt7411']
>>
>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   Documentation/devicetree/bindings/trivial-devices.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>> index 27930708ccd58..38bc1937ff3c9 100644
>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>> @@ -41,6 +41,7 @@ properties:
>>             - adi,ad5110
>>               # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
>>             - adi,adp5589
>> +          - adi,adt7411 # Temperature Sensor and 8-Channel ADC
>>               # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
>>             - adi,lt7182s
>>               # AMS iAQ-Core VOC Sensor
>> -- 
>> 2.34.1
>>

