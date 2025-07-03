Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E4C25A2A1
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751561107; cv=none; b=nGKaUswU+Zp8XyLWRr45msZebHAXQu8JL975sb8ZQGAl9gS/gl6bAjT5NhI4J7e/u0P8Notx2kfa01CdXhBdo37ANmBHxst+YlG0LErpYvEhlFszyaEwEEJKMQvkbDL3xgs0g92RyQLp9adaM/HimwY/MwR64wvtthTw6GUVLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751561107; c=relaxed/simple;
	bh=K5enpRuic32S4oE82qU4ccV1Rqy8bsY8TPalBVIEb0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbEV6+JMbDgSkTKJvw/jmNUoNWmSY90olgxR8SXTrv9+2s3Nr7gn1as8LXmSfhZhT840czBwqXuBAMyvIM1uOPgt+1vcU4WCgxQnSSQeGUaBXgviF87LiNCr4meh0IGDZ31OAw9ZcnJ63vnJ8y9ryr8Gvf6+0XH/4VOD++Zaq+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b/UqjVC/; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b/UqjVC/"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so60675a12.3
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751561105; x=1752165905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GBHUELeShaDsr042UH3FpVBn+V9zul7LrFKtD883WnM=;
        b=b/UqjVC/DpzGyVmUjb42HBLeQfqSd8XmsU4T8/dCNVfN+TIavVA3bNAgL7sswynHEt
         jcg+06QuLsDxb/4G//aUK4XOP9VOulIfamEo9Aq90C3YdxkSLgczlSUK3LWKGyXhewSE
         VUno3uMP8TPc7BWwcE5joJlUPWLJwP2sUi8TXXqAloIhYWksjo8194dQ1Orjm/EU54dl
         DlBavlg65ugnSO3F1ZHImPKdvNRjKo6kqxDu2qfujCn6BrtLPKW5anazOomYZl7Ayvo8
         ssgUaagP5v3nRFRu97xyZhv997wh6e2L0qcBIXd3ErHGP47MCAbVWsDqvfb05fq1GJ1k
         gOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751561105; x=1752165905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBHUELeShaDsr042UH3FpVBn+V9zul7LrFKtD883WnM=;
        b=lhYyalb/j0h4lUAG4/8fnx1FRCp8DkdzP/LG9OJDuqt/fMb4kv10bC5iAHShXo++g+
         oIFu6kytlMDrdxf0dxVwIG2z8/SfZcKC/i3G3R/3X7usz3x1R5t+dhY89w0W/Jeu1Kce
         vJLGWL7xQS+ffsNeSBm8VbSGD6At2Whhn4SST1UwSQAj636KWEkpE2Vb5JxGH6kR9BJx
         geQ52Z049SfQaRrc9cQguan3vxg109yGtXnozlXKwrl9qUv4eUdhRZokwKkS6mXkF6jf
         waNjA7vn44iK2pSwOawJtAGTAHtQmkSUmAtnM86c/k1uz/hXLoy8VfwJTU/AyvNaHhHw
         /dtw==
X-Forwarded-Encrypted: i=1; AJvYcCVNmTvTUbsm0uUs2FzVdUxG7/zxLYtHaCnRcJLzSP8mYkHjaT7l0wggJtBzlyrj5mrUYQI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yytsx9uG8yqAIFFW1xUMMNdh7GP2a68BtdIHqtTEgVDVMbcEqQC
	1tNFKsU1ICAUUQ6xzBHaU2xU845gmrq3XmvJbX2FnGfxb+HobnCwO9Fg4O/TE/3DrVA=
X-Gm-Gg: ASbGncs8+n+H3M0kQJenXKRGdG0QuteXvqOaMY3fR4SPa1Yt8hJDmfPnR3J8RXGmkjL
	wOCD9KcRXg8FUadFWR1e6Ae/MQWf46Ig2on51Axnb5wbys/Eg+FdLJ1rDlc9hW0agkpuvWK4xoc
	N8QNq5+TFWffqwO3eY+gu2jCRy03UluYAw+pphD9s5JhM4BDZ/9DuqK1MNVAbUD69JuoSX/ezna
	y3R6DfWPqMhIKSBOjCTC+fLFK1l6wnRYUErVp9YlzGvFC2Ztlnp1xpU0XESWLLpVxPsykFDLY8V
	vGmqZL0fuL9H7qRtn6ro2wsnWhM0hhljnDx0Kp9prKuRwUE66zV8EFvjC3u6SAPG
X-Google-Smtp-Source: AGHT+IHypldJuULZ325ar/a9F5r+ljoB/YMqxQ3fIIAWryPfaK7GDkJ6OJPyeHAhWYcOOLtHPwQMtA==
X-Received: by 2002:a05:6a21:339a:b0:220:8b24:ab97 with SMTP id adf61e73a8af0-22409d1b38cmr5899440637.16.1751561105008;
        Thu, 03 Jul 2025 09:45:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5ee3:4bef:2dc:d1f7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee749366sm74601a12.74.2025.07.03.09.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:45:04 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:45:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <aGazjaJQXl03HUJE@p14s>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629172512.14857-1-hiagofranco@gmail.com>

Hi Hiago,

Many thanks for re-working the changelog and comments in this patchset, things
are much clearer now.  

Thanks,
Mathieu

On Sun, Jun 29, 2025 at 02:25:09PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> This patch series depends on Ulf's patches that are currently under
> review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> Without them, this series is not going to work.
> 
> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
> 
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> already powered on, the driver will attach to it.
> 
> Finally, the imx_rproc_clk_enable() function was also changed to make it
> return before dev_clk_get() is called, as it currently generates an SCU
> fault reset if the remote core is already running and the kernel tries
> to enable the clock again. These changes are a follow up from a v1 sent
> to imx_rproc [2] and from a reported regression [3].
> 
> [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> 
> v7:
> - Added Peng reviewed-by.
> v6:
> - https://lore.kernel.org/all/20250626215911.5992-1-hiagofranco@gmail.com/
> v5:
> - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> v4:
> - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> 
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on()
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> 
>  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
>  include/linux/pm_domain.h      |  6 +++++
>  3 files changed, 73 insertions(+), 7 deletions(-)
> 
> -- 
> 2.39.5
> 
