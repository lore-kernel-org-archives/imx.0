Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823AA3074AB
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781900; cv=none; b=G1igxrXXz9i3lzeyZqHXCm9Ls3xJREs4YkMRpFD3jp6Ozenq1xbKiKkW0TOGQYscSG654DOjvgv0lOOD/gRRa6fGpUiWJFpWcJA0TzTGGX2fSjEhpi3NAE113o4y4gxVhZtY4OOGsydNc5MYDjhgnYUN6FjGYC7jqnMR+/VyotQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781900; c=relaxed/simple;
	bh=jEHkfNRoxG08BgsTmrEHrIPbT5Ga85US2KlZCNdzJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/7NvfS8RGA77V4Jza61nvsIdcNQUwno1L3AoWPtMzr8RFSdxuuTrRgyj7fI4RmGbTWF0pYzF327OpEdqtU2corgkOgHrGOMvKp3rYiUw9/Itdj6zhksr7YISgym/FGDMc1WrpAKbpFJAYfhpCA3a95YmVuztGcDVk/aC7JNg7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao8b8IEf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao8b8IEf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2350fc2591dso326415ad.1
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781899; x=1751386699; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KaSirUQP1y7nt53v45U75QfDYbaR7g+CaXyRQ+R4zaQ=;
        b=ao8b8IEfPyjaFUCtdgeV8dER0SNnlpnr6sresYt3p/1A46S+kXZZ2TU6BMUTd9CLP8
         COdq84+ymbWzMXgSol01UmyooOujv9RpV2TwB8o5K5iD+qNIc8F8UWb9SV2/UlJMLatG
         htULQhLkyqXm+15eW2u3jJ0o4cwJLpkTScnwyoGP2A8GOaLJyO6JQHVUFeRR+8YwYh6x
         EzE6qdRbx+nVCZPDoAKdr4swP3Fi7CFSkVZCboMs1Z/tWIFZ2YWVT+BZDQlTqZzTFTvz
         ebcPKCPd7lpT3egveNyw7f3Rb4Qne+Akjc3GPgzXKVd/BLRyG5RIbI15xdmt1YDHVV3S
         pQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781899; x=1751386699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KaSirUQP1y7nt53v45U75QfDYbaR7g+CaXyRQ+R4zaQ=;
        b=gQA48/jxtpD9x0acSJ7m7r5qm9f6Flqn7DXGM/vVYRMcEx28T6OsKYuNsMesz77I8E
         08BJNiRmsiRSOI9VFHzpds7Cl7tcFCT7mCm4wY3MCTyPljPhP40YPKJ2sak+SxNhrXOB
         e1mpGEB3cl6Oe1Oi+yJowm5S1ALaS51yiwws0FSyVA4zl9jDZskRo8ULflaMoawzD+xP
         XxhtDcZnJE9zS012y5FIW6XCBuatsGVeNx0zYnYHZz0MfpX3yiJX9vCEoewCXloT8Q2M
         fWWjJ8ayGgTrDPFBCP4E5gcDhLIvcK+yqa4OHArOyNMrHzQSVsdOlmZn14MsVm4VvmLM
         N7lw==
X-Forwarded-Encrypted: i=1; AJvYcCU+rKD9yuTiSGtg11zS9q02aCIbCqBu31bJm/79sLyUcmPoA3iecIu+lrET1CO6FH/UMv8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNNMY1ZikxwmrDf5TUM6BylYeCN7DOrriKwwivuMBT0IpZxFeM
	7cEj5Te/IypYV8rQPBapLAwCvHwh4kURlaIVzxI/86VNPMk/HdWqS5sw
X-Gm-Gg: ASbGncuHo26sJmrOXPRo7zOKpPKBKZbaVriYzhSG62bRVd0xE0IvZIkxhjXfT3J2BAe
	vGpOImCvzaSBJkaQbWTcKLEo8ByJx7HHy9gLdXfVDQoenZMKzafT2hEsCAAB8tmaqrZkyyI3eqh
	ltldLJvFjKeZEpLc0yMU4Omy1IsJ4s5WPA3Tx7Fuz9m03wztKWfuaqhi/QZbaUqY8gprFShAZ8Y
	mEQDUcrmf6he+p9IK3taPgJgaqfubcK/RFstPM7MhMWDKHJ82BEqL/HX6zu46XkEZax3i0GoFml
	P4zGfv7taJZXdwsvhA9vUTXCFbalkA5Zs9uu00DobaYezndD/t5HYTXQEivUAsfOfXgLuw==
X-Google-Smtp-Source: AGHT+IGY9jDpDk2r2dCyM4JVgT9EfvwZiTIAPDobHHlnMbHmIZb819DFvehZFOYNen2Nr3/FdN/vzA==
X-Received: by 2002:a17:902:9a09:b0:232:59b:5923 with SMTP id d9443c01a7336-238024b7fe7mr64735195ad.23.1750781898702;
        Tue, 24 Jun 2025 09:18:18 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83955a3sm110681625ad.36.2025.06.24.09.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:18:17 -0700 (PDT)
Date: Tue, 24 Jun 2025 13:18:12 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
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
Message-ID: <20250624161812.c4p26zkd37awixpr@hiagonb>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <aFlzpnT1yNGdWWkH@p14s>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFlzpnT1yNGdWWkH@p14s>

On Mon, Jun 23, 2025 at 09:32:54AM -0600, Mathieu Poirier wrote:
> On Tue, Jun 17, 2025 at 04:34:47PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > This patch series depends on Ulf's patches that are currently under
> > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > Without them, this series is not going to work.
> 
> Please resend this patchset when [1] and the work in patch 1/3 have been merged.

All right, I will send the v6 with the corrections you mentioned and
resend it when the other patches have been merged.

Best regards,
Hiago.

> 
> Thanks,
> Mathieu
> 
> > 
> > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > started by the bootloader and the M core and A core are in the same
> > partition, the driver is not capable to detect the remote core and
> > report the correct state of it.
> > 
> > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > returns the power status of a given power domain (M core power domains
> > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > already powered on, the driver will attach to it.
> > 
> > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > return before dev_clk_get() is called, as it currently generates an SCU
> > fault reset if the remote core is already running and the kernel tries
> > to enable the clock again. These changes are a follow up from a v1 sent
> > to imx_rproc [2] and from a reported regression [3].
> > 
> > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> > 
> > v5:
> > - pm_runtime_get_sync() removed in favor of pm_runtime_resume_and_get(),
> >   checking the return value of it.
> > - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove().
> > - Fixed missing "()" in dev_pm_genpd_is_on description.
> > - Updated dev_pm_genpd_is_on() function description to be explicit the
> >   function reflects the current power status of the device and that this
> >   might change after the function returns, especially if the genpd is
> >   shared.
> > 
> > v4:
> > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > 
> > v3:
> > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > 
> > v2:
> > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > 
> > v1:
> > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> > 
> > Hiago De Franco (3):
> >   pmdomain: core: introduce dev_pm_genpd_is_on()
> >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> >     SCU
> >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> > 
> >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> >  include/linux/pm_domain.h      |  6 +++++
> >  3 files changed, 73 insertions(+), 7 deletions(-)
> > 
> > -- 
> > 2.39.5
> > 
