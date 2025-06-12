Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120182F433B
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742600; cv=none; b=IgV5PdBJMQa0zFiXw7ffQex+P3KG/JIe0cT0H2aQF9ZV9YXlrWfYVsu+yzri838yjWqzo+VUDi4a6Fm7bdfz/h+xHQKQr2BRk/arixEIfrk5MKFG3MNAb7p5R9ZeYtIoDOUvUmR5yrN1f/GW0c6ngx5+yAvSJBGM6rfwBdK78RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742600; c=relaxed/simple;
	bh=gfSkNsEDvHrBasjkaxzkBzgE2ArloUcp9iGt4cd2kgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZzPs17L3bBgsZFhkmyoqH1p9p4gYobt7MfhhmUZHuDHygsgU14rBqbMXX1v2xVT2jIcssZbVZsd0hUDZmzCva0HVzrJ6zL0nCX9aI3xDT7FbWxeRwaNV2A4JLkv9u8JQTgfQIWzU25AQ6Mc2Age844JTi3eJNf9UMIE8LyeIEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MPKL17uy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MPKL17uy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4533027c0ceso6082085e9.1
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742597; x=1750347397; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ljv00glv7rh1spp86bQ43dOcZbrTy283SQsKA4sfY=;
        b=MPKL17uyVjOfqZjMS7j1ajeI7cr8Gs7hWI2dqvzlWcBHaGov4Kw3tiAE6u2g66b9Bn
         GwuUFwu08g/t4PiHEJjUXMQnOVAlh3nvVIUYWDgIqF+SadRY6dYOmdCuqW7z7ZmDgArn
         M9xhZQNQtKd0elL9ArnuUKOqCS5jF//J9WpS1tE8VIDH5umFB7hA/YhIyjeVJGdE5lPc
         QTetyy5OrFvw4ZiNNdJ9D8f7hhZFlOO6NYwzqubY4qscAT0tZn/KCuP3lFKIaezeau4X
         SkBXvIOFJE0jNTVg1cbaEK9/8JPJY01fUmx/yM856lFVJ3s4v3fuxEYFMnFzri4CFGeL
         p+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742597; x=1750347397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ljv00glv7rh1spp86bQ43dOcZbrTy283SQsKA4sfY=;
        b=BYCmF3u97lDanFWro1aoQlHgMYd4SD9x5Vcw05KxiKrA/H9D5CTXS2TNoLljn+rwrC
         eCq6PukPHJcbXBym2jIVcqMNhkzRigG+QzV3WoFMJraUc2LoaPSTEcM4/QRxeEa2cgmX
         BKbUzQ2Dd0Q+QR/0AKArF+z+Fcy9WkaqROxvfzq8FfbUcRx29anZ9N0TeHXHTBh01QYE
         mw9tm0WF8L5KE0Rmvjizmflh13FFRReagBJY742g9QF2LH3iShCC/x+Ype+F1/7cZcXn
         T1adBIf7INgBUglnPQ4toc7APWiOnhCFEw0UpjOd1GZVD3nWW13gicpkJ+2O+zVvLoya
         VVDw==
X-Forwarded-Encrypted: i=1; AJvYcCWvu5BjnTGGbaAs8UvUNXLuuCyjxJ3j8tHjLbeA5UBfJOn7Qc2H1HardBlDFelOuVukjZ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzN3atyBhOsJ3nK892E+9DBTgLqdYhFxUwLeFEpKc2FAYRE8U92
	A7FqxpKBsfsFpPdxtiYjT5SNcZsDXNxP8FLO7HW7luK2hMas422eiAbom0VEzh7p+U4=
X-Gm-Gg: ASbGnctfOOkaWWBFooZ1v/nmKUuomMMCyhLlpQLw3j5yPeAQq9sSjORtvRCQc3K70Tz
	6OYaWj6rJe5WmXkCzAr75zl1kQGsBgW4pMs0xlwYhR/dvWgNyQgr39mlcaBOIu3KA1YAf2ZGB61
	sNr1eZkYodtpmvdH4Jpc02I5gzqqz2l0v8KhVC4Wz1tw3wNO4JOYJUJdxEGrvYQiA6T4EtIlVfA
	KGjDIY54Tz0zqO0r9aZvMsNo5rwelV5t6Zs8wKdK+Z1z4ImXUXzHIQqRss/AX/NwpLIsrPi7RON
	AeaVVvLuy7zGYkApLqRL/McGFm6CrB5ZJo1URYjHhx7oElmO/JFrjmX4ds8XNokkOlQ=
X-Google-Smtp-Source: AGHT+IFSR8e8jVVCJqCvh7kcoUQB+Aw0Y24SkOD/mG2mZV1+q1ECgdVeqvoTrAvrNH8EzxirHatO2g==
X-Received: by 2002:a05:600c:1ca8:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-4532b941335mr36533255e9.32.1749742597338;
        Thu, 12 Jun 2025 08:36:37 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm24007395e9.10.2025.06.12.08.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:36:36 -0700 (PDT)
Message-ID: <7e4bcfe4-cf79-4b21-865d-a1248e09ffee@linaro.org>
Date: Thu, 12 Jun 2025 16:36:36 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
 <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
 <20250612143644.cmw6d4iiootipafp@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250612143644.cmw6d4iiootipafp@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 3:36 pm, Vladimir Oltean wrote:
> On Thu, Jun 12, 2025 at 03:14:32PM +0100, James Clark wrote:
>>> FWIW, the XSPI FIFO performance should be higher.
>>
>> This leads me to realise a mistake in my original figures. My head was stuck
>> in target mode where we use DMA so I forgot to force DMA in host mode to run
>> the performance tests. The previous figures were all XSPI mode and the small
>> difference in performance could have been just down to the layout of the
>> code changing?
>>
>> Changing it to DMA mode gives figures that make much more sense:
>>
>> Coherent (4096 byte transfers): 6534 kbps
>> Non-coherent:                   7347 kbps
>>
>> Coherent (16 byte transfers):    447 kbps
>> Non-coherent:                    448 kbps
>>
>>
>> Just for comparison running the same test in XSPI mode:
>>
>> 4096 byte transfers:            2143 kbps
>> 16 byte transfers:               637 kbps
> 
> So to be clear, the 'non-coherent' test was done just with patch 2
> applied, or also with 3?

The whole set, and then the non-coherent patch reverted.

