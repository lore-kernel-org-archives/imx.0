Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2146124169E
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946660; cv=none; b=Nutt8TPX9AbQQOO/QFlSYm4Q/kkGIVJl5l8xAsmUaBT0nRXZZwKCQGDgwLc88791jw7uO0tRD5EI/TVLAw8liqST8ZZbM+45/iSPURsHAqmjKTn1y9yix+SKW61P9si3AUE07ega3R104bAGD14sbX9I2hphw06yq6TaZJkE2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946660; c=relaxed/simple;
	bh=QWqJhQoy+yUFqiRBx05ADwVJXzuBzAl6gXFQysAaiVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQ9d4eUCAYtXkDmLwxbea7bHGmF8qnrX9XD4vJchc6HEWWm0ZeGWuLyVD0UMRBX3YlGszyVaOuB4emLv86zPanBTufMl7w80lHsUd0YDwI50FGy8CMJD4Av8hU0LzWEz3HvsrdbiJBusO93VwbTb4chzb81DTr2/hhwBawvYnII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so10996193a91.3
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 05:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946658; x=1737551458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHZuZatq5TIRdfR7unAxNxIsWdF6a/AalKExx0oBH/k=;
        b=PPPF+1GnQiWvU9inFma0y64yM+r10BaKJYbTYLWCoTbdV9meZpCnoar8ZyT57WrWSW
         cYC2wEX9UJzta5BHgUDmisIIXERfEP8gjhoy391GYZ377XUrHiw+CrSF25uQICPIKMcY
         XlXvrvOfuf58i0mDqjDc6FIB0Li4cilX87uKrbfs4z0mcL4nfywNe75GRJ55+VFhI9MU
         q0pic6J18qkkmTAf+hN5EvZRV2CljoCWebEw3kgfzV2cgESao6HTJP7EmjMDZ4KQFuP/
         yUTJHem5msfNpH6Ej2927fNmrPdYR5nC88fTjg8RdkrwcGVKlCCg4x3EChTk2mLUpwB4
         nfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfF/ozUynEpJBjCHiYZgRh6odExL+6hdhoEyJbjeR5dJcL2CS+5HEh4NauiLkn5Pdiu5U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFQ9U1ZGG6NEdG9AD2Jsr+GfJOgRCjn8gvnva2UVYwCr6S2D9X
	lGa3PcIeqTs10ryEu0OlTgX6Jw9XCVZWQDUEDZEP6M2PnJqZyeuS
X-Gm-Gg: ASbGncttY6ODvBjDllv8zQyLmtEuIwVZZjhubx9bm1TLng5u3xDBL2gwlW/ulAZ7+mY
	aSNNzkJrPaT+N48FR4+nqaEtTXNGAWGNHF97DD0xKMwGM6gjY6XermmBrvb9S0VIcKVvce+OO3V
	B1Y8DT1ytXIAsYA6576qI/9gVXZFsL2OlmqCmpWpku8kw3uVf2e4I0XNkA4vLedKA2160yqLd5y
	jqcMwRPtB4YzNs/jr2gE89BR3uByKM5AyesiErn/0aZi+FZup3Me7jBqh1IbYMiFRYQjDCgDxdO
	bs+y/IIIhq9A4Es=
X-Google-Smtp-Source: AGHT+IFMmgTHpSa0xnjJFaqenc3CT8FqkgozTqAlkATKLjR40Zz3fByV9gWztcPe6gxxEkYY4WKHgw==
X-Received: by 2002:a05:6a00:2388:b0:72a:a7a4:9c6d with SMTP id d2e1a72fcca58-72d21ff97b1mr48634699b3a.24.1736946658384;
        Wed, 15 Jan 2025 05:10:58 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658a7esm9363767b3a.106.2025.01.15.05.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:10:57 -0800 (PST)
Date: Wed, 15 Jan 2025 22:10:55 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: jingoohan1@gmail.com, bhelgaas@google.com, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, robh@kernel.org, frank.li@nxp.com,
	quic_krichai@quicinc.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] PCI: dwc: Clean up some unnecessary codes in
 dw_pcie_suspend_noirq()
Message-ID: <20250115131055.GU4176564@rocinante>
References: <20241126073909.4058733-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126073909.4058733-1-hongxing.zhu@nxp.com>

Hello,

> Before sending PME_TURN_OFF, don't test the LTSSM state. Since it's safe
> to send PME_TURN_OFF message regardless of whether the link is up or
> down. So, there would be no need to test the LTSSM state before sending
> PME_TURN_OFF message.
> 
> Only print the message when ltssm_stat is not in DETECT and POLL.
> In the other words, there isn't an error message when no endpoint is
> connected at all.

I applied the same patch from the following series:

  https://lore.kernel.org/linux-pci/20241210081557.163555-1-hongxing.zhu@nxp.com

The above one is still a v4.  Hopefully, there is no issue with using the
other series.  However, if you prefer this version here, then do let me
know, so I can mend things directly on the branch itself.

Thank you!

	Krzysztof
