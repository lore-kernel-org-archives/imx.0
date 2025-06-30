Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C7928A1C5
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286981; cv=none; b=ryDBFO3Gk5v9UpBa8B/nFp4dW741ewogwXsHyuaz/BwU6h8YghpUzAPjqmdCKku805tb0Mz1pQ5dDkATR7lF4v34OLvZLYZrPIbwl/tofduQ8Zq2arDZGQCwwGYnfNhD1Ebo+H9kvin/JSxXezE5p6QaSEz856XavfC55ZDHweg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286981; c=relaxed/simple;
	bh=Iqbi9XJU3Rcsr9hOuzWCaTBhtE4KFyjIWoG/KOJnLcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbVJROMiBZFfGqw6+I1ryPgFFVGwLDzPuIO9jCEAz/Ubk1SHKz182Y8epQTIO1XbYJ9yGQxRzX69fP7ckFGPWdSUunxmhwI3ZBwS8u8lQy0NqAXMQJ6tHrgmBoawDPNQejQfpOoghab8aRRGVPRIXl2isIMTTcj6mIyMw4nYP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MOJlMvPl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOJlMvPl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453608ed113so21263415e9.0
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 05:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751286978; x=1751891778; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sTk6vgTqpktXfMs2jw1tzY/3Mhfdc83Si91WoTu70s0=;
        b=MOJlMvPlvP0pHf+yi0W/Aob9eeAsyFF4Ed6tcLndnGmheuC1HPTk5bA6KcG+A7+pcv
         BfIoXN8FVcBLqN6jhDXoMOeDZ5iQxIt66yJmQrfv8zqR9zFpb5tFm7EARb2NGz+qWEoO
         jW/JZWKptKjCDZGUpLi7KO55rGrzMvneVsqdW1u/jYWa2yXaa2zNeQp8uRvrYFWQ4jQH
         lirmws9y6CmQyjb7CARutDmhis8m0E5g3tmbCnC2hcVTNxePh2uP+NAEQEBCxEih4ZLZ
         AZhKTXOzOwgcK3lCU4RmXNBfBCwlnP9vkS4xXCpnW5fhy9b5rFUOb1R77ot1eHVQVkE3
         e/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751286978; x=1751891778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTk6vgTqpktXfMs2jw1tzY/3Mhfdc83Si91WoTu70s0=;
        b=BoYltWnN1L4Q8IwlTAI09NtaqhMBQb30vkWNJj9cVER3xoYN9WE4zB8rxVRB4w2+0t
         2yz2e1Dx5HJMvLt1RY5S3+laph4T3ojjKRgE5JZ97uZAf5h0oPovayZpzQWjUukdhDiu
         if5GuotLNeYMSVRb0qQU/ZWZGqe2gym1kfdTq8jHvHB0JRH3XQGlDP8MGRXLdwR1KrEk
         7/VrcmrxjAPiuKN7Lr/BXs1ZWjFnd7tjp9pJ4BlU1yuDr9FaQIuugzQhNBz/hJl+AI88
         t8TNBU7oCVSU5pLl1GJGQqsRYfU2dMBTs4AKdV/kBXVsU64YOoJk+Z/3WbEaZV+7acWu
         JgQw==
X-Forwarded-Encrypted: i=1; AJvYcCXGxKxAhHVWOnDkiXzYcYkgWlNWKB7yQ0GIVLeV1lRkRtVn1rfrvg4UODWcPes7htxUVMU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTzJpf76x+QwDR5SQXVdQgDgLvLBol/4EWp6g5ebWfgPKDz8CZ
	N8SpcrsIUIi98Y2HO3IwPGzCTxWp07FBV4qYaZDOc5evIOAlvk/GZzgz8WoQ9idaIf0=
X-Gm-Gg: ASbGncvslqtKVZ4Yd9UuTybDwAqIHQBnzulfS5q4uLqZUvhRFaTdI/cCfjIW0I/qBmB
	S9GdZAPRM0hgpg0//VEOIMCyLgEGyAj6oAbgh4TQevl8MhoAxtRgyTEoH013837RxUp7W5rlmhG
	9z5Ghe5FHVfVJteSChiq3Ir+7oNq0wbL1QcCMEZIaIm/2lTAL6uPEkOsHM6fTf4iLJgDBYkVGW/
	q2F3fKhDUHCF8UWNrxbAFcz4eI5Fseb4W1/ZYMk6MoZWOqdRwplXPUS2CDogeJ18+zpdHKPH/oe
	iHu/Yy1uLYonTj4HgqYJ9l8HxDeFFTORPARdsplz+pUnXOrzQXtGhcncQBv9Xsx9yL4=
X-Google-Smtp-Source: AGHT+IGodC564GL5rE7SFk0/J9O10Wn4F5hiF1J3YUnZxSumumM4a6Ana+kyQSrduZXBrfrz1Dx6YQ==
X-Received: by 2002:a05:600c:6285:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-4538ee51961mr149563425e9.15.1751286978275;
        Mon, 30 Jun 2025 05:36:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59ab5sm10090309f8f.82.2025.06.30.05.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:36:17 -0700 (PDT)
Message-ID: <d86c48f4-fa10-4205-b0de-43fc8be0c848@linaro.org>
Date: Mon, 30 Jun 2025 13:36:17 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <e5dabc83-eb1c-46eb-b24e-6dc8b19c4ff7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/2025 1:25 pm, Mark Brown wrote:
> On Mon, Jun 30, 2025 at 01:23:18PM +0100, James Clark wrote:
>> On 30/06/2025 12:40 pm, Mark Brown wrote:
> 
>>> [1/4] spi: spi-fsl-dspi: Clear completion counter before initiating transfer
>>>         commit: fa60c094c19b97e103d653f528f8d9c178b6a5f5
> 
>>> If any updates are required or you are submitting further changes they
>>> should be sent as incremental updates against current git, existing
>>> patches will not be replaced.
> 
>> Not sure if this is a mistake in the notification or not, but this one
>> shouldn't be applied. There is a v4 with some issues. Although the
>> notification on V4 that patch 1 was applied is OK.
> 
> Please follow the above for any fixes that are needed.

Ok I think I may have just been reading the notification incorrectly. I 
see that patches 2-4 are listed as "(no commit info)" so I'm assuming 
they weren't applied.

I was a bit confused to see this notification on both V1 and V4. Maybe 
an artifact of the first commit that was applied being the same?

So nothing needs following up, that particular commit happens to be the 
same on both versions and it looks like the remaining patches weren't 
actually applied.


