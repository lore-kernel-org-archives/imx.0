Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5BC2EEE7C
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 06:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996771; cv=none; b=DRhbr+8kJorJUxuKmb2MsOZdptWxZSC54FxbzmsuLClZpMLFWjttqRw2L6FJHq13TTjuVC1IVvAaIxkDZLTfy6nZySL9aa3r5agymtg/HyZuoI20mTkuwVRUvoE8ehXBN7eeYJVNhKXs3la7IMCyQ4RXbRBsMu5uqlU7GFxb3bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996771; c=relaxed/simple;
	bh=EKElwWAbTDWthMpKF+ZWvr/9mi2EhJADPAtIsbWv5rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8HcgCVwpag8gPHB4ml18UjTIYOsiH6B1imlVtLlrSkR/+e8ngeDSwedcgUwkBRmjo3pp52MC5NaIsXMTB3g+lYN7uC+/WLL5qYpfQwJAI7vd3X6mS/lrnj3tNUZdPi1YHzevZjXMwFkw9OpE6TrL8ClDvTwh20bP26SrY2QaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ihdGJRJ+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihdGJRJ+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caed617615so24781325ad.3
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 23:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785996770; x=1786601570; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/Noaa1/5CoT0jOkbG3HQUWESYiE8Rvb0ack3Temr4U=;
        b=ihdGJRJ+3UiDwq41ldFdI65IcvYpJx5yTqIEA4oMRUtBlXV4JHGkaPkViHmazcys2i
         8wLH444w4fBKratUZfAoIthk9OIGqJm2zPRJQde2p9BNJtUoOWbRZOSekBY5uNv5riZH
         uJQxd+l6EEHzfIbZHgCHaNzCpTrmDytucKxV5KsXgOfA7NSsK/8hfY+VQF0iddHOkSy/
         EPaym1vHj+4ik7gbPJnDww1SdCQpuWIB8X0JBuR033aEcstnT7dR/ck9QUulsM32k7CV
         fOEpnp43s20YllSioYRRoJEEtsDHtrz1qRcX/7+NsDwNErKPamLJUueXArVipBgzxEI/
         xXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785996770; x=1786601570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/Noaa1/5CoT0jOkbG3HQUWESYiE8Rvb0ack3Temr4U=;
        b=a0jZZ8xukvScPne6iX9o4vVgH3dj4YCbwP2ceYuTf7emZysWYS/Z0v52j0aiUfiXG1
         8QJpDehyy9ZRxdzP+9Im3aa5iJXvtrY/grWLNiOzL04ueV+1kERJmCq4eoW9IjyW8CzE
         bc952LT/SNH6E2AU5ViAucI2K4jCd1OYxS3TrsP25nhsOU+l9j7khEtK750IJoVC4zCR
         oawSH9ozJQh2SkmxinKUctLmMfmAyt0sGPRAYGYZGt82lXqgfmNpKg+uyT0I2WpuyFME
         XePAWUuVgaM5lvwGYNHpbkdnYoTH2N+FhwhznfuUYCWYDfNtO3MZLhvR9F+qM1uVz3sl
         iWJw==
X-Forwarded-Encrypted: i=1; AHgh+RqH9wggiCo7HoTpB082zSJpfjSD3c5SWQ+fyAMvH/PY8i1qUsPvXSVKvnqEXsLDGSmRdwk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKi0MHpnTKx2BDZ+n4LkO3iYSLCjjrxm2gPwY5e3zYKXmq4s8Q
	HENW6pwk7YEuWaPaPkIyCKN3gQTvqp7+6Epi0KqX9TNua4RkPNnuYMfcgWGh3qOd10k=
X-Gm-Gg: AR+sD11gVeQqijhGHao0vUiiYZdcfYSbEJG/ujDS9chOnAV+n8BclTlRXgvv9ZP6GCh
	avM3QqzVaVnBARDaax0sRcYTLvcsaQmuwxYmhe4v+n+Xoq9160nNy98hoYkfTyTi4QAdxY9Y7j+
	a5aYQl84zknIihek2k72HXVvo9uDxkkcqU0Gd1C3AeTQ/39y4VSZAqRR4oMfbRdrTwRkqbz6X23
	OMxE2oVChSAiZUsNNd+ajHiolVUpYCrBwqWzvfPP9d9G0F5mw/xb6O8XckyY9QUI390DmrKx0LV
	NYVfDjzcOEZTwgnr0SFLE+VG9mli5NM4a97RVRlHatJoC9UYm96mqHRnxGl2tO4Pof2/J6kQgyO
	gXt4boCrOFvDT1L4gWXn2mGCJh+IVlwXT/qwEyC1UffXA+43BHEgSEsVpX1wajw13HIIXxk8BII
	VTf8ODYYqI57TgNOcYquX46xo1wXTh5EYVY5kRonfHyCyuqJTeQZLmkSnfCJtq
X-Received: by 2002:a05:6a20:430b:b0:3bf:9b3d:61bb with SMTP id adf61e73a8af0-3cb85ee779fmr14662992637.16.1785996769547;
        Wed, 05 Aug 2026 23:12:49 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863fb350sm24210421eec.8.2026.08.05.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:12:48 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:42:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Anson Huang <b20788@freescale.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: imx6q: fix devres accumulation across driver
 rebind
Message-ID: <xale3cobuizjnufkp2fkvxmq66dl2cmuoh6szd4d4vhwfcxizp@4kp2zcpu2ndw>
References: <20260806050902.90550-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806050902.90550-1-kmehltretter@gmail.com>

On 06-08-26, 07:09, Karl Mehltretter wrote:
> imx6_soc_volt is allocated with devm_kcalloc(cpu_dev, ...), where cpu_dev
> is the CPU device from get_cpu_device(0). That device is never unbound, so
> its devres list is never released, and imx6q_cpufreq_remove() does not free
> the array either. Every probe therefore adds an allocation that stays for
> the lifetime of the system.
> 
> Allocate against the platform device instead. Its devres is released when
> the driver is unbound, which is exactly the lifetime the array wants:
> imx6q_set_target() reads it, and nothing may reach that after
> cpufreq_unregister_driver().
> 
> That makes the array actually go away on unbind, so also clear the
> file-scope pointer in remove and on the failed-probe path, rather than
> leave it pointing at memory devres is about to release.
> 
> Tested by rebinding the driver on qemu's mcimx6ul-evk.
> 
> Fixes: b4573d1d657a ("cpufreq: imx6q: correct VDDSOC/PU voltage scaling when cpufreq is changed")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/cpufreq/imx6q-cpufreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
