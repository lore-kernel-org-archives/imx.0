Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEFB285CA4
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288088; cv=none; b=DTbfBhm1kPfaGG2YsH/H01jpIK/FqIolzaj9LN2ixK8ZqQwaxILVOFq1i+Sfe4LMOTGn/71Oxs+nfudZIxStieAQJgnlvUNn2UUK8pKU/QR43rFiFOMZjC1d/WbDmZZ41vrAoqttSTxgkS4P7E09Y1kgw3fZNi2PqvExPppzvfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288088; c=relaxed/simple;
	bh=dFUfA59cZPhURFeCuho8nEpvNW1tRPC7vIft9cBn9oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAS+n4okRPptLir4/tq9xj10u13sUB2SCfLfQc4UgsZoVCOp83mVlNM1PNx3pQlrqwFnMp0pLvb5f8CaiVcHEcVgP1kbhahLpbUfU3czyw6NSGjwPIdI1/dpwIJBn69jR8ggUdPGUS+9VJOBv3TDWTmTXI4RxJOYvwHm4IHiCpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bdEEexhs; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdEEexhs"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso4710221f8f.3
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 05:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751288085; x=1751892885; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6LLhW0l1DwH7atSswhul01kdjels/mjiCnzYleUxWc=;
        b=bdEEexhsv24OJLXwYnmvJ28WIoXntpoICRFcoCrTzwoy4krp9HJk4EdVDkkP/tzbF3
         hhykdV+MP2jNKq8er3sQ7n6X4NI7F9DpdYpgokxd3hAh8udgrOVH4thXQAFAXZr0HdHE
         1iBjp6koVrObkjC/MuZ9lxncGH5BtCadPpeJOjHRxbB8qtn/9r10HAF2lQWGXzrepEXT
         Y/D4peA0nKz92NQqwGN+8u2Ir4Kxf3bMgjZ99S8w6VjONKuCoelLdcUvflBGXQ9Vlc9t
         1ut5y/p4Izcg84T9/Tlt7IRu0HsrounktmrsPy7RVO0kCcqrkNZlfnkfEQpw5ZhxPe2l
         DZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288085; x=1751892885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6LLhW0l1DwH7atSswhul01kdjels/mjiCnzYleUxWc=;
        b=muRg/Fkf7cgo3cMSOurEwm9uYMDNTkKCBXMQ3T99WvHalv9I1l4QJjy1IYgzqlRQ2o
         n++uS6tJT3en6cEQCVDtRNwklwnhKlXMViAzm/9d8l2VDrnsG+uiDDQ4wU5YTdC/AJ7S
         BllK0GQb5fOuuA9R2/cSYfAhWMSucuz5d1whbxRMicxhlPuyIlfFV7rckJKaPLeJSeIc
         /T9Nk4JkVgJemJwIHKx15WmiH72NU9oXECqWNyXxGvQozDo4XSwiwaCzH8o2kPoLd8dJ
         3LJK8I45nJHA9pFu6Cixvun/HHMwWyYb+wllpTrumACVV7wrLmIKVN8U0B+lUJim34Z7
         rg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPclbLIdXHpxiN0Wd2E1L2nAlPWC7eAkJ1A693G/IKgmKXnxtYDJyHHB6v/fYtGoxdJXA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5F96On6GeoxMcDwWI3mciT9Uy0I+1/1YdfbjFoxY66i2/hzkk
	7G+b3saHnAbyGyHfPkwO51iK0hYuCevyb7OKFOliirxYhIEiAUsllmSzIZZ/4kxLxUM=
X-Gm-Gg: ASbGncseA3dUvE2UknIr23fhny7tYq9Y366ZqOvX+dYUzcUzf/SyCZEcwOu29yDc1fL
	m9RHb9TN/3kJZVC8f4Lcd3xGaNTcBb0cSwDZgOh9GpvrZpmdxIDGl4UfxptSNxliE7blOF8OLHh
	iKqzP5+3/IghpzKoZWO5c0J9+XW7ZaGMc38hmlI18m6Cd6+M7rbxo2bzO21GYdUejrd0vJUyoDn
	FtOg/i2TbVTn2+d7cTMNxrLVOuahGPcqm++s0GSGPjCu/6kfgvM5Y80kJ9vDwdKQIfRA4hAhJzj
	yhv4EFa9dZizKsKS3yM0u5cbcArEpI2i/ph6ObOIT7ZSszb/b+TL8zidMna8i0bgv2E=
X-Google-Smtp-Source: AGHT+IEOf3lWnYoS17T+S9usuCMf7ZAOx76NQaH3qOvK0doAAUlbSt9hmIVQE6Nph3hAnN/TUv8l9g==
X-Received: by 2002:adf:fdca:0:b0:3a4:e4ee:4c7b with SMTP id ffacd0b85a97d-3a90d5a7cfemr10289035f8f.15.1751288084621;
        Mon, 30 Jun 2025 05:54:44 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453888886ddsm95050155e9.0.2025.06.30.05.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:54:44 -0700 (PDT)
Message-ID: <e7a7dbc6-c423-44e0-95c0-5b3323f83c8b@linaro.org>
Date: Mon, 30 Jun 2025 13:54:43 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] spi: spi-fsl-dspi: Target mode improvements
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <175128365072.28911.16806664823646528710.b4-ty@kernel.org>
 <9f707fd9-a9f0-45d3-aaec-e20bad4c4f76@linaro.org>
 <e5dabc83-eb1c-46eb-b24e-6dc8b19c4ff7@sirena.org.uk>
 <d86c48f4-fa10-4205-b0de-43fc8be0c848@linaro.org>
 <a164abb4-0863-4a0b-b2f5-f7c1b36e408b@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <a164abb4-0863-4a0b-b2f5-f7c1b36e408b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/2025 1:40 pm, Mark Brown wrote:
> On Mon, Jun 30, 2025 at 01:36:17PM +0100, James Clark wrote:
> 
>> I was a bit confused to see this notification on both V1 and V4. Maybe an
>> artifact of the first commit that was applied being the same?
> 
> The tooling remembers if I ever downloaded any of the versions and
> didn't explicitly delete them, if it sees a patch that it remembers
> it'll report that it was applied.

Got it, thanks

