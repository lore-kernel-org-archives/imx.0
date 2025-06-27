Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAEFBE4A
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028843; cv=none; b=NksI0q+pPYirspaKd8Dk58P2cg/ckvkox51s+IyfOgQWULnJypJqnZ2GaT5RWrWsyx+NRfA8DVsgb2+JWaX37LXwlJ73JTv5pSDowgXnKIx7C9QeiXDxKMlI5YHJl/8ab6AkCn8xPp3NBybmySf1KnYjt/HoJGcP8NkF8e0BuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028843; c=relaxed/simple;
	bh=saqz6BlFQr0m4M/mU7Qnz/3rJIYjIiNg+AsFwW3PpIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7TTGB05vBGeEJQBR6y3X6S1jz3CFrF3416opl4lCQOy2ADHlRUOtEi/Ii6RjTA1yJM0GRYRxJd7UJCycx02301V8Zm7iO1e8qtefDIFCCI7ggPNuCrFbD5GfCmuqGal0BLxvjyx95dIsmTuajamrjf9RfzsqwvSyRujjYz20g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mohp408N; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mohp408N"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a745fc9bafso35906191cf.1
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751028841; x=1751633641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0+gbguBFKXfSpjf/gN8iCO7iVT7YM1v5J/bh+qAGVa0=;
        b=mohp408NFnjb7PO43hnLdXY7K12S/AR/ZVjsCqVK0qtz4Xf6d3u3BZI3IK1o1xpqBT
         9IRCMd+Zvdj3myVznOZOD8pbKqluD4OPgbIhfGRHZM1xG8iu8lIjOl2EK5TGIG6dD6sJ
         sBqfC+4psJ0IMP2txEm0DSJsdQB/Kbg6WBp/t4/euNu+qeB0LyooS+80IV12t0xa6Z7c
         jExbo7vaZgCRGvNQ9vcQppAqVOarwz0Dd/7XsVGSNIxlOTeZnl+yHKG9Qyu7BA5s3G3n
         KQDGRzhbCW+Lb0X6PdAB9R0syJGSy4V4uzF0W1T4siuHbJtS2dSxezJVjo+Y+ePgc8XI
         AD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028841; x=1751633641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+gbguBFKXfSpjf/gN8iCO7iVT7YM1v5J/bh+qAGVa0=;
        b=SX2ZcafW1Fz9Z4Hp/7E8A1oIU01EIKj2bOtr1RzWEuDSK8LFny/kZpgFRBMLrhWVS8
         1sZx8+urbaWsFXTbkdeHFl9rhBXu6bY/iFsyKgmEqvsQPzwQcNUaDeC+FnxYhvmFvXcq
         Kmnpy06d9xcUe86A7gzE2JYuGOfZCf5+bwsKm3h7PYDyF8mjDYejAuk1DTVx2qvuxchl
         XvEJ8j442lUkHjeq5PJmhic5y5RznaZlZi/sr48DP349cVt9g+NUi3kkgFujRBN5o4NF
         Iw4iyoBYcuJK/a33IUHjwg0IS1NR9Z07eR35Zzvy2dpeL4lUP+2vs+vvZhjpyVicDdoq
         WvIw==
X-Forwarded-Encrypted: i=1; AJvYcCWVx+9W8Mf6Pzdg/x6wKHDgg1x1SNcESjkaBM8dVFE69wXzAgc/d/ynDGUl6EHu+SslBQA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWmDE1yAR1TuAvOFfBW16lJoqerxfwUzE9PgoW9XX0GCJBopr/
	jUm94tULmIZW810QsoUFL/cgpvwi+p+GUjLBj5LqzlLfgxZYWeQvc+Vx
X-Gm-Gg: ASbGncsAcf9yEiMKWDQ2OhxWsgl4het6xGwqbR1cmO9C4lBUqGmXATQmwIpX1HWFzdR
	QZbjTQ+kZCxMBo6ii98Hjx9n7jNxpARejpzxP4qyTQbGawqSw/PvDXlmbjcAuE8KWpWWPDBmJ17
	L46EWaFhBq7wfoXbl6O9Qf3y5vlTp1b3Jp5VN5uC3zPYJ0+l9/Z8k1Xe4GX+hnWdhnVNmTo2Ygt
	D3VJJ+N2pXkzuE9+YuRm6E3rZT4yBIllWa/n5wIfQN+e7//QJzG3C7B3/pxWDxCDScTrBybXsxV
	ZmBWcyZ/36jTsEvaa1wjN6UjduWMQrX1PbxAqWe2fq79TkN/WjYbEvym64BV
X-Google-Smtp-Source: AGHT+IETveSWoXC/08GsXfLK3MH9fUuvjqdK0l7+CppsFqhkxU9gg79wiKfc6Glf1WTlwpf/BCm4jg==
X-Received: by 2002:a05:622a:4112:b0:494:7043:8a2 with SMTP id d75a77b69052e-4a7f2e86617mr128632811cf.16.1751028840824;
        Fri, 27 Jun 2025 05:54:00 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc5a3b92sm11378121cf.76.2025.06.27.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:53:59 -0700 (PDT)
Date: Fri, 27 Jun 2025 09:53:53 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <20250627125353.2wuozc5in2ijnbi3@hiagonb>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>

On Thu, Jun 26, 2025 at 06:59:08PM -0300, Hiago De Franco wrote:
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

Sorry I missed the reviewed by from Peng, I will be fixing this in the
next revision today.

Best regards,
Hiago.

> 
> v6:
> - Added "reviewed by" from Ulf and Bjorn.
> - Fixed and improved commit descriptions of patches 2 and 3.
> - Improved the comment inside imx_rproc.c file.
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
