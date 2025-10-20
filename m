Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D488F26B0B7
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983613; cv=none; b=Ht8AcaX9/Wf+ydNXLUeUxkAJRJQ3gunnOuWn5KCmete8BaXpSN1cFulMB/L1UyO6E3VSfFSFLXlz5WDUklBGH13pI2BoyQswBGZa+LOkjrhZK+2ArPE5d8oHxLPywgfw0WzsswF/vrC0fOc3JAdobdUCPd82ifD8JWrSHtj/Px8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983613; c=relaxed/simple;
	bh=SZsJevmbz8OxFMZ0VUQMEIMaBdwy5skEPKFMyP6eStw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jpqc6nHAxd4LMZQKHeJNtTpAnj3heVAAnD+83ZoCAu6uRZi0/FK34j5VAIsciKrlgTnIcbbU8gbOPB9wHQTwx+ydwZWvylpd0Rfm+BJyHDU15MMRnenKCGLd7SJAeOxREvlLcihKURJcM+/A6ZIvwmpN9o6DkXsHNyI2s46WRcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ADmUkLrT; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ADmUkLrT"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-430e6ac6bccso3968975ab.0
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 11:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760983610; x=1761588410; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Cb9G+JdDcieHiAzL0OEVFR37yQ/b0GUUu4YH0d0n0A=;
        b=ADmUkLrT6i0Rd1rf2iCjaYY3d9r2WIGjtPBTpVSvZhG2sg309+njVgEf0mBSH4CPXA
         JlMebfm6RX6ls4OLpMMwxxDlQT2dmW05+m4Nv06WGCJRTpe8EJsT1ky2vCkJ8OncNCGk
         pafLRxQ0mi0M8ZJpCL7Gl/0SKturzx1qywWBv2Z8XbgWc7oQZtuKVxPVSdLE41MTIZ5r
         AYvJ/bj0nF7SpV1FtXv+DiA+DVSTS1JUlVDPx2cB+uVLV3MiGTtM/i2vAx4kHn9ES2a6
         0mECZbO9p59gpQQ6KXRLRKQl3sYZk/hwZNvlM88Lbel6kfSdomQjFRuXhCYWYUy0xbr1
         hFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983610; x=1761588410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Cb9G+JdDcieHiAzL0OEVFR37yQ/b0GUUu4YH0d0n0A=;
        b=BTcbhmBVYOf1fn0uFXBXhOQHb4WPVZuQzag76fLy0j4UtxdanlD48BdSkWWNMd0bPR
         LU4yagNs7+qmodK++0THiPpcKz1jkLW68UqzPR9AJIbN3aGSitnzv9F1a5NJJ32qbA57
         RymPvu18vn1O5L2uaH99W87WW/1aX7nUFyqNHbjT8TBWbNUXFNqtZbAPAkuPFZoe21GN
         J5sEzdZeWPsqI7mf7piCRrQB5vozSQh3tnj65Vj7w293DiTG68RJHGbP7dhkRDgXZ8Pj
         QVXIqiLVYNbQa1JNVbcX37B07gJbDQIi+tdoMCNK0l3hzwGBETI+2WsQq3zMIYjiy/9+
         OuQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfioSc33iQv6k0gcTzJXqLbKIf2stf4ZdcRyDY41eFckZa3Jgo5qEYX7kaLhqAyrPa6CM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhEWnA0QstOt8WmPQ9zQCtwvA7IZCQk+vM6723AreqXxjRz4Lv
	4TdQO2MAtlcymXq/V6PlnGNTINODcnUkpCHYHIhaCnl4V3KsQZGEBQer0BLIJ5svTTc=
X-Gm-Gg: ASbGncschGs9BvlPEUvsBaKyffeTIGSs9RNRo2IIgKPXhuvQbIUOD1hj22AGI3eWGqk
	ozkXpHGMtfALZN2eCtSuepUcoz+7XcY+3P98AWY58/wyOpvp7nOizzzQD9sHBYcFdO5/hkv+gpo
	yK3YTFVOqO8WNTLbcWdYnetZZUwWhINP0teCWbcbnj4TKlplBORrehmLeYzmJowsVSgXFcPaRsf
	aOyibvXiwMJtXOHbqVGYm/y2VZ8BnAd9NEOMEzmNf3oAc4TTrsSU4AQgh0EgTxQcW9LWbONySti
	4LjySLmsAy98Cqdk4bukJ1qpDTI17riO1OBjBmOdKh62L8XwlrITyAt6mIyeGV/R07IHf34XX9Z
	vkJ9xaauP6XtxyoxNn6ERZVqdUV4l92cpizSHNg8GE+NaAwprDvGf/zuFfIlfEHkn0XpQfG10GT
	SLzCVRHi+y3r69+m8aYaTCkX3zFlVhahE9EhG3EiBV0xlL2Ago5w==
X-Google-Smtp-Source: AGHT+IFDdymJB2Qui1FemWWgGTvX6CFYwAWlPQ4NJbUO3JNIaIrN8E7GPCA9FCFosUo4bQy4mXpGxw==
X-Received: by 2002:a05:6e02:1563:b0:42f:a72e:e179 with SMTP id e9e14a558f8ab-430b43675e3mr253211025ab.11.1760983609985;
        Mon, 20 Oct 2025 11:06:49 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a961e88csm3172542173.15.2025.10.20.11.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:06:49 -0700 (PDT)
Message-ID: <09484591-e1e4-45a8-8451-afa8feeaf5a7@riscstar.com>
Date: Mon, 20 Oct 2025 13:06:48 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: spi: fsl-qspi: add optional resets
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, han.xu@nxp.com,
 broonie@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-2-elder@riscstar.com>
 <20251020-henna-headache-fae4440ec7a8@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-henna-headache-fae4440ec7a8@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 12:44 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 11:51:44AM -0500, Alex Elder wrote:
>> Allow two resets to be optionally included for the Freescale QSPI driver.
> 
> This is a binding, please don't mention the driver here.

OK, I will reword it in v2.

>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index f2dd20370dbb3..0315a13fe319a 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -54,6 +54,11 @@ properties:
>>         - const: qspi_en
>>         - const: qspi
>>   
>> +  resets:
>> +    items:
>> +      - description: SoC QSPI reset
>> +      - description: SoC QSPI bus reset
> 
> If none of the fsl devices have resets, this should be added alongside
> the new spacemit compatible and not permitted for the other compatibles.

I thought that, being optional, this kind of constraint wasn't
strictly necessary.

Anyway, I'll find out first whether the resets are even required,
and if they are I'll rework this the way you suggest.

Thank you for your very quick review.

					-Alex

>> +
>>   required:
>>     - compatible
>>     - reg
>> -- 
>> 2.48.1
>>

