Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB812261D
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 10:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728295252; cv=none; b=Moz8jMdKjughE3M0HeuOt1Fd3mJjLUQu2z1aWLxRMaljBvqqjbInAX+LdCTEHcfVfYJenmT4d8493yyn/4C76Zc3L7HyJHvNsiEZYwtj3hb2Lrqf0jUJRM9AjK6KjcehP64LU5ZWvrAiGbQAW5WtHxBc6gpzbP+N5VQvwtV33JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728295252; c=relaxed/simple;
	bh=8jLkDLa1KjvLII9dGVbKrzkDwrGVZgRVLaCZdg+1BGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJxvBFpStooGZWWZtsgQULrctJQTGIU2FquKxIrxdliUobedA8B+YhEKR4adVmmrxZ0/ExSfauJ9RsFluA4DiqP/Kk7tHhaEGlD+Mt5edcUTUXAC6e+lAPcZiJrT1toVqKMkcNwQRjHs1QsvHhhT5rxwIXc/5HaIzv8SYk7g0oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3jJLpeU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3jJLpeU"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5399651d21aso3789700e87.3
        for <imx@lists.linux.dev>; Mon, 07 Oct 2024 03:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728295249; x=1728900049; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+6HLACYIYStp6InlFY/UrXlQ9BZcSDR4bw3DCXtnczc=;
        b=K3jJLpeU37zeKV3o4CRCLA8QEkYAeMtI/W8wfas7bXvJreZ/ylWotHQrjyLPcVLogf
         yyKtdkvYHQMSyKqiZWh83uUQzjdW0ulLqOVtrVWCiB7Hk4qNRcHI4xwfHQk24PJMFzWy
         iDop+ANV0Lpa+2OSC1domau+Hxb/HfBh2vAyXllrfRXRJHHDmNqEiHMi12xaohAXmg2m
         5uKYpE2E4v1qRxQNTtwREPtxFqu3+rcl1SWKbB4cwB2eRahMk8UMgk5fENnlqZtnQ/Gu
         yAcBEksO5QnbKhf7zseb4q9ywfoZdtogrqrkKMu11QqfbTmuyxJJDDWnWumPP53A3VQW
         3C7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728295249; x=1728900049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6HLACYIYStp6InlFY/UrXlQ9BZcSDR4bw3DCXtnczc=;
        b=Za38aY3oj1/qjhiptzmCbdznJMnxc2nZcy9MakmyHjQcsjYOIWNvZNIEHxOT8H23SJ
         RsJHnd8v3xzfYBfvujc8mpu+WvR7mA4aRaUershH3kSMlYN5nkuknP+iBb3uRpYrhnQI
         LsTDzNDnIWoFDUvohgfsUmA0q32WGY4+kI2gqToVMcKVe83zvEc/lJ07Ks1kvRhkI6Bf
         olL2EUcyFPFMxq3+hjjz4wJPHiGoidfPLTU4AsN8uGNiQm3Dc2Fg7jNNaundb+fe0SzS
         N/xR+Hwo4BhvYhDKDaFeS+UKuupTq4luQVxb/sry2ccxNwbeTblUxgcSvvcvrLwOK2At
         NXaw==
X-Forwarded-Encrypted: i=1; AJvYcCUxXTBsvo4Aagn/KjVEosqji1dWAsEN4sXry6Z4e7aweiU88HtGj+kcR9Dv1tVIORtlPvA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1y5gqS6sZ34zXyXZiuFRDC+FNwbfetufSUbGD5jwbSIBtcvtO
	DkJqp2TeRhFQYqBcnFpqh9aJ0ol7pbn5yuc4zNYf9vpyacoddSIC
X-Google-Smtp-Source: AGHT+IE7fzKBCyOHsn6sB/8KjqsNw34RTIfeHeJEYQWXt64wGo1SEdrFPzcHNdDA5aHtq/+F5n0h3g==
X-Received: by 2002:a05:6512:12ca:b0:538:9b5d:9885 with SMTP id 2adb3069b0e04-539ab6d851emr5214374e87.0.1728295248943;
        Mon, 07 Oct 2024 03:00:48 -0700 (PDT)
Received: from [192.168.0.101] (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9957d955f8sm99206066b.74.2024.10.07.03.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 03:00:48 -0700 (PDT)
Message-ID: <6181060a-ae36-4d0f-bfe0-c1e5c8a8ab3c@gmail.com>
Date: Mon, 7 Oct 2024 11:00:46 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] clk: imx: pll14xx: Fix potential integer overflow
 on multiplication
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241007084840.1167527-1-colin.i.king@gmail.com>
 <3e0def9f-ebb6-4171-9395-1da118b0ea29@stanley.mountain>
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <3e0def9f-ebb6-4171-9395-1da118b0ea29@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2024 10:54, Dan Carpenter wrote:
> On Mon, Oct 07, 2024 at 09:48:40AM +0100, Colin Ian King wrote:
>> The calculation of fout is using int multiplication and assigning
>> the result to a u64, this can potentially overflow if the int variable
>> mdiv is too large. Fix this by making the 65536 a u64 value to ensure a
>> u64 multiplication is being performed to avoid the overflow.
>>
>> Fixes: 53990cf9d5b4 ("clk: imx: pll14xx: consolidate rate calculation")
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> mdiv is always clamped in then 0-1023 range by one of these:
> 
> 	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
> 	mdiv = clamp(mdiv, 64, 1023);
> 
> so it can't overflow and the Fixes tag is unnecessary.

Good point.

> 
> I think the reason why "fout" is declared as a u64 is because we were worried
> that on 32 bit systems the "fout *=" operation could overflow.  That looks
> reasonable to me.

Yes, that makes perfect sense. NAK my patch. Apologies for the noise.

Colin

> 
> regards,
> dan carpenter
> 

