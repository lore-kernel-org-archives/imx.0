Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760AA175A80
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277032; cv=none; b=YxqS2fuQjUql3upy9SUkC+eeYSi0KJVoB+kWDXEK1ubMUc0x6sXP1sAOO26ZqyEgzUABIP856b712Fx/A/YRuz6gPj2Z+cP3XsXZbeMQFamQ+162U/gDz4rZem0n+Jkkc8O3U//5fXNlW4VRSlvbhljczEJUrBKvhmdHA3pTmY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277032; c=relaxed/simple;
	bh=TjnRYqm+07dz1JIPm25P3R4cWx82uCOBLAu76ZxLyi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WISERdjKNc0Coe80ePbDuaTwCL+PdzBKGenUkVu3YEvSKOlXE2lb3aYHLYKyYJd3qyNcwQfpvnrpQkmzhdgd63nMr/juA8/SGgbpzC+R56ZAdjfaHYOw58I/6fYDB3Ag5WnSpL0EWE+JHFnvuUw0ez5SCnz+RX6fe/jIa3an07c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY2w+M/3; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY2w+M/3"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1271257ae53so232305c88.1
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277030; x=1774881830; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Mw89EmH8qUZwnDDKLdU6WpDiI5F4oXbKdFeBF7Ff7+U=;
        b=iY2w+M/3utWWVMKdUQk3BoJsCiMKmAMQuPoB+Lmo1/I0tpfH/f2wGD9Dq7EFhNXmn2
         RZ/jwWbijBIGVhfA7ZTv925u6qHlUUiHXTM+RsutfitXjzx9SKak2fjiIUEuNLvIyLS8
         2k8S9PEuGr33OiXdRmnInq7K/Ktdc0Svf1EBlVEs5QMEWQHGYX7gHfn+J1gQfSASBJs+
         W+xslJJ3Am/t9p3IidZRk5E+4HzeaodKGbIELbQ4ivNQH5YcUL8uDkkDz8oCyE46nmDt
         XOzUutI0h5EZ/bG5k8vmsl7HlKb7r9LbdpZjvBD40rkNF03vPzzWK6PwnVFsAp+f2wR0
         drgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277030; x=1774881830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mw89EmH8qUZwnDDKLdU6WpDiI5F4oXbKdFeBF7Ff7+U=;
        b=B6Qipk051zBP7Mchu4SdWSnsry3zT7honaKedvMIVUpys63vk16scBJiu9G99HO2nC
         S9G+Rf+HhCj/Vh80OmFOREbh/SG+MmeBAPVPCUdi9GU6Qzlgnc3j+0AUVJLn+byYheGh
         OgT5iFPh7X0OPswzpKVjXEQ1W3+idgsnVEgwwxKzPj8ptLL1fgLZaQGEnhJ50dzFQoMr
         tzEwyw+FLaOmUhI3XRqScwhHKMwb4DIZYB2b3+wXT9YqrfDGEMlDd5zc++nqTEwAp0Rx
         eE5BkGxUJzvDdCJInrFjkQJ4duy4do8X+j2ScHNAQJUcXE1KQDuD044AhlBfRlz2t1o2
         l+og==
X-Forwarded-Encrypted: i=1; AJvYcCVipFASFaHL8my6SI7+nlr877yfiERIRC1P89sQjCli98FBO7yUKcVfbBlpGHIOH5bjj5A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZR5zj5zhZA6mmrh6pRW3P0DgNmDFUd6M4KZTaYAfcw68dU0iB
	I2jr41yQ5IxGl/T7QuLmpSZOrqcaJTVjxmc5+8Fdd2AEkNCIRsS0+prq
X-Gm-Gg: ATEYQzyS/efTscatKFdFeGe5PbbfquK1SKlWbiPhd1i7gHmxRbRwRR4GWsbeuXCid/0
	PoHQ4a5nkBouYHWfHC9XGmLu1la1hJKdOVh3w9yjFGMiQcdtjUdvFg2RgDyDWb6EBhQZ0WQGI/a
	dBmTOk1aaW90Fns6IoAggUgObGZlD7xFj+ko9rrGCzXznEdZqAi1L5vxJRQrhV/s72Q6sM5dBXg
	qzC4idztdYbvAkPoGQh7f+VkmBHnds7206bDO3d4AOL1IlsKKKPAyhoroy5kbWt4C7nwJp2uvkq
	L37eRzSZjHt+0INxaNOM6RzuNfdThm3obwrzR7zBfeIN3nLTfZvJ3EGCp8TSgRAKxtPIpMi+yCn
	WeZC0k+P3CMh9h1qFZHYLhqiIWplTNsHkX3yoVNjmE2Ypp+C7Gmw1lvyYNT9nrrl8c+xeTX638Y
	2q8jOU3JaH1NhQEL3K1EVZmUfZq0EouhOyiS7zuKySQ2w3PkWiExZM/9OwA+7Zv/wVKj4oLfd0
X-Received: by 2002:a05:7022:327:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12a72684c44mr5788964c88.14.1774277029439;
        Mon, 23 Mar 2026 07:43:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733e794esm9375194c88.6.2026.03.23.07.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:43:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <72ba643e-c716-4332-bff0-f9d12add0cc6@roeck-us.net>
Date: Mon, 23 Mar 2026 07:43:47 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: emc2305: Add
 fan-shutdown-percent property
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, florin.leotescu@oss.nxp.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
 <20260320152959.1575978-2-florin.leotescu@oss.nxp.com>
 <8a8d2991-cd85-4aed-a7ef-a90b0cd10fbd@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <8a8d2991-cd85-4aed-a7ef-a90b0cd10fbd@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/26 02:10, Daniel Baluta wrote:
> On 3/20/26 17:29, florin.leotescu@oss.nxp.com wrote:
>> From: Florin Leotescu <florin.leotescu@nxp.com>
>>
>> The EMC2305 fan controller supports multiple independent PWM fan
>> outputs. Some systems require fans to enter a defined safe state
>> during system shutdown or reboot handoff, until firmware or the next
>> boot stage reconfigures the controller.
>>
>> Add an optional "fan-shutdown-percent" property to fan child nodes
>> allowing the shutdown fan speed to be configured per fan output.
>>
>> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
>> ---
>>   .../devicetree/bindings/hwmon/microchip,emc2305.yaml      | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> index d3f06ebc19fa..7bcadfab9fc4 100644
>> --- a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
>> @@ -54,6 +54,12 @@ patternProperties:
>>             The fan number used to determine the associated PWM channel.
>>           maxItems: 1
>>   
>> +      fan-shutdown-percent:
>> +        description:
>> +          Fan RPM in percent set during shutdown.
> AI review suggests to update description to 'Fan speed percent' or 'PWM duty cycle in percent'. This could be an easy update.
> More important question here is how should we proceed with the following observation:
> 
> "fan-shutdown-percent property is already defined identically in pwm-fan.yaml."
> 
> Guenter, should we move it from pwm-fan.yaml to fan-common.yaml and use it here?
> 
> Our initial thought was to add have it merged in microchip,emc2305.yaml as it is now
> 
> and then factor it out in fan-common.yaml in a later patch.
> 
> 
> What do you think?
> 

Both are fine with me, with slight preference for the second approach.
Please do whatever gets approval from DT maintainers.

Thanks,
Guenter

