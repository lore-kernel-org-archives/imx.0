Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34BC4CB28
	for <imx@lists.linux.dev>; Fri,  5 Jul 2024 05:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720158655; cv=none; b=EBITHdCmqGKUpmnDNcBi6ZIFTInLXdisdM8BgPt96I7an5p6cpNnerRCbAlHtX7mAVnGdRaDeKkDGGf20NP0uRjLfmdgRJcHnRWKN3NN05DP0xJ8flbvyOaAvHPWR+6Dx/WM11Pw1xgAxANRDVnKJOfVw515DTgElNKqedGI3QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720158655; c=relaxed/simple;
	bh=JrLj91YPVZpy2XkIrYFYm75kBGBGgkOBeCe9zPn1RlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdq5+cuSgdoj8S26QUl3OFcQIiHgf+v1/XONLf7eGcjiP82CkTHBFxOw93Wer7wu9yhJUclB/O+4SbpWLMZqNODgj2KRYzvZ0sPir/BB4ksO3CmJRpbwpocrH1IsvaPvZgsxxtK4pYw2E5iY/di7DjNsowBvA7QocSep3ghuM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GL3K2n0z; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL3K2n0z"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ee920b0781so7995371fa.1
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 22:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720158652; x=1720763452; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbiPVN/BaSDz+daEINbCMF5/eDCLCv2CP3RxKuEyuuY=;
        b=GL3K2n0zC4ndeIm0iRUDDQBOMQ1H7GTtdyMilDdHm38RnCVHPorBgh3BB3zUxMO0Br
         88edXQPiERwL740QO5fEEEeStVv9SkXvWlZUfKdWfootFBrRwetQuCIEnfNKqihaEegB
         lPfJz3trm9RK9huZdj0dF9do9r3tgKKIV3Vk1XyRhKBeybXenxRxXypNo2k624wb+nTM
         ALr2Y+MxTJ5oyfmzJ1iydANK0p1maClO7JFHgYViR1biXnSGTbUDENASwYUcRtng7CHT
         3aNoGg7y6u49VLvbRWCFu95q9SY7Y5kLlimagbfQLD4g9+0GUbYB+3E2h9l1HHnWTb7Q
         HcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720158652; x=1720763452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbiPVN/BaSDz+daEINbCMF5/eDCLCv2CP3RxKuEyuuY=;
        b=B/3Xz3+ispcyWxQFMJonybZpjVqzZglkLi+UY1HWnVM+xhBCdTk7D9FaKqj0E+II5h
         po1dgj9HofDzQTdDy1jYSCxQbl2rO7AaoIkxcQKUJF2Om8E6etccsH9n6T8Sj+bjtevf
         pTF3+y/VHWyh3eWT+ho5a7U7WE8mOMaXNsSL49y/Ed04O1XJX5Cy+ZalJwJOsQUQCL5k
         D3QySBI9J4OiWWwUccx71OZeLNN9HlrhApEImfrXtUKPRBrDDhjkOZ4thYa6E1M3fz2r
         sDPiVt2LcWuLyQuJJjlxFCz8z3zIREAAX8QWmE2JjjSUDDz6LsnJVSUXzvGDI/gsWD7E
         2YNw==
X-Forwarded-Encrypted: i=1; AJvYcCXyPRRBv9X20aRhtu1vDkFNlI5iyDWCJ6GgL/ZOqqrTI3x40Oz/3wZBn+yqS31eEI9DFvTRvpRvc/lyOtkrwZxt8B8q
X-Gm-Message-State: AOJu0YxvqICP8pElppxOqDQmmAqJLCeW83sCil9CVvVkvtQR3xAXXZuI
	2On7enV/MlS1+dO0s3ksEjitIu8dem9H6KVnogbTTZJImLLtCYlk
X-Google-Smtp-Source: AGHT+IEpL0Mf1EKOoiMjLyxqd9bytkbdSwdDuZnIv53bLozrxliwMa2PYXZdfQHo1c1KgldzxRAFXQ==
X-Received: by 2002:a05:651c:19a2:b0:2ea:e98e:4399 with SMTP id 38308e7fff4ca-2ee8ee01aa7mr30757671fa.36.1720158651428;
        Thu, 04 Jul 2024 22:50:51 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee8cabf202sm5086491fa.99.2024.07.04.22.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 22:50:50 -0700 (PDT)
Message-ID: <20ce567c-d3be-47e1-8e73-749756204b43@gmail.com>
Date: Fri, 5 Jul 2024 08:50:49 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/24] mfd: bd9571mwv: Constify struct regmap_irq_chip
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
 <20240704-mfd-const-regmap_config-v2-9-0c8785b1331d@gmail.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-9-0c8785b1331d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/24 20:23, Javier Carrasco wrote:
> `bd9571mwv_irq_chip` and `bd9574mwf_irq_chip` are not modified and can
> be declared as const to move their data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

