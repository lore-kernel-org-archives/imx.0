Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21F241664
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527474; cv=none; b=DhFDR2w6vDjOHobEFuyjuSflqWWyJxdQginHpQbbgajsl/TLiBxJB/UbuQvGMmXp5VHF7WGBFgYiuzxhYQuCufMfK86aqOITXbwd8rUMQ3Q34KyGl/bjemxrppF+Bf4CvKn67BVptWvr3aFSrWV7v6S+DoP+eJPyk5tqvtJjaGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527474; c=relaxed/simple;
	bh=fG35iN1kFRAXE21etI8+TbfhHtzWP96Txn+0kfsGruE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7FOjVaizvwvTveSPMa00DulBpBRFGqZaJUAAYVKEPuizW9XpQLnTbQgK0m7K1E90e5l02B7S9EC6R0+9gacFqL3zwk+oNESKbTYDp1eMucRLo7w+XdlPaBEUdyl0Gw4Se6G4IRjr1WuZikYkxs9kV9PIvwnUiPeH7lKs6Sq4d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dotHjKdB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dotHjKdB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so2687802f8f.1
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755527470; x=1756132270; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YqUCIFuyjgf9dWStxbEJTvtbXAyyq5gx6EE3yh2DLD8=;
        b=dotHjKdBUZEtU0vmZ7wfqLBghnSgdd7YcN5aXAVCNiodjlbb3Ac6AXdcI9+x+Mo7Fq
         dX1z/CUR19G3radfq9nt5oncKGHIGryI70Og3Mmb5k1HMuwoqW1NuEbe8vGS/gDJYUPf
         hb6up6mgjCI02J+He0zJpJxc49VVLDDoPE3dAa6IJW3KaIUWNlfuxXXFL4d/YtBRofDX
         weyGsD15Ma2YCgozWb7tErnQOzipS/PwKB5Hl+AgWAC05JrvYu6VpoGo9l37swJDWzCK
         Zmc5YHdQLuRJwrDq6SygqcVIw/0kXcq5IFBb0TnY58N1sIzvNyejaj1taZzazkgcqoVk
         94ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527470; x=1756132270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqUCIFuyjgf9dWStxbEJTvtbXAyyq5gx6EE3yh2DLD8=;
        b=W7mOKvfhwiQD3ayCbZer+Abkga6aR8uZov1Gw9RTyKqSHkgn8Pyshw3pFHdz5sK/xg
         /mf9/6v0oSNrPNZAbeHQwe8dNQAoZX3RzUulVrG8c6j6j2yXQxTY4QYhcSw1i6YYntAQ
         duquK3LDXO8qdwI0PvKlYsPcHH0kRJdIUjHI4YufpSh55HodEAPj4o0ZJ9mleBSQuFRq
         LnAurfuWpxsLfI2L1F15spjz0gTob9Syx34uoyBLa5XiIASizuKLDmrycHsPsMwoZ32b
         JjE0DuONS6VJVqYbw+byD7eS1Ds2SlXNJdHslxKND6V5DJl7gAHhkCcHghTP0lWD/EZx
         PPFw==
X-Forwarded-Encrypted: i=1; AJvYcCW986qcVAHE2bygLMs10jausj90CG+vzc+W3UYnW4pXMFCvXCzesKXb9nA6NT/jwKMxpw8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQJ6L5Dnic0gHph7V1NOYvNajb8i8QuvzmjDJf4t4Wer63eOk5
	36BNtx2U6yv+41mpLE/D3iiyrCAA/xPuxwKP6pl6CybpKqPLsVvzKVIfABvHljmWwmI=
X-Gm-Gg: ASbGncvKayFzdkN0w4qgMYJuN6VdffvSfpuhtjH05V/uZb+1CwMXbyj+D2cGP2e68MK
	SXCN1hVv1kG6psCUX9aDrbr+y+Dd2fQhpu0mJ0m3DFD5JUgiF14XxUzDW+4mlpJ2NPgosjTx0d+
	hcod52alr65ScRdbixYSS8uyhOEO+mbbDG4OnvRHlsjHdIlj7IMakoZA+zhJ6ZE0Z0jKFgK0uiw
	guYaxeiEkjySQt0LzzydYkwz4nc5Uc1A1b0yfCi1eFedDKbymQZeR9CnFjI+gniaASP9i8eo/gD
	AxKLjJqstiRGG9GrnA9DgiNPKy6ZEJookyw5yVoTG92SQmhrw4YCaBkhlciF7n8VDO9T3LzligI
	5jxSxTUWV0Ifay4j3sPEQzQ91+VM=
X-Google-Smtp-Source: AGHT+IEIVkPMjBrXWVFI0F4OEOVQGx0ZBgi9PzSgWdLSOcLjkm3Z6slxreu6ZYNW317l5cxTvC2cUA==
X-Received: by 2002:a05:6000:2289:b0:3b8:d14b:8f86 with SMTP id ffacd0b85a97d-3bb690d1f0amr9352479f8f.45.1755527470412;
        Mon, 18 Aug 2025 07:31:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64d2a405sm13313387f8f.20.2025.08.18.07.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 07:31:10 -0700 (PDT)
Message-ID: <1f3b68d4-e0cc-4952-a695-322ed9756b95@linaro.org>
Date: Mon, 18 Aug 2025 15:31:08 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] spi: spi-fsl-lpspi: Add compatible for S32G
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Clark Wang <xiaoning.wang@nxp.com>,
 Fugang Duan <B38611@freescale.com>, Gao Pan <pandy.gao@nxp.com>,
 Fugang Duan <fugang.duan@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
 <20250814-james-nxp-lpspi-v1-10-9586d7815d14@linaro.org>
 <aJ4qNVIp788gc2ZU@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4qNVIp788gc2ZU@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 7:25 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:50PM +0100, James Clark wrote:
>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>
>> S32G doesn't have the max prescale erratum and it can query the max
>> number of CS from hardware, so add those settings.
> 
> binding doc should first patch. Create new patch serial for add S32G
> support only.
> 
> Frank

I'm not sure putting the binding doc commit first would be right? That 
would imply it was a valid binding before it really was because the code 
change hasn't been made yet. Practically both are required so it doesn't 
really matter which way around they are.

As for splitting the set into two, Mark mentioned that he was ok with a 
single one, so I assume that's fine? The devtype_data changes would 
conflict unless they were applied in the correct order anyway, implying 
the need for a single ordered patchset.

James

>>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-lpspi.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
>> index 6d0138b27785..a4727ca37d90 100644
>> --- a/drivers/spi/spi-fsl-lpspi.c
>> +++ b/drivers/spi/spi-fsl-lpspi.c
>> @@ -159,9 +159,15 @@ static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
>>   	.query_hw_for_num_cs = false,
>>   };
>>
>> +static struct fsl_lpspi_devtype_data s32g_lpspi_devtype_data = {
>> +	.prescale_err = false,
>> +	.query_hw_for_num_cs = true,
>> +};
>> +
>>   static const struct of_device_id fsl_lpspi_dt_ids[] = {
>>   	{ .compatible = "fsl,imx7ulp-spi", .data = &imx7ulp_lpspi_devtype_data,},
>>   	{ .compatible = "fsl,imx93-spi", .data = &imx93_lpspi_devtype_data,},
>> +	{ .compatible = "nxp,s32g2-lpspi", .data = &s32g_lpspi_devtype_data,},
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, fsl_lpspi_dt_ids);
>>
>> --
>> 2.34.1
>>

