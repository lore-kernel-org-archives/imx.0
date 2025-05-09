Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8AF8632C
	for <imx@lists.linux.dev>; Fri,  9 May 2025 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799590; cv=none; b=fRgzPOakQLWFuBrQw72fYdAhaxjdfJqUOzWuZcex+mH6v5OUjQmyJu/tFGfquXegka8R70L4Al5HmDc0ak4sWf0XRCQtES2se2Xae4Nj8cKTIDLTvIPeYzRT6puYNGvZu8wpS1ADKA34Ujcq/REu+CMEDHPuQ2CzzDn6U8lVHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799590; c=relaxed/simple;
	bh=EDEwnV0nE85Oqv0NR7mxnbl9Iv6yY6k//Uqp11s7Pl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOHbdDE4btYs6ttEIUwyQvRtpFiCN0lh5mmUSju4OVIwjfa9KtM40WGP0ukRRuZFXfO56Y3RtiI9djj3PlbZEJqMxbkHW4xSN24Ty7LyP7Y11vi0+2EhwOeGniflZyQxN6uyXmcTMCD+4VK0xanceokRYV5FWZTCm8IRqPPIv9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WA3jTdkF; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WA3jTdkF"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac79fa6e1c2so39964066b.1
        for <imx@lists.linux.dev>; Fri, 09 May 2025 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746799587; x=1747404387; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vR3S5bFvr+HUo+LPE6J+nwHXZjEwfOX2Cga+g88x6Q=;
        b=WA3jTdkFJ7lqsK6xsujqiZUZTAxNIWaitht1KXxWigGkfS82SAGVoAL4cVx5LkVG/w
         w5A/N8TpJMvMAkvcPhci8tQ81EGqrywVXePu2KLaoKOTdd87bDMAqrYM8z5i9ob9UkSR
         XXRepsqldvod4gtc2BeYsrtMWqHeQnycBRgg7kf9MZWGxZgBYiQssjdHSj2jzowOirzT
         +2dO9HTnTFLO7/gkQ2I29+SDV6mvQaspd9YFF6PjC7/2D9OWUVRwIwr3g9fRDISU0YRP
         LgieBcziHddBCfnMBUdMJvQyTyO6HYWt9UQv8V3+l4zMdr0Zpe15shbTNXNtKcveU54Z
         Wheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746799587; x=1747404387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vR3S5bFvr+HUo+LPE6J+nwHXZjEwfOX2Cga+g88x6Q=;
        b=vEAloqFgdhbvozcDjE0pcwy+WIXLkNS8971m4idC0oNZDC7Vo2YdqZst01hFdNBQQb
         v5AJZwaQJ/eXVKiqPWmLIlxL211lQh3Q5iEzwy+xGy6SGfl2CGm7ntzwpDbkXrXZxOAd
         MNRgw8DiKdzSLYTQo2nQPCQKQmV/zKLM784qhIy5JMt5ulJwMCrbzrqWrLRwBUgOKv01
         WRhzbLd35MOKIfSkYYaP3t3IURBg/dPVX3lMUIARFaBjX2WqdCoJ7U0zDsBn9BkLlUbd
         ZmzR0NJFomksBvwEx+3j7k5TuTwIH7iV8sVjiiz76hgPLYpGEEW9LvuOTx3TIfQfXVzf
         lkjg==
X-Forwarded-Encrypted: i=1; AJvYcCWFAKS1Y2jHCwSJ8zOGrrENgSeaQCMKs7s3CUltdZUc6Sb+Ii8ZXS9ldt/I371z0yOgCwc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyauXNidcAtC5LeG95b0wP/hoNEDWS3iJ2tVVNX2c9GnUDZeMOG
	i9GpS8zV4Wgd9oupFsiZvLphHQBelUMuqUfiswqNaUEmBE9jACX3
X-Gm-Gg: ASbGnctZWeByVzxLZWBvEd9jAnVFnOVYGMWlmLqFc2oONGt0L3MHKr/6w9wv1meWIdT
	6TsFzanIauTwVvn3qw805fRci7D+zJsrdY98G8ggoGncIdOE6qYaLMSk2/ivtwDkIe4/Vyv1slG
	JQN2jkpYO/WemGIfBPYoY2jKKULnoevCI0BDDaJemdB0V/MRg4uc/KojITlNyvV86eB63RXQtIQ
	+DaiNIYsQMd6chPO681A3Ez9pYSX9iX7fcGTWmqWGIDXUXggwLFT5TUvZXNTqQ1yk3bUrE0C053
	ESexECzMysAva/Yfplx6HB54aNYl
X-Google-Smtp-Source: AGHT+IFyBqJPuUpd/VkBty6rVNROepduGUENPpZDSw5zwcqT5KP0a0bpgkdNYr+JHP9i1uJjIlcABw==
X-Received: by 2002:a17:906:8474:b0:ab7:5fcd:d4db with SMTP id a640c23a62f3a-ad218f68a14mr108916866b.9.1746799586548;
        Fri, 09 May 2025 07:06:26 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192d4a1dsm158053766b.17.2025.05.09.07.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:06:25 -0700 (PDT)
Date: Fri, 9 May 2025 17:06:22 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com,
	arnd@linaro.org, andrei.stefanescu@nxp.com,
	dan.carpenter@linaro.org, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Xulin Sun <xulin.sun@windriver.com>
Subject: Re: [PATCH 03/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
Message-ID: <20250509140622.n2tc3dd23ylyux72@skbuf>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>

On Fri, May 09, 2025 at 12:05:50PM +0100, James Clark wrote:
> From: Larisa Grigore <larisa.grigore@nxp.com>
> 
> DSPI registers are NOT continuous, some registers are reserved and
> accessing them from userspace will trigger external abort, add regmap
> register access table to avoid below abort:
> 
> Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
> Modules linked in: fuse dummy tun hse sch_fq_codel openvswitch nsh
> nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
> CPU: 2 PID: 18231 Comm: read_all Not tainted 5.2.33-yocto-standard #1
> Hardware name: Freescale S32G275 (DT)
> pstate: 20000085 (nzCv daIf -PAN -UAO)
> pc : regmap_mmio_read32le+0x24/0x48
> lr : regmap_mmio_read+0x48/0x70
> sp : ffffff801123bb70
> x29: ffffff801123bb70 x28: ffffffc873b5c000
> x27: ffffff8010b408f0 x26: 0000000000000001
> x25: 000000000000013c x24: ffffff801123be40
> x23: 00000000000003ff x22: ffffff801123bcfc
> x21: ffffff801123bcfc x20: ffffffc873a9e500
> x19: 0000000000000024 x18: 0000000000000020
> x17: 0000000000000000 x16: 0000000000000000
> x15: ffffffc876189160 x14: 0000000000000003
> x13: ffffffc873bf73ff x12: ffffffc873bf707e
> x11: 0000000000000000 x10: 0000000000000000
> x9 : 0000000000000000 x8 : ffffffc83fca4e00
> x7 : 000000000000000f x6 : ffffffc873bf7083
> x5 : 00000000fffffff9 x4 : 0000000000000002
> x3 : ffffff801061f058 x2 : ffffff801061ee18
> x1 : 0000000000000024 x0 : ffffff8011490024

I think you can leave the register dump out, it doesn't seem of much use.

> Call trace:
> regmap_mmio_read32le+0x24/0x48
> regmap_mmio_read+0x48/0x70
> _regmap_bus_reg_read+0x38/0x48
> _regmap_read+0x68/0x1b0
> regmap_read+0x50/0x78
> regmap_read_debugfs+0x120/0x338
> regmap_map_read_file+0x44/0x58
> full_proxy_read+0x68/0x98
> __vfs_read+0x48/0x90
> vfs_read+0xb0/0x130
> ksys_read+0x7c/0x108
> __arm64_sys_read+0x24/0x30
> el0_svc_common.constprop.0+0x74/0x168
> el0_svc_handler+0x70/0x90
> el0_svc+0x8/0xc
> 
> Co-developed-by: Xulin Sun <xulin.sun@windriver.com>
> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---

Do you have a reproducer for any of the supported SoCs? On LS1028A, "cat
/sys/kernel/debug/regmap/2120000.spi/registers" runs fine and does not
crash.
