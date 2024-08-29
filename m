Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADA4189B9C
	for <imx@lists.linux.dev>; Thu, 29 Aug 2024 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724918013; cv=none; b=Ezt+JikoBTV6OAZ6k/lDzXclJeAh9XED/zlseKLnACfYlJcYw+X4JNfm9OW3urUpNwxZ5QGLHB0tRYcAuE/oqRHJPhA1KztPCX5Ew4qsEyb9ugvwo7zlI8i2QynsYrYmIlMbFbVkKctI38xhEUZLCz8+Y849fvbfnVvRQ3bEgdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724918013; c=relaxed/simple;
	bh=W3a7fcWo+PgBtFPMvzXW2DFGxj1QeaatlOg1GiAuNAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abvhlvv5ItkLfE6ggM9KxYsFNuDRpamGwfxawaE8sjqVpClIQsdLcftJG5p1Feia4YC9W4t80j+smDLRdShyuLW+kN1/RggHCwDcHhDXknkLgtyApY33pNpCyug0JxpgQCLGTg9lGK3vusdDd5v3WMro1uic0drYN7A5C+3tn/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VOh/Z5Fx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VOh/Z5Fx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4280c55e488so1838325e9.0
        for <imx@lists.linux.dev>; Thu, 29 Aug 2024 00:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724918010; x=1725522810; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=InYUyDiltHfYnX1zRpFtWut+hZvc9QSePUy7MTBnp5I=;
        b=VOh/Z5Fx6puru7CFPbEYvlkCWu7oXg3Zo8blw/Tf4tS7jP36VHKj3XlrD7bbrLTcI3
         9RDuMX7yNqc7OUS/d+IMC/xOIzAKf31FTpgfgGc6bXxT1/F0IQ5fbAiTZW6Bhih1baWb
         G0HLOQq42kMX9VCVjzz1DdVF1c+IjK9p6vGeVGNp5t4AnB86b42k6gLchwmYCBDBg2HB
         GTR+VPtKxcHeOPxFZ2mrNcSBFEbKGqdSNS3S9QIPle8ih0Kr+65b1dYJwABhMsMEH5zM
         hEIe3Q4oR9ElaT+0fvdDXGYAbe/tSWQmKBaGIBIdpAKgkm6U4U3UNtBdQZVgVDLjqr5x
         cXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724918010; x=1725522810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InYUyDiltHfYnX1zRpFtWut+hZvc9QSePUy7MTBnp5I=;
        b=BBo0T7vBlqRwqGvLFrv3PemAaWVrtNNg39HDBUDzgpaYyPooKj5QTfJtbJs5ww6fZJ
         TFC/AbnDaUgsD22MUIyW1IILtY5dVYLXlX/HM7i5gRdS97pACwL+D4J2iiXbfcpuOcfu
         dmUUpgJFgk+FEbvFTR1SsrziPPj3Hse9xt5/RoH2DiwNdg5/64Qvvt91v8P2waN689vK
         JASGuFIsCZKYsOArxcp75h6noF/pa3a/X5wgXN4YvqmpSC+hGs8a8pkUlTvmRs9TwP/o
         og8taFVTrHlDO+zvGuIHcML1rWeO8+TUTZ1LG+EqRdzoBmT8WosGDkiOI2qfepRQS+UK
         QtDA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Pzn3ch0xKMXOpR/OquuD4lKGROpzOPFqorl7A3YfZ2iG03LEcxiAT7XH47wFYyDNGGw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwU3NZXSAAZapYiQKA78b/wZLWL193AyO3tPVmtTD0Sy3Wy/AOw
	xOkOXE8i8uvnSuOzfUJOcp/MkUcOdTtY+EdPU2V0BR5JrRTTSd8m+wesyMZdkHg=
X-Google-Smtp-Source: AGHT+IG36wbd/M5Oo2bLRecVz+d/tZ6IYaPfKGqL9VUz1yj12FPMnhEBY5MgAchFiPL25jDtKrOvaA==
X-Received: by 2002:a05:600c:5025:b0:426:64c1:8388 with SMTP id 5b1f17b1804b1-42bb7461abdmr5020065e9.17.1724918010053;
        Thu, 29 Aug 2024 00:53:30 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4aa22sm733789f8f.7.2024.08.29.00.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:53:29 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:53:28 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com,
	Wei Fang <wei.fang@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 0/4] add NETCMIX block control support on i.MX95
Message-ID: <ZtAo+B0XOE558+93@linaro.org>
References: <20240829011849.364987-1-wei.fang@nxp.com>
 <172491778768.2521946.17064463983702008243.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172491778768.2521946.17064463983702008243.b4-ty@linaro.org>

On 24-08-29 10:50:16, Abel Vesa wrote:
> 
> On Thu, 29 Aug 2024 09:18:45 +0800, Wei Fang wrote:
> > The NETCMIX block control consists of registers for configuration of
> > peripherals in the NETC domain, such as MQS, SAI and NETC. So add the
> > NETCMIX block control support on i.MX95 platform.
> > 
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: clock: add i.MX95 NETCMIX block control
>       commit: 4b78b54762dbfc2f22f28655fa3cf6f5d50de197
> [2/4] dt-bindings: clock: add RMII clock selection
>       commit: b4f62001ccd3fa953769ccbd313c9a7a4f5f8f3d
> [3/4] clk: imx95: enable the clock of NETCMIX block control
>       commit: 42dc425fa8b5be982bcc2025d5bf30be8b26da86
> [4/4] arm64: dts: imx95: Add NETCMIX block control support
>       (no commit info)

For some reason, b4 ty thinks it's OK to mention this 4th patch as
applied, while it is obviously not.

I only applied the first 3 patches.

> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
