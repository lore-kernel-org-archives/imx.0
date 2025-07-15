Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88492DAFB9
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752580221; cv=none; b=bOr49oOkuSL9vMcH7v+k4piK/EDABwkqbHgNYT97k8J5lJjrK4gHsx+zJjq8JN8JH58id+mG0luMFjndj8erm5KMZ9SNsDrJqS/0eWkdimq4PdVVWyMP5CyP/o/C8z7tyH9HnhYEZXz1fIG/5vIux/wmob7HwllloNwsZ10W5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752580221; c=relaxed/simple;
	bh=QNcCDmqQ5Df7rSq9TtFAWYVAUpPVzmHMgnOLyE7lX6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0oFdGWos3KB42wr+dhbX/2M36ocdqFAr8CJ21w3TW39SJP5ZTolC5oW9OKqzbg0Z+x6lX+qI8O7SsrixisusuV9CGW4Grj/ar1j/Dujqx9J8tvSttWwo1NN7n4BqhSeETa9KN50NgWpR+mgJqxmf4q6ctjiuUnMH24Qga/Ipa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=luRzSdH3; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="luRzSdH3"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-711a3dda147so57229167b3.2
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752580219; x=1753185019; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4wNySUjatYeI6OvV2zA4z/a1VqMlHoZrAYnvby/JKWM=;
        b=luRzSdH3wbK3UJjU8b8aIovM4Z8sXWRm96XRyHcDZB6KBuGAqISxD3xIVQkk0Us+70
         64N2pP1vGLZVx6NLGgdoDfwvDBtrLMXZLM2DnigVEmdewhEeo/ZGaFjsve2qRfvEDVYQ
         oaVRxu+OByMKZr2SsfVzNaz05yIY/b7RQ1NmCTAqdXL6I3Ss3KzQwj/7le0NveUXPPbr
         /M/peIJIGqkRXYDUGqhwNfs8BT73AQ3IpbX+0RKmKxkTdY0QC+AAlt8CZXbMIddYgV6n
         RIDNGWZNhOVzNn/FIvzDKl5GvQcW3UzKCweN5vtsuhcoq2Qk4SJuABcw2ZYILifDvPrO
         MgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752580219; x=1753185019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4wNySUjatYeI6OvV2zA4z/a1VqMlHoZrAYnvby/JKWM=;
        b=ieeEiHrNbBMor2dD6c2mdvG5LITgnr4qr31OjNZ5mq0FEB+QdY8EzmKXD6R0SBNCA+
         Wwkkj8mU7S7PqC8gH+GIqCpokBqjWuiTnGRs10NTejyMxc49g/K9fgsOhBIxn9o/+k3o
         UMJEf22nlH98gVWhilnarQLbdA9K++CMTTp8NPc+GE2puHeO/o1x+BY2CALJOsXUC0xg
         qbf8x4m80TuEg7r16BXuczgD9ZvWeRZbIzbVa69vdV88MXLGfNEdBfN3w6VhPEjGBC9N
         is18+n4zv8mxxLa9zUTikUggUa5LsoQiqYvkc8vvAamI6ik10kOAWGVYjolGTj38F9Qx
         +6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV7EXqDW3aE0Bq36dng0VF7OINSlUOV/ilT2wPfGBpliuy0N8t9yEoDdKBlMkObqEHjtbM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8Nyw+fD3rfDbvXa0L+BN7OTJ7iTyBJlp1GDQvXVOOqOklRmc6
	DyMTSPv58VkyR8B3269V7LLLH/e8NZWhQH8XJb1VHLtfjpXLpr41GNOztUru6+AJhbBARwtmzTr
	mwiRpX5gID+YLyp1EIR9agTnwk2s9AtNrTUZo2Vg13Q==
X-Gm-Gg: ASbGncuEUZOi7ifz+HodPCmnCAZZ7P4yLMILsoYJ+iKkoCdrqrFRy9N3KKPHunZ6UHU
	1pPiw+6AUybhJP7FHY89aljlOPN+MlbQi/IjPQv3+aGoOGPqrRIz1jtI7cOwfW2+4VR3NNCf0bw
	z4KLssK14M7FH11oGG6sd/M4Aqgzjs/G2ZPnIifsZm3NaACi4SlDxx54C0Wl1VPtNC3TBfVd/el
	eCKPV6X
X-Google-Smtp-Source: AGHT+IF/K38yeveYq70L/mHAPtfjeL+GIee4NoKApQPc4/AmworpqftrKbu0K7Q7h4oLInJZL2btkmXzEuBJtreqbG4=
X-Received: by 2002:a05:690c:7483:b0:716:3dc5:a35f with SMTP id
 00721157ae682-717d5e94ad5mr256657057b3.19.1752580218628; Tue, 15 Jul 2025
 04:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250629172512.14857-1-hiagofranco@gmail.com> <aGazjaJQXl03HUJE@p14s>
In-Reply-To: <aGazjaJQXl03HUJE@p14s>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 13:49:42 +0200
X-Gm-Features: Ac12FXwJ5N_wrB84X7RLvjAxpSUj8wCAKwcHpPhNOwV7kx7yjVIlAOOax7yXEA4
Message-ID: <CAPDyKFpUF+S8EqVsHct7TFZGupq71Bu7eL3t2Sr=ibhZ518nsQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Hiago De Franco <hiagofranco@gmail.com>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mathieu,

On Thu, 3 Jul 2025 at 18:45, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>
> Hi Hiago,
>
> Many thanks for re-working the changelog and comments in this patchset, things
> are much clearer now.
>
> Thanks,
> Mathieu
>
> On Sun, Jun 29, 2025 at 02:25:09PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This patch series depends on Ulf's patches that are currently under
> > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > Without them, this series is not going to work.

The series above have been queued for v6.17 in my pmdomain tree.

Do I have your ack to pick $subject series via my pmdomain tree for
v6.17 too or do you think it's better to postpone to v6.18?

Kind regards
Uffe

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
> > v7:
> > - Added Peng reviewed-by.
> > v6:
> > - https://lore.kernel.org/all/20250626215911.5992-1-hiagofranco@gmail.com/
> > v5:
> > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > v4:
> > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > v3:
> > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > v2:
> > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
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
