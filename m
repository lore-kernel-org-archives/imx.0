Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1502A12E7E
	for <imx@lists.linux.dev>; Sun, 29 Jun 2025 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751214225; cv=none; b=cIF0ofvjKIN9cOghbmU0bv5NwBccowp8qYJzLYN8v8EFsP69IlS8MqhbctXkX7KVMlaIS8DRY4ro7kSi6xHbb+kv4xvTi9StDAhxwRkaGjOyHxaZ0HXkToUFbKn0dXAkFQFeQxFnkT1yNUxQ0MnMjfM6aURrf5Idm+7S2TByXZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751214225; c=relaxed/simple;
	bh=JqfaalQqRJu0oypmymEvV6QArJyNK8a8hndEAk5F8Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2JEDuSiE3vOFIKKMd6oUb+U0hAAiSZXacaP5wZ0RAyn6VBwke62gWG5HVedeZF1nOdOCO7eM9tmkbL/9/SLhQyuQcDQlYcvpSNrckea/xsujqwskK7rjKEWzs94QKc6IOhxh2tV4D7R6IMrTp0ApsfjDfTfscrjaiXrvUdu9CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPbKZDNs; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPbKZDNs"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecf99dd567so22450066d6.0
        for <imx@lists.linux.dev>; Sun, 29 Jun 2025 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751214223; x=1751819023; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NfieMz5m9Z2E/riszCvxx0vxjw0boZDSxhpy/iJ0gcc=;
        b=OPbKZDNsBPXR8Iy1zpjPiMXPJC9EwADmgblCOEUMYKSzlNFz2/dkkl+qBsnAoFFxpz
         byd5le/V2YxtFe8JfAjXnCSxEP8SAAiULQVVXPxC03v8ApuRC41GjYOyXmGs0Buw/hjd
         l/IVzl0N0kTczdSNIKOk5O0T2iYuvXb4l57OpjMGHSo3COGwTDpO8gIABIM1TPM5Xc7I
         t+ciqg7CLpOIgDYxUeG5fGNwZtZc+kdJJrXFG+A41iayAw5IEWdrymQNnw3kFeA6nqjL
         1zD8oEYqLVccqYxHkt6ZR6VWknhL6y/pEVTfqpwbHS4PXZIXScwYlkUvfV/t0jblZmqR
         jnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751214223; x=1751819023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfieMz5m9Z2E/riszCvxx0vxjw0boZDSxhpy/iJ0gcc=;
        b=Cv1+stWcZmP2dxvr/rmBFyMdb7qPOPMwiu+wUkA/H5tU/AD7Trp7F+w7zz26XpOF3u
         pBf8zQHh3p6MyTZBc3jVdliz/iieTH/0Z9xbSH3J3QIjMWGP1YR9Zzs5OnhAU0AJX/Vj
         G+UKpbegnYqZERLNzZYIjkxgLsHSVrz/ouV2rG3e0CvtZeDix4XsUrqi9sNeN1j60jR0
         8EyTD3FSsGawDF7BdoHB+aeHIMV+Ro19Um++5LWoqJYr9APlqMwB5jtApZX+QbdLUL2x
         JaYK1hvwo150VoJ2mERRjpFnlInp4fwsXPEi6MtiOoAAVJG9w3Ai0uRmCLPX26bPMGnG
         BqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyr+yjcLhqwdCk+MXOW2DPrXRKH3sOUF1JNQmPPlflIYVnqYqlq+7E7qW0VgRTpXsyVmo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrl5kzqhB1VFJqao0dIkWSuFCX82bhbbByR+amwb5zhItLdI3d
	jJyg5T4LqY8/6+LeS+9HE2262Lby3+Xmx4JUHfUguWbNd1AXmea1vw9R
X-Gm-Gg: ASbGncvCk+f+bTLbS/nut3AjrVr3MrKq8cSoDo/20k7qFVdaKXxH43VEgOk8sqOefhH
	t4Iq04+iTw08ehFa5lE2WB705lVT3FS4GKn6CbjSUQJKvxvMuQxUR7lKXML1ckRLDrgl9G2nNB4
	29RIh59w7KRTLJMMBqUdSJVf4GeYbZ0UeYjablphjzC4x5onU3/iHd3V+b8FKV2OVNIEVCr0G8m
	qaOPqe1MplPOlc8vKtdCl6Nn9m/gLhYo5aK60EmsH3ExZiOYqR7m+JCW7PH49Xwu3p6uAgPpaOw
	7/1A5tG+fxz++ht4xABCqSxD7DnRi2H4ONgiz+LgYrubsqodCaaF3tA+RVR/
X-Google-Smtp-Source: AGHT+IESfg0oyaXsV4gGFWt99icXqEwyys8YI4taj0L64tG5xEmVRuFGmG2zMdbH9gxzpEcZWddl/Q==
X-Received: by 2002:ad4:5aaf:0:b0:6fa:d8bb:294c with SMTP id 6a1803df08f44-70002deaefamr184709886d6.14.1751214222731;
        Sun, 29 Jun 2025 09:23:42 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e7301sm53047806d6.62.2025.06.29.09.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 09:23:42 -0700 (PDT)
Date: Sun, 29 Jun 2025 13:23:36 -0300
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
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <20250629162336.tazeqojyhtgnecmw@hiagonb>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
 <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
 <20250627144955.tbmk6ako3rgv3djo@hiagonb>
 <CANLsYkz3SD1PPnVwoBnnKhyCUig67o+=NgoDucq5m+4sQ=xMYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkz3SD1PPnVwoBnnKhyCUig67o+=NgoDucq5m+4sQ=xMYQ@mail.gmail.com>

On Fri, Jun 27, 2025 at 09:40:27AM -0600, Mathieu Poirier wrote:
> On Fri, 27 Jun 2025 at 08:50, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > On Fri, Jun 27, 2025 at 08:31:20AM -0600, Mathieu Poirier wrote:
> > > On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > >
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > This patch series depends on Ulf's patches that are currently under
> > > > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > > > Without them, this series is not going to work.
> > > >
> > >
> > > I thought we agreed to repost when the feature referred to above and
> > > the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
> > > to do with this patchset.
> >
> > Sorry Mathieu, my goal was to update the whole patch series with your
> > reviews from v5 so you could take a look and then I would resend
> > everything again once the others have been merged.
> >
> 
> Ok, I'll take a look next week.

Thanks, I will be sending v7 with the missing reviewed-by then.

Best regards,
Hiago.

> 
> > If you prefer I can wait for the other patches to be merged and then
> > send the next v7 corrected.
> >
> > Best regards,
> > Hiago.
> >
> > >
> > > > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > > > started by the bootloader and the M core and A core are in the same
> > > > partition, the driver is not capable to detect the remote core and
> > > > report the correct state of it.
> > > >
> > > > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > > > returns the power status of a given power domain (M core power domains
> > > > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > > > already powered on, the driver will attach to it.
> > > >
> > > > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > > > return before dev_clk_get() is called, as it currently generates an SCU
> > > > fault reset if the remote core is already running and the kernel tries
> > > > to enable the clock again. These changes are a follow up from a v1 sent
> > > > to imx_rproc [2] and from a reported regression [3].
> > > >
> > > > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > > > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > > > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> > > >
> > > > v6:
> > > > - Added "reviewed by" from Ulf and Bjorn.
> > > > - Fixed and improved commit descriptions of patches 2 and 3.
> > > > - Improved the comment inside imx_rproc.c file.
> > > > v5:
> > > > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > > > v4:
> > > > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > > > v3:
> > > > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > > > v2:
> > > > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > > > v1:
> > > > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> > > >
> > > > Hiago De Franco (3):
> > > >   pmdomain: core: introduce dev_pm_genpd_is_on()
> > > >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> > > >     SCU
> > > >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> > > >
> > > >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> > > >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> > > >  include/linux/pm_domain.h      |  6 +++++
> > > >  3 files changed, 73 insertions(+), 7 deletions(-)
> > > >
> > > > --
> > > > 2.39.5
> > > >
