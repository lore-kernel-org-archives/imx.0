Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3631228A1FA
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546202; cv=none; b=Dx+Xv/oS9Az7Fr4w/e7qkn51tehSkcw8uVmUFkt2QEpLXrHPzY5juc56xsYqeRa0Eu506SGoZ5HG3CKO8dFmRr2LiTsPsqg6G0Mv9nejf6htbRr9mz+Vaftf+9N7VaPa1gnX7YJg6O1BmlPIYRzQ8TCtUxr2wnfKN1P+ekaLQME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546202; c=relaxed/simple;
	bh=jQuhSajM/eKNYIy+lnEsFf+cKW6Vn57R891VHKHU15Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/v+pWIicCE8lsYbIXw3DthCEgJ6iBwn93XcrOdR/hJBAL13EylBPyLYWXM7MRPWsVS6Y4d/TlPPoahJt0yDTY+00mpfOO39KqwnR/TM6FqFn4wNF24gBdZd63EXmJ8J6cVegU/I6Cgyt/O5vYygDbx6stuHtQ9FaOmHyVSWDrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cDVX/mPh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDVX/mPh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450dd065828so34932815e9.2
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 02:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749546199; x=1750150999; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HPqK+7Pme+jXJ4ncyLUwgWNNufzulUH6kf6Ic21uOPk=;
        b=cDVX/mPhmEyvC3jPe+Vlg+XTtCl3HendoVbhxkMfWC1nEWeH4LPZdAVv1zE9lhFSDw
         3giqH2Yh4Cwip+CJL/jG61niUcKqzJCh0RLaaXhxl+TrlPooo+c0aEAQDdHB/NGLItrz
         K+Ni1S8y37jNpvVWyiXn57bDevvS93JO6LvG6iQ2rB/vHHdqxczENBd1PE68aIRJdLxP
         rKQqnhTDgT7sOw1567vghTyKHsB4Y7HomntqYFmntM3rJOSz7YHxb45TNeN7fR2o4La+
         +YqOHjQz1NhG5FgltHlMffTx7QcGYaRk4Req0u+L4q/9Mxh8/6ZpgETL32ghQXs8ScCM
         Vvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546199; x=1750150999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPqK+7Pme+jXJ4ncyLUwgWNNufzulUH6kf6Ic21uOPk=;
        b=TyKn723xLv848GAy22VTNUwp6XOLoHbINzwlM0rvetLmBNAqjoPNjG5t1brzFbYIVg
         mIwnn2VcR0jIS6nuHadxHoWW5iHFuldk7U3R/t60OuXMgmeUJXbHNNkAP8FMplu1RLfN
         k/AFtKZadeZbR5vPdnfR25JSYTt2f1nWZSG1m1RBgeuDv1yONzNjh3gh2BJfS/2pcu1T
         jhyfG1Arjo++nGD7G+XGAvTscladFdljhbsdwZJHlD4UBXXBtZcmws/6koDxHrNh4UxM
         p/NaFB0o8UuUjogahnwJoDh4wGcR+uC9AnuW3ZWzHdeCCeMRxKnyPFUXcu/BAINQa706
         I4XA==
X-Forwarded-Encrypted: i=1; AJvYcCU8DvEL17ZgeONo2yLtAPJ/y3cb9Txzn7/SwvSA+UWEYHHVknScr3Wm+exWCG5+fjFUjGI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+LjQhGV30PS1zJvKIs69iT1d9h+WXgvEWSc+xNlyiKctGEmYP
	pMvObn6I0/zfmy5ZcKH44s5zjajOCAIS6aT5OhYHVyOVvaTSAMM2vDDItHuwGhs72Ec=
X-Gm-Gg: ASbGncuaZudp+jNy6+nE0n4z4LTNpJaZIKKn8cROGUgUaqZEmwh1BEI44PhX82fSoLU
	m9Wyr738beUEli0eFtv4LPfPQ1Pb5ToC3x7R9T1Y65B//0QHK8i7XDT8PstybqFy2WcIHh2IdOj
	SdrtpTi5BDLHhtGp+PejYSSlm04MG48qH8GF1+CI0sM3VHwa713v1Hshs9f4bukjchZNqYoi9OG
	gVgBnAIeADJsPUayXJB7he5I3zaLR2uM9eGROFEu5oR6IbNGzk2lNjuN7MpS18F9PCc3ZCpJTVe
	kZz86IFv54qOh3FUyv81RqVWbZzrUhXXQvPAESBzpusLwallCZ8eJ6fgdyjURXdqRX8=
X-Google-Smtp-Source: AGHT+IENhfICQtVFbADftr85Dr5PIfBzTkNl7ToSjNkBgjBnd+DfSLsY1NJ+qsOdHIdVQA5u4x1ouQ==
X-Received: by 2002:a05:600c:83cf:b0:450:b9c0:c7d2 with SMTP id 5b1f17b1804b1-452014146bamr149777785e9.11.1749546199567;
        Tue, 10 Jun 2025 02:03:19 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229dc33sm11573487f8f.20.2025.06.10.02.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 02:03:19 -0700 (PDT)
Message-ID: <e78107ae-e2d9-4ffb-9a2a-bc04426e2a75@linaro.org>
Date: Tue, 10 Jun 2025 10:03:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <1c579729-4461-4666-ab1a-77f17a320ee9@app.fastmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <1c579729-4461-4666-ab1a-77f17a320ee9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/06/2025 9:26 am, Arnd Bergmann wrote:
> On Mon, Jun 9, 2025, at 17:32, James Clark wrote:
>> Using coherent memory here isn't functionally necessary. Because the
>> change to use non-coherent memory isn't overly complex and only a few
>> synchronization points are required, we might as well do it while fixing
>> up some other DMA issues.
>>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> This version looks good to me,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> I had reviewed an internal version originally and had some comment
> on that, all of which are addressed now. You did not Cc me on the
> other patches, so I looked them up in the archive, Patch 3 also

Yes sorry about that. I've just started using "b4 send" and I was under 
the impression that it would automatically CC all patches the same way, 
but apparently not. Maybe I'm holding it wrong.

> looks good to me and complements this one (i.e. you really want
> the combination). I did not understand the logic in patch 4,
> and it would be good if someone else can take a closer look
> at that in order to Ack that.
> 
>        Arnd

