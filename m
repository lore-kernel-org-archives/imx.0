Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A49C5258
	for <imx@lists.linux.dev>; Tue,  3 Jun 2025 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952593; cv=none; b=RktMdjvVNi7RozP0z0V/f/CTXpcFDGWSmbwdMh947DgJmJ/ncMn5/EzACKmA+NCWzdds5VJFmAthPBF7GGSVeiJbmeOpF+ZprGIWiKVJI8El6liWdqL+6y+s2k80Zf2BU0ML3EKPeCh/no78rBtaw+d5I+3Vhb4O+wTfZ/LieRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952593; c=relaxed/simple;
	bh=YryBAYYqkusGLWOaZUx/ENPVrzfzihfvA3OAF4RkZyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RyFmoYdwavxdjIldjsmAbHDHZL0osiwooYOKwfN3ChyLlvkz2AROikQjYC0bR4L2zvIIyL4SZy8azRyoZ97VscQ6T15AglkFmoUpncMY3FNBfIwgqik3lJWyxyq38WUUq+cbpiW8gHhSAPufsOafq3bFmVvaP2T0I4PsqFhJZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sG9yOd+f; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sG9yOd+f"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70df67e1b17so51582087b3.1
        for <imx@lists.linux.dev>; Tue, 03 Jun 2025 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748952591; x=1749557391; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wkgkfx1ZHJ5WRXN3wk71OJao3glFFdhvQiWlOBbCHtw=;
        b=sG9yOd+fknKGhujrL23/qnDNLjotNYIN4u6UX90+MxIQBKWAM4WDhFbAlExTg2DuqA
         lpUxAh0GnNKwuf1GCjV7I6T7OOYCR6WTIj/DAKzydZZn1B/ZiqE65s/wQQR2yMPyLrt/
         2jwTIaJZEDk018MrVYqYflCG1qo926V8agT7cS1b0ued+SCmeTk58KrZy+w+uA/xSA3L
         DQpiEDGttnYJAsVoqZvbPJhAv5maJ0wK8a8FM4ViNoP9NUSWWiXAOKZRsd8+UPm9NUoK
         NmZVPpZr9gLbrXsbH6m5QUk8XyqjxLuxGGjG8/b2geAKICZA7Gi5bg8ikvIGYN1af9qS
         oO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748952591; x=1749557391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkgkfx1ZHJ5WRXN3wk71OJao3glFFdhvQiWlOBbCHtw=;
        b=C+P2Rj7MrU7iOSwAq4Xadfi87bWpUfWNfHwXqSzZE2ZjqdldzeBUC17xooKTmxFxJV
         ddbL2fC9OZI5DtasRHxEx29sy58bpIt0aa+gwYdlM7zPZXnJ4CnbsQ8fPwBtOhHvnFQG
         CccidErRXS22XBPwD2P654A+iwmcaVfVVYy+XxFMekZox4N8PCc53asjSP8MXcgZqbnL
         Gs9Z95rMe3EThR7HATbE5sYLfRBQY47Jdeh5NQLeFgaI/VwWQPixRqRKpybqsluTpsNx
         bBo2ofX4bcRnP0qqRUsAO7NalyMEp/0uWj2jth00nf30whRmIQEOM15+jL5T+Uwu2eTb
         yi6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAddGiRCrelCISo05yanc8A+U7HV44dLcRHw9gKO7TZ+Q2X445ijAO1xtUaCcmOwG14ws=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvXE33kPvpZV7vLanxVC3Pee6YLMUBXVw2WbWGvX0+6KJAcXs0
	nvkPxRgK6EyydZf2EKFekrSXlMHwf2B4cX9iT37LuSDsuDnQQsirGe1hu8cc5Xf2n2EOhnSGwAH
	4RWs050DBjSTzleGgTvwcLfnXmiUKAyBvrGqulxintw==
X-Gm-Gg: ASbGncvQ/ZfNeg5yJWWpM9px4ZWbses7qRO/ZGyJ/SDKZemiiDwrWjfXmpFBWpLXext
	mr3RHoR/51n/nTU+TifNrvryNdgjaUNGHQY7soeUQ75Svz10aR5ei6NXV2AFZULbliLa6rxXHGx
	RjdfYAM1lKvUcUquxIpMGtgxaf5DifFL2HXJu1GOHWvqU=
X-Google-Smtp-Source: AGHT+IEBu6kRLR+QihKU16+LErg47sPGw3yJ9MbHWp+STBlEAPmBRdPA2kKSotqf4d+nhihTdrEqxcQCav79Y/SEImk=
X-Received: by 2002:a05:690c:6888:b0:70e:923:2173 with SMTP id
 00721157ae682-71097c2a76fmr158597817b3.5.1748952591135; Tue, 03 Jun 2025
 05:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602131906.25751-1-hiagofranco@gmail.com>
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:09:14 +0200
X-Gm-Features: AX0GCFuMy0nMLljWiQ8PZlmv65MxrymGJ77Eb8A4CZbrmvODDSNF3Eq2H4oVdUw
Message-ID: <CAPDyKFrUAF5oWkyc3mLf0+R9VAypBotNyR4B5Chr3KQFYJOjbw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Jun 2025 at 15:19, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This patch series depends on Ulf's patches that are currently under review,
> "pmdomain: Add generic ->sync_state() support to genpd" [1]. Without them,
> this series is not going to work.
>
> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
>
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is already
> powered on, the driver will attach to it.
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
> v4:
> - dev_pm_genpd_is_on() introduced to drivers/pmdomain/core.c
> - imx_rproc.c updated to use the generic power domains instead of the
>   SCU API call, which depends on Ulf's patch series.
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
>   pmdomain: core: introduce dev_pm_genpd_is_on
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
>
>  drivers/pmdomain/core.c        | 27 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 33 ++++++++++++++++++++++++++-------
>  include/linux/pm_domain.h      |  6 ++++++
>  3 files changed, 59 insertions(+), 7 deletions(-)
>

We are awaiting further feedback on the other series [1]. As you have
tested it, may I add your tested-by tag for it? Or perhaps if you can
send a reply to the cover-letter for it?

Anyway, for $subject series:
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
