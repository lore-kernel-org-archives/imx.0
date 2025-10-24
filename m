Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C7347DD
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 00:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761264247; cv=none; b=f8wayIbiziN6jwOpHp3B4OBCmkD/hWbBPUUr+RiD0iMa8CR+arq9hB1zIXShfSxc2ihbdbZBMXKfy+3aHQ3GEe8n/21uz5er931UKiHK/FXImfR2WO4D4w3vwhvVmxC7enqKZCSWihx11U+pYNT+0xd9jUi6yHDNKbw3kDMt5Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761264247; c=relaxed/simple;
	bh=C1jkv51ztRxfrNfz0d7YqP/iXJQqsBRzL9QozwFBY9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCfjCdCZWM1npVHAAmyq9h+ysee2+9nA151gD20RRGM3K++HCw7OA+6QEoMsFS1DZ/96RU+9Ffr9megEasgYzq4ak/DtL5kxlfwyTg5o6Pn55oq7NQbl/vZGAiD4jmgIYyzhugWyhw5xV9kId0AzRGWKKjyFBR5pwInzS78MPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wqgnjsnb; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wqgnjsnb"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33bbeec2ed7so1381973a91.1
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264245; x=1761869045; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDIR1c+Ak+2fqutJiwvCBnlZ0v5UftOa0ifZP/2OQnc=;
        b=wqgnjsnblfjTMkEiWjlQk3tOLpUvU5uV8fmB+1893pLgzofE6Rm3uaa4frJ1TRFHQj
         Q/Ryo9P7XmCapbx1BQkNr0NQSqIKBXlTP/eEts8W+vilMHBajxgSBq9q6IpZcQ9Jxzbe
         3D9NrJ27t6m0gK3qgS15FIlDhIHRVJt0YVP/rGjzUCgJyR60ETr1uxZOkHbodGpyMIuN
         g9ZlHGzTQXpTsLwLYSCTopEYtexODcTihn8jPkd9VYh5zVe/PlrKJzx0BdebOt912akC
         CY4knfQVLotIx6o1pLZxGSyVzxMaGgolQ8DEWId99B6WU+RxLaDDuZxAqBuMHOvT/eXo
         4wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264245; x=1761869045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDIR1c+Ak+2fqutJiwvCBnlZ0v5UftOa0ifZP/2OQnc=;
        b=O7kaJDjs3wWvyu+cv/MZdKgeONAAjA3qeG/2L0H+iwx4T4aK15mEDrO7sVsU39B/VX
         EejP1uO2Ifl8K4UU0ZCDRQcCkJPCx1Nyq8GhqEsVXzH4S37/3b5BuubbKMhCzLw+QAjv
         YZt0WHlDJ/GM1twSuUc39cECVdyNGKTKO2R3iLc/w33JMYfCwG/kdIpOjhQCXU6U9Q0w
         JmVEryG4T+SHIhrnWdwYTLjcD8EQOycZ4Ga4uV1ykc5X3qLcU4S8j9d22SjLW7zYw3qL
         H51asgPa7G1T9E9mFfsmuOzD+7gy/Ure5DPvBsmp9UngxYZJWsfCXyMtMbO5Q2qtsH4z
         RpHw==
X-Forwarded-Encrypted: i=1; AJvYcCUKXjvmFinlOpiFhmkxkWKONJZoaGLo+yZX04y+QXob3HOXnDjGytaSnZFYFd19o7+m/oo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlRhkonQk1mqnuOZE5na2Ft94zuZKudEi158fQhBX4vUdQDjIG
	PHRoakotnfPLqQYMOkGR2D1fVKisakWoHtRtGg8YacwsiswwpRNrSUtbis5y3BTedHM=
X-Gm-Gg: ASbGncs+iJPFJ442AuxdrLv4JX/HeU0IAxlVvdObr7y0c5RkXTJt7vof+E6KfaQivdi
	uLCK03lZI8Gp8MZn3a5SoKpTiCj5l41NNQdIg8BAcM+JjPEr15qz19RRwDzGaqkh0pGLpDwHvFW
	hj/ZrZZzp8llpQLI/6LlkP1sVBkQxenqiQnxTrVctSm65UTjVa7oigw99fhSKcN0w70NmLcZ/IV
	q1IM2OqvpHpuO3co3v3hoUYpm19gIva5yJ3OkLDrMLnrMCyN0WaoO6Vs1FtH/pgk+MKG0iKBS62
	at5xjxE2XGW33zy4pZYGIBItNQ8mCvdSY4yjO9CbFN6ZV0/f3fTyK7OY9G2VkYK4HzXdnlCgEE9
	Wr+p8Gp87SPnsc+vR5hpr/hExP+oXOw3Qz9ti4qDvHEKncVaPDa9KWX9Y/BEiUSVEr2GMhUC1kt
	OcmTLwwocxZwB863AF
X-Google-Smtp-Source: AGHT+IH/sqOkgJHPoJp0C3PRAnpePjJuvBDUdrVuB7xX2bh8XQc9etMQIVsugloCyKqrfw/GQPbVxw==
X-Received: by 2002:a17:903:38c8:b0:276:76e1:2e87 with SMTP id d9443c01a7336-2946e22bbcfmr48197185ad.44.1761264244857;
        Thu, 23 Oct 2025 17:04:04 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:04 -0700 (PDT)
Message-ID: <c4da7114-09c2-4c66-bdec-ee80cd7c5f5d@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:02 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: fsl-qspi: add optional resets
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, han.xu@nxp.com,
 broonie@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-3-elder@riscstar.com>
 <aPq6+4RwGeru9Txw@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq6+4RwGeru9Txw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 6:32 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:14PM -0500, Alex Elder wrote:
>> Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - The "reset" property now only applies to spacemit,k1-qspi compatible
>>
>>   .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index 5e6aff1bc2ed3..edd3158a6f2e8 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -55,6 +55,21 @@ properties:
>>         - const: qspi_en
>>         - const: qspi
>>
>> +  resets:
>> +    items:
>> +      - description: SoC QSPI reset
>> +      - description: SoC QSPI bus reset
>> +
>> +if:
>> +  properties:
>> +    compatible:
>> +      not:
>> +        contains:
>> +          const: spacemit,k1-qspi
>> +then:
>> +  properties:
>> +    resets: false
>> +
> 
> strange, if-then should be under allOf, I have not seen you add allOf. And
> original file have not allOf.

The file currently has allOf at the top, to reference
spi-controller.yaml.  I'll include this next time within
that allOf.

					-Alex

> 
> Frank
> 
>>   required:
>>     - compatible
>>     - reg
>> --
>> 2.43.0
>>

