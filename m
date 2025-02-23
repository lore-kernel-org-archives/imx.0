Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393AB204C2B
	for <imx@lists.linux.dev>; Sun, 23 Feb 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740319028; cv=none; b=dUni0qiwsEovbWbW3DwpLAuI9/3TFjuUGItf2Xd7QBec8M9MjuYAcJR2nqWcy6TlQSRQlfbiWF8vmOeybCwu+MjtVmrYwp0OcK9uogv8hKhTG4wNfFMqFIc7v4XLo79CLNlPppNAXu4jXerdyPpGwCUfuFFDUhsXK2mDfcOEv8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740319028; c=relaxed/simple;
	bh=b5sKo7or1yxhOykhB8W9cO08pjMsuK4KXAFBMM1a5/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rb2EWXCeF6d/tKTmM2O6Ro2fY0s1R/nmD8o/n+7bKgNzO8Y12T1lAAsLH8Q4wFk1Evj2P0Cklyh9nl6Pjz2S0a5hxjdH7tda8E1CLwjWr77+mrLPN2xrCX0BayXca3cFbridjqtuwc03bK9NOJL9pKb3ITGn6W+p9Hdn6MLZAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no; spf=pass smtp.mailfrom=remarkable.no; dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b=I6x+iH9Q; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=remarkable.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remarkable.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remarkable.no header.i=@remarkable.no header.b="I6x+iH9Q"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54622940ef7so4072599e87.3
        for <imx@lists.linux.dev>; Sun, 23 Feb 2025 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remarkable.no; s=google; t=1740319024; x=1740923824; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSt5Oh4aOXUsbkkdJcXi4r7HM5aKQql9O5bNB1EciEQ=;
        b=I6x+iH9Qa5l3FaP1PovsQAUfTLGG6ToYHERwOaOPk0jtI4t4OF4YzK05ln85ZP2U3v
         lXdNjOOi8yWrRNAmzYdqqSY5bw3uKVBeULE9XFxAMMISLyX4qWKRWJbWSvkavWYAGCRb
         zw5+RX+ag/R1HbJYACq1yjKfIwiW24pYmHpm75a4YLkZK0gcGFTJT3KXp3oF6wwqyHT8
         TBKpT/288xclbCR8C4nVEezH7wviDCtcGpvzZRRiVcw9cIBUmJEjGbSWhPOjNdk48wWH
         imb5pRX/t63FxMvfGBNJd7ThXzzGPAnMB15F4fIFHZs59GI8bahnncDTeb69433yOaUf
         MRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740319024; x=1740923824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSt5Oh4aOXUsbkkdJcXi4r7HM5aKQql9O5bNB1EciEQ=;
        b=EGVwx9wyZjngHKk2AkdYTC3moIOTYdkMrBYPTpzfyYwn2YptdNriV9FpbEOwUhERjy
         xoJNNnfrCnAA9OfRCQDWKjpOXWaYecW/amhWULOwFUWvarsjsDSdzUh2/l77KjQ5PcLH
         mlMd/GM0akAW3eUveshOxkGAXmNh7VqAJbGoDojnarHJbBvbG9YbuCfd3p1384O9XGUd
         aIugKU4N2s+fMqCIIu6Zy63XlQA2UKLQbpEl78f+CzuEYPZwK5oIHNaqKvJLS/LWnrIT
         vGAqMUj0V1plvIVUji4zjmCr2rEpkoHkRVMIWW+S0p737mOnjINQI92zf6VVUsECYJ2f
         865g==
X-Forwarded-Encrypted: i=1; AJvYcCVVILfWnXzhckNWM2gfZVn6IQYloKubjDHTyoy4evp2zwmWGtOMAkU51+GB3F+NF0o3TTg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxE1ET7JXfFjbSOj9HKjAKuTGJwIMT1dQuEM3RxuuFbjXy/y591
	5hreWUiMTTsgMPV528zfA+MFrvr3xenXk629G3sFneQUa274ZvBnaRygEMdKKA==
X-Gm-Gg: ASbGncstFf6mJbS1MZjRYpTZ3e61baTHx4c1mFZ/ybKS17Ghx/XxCPbclNYWMie9wac
	zTeSE8gdnCpmRakYT7SQWf0jdzWYT7+DWzBT9v1D49n/JbRRowlewTUvv2yAzvKlcWhp3kqqHIE
	Ow5mya9udIX8+logChwaozt5DCYwPV6N2iH4BUXzU20TRrDdsa2pii7rOampAXjQt22EFZWm95h
	GF5Z4qOVkA1Ypy5mxdZVciK3wgxGaDYVFhoH3vFqEdXGm4+QUw+9eak7Xh1uwqCX04m7ICsPjNn
	J2b91D/iXKfLFBoEhYVqn/ULzodZHoOt4meg8PcbYSUnTIrtR+p5DwDfMT2upDvongsw27ff0cz
	L
X-Google-Smtp-Source: AGHT+IEsAPLG0VnAgEWySFLvjEpv9b6lcCK03yae88Y4++t5RMI5NrCMFxRtv8orcMuGnVhJE1uZKw==
X-Received: by 2002:a05:6512:3995:b0:542:91a5:2478 with SMTP id 2adb3069b0e04-54838f4eee6mr3963231e87.32.1740319024112;
        Sun, 23 Feb 2025 05:57:04 -0800 (PST)
Received: from ?IPV6:2001:4643:2b9c:0:a407:a1b4:766f:a8eb? ([2001:4643:2b9c:0:a407:a1b4:766f:a8eb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452ba47793sm2794112e87.249.2025.02.23.05.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 05:57:03 -0800 (PST)
Message-ID: <37e3fbc9-87c2-49d4-bf32-e4c5906cdad6@remarkable.no>
Date: Sun, 23 Feb 2025 14:57:02 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpio: vf610: Switch to gpio-mmio
To: Linus Walleij <linus.walleij@linaro.org>, Bough Chen
 <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 imx@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
 <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org>
Content-Language: en-US
From: Johan Korsnes <johan.korsnes@remarkable.no>
In-Reply-To: <20250219-vf610-mmio-v3-2-588b64f0b689@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/25 10:04 PM, Linus Walleij wrote:
> After adding a pinctrl flag to gpio-mmio we can use it
> for driving gpio-vf610.
> 
> The existing code has the same semantics and the generic
> gpio-mmio, including reading from the data out register
> when the direction is set to input, and it can also handle
> the absence of the direction register better than the
> current driver: we get the direction from the shadow
> direction registers in gpio-mmio instead.
> 
> Since gpio-mmio has an internal spinlock we can drop the
> direction-protecting spinlock from the driver.
> 

Hi,

Could the following headers be dropped?

#include <linux/pinctrl/consumer.h>
#include <linux/spinlock.h>

Kind regards,
Johan
