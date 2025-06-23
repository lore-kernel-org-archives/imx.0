Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98305275859
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692780; cv=none; b=K/XYLByrbFio/UjQ5qCJE2dyPSFMBpgXqq9OXMzzRwsA9iqxBFsgs83Zd5tFHEk+YPTwh/Ss6JzRAHUs0eJoVPCgJoA/L2I/lB9JphMshK3GM2gXdDPHkoM408SSsfuJVKpfSE/SsSsuPF3trzKdu1e9Ig9SVKlG4wifPeaidp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692780; c=relaxed/simple;
	bh=K7nJQgtBbSh9bg4c43k2d/lR0pxtXBYTwkLYTeoGBZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPsclm8PE2ll/q1uMKrsEFX62w0nYA6ZK3Y6ll7TcwWKEag6RSq/9NPCsraJUAAcS6QnEJmA29Ws+MyqqGOF5yHOXM4fpugCCodCI9S7X4c5Y/bVnpyeFLGfOW+MfbSbbWbyZ6eQnfhYKkSijjPlBag8B4NMTIXHlNAjiYnKIMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+IUCALG; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+IUCALG"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-313b6625cf1so3015490a91.0
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750692778; x=1751297578; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1KRVwjnf5Gu74AF6Zl0ciz1iQ0kZ7/1mY4qiKdYpBHw=;
        b=U+IUCALGH04KWHcUnB9hvsK2tcaLx4Vzs4QfGn7+qse9XM32NvrCcf3TAbI9Qc8ith
         3k/Zs14I/6V3Pn08ZBzk/eyqM7bDjv0a9uznIV38dg0E6MXbpJslaNNzKH9wu9GiFCdM
         GD95zzIDoRsQDwM6PJVcSZc8kQ9naiTgZ/e1O9dZUXdwv7/O1opPoAdp+nLSuMe5I/xv
         OQXi7/u2/mVdY7Rk4io4wZh2QRjX46eg5368+eqY0vlJLksoWAcCVaxtZEpHnXZoaKs5
         Sq3RipihgxAWhKZx7Lv2R0z32f2QLouveWSGVwYUmUvo5TvhPwLcUveCFZ7JBnHJf4Ma
         TgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692778; x=1751297578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KRVwjnf5Gu74AF6Zl0ciz1iQ0kZ7/1mY4qiKdYpBHw=;
        b=jySZddYA0lrNdPJx/utgnMAQ12n96oB1s1TvqkrRmYicaGLHb5Sug553wJQdfKyfSV
         QJ6v7N74aVeauhbIU3kzbIY00tv8fbGT+Jijb8wkhXxDgEFKLaamRZT5H0WImpAg4tOV
         8Vg0vd8E9C8CEaoPTejO5FI3XoPYRHBoDcgMck3RHTd/zSG0/m1Mhg4v5EWyCrUO87dk
         Reaqi7sL0/zDqq44J7oOZYNlNU1Qlz6KJV3z5RCh3TfrIvHJTiPZxekfMTV4ecOWNHx0
         LEb95WHBlCeD9D6B69iIGmo6MZEMQwkGroaykdqSVALaCtGFiQ1lAcFUihRTlvBdvEkN
         TtAw==
X-Forwarded-Encrypted: i=1; AJvYcCW0+SBdJvcKtEcZswsrF0E6m9uts2aGs051CzTmmUYLeHFe9hSrA3pvG2xl3vetOhMheIU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhKgiTlcSKYdK6GUoK0pyG6ngUMdq+krva8RmzqV9LsxJqEH/c
	EEUgN88LcMk+0Q5Utew/lD8Fv//7dDuAQud+RChE0dZ9CoAxOGNt5QglGiF0ur+lTAQ=
X-Gm-Gg: ASbGncvvwZ4ppZouvEgN9fmkSUth3QKPlTHl40zEeoXzcn1lFAXERa55ecOxaduHAw7
	0fpyRQuwam7BonvenNnpqBaeDzVIZ/EkjJFUWFEzXXVsxCGsvbphQW0FmK0cRA5SemZoE1XyoIU
	sjEvrAxcOSSUcK6CAmDln15GWbb0hZNQjYgFAWLe6bEDqwj735kJAGGdvI5efyRe0mXQgrbGqMx
	0EUvAuCNA/Ua6yR9KzfH57L53xytukv/Z0ir+37ikcdspWiwM4TVt4uNho2WoOAmqsceOE4sYBR
	TwmBM7aC04JgpsBnAPyLbm8xWr9/XAgNrG/rTp5V/1/NmmXQbzbJhDVJALRc4OIv
X-Google-Smtp-Source: AGHT+IGNVVPK2gkJtWTZs/pQbffW/A6+VZyFx1ATrRb4chkU190AUhzC35954VZWOOfCqbAJDEPO/A==
X-Received: by 2002:a17:90b:2e04:b0:30c:4bac:1da1 with SMTP id 98e67ed59e1d1-3159f52d0fbmr19149295a91.17.1750692777852;
        Mon, 23 Jun 2025 08:32:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226f6fsm11220540a91.6.2025.06.23.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:32:57 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:32:54 -0600
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
Subject: Re: [PATCH v5 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <aFlzpnT1yNGdWWkH@p14s>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-1-hiagofranco@gmail.com>

On Tue, Jun 17, 2025 at 04:34:47PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> This patch series depends on Ulf's patches that are currently under
> review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> Without them, this series is not going to work.

Please resend this patchset when [1] and the work in patch 1/3 have been merged.

Thanks,
Mathieu

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
> v5:
> - pm_runtime_get_sync() removed in favor of pm_runtime_resume_and_get(),
>   checking the return value of it.
> - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove().
> - Fixed missing "()" in dev_pm_genpd_is_on description.
> - Updated dev_pm_genpd_is_on() function description to be explicit the
>   function reflects the current power status of the device and that this
>   might change after the function returns, especially if the genpd is
>   shared.
> 
> v4:
> - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> 
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> 
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> 
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
