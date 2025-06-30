Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1711238151
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286203; cv=none; b=TWI110plcqTKqkni5nmoSzriFX0vnrnjFruCa4X1CZYOjVIPcgCJoNTvd3s1PhfOWnuy8NmefjnW5Bjok0x2ISpE6U/lV/fm23PS5CkbhHxNnCLR9APxFlI36oQRMHLqejs7kCFf1CnrOgGa22BrmaztYCjM8HOm6Wxy0aE91pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286203; c=relaxed/simple;
	bh=JLHrBH6b3pfIzRPLJnJLspPSOA6Z6HMCAWPpwMR3Xv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mKCYNiFi7je6CLvvaCdcHeOrONbLS/WLszXx26mXgKuQIssYgkK44Xl4KPF3hzgT9xus+ClX19T8qdWoP86vVuLMeeNXXAy3I1S4Bs7BGEbsiaI3hQif+xugdxpntnpqBqP+MmG6hX4QJzvdAuOulFX6+0Uwea0O8XPovi/R3I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f13yq/ag; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f13yq/ag"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a52874d593so1744141f8f.0
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 05:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751286200; x=1751891000; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+LtAbVIirZlxLY7Yp0KWHNw1TQGQMGY23zMCzJj4uA4=;
        b=f13yq/agIj9xDDDSSY3nb5mUe8kOtmnmQskHM9JdiT/IiDFKzTq97uU90jTrbo2Jmq
         ZqoXbH1GpHPFdfFl4kO0A7G8mrdYoxo20Nj2QzDARetMrlS2LzVCnKYIHd/EVDIjs7oH
         albtwSHbJfSNFdPUC+ifNw83RIGbdD5AYv38iz/X1Zu7krVYSeh/xEe2OEuxGneBS+ja
         bM28qKgNlrQcdmiGzowsGsQGhnaSMVqy76g1HoAvjb5a8Zmk/Vn+cHn8aHf9rVDXg7ko
         xO7EZHH/CwscGLmtsK2rj9U4M+dDEuAbJuk9rq1Cat6/lg2qP9K22VsX2e5UiEIpiZEu
         GrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751286200; x=1751891000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LtAbVIirZlxLY7Yp0KWHNw1TQGQMGY23zMCzJj4uA4=;
        b=Q+VULl71l7iO89FHuq5ylCoEke2bESxWigNI+IftMjPQJc3a/8ojDWH5JGF/sNZuq1
         4pnkBjzx0hMQFuP/h0w86PysPxLC8QHkGF/sO6LDWzOGuLKyLHjD+geaI1Jb/QqPHhLQ
         AlX1sEfTOkvqzrN0x/xgHaFaWFhr6MObRzEbfHgd6Lh8k0La2PySQ4M/OSgvE3Z1dmNe
         54HdSD/ApXOozWvRTa6g3YaKYCM6fnnC82VQ5Ufg8fsv1lHsw5bN6PRdQuAYybSfwh3F
         HZvZ/ZOqYI6xWYTlu04ikUsN/LXBPXVh16jfqky35F5GO7s9lhc0xgOlNDnP2c23kikh
         eIKw==
X-Forwarded-Encrypted: i=1; AJvYcCWD2qvhMkvXEJ3C20iba40JfY6MKzSynyM683uK/qNWHORESXGif6/Q47rd1bRzBUBEkqM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEw5QTmyYmux1ARda8PvLuRprVkAqhf2cyDymNLH/rghlT1tqd
	59Qnkm47KK6qF0ombcAiUYwzTrM7w/G2+O7YO8SwyUHRxeG4pI8ObGKy/Vvp/3W+HK8=
X-Gm-Gg: ASbGncudLIo3+pwTwzbRo5IwXJctb5dYRMBPpXAgqDu6chBPBBAKVKg7gLUsIUNiUPW
	/2EZkThH/KenaOEPq15opxabXvBOp6xp/qaGK8cWBRnoJ02Q/XOsd1GnboFWC0Lfitartm6NHF8
	wqtc4of5wZIbQ4CqjeNt479N8ouHY8euaWz3JyTJ41qzxi67jtOC2TLp7Lv3A9ICwnY8IzJBgQt
	Ik3vJ7vrZRX5NBL8ojPfhXX2oe234eUxO3Yei0dqsZbpRgJar5QRzm7HvOnw97xogpIurz+GtIl
	HN9OS7otgmJNaEXytLuzVgUovET8VDEijmtTug+5y9mER/mJohcSxD7c/U9I56IwgCQ=
X-Google-Smtp-Source: AGHT+IHT1f28riQVw158gQHh9SJOUG5RR8A3OLV9NLCig3hrrsfw6U/Oe87FAXN3XjWp4DKbgVYDNQ==
X-Received: by 2002:a5d:5f4b:0:b0:3a4:eb7a:2cda with SMTP id ffacd0b85a97d-3a8fee64c9bmr10466507f8f.30.1751286199973;
        Mon, 30 Jun 2025 05:23:19 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10205003f8f.21.2025.06.30.05.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:23:19 -0700 (PDT)
Message-ID: <9f707fd9-a9f0-45d3-aaec-e20bad4c4f76@linaro.org>
Date: Mon, 30 Jun 2025 13:23:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] spi: spi-fsl-dspi: Target mode improvements
To: Mark Brown <broonie@kernel.org>, Vladimir Oltean <olteanv@gmail.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <175128365072.28911.16806664823646528710.b4-ty@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <175128365072.28911.16806664823646528710.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/2025 12:40 pm, Mark Brown wrote:
> On Mon, 09 Jun 2025 16:32:37 +0100, James Clark wrote:
>> Improve usability of target mode by reporting FIFO errors and increasing
>> the buffer size when DMA is used. While we're touching DMA stuff also
>> switch to non-coherent memory, although this is unrelated to target
>> mode.
>>
>> The first commit is marked as a fix because it can fix intermittent
>> issues with existing transfers, rather than the later fixes which
>> improve larger than FIFO target mode transfers which would have never
>> worked.
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [1/4] spi: spi-fsl-dspi: Clear completion counter before initiating transfer
>        commit: fa60c094c19b97e103d653f528f8d9c178b6a5f5
> [2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
>        (no commit info)
> [3/4] spi: spi-fsl-dspi: Increase DMA buffer size
>        (no commit info)
> [4/4] spi: spi-fsl-dspi: Report FIFO overflows as errors
>        (no commit info)
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 

Hi Mark,

Not sure if this is a mistake in the notification or not, but this one 
shouldn't be applied. There is a v4 with some issues. Although the 
notification on V4 that patch 1 was applied is OK.

Thanks
James

