Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C3E1940B0
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755969; cv=none; b=k0GjVKv6p4MFSjz7g1RwfayUgXkeGGVO/chAZJix67GYJPJbKUoZRnEPg+JPbpQ5EIOL2WQRitMT8pTDZ1og0w6GPiSYda6s5UIUjyAhPdHQF+trQW6+a3+Fb0fYLSk1Qwiqtm/h0xe5EmZgVp1z4AaXYnnwRazOUMMkyWCa7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755969; c=relaxed/simple;
	bh=SHkFjsUEK8BRAqvmfnv5vItChhZEKbXF3e++QGo0kBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vk8sbWk0JNZ/echlPDiLXt+H1AaDArOJ6Ls1D0/j3DgrNi86crHOVNLwBiZkkGb/zFVKG9CQ9EEFj2ujroqpx2FZ6/Lr6UZZ/IhyjwD27CBgeV8cfwGlAP9PGHqa4ehyQHrrBu6nAt5MM3QL1SZWhfmBRhrjG9I+ChhIqqyWAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qy3caz+i; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qy3caz+i"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso27371555ad.3
        for <imx@lists.linux.dev>; Sun, 06 Sep 2026 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788755967; x=1789360767; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=Qy3caz+i+EDFK19m4WMbd+ISh2GxipAiB8y9my35fNif3z8SUIqjMMab6JmKP8qO/F
         aBcxgjgO7D3CepfPeuKYv8UjVJfJi3leRqOmLoxaFqahQM+27gOvMPWmQG0l3JteEMUI
         mFI22LofDr1z8zvUhgopaBj7SRcnMLJmVEoHOreziUof5qVI5Vndhm4qHu6uxWVTmBVA
         EaXrMkd5zLfYmpnxbLfi538zaK+n8MXGgPKm2k5kO2hPZ1jLF+9c93qohF6Mlhfmt8zz
         jv+7XWpmrDjaZWpw5cEMcF1f0M18wxi+TABb0klYsdK9FTLz3d7ygjg5OYECVh3pUAnk
         kiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755967; x=1789360767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=tVrW6Ebu0yB8VpsxgoyT84AXKYk2cunRDHDSwYf2Qvkg0vHDvo/d31EiZflnw164I2
         o5C7+TcdI0SFyw7deDSKPbLRm4pjjrqpzlGCd2aNkp4c0Dc9wuVVGXm4OAzRr0RS9Epl
         sZFJ2NgZ8E94OMqib0GdzFYPmidoYq2FDhlPqcLQzRVGtqKTmk0NO8oSN26tdDRj8ak1
         WIYogd07gUcVM3U0/GqsiTV9cECLGXwgkA/Ec2nyhaiEoMVB3lsFeHAzH1cdqU83yC43
         JL4Jnm3xeyveDKVTffkUZYlrDKCrUThpGBfB1D8aZQqM31qvkSq/u6/Kk+8A6a3OX+4w
         b6dA==
X-Forwarded-Encrypted: i=1; AKwUvBwGSX0HHzFMVw98nAg4a9TPteaSwixNCXbpnYGQ/2YOENPwtislQ7R0s03hqR4dQ/YGHb0=@lists.linux.dev
X-Gm-Message-State: AFuF++lS/NiVU1yo0L2FKzUpEN/tthfDHdcKFWiFMuKhNyTDQ5k073t7
	8KJlzTWS2MaGhL/+nhktwyqNk0pHt1oZHJN7LYUHFCSdmwiL0T9l59Q22IdJi7TQlD4=
X-Gm-Gg: AYBFou0olUOa0ermjvsAFNEc3TKiWix+GMIU9e2Y5z+Ch0ATzGUkuTNqpmH4WRZUq/5
	lddrWX3G4T4tY069PCKI2nDAvtiblPNuLUV1brVYwFiaTsjm8YzgMG6DvjFVnRo9yxXbFTLVaEV
	HHwVnJRqKNifRJ+/vS+tvhAEpFAaFnJZX14AViUS88hl/jMcYd8rba0DgmLFxBW8l08Y8uSr0Gd
	E+rFfRuaJjlM+IuqnYx/eXOmOiHWiEhu6Ji8uOM6YOoCZFTKVC7oIsGtMvhwQAyapwdIS6RY1V3
	Up4cmB9TBMAsJa/+RvUgMH670TlzSRWFnL+7KkHH1mb2yCRvJjOnsHja6REumQMM7f/85yaqR/g
	azfhaL1Oop6x5YUuILDEbUsN/8evQZUmWX5Bt6zACD8SS/m+KcnAF3qQj2AebT+p/6o7VdLM1cV
	GUiNKFSOzL04FDRTlK0W3h7UgDWQZk9+46z1payQvYO50LSagNAnUVaxsU3AFTago=
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr299920485ad.16.1788755966732;
        Sun, 06 Sep 2026 21:39:26 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm26643998eec.2.2026.09.06.21.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:09:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com, talel@amazon.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	mmayer@broadcom.com, sumitg@nvidia.com, krzk@kernel.org,
	peter.griffin@linaro.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sven@kernel.org,
	j@jannau.net, marcan@marcan.st, casey.connolly@linaro.org,
	sre@kernel.org, wens@kernel.org, t.schramm@manjaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] cpufreq: Use %pe to print error pointers symbolically
Message-ID: <ap4_-12ta7ThxEjc@vireshk-B250M-D3H>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
 <20260906061755.5103-4-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906061755.5103-4-sumeet4linux@gmail.com>

On 06-09-26, 11:47, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messages
> more readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
>  4 files changed, 8 insertions(+), 9 deletions(-)

Applied. Thanks.

-- 
viresh
