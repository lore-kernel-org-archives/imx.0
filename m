Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4F428F51B
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 19:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752695412; cv=none; b=IjR69ooeikm/U3IaNh4Ofg/O0orVoGFh3cbnbSEewJU4zgnlgb6xil11ho83gr8/Ep9h3jgd372Ns33o1GDBHvygsmm4pxCanG2eRD0OtdRB85XOJIO9ayqgmdxQxU7z85KpS7yVxCmmcsZRR+Np1x7tcQhAzcwm1Uqs8PfDp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752695412; c=relaxed/simple;
	bh=SsZPmiVgiEbGyuQvV/yeqg4poe+PgKXSBFskoQzwdAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avfTvxWILyuRDXAr/t+iLUrQj/ihSu9BxMYh0TGBPJMvpVBdqX4S0HKcTSfkB5R7xldBQNlmpMeL1Vsrin5BTKzF9V+kNTi3PDr5nPWVYSZe8pyQfk1ihcvMl+qT18TAdphdIIbaCeJROIiS1LNsbUyzkK3lEnRA7O0f9WBp3Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MX2wfTLw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MX2wfTLw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b31d578e774so1011227a12.1
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 12:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752695410; x=1753300210; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZZgzA7unxaQYTpUKeT3tiFqc0eDBxi7N6aA9SCTkxo=;
        b=MX2wfTLw8vSTqKfJ57gcjRON97k5KDFimMMpkwOXzSnzBBc8Fm0FQ9mgDRNDJ8ewAk
         fB67QXpjIjkoUjDDfyIcauOunjz03wavbnqF0R3Lm1XlMwL04nrOi7OMTHw737QA73Ow
         ePQEPExwgEVgGjme8tjdF87C52SdJXdNqFzia37fNSYEefgyPVHQdSIx8RJs5J6Sh/vf
         mnWD7us62y5Mq1U3snn+sajJGk8ve7myHT1a/CnDdKmZSTWIhYr2yCkWS8uPpQt0SeKL
         3EBmJaa++TBFAT0o/gihe2Qehy9lVOyeer8PyG0RSVS5Bv90iRoQkvDAvziWFjtO303D
         LUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752695410; x=1753300210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZZgzA7unxaQYTpUKeT3tiFqc0eDBxi7N6aA9SCTkxo=;
        b=GV81Dhc5v296bEf46cORmQd38FOPLG8BFx2MONN66HQ4m+JCjVfuYZ0D25+LdN39UR
         BpF9jq8IzHZDj01AE6nup4VRsQ0JK8jD07+a3r1r79g8jXig6b6/u8Vvci3MWiHqoDw1
         DbyWJCr0Zp+EpuUxEf6RZl1FkvM+OE3PxvLHdzxFa1WPGTK163cIRMtfq8rNnr5eIAMm
         KTYElnGTekI08DB1frAneU7okn6pLhatB4ZSNExxUS/TYLWOeunt/voYRM4/hJTwUg2a
         caO7GnekLYPs+JzFfOKMq6/BpDV1KcQhFasv6TWR1dcMuKAkE4XRnYG7QABLUuhTNdDl
         nEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDpIqdDSAqjS0YjjEJxN21DuOMNiW56tjPz2xk54V7eMsf6g4rM40B5ZxAAMHPx+GpF9o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGULOZJkiZTjuyPCtgsqgPQJVBVGLljvDBk2AtBP8EzrUtdVo0
	ShRdXVvni2MmR1TIFc4zXwHk6+W6sDSrSOXMhTnm+0VATW+/88n5hea9gDIe6URu
X-Gm-Gg: ASbGncsyIHoUASvfyluLNWR5P7nIVWE2Sn7EHP9bC6ndogh6AqK0xfAPZfqVC6xkGGf
	qxm34Fd2FgtLX6I0EKuHz4d6GSqZK+0L2h2LxEt9QUeTqjS4Wx61Y64EyA7dnzV8D7YncTWfYQY
	xC7vF3xrgBKBabk64gVbDUR0GftHpFrFXTJwBdFvQZ+3w2W7nm5eVK2btg1FejNCNIEPfXiSFB+
	mQO+0hyHBdD8kCOtQmzFFnecoiVkvjw1EDYSm1Nsy5yl5kDJHylHCW1X+kL3lHda/nGyAMhiDuH
	MNp67CBENXqPhI9mwqnDHWo0YlBwhHHFYGgEutYEkmXPiH2uX055sdLF1Dwc8XEtf1EJeaEx1Mv
	9eaYdKPV91FAjBUqdpO4=
X-Google-Smtp-Source: AGHT+IGkORjHEJ3lwLi+FibgkhUKI9Xi/FApJrENFdLLcxtfYU8HO8fS+q0sfAOpe3IeYIpcVRS1Jw==
X-Received: by 2002:a17:90b:3d81:b0:312:e73e:cded with SMTP id 98e67ed59e1d1-31caea21526mr783583a91.16.1752695410205;
        Wed, 16 Jul 2025 12:50:10 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1e684csm1947200a91.12.2025.07.16.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:50:09 -0700 (PDT)
Date: Wed, 16 Jul 2025 16:50:03 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <20250716195003.5kunymu3nrdsfnz2@hiagonb>
References: <aHZ0nK4ZZShAr6Xz@p14s>
 <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
 <20250716132552.bra37ucw4fcjwril@hiagonb>
 <aHfYQFvkJcdfq9K_@p14s>
 <20250716172308.lzh3aak24d6mt4cs@hiagonb>
 <CAPDyKFr8eYiyj5s7wGsru8GJ+CS6h-o+a+BOV-nvCdSzWM0bSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFr8eYiyj5s7wGsru8GJ+CS6h-o+a+BOV-nvCdSzWM0bSw@mail.gmail.com>

On Wed, Jul 16, 2025 at 08:56:37PM +0200, Ulf Hansson wrote:
> On Wed, 16 Jul 2025 at 19:23, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > On Wed, Jul 16, 2025 at 10:50:08AM -0600, Mathieu Poirier wrote:
> > > On Wed, Jul 16, 2025 at 10:25:52AM -0300, Hiago De Franco wrote:
> > > > Hi Mathieu, Ulf,
> > > >
> > > > On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
> > > > > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > > >
> > > > > > When the Cortex-M remote core is started and already running before
> > > > > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > > > > bootaux), the current driver is unable to attach to it. This is because
> > > > > > the driver only checks for remote cores running in different SCFW
> > > > > > partitions. However in this case, the M-core is in the same partition as
> > > > > > Linux and is already powered up and running by the bootloader.
> > > > > >
> > > > > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > > > > M-core's power domains are already on. If all power domain devices are
> > > > > > on, the driver assumes the M-core is running and proceed to attach to
> > > > > > it.
> > > > > >
> > > > > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > > > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > > > > consumer of the power domain provider without changing its current
> > > > > > state.
> > > > > >
> > > > > > During probe, also enable and sync the device runtime PM to make sure
> > > > > > the power domains are correctly managed when the core is controlled by
> > > > > > the kernel.
> > > > > >
> > > > > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > ---
> > > > > > v6 -> v7:
> > > > > >  - Added Peng reviewed-by.
> > > > > > v5 -> v6:
> > > > > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > > > > >    by. Comment on imx-rproc.c improved.
> > > > > > v4 -> v5:
> > > > > >  - pm_runtime_get_sync() removed in favor of
> > > > > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > > > > >    this function.
> > > > > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > > > > >    function.
> > > > > > v3 -> v4:
> > > > > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > > > > >    suggested by Ulf. This will now get the power status of the two
> > > > > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > > > > >    not. In order to do that, pm_runtime_enable() and
> > > > > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > > > > v2 -> v3:
> > > > > >  - Unchanged.
> > > > > > v1 -> v2:
> > > > > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > > >    suggested.
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > > > > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > > index 627e57a88db2..24597b60c5b0 100644
> > > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > > @@ -18,6 +18,7 @@
> > > > > >  #include <linux/of_reserved_mem.h>
> > > > > >  #include <linux/platform_device.h>
> > > > > >  #include <linux/pm_domain.h>
> > > > > > +#include <linux/pm_runtime.h>
> > > > > >  #include <linux/reboot.h>
> > > > > >  #include <linux/regmap.h>
> > > > > >  #include <linux/remoteproc.h>
> > > > > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > > > > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > > >  {
> > > > > >         struct device *dev = priv->dev;
> > > > > > -       int ret;
> > > > > > -       struct dev_pm_domain_attach_data pd_data = {
> > > > > > -               .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > > > -       };
> > > > > > +       int ret, i;
> > > > > > +       bool detached = true;
> > > > > >
> > > > > >         /*
> > > > > >          * If there is only one power-domain entry, the platform driver framework
> > > > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > > >         if (dev->pm_domain)
> > > > > >                 return 0;
> > > > > >
> > > > > > -       ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > > > +       ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > > > +       /*
> > > > > > +        * If all the power domain devices are already turned on, the remote
> > > > > > +        * core is already powered up and running when the kernel booted (e.g.,
> > > > > > +        * started by U-Boot's bootaux command). In this case attach to it.
> > > > > > +        */
> > > > > > +       for (i = 0; i < ret; i++) {
> > > > > > +               if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > > > +                       detached = false;
> > > > > > +                       break;
> > > > > > +               }
> > > > > > +       }
> > > > >
> > > > > I was doing one final review of this work when I noticed the return code for
> > > > > dev_pm_domain_attach_list() is never checked for error.
> > > >
> > > > As Ulf pointed out, the 'return' a few lines below will return the
> > > > negative value to the caller of 'imx_rproc_attach_pd', which ultimately
> > > > will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.
> > > >
> > > > Please notice that even tough 'dev_pm_domain_attach_list' fails, the
> > > > rproc->state will still be set as RPROC_DETACHED because we are starting
> > > > 'detached' as true, but I am not seeing this as an issue because as
> > > > mentioned above the probe will fail anyway. Please let me know if you
> > > > see this as an issue.
> > >
> > > Two things to consider here:
> > >
> > > (1) It is only a matter of time before someone with a cleaver coccinelle script
> > > sends me a patch that adds the missing error check.
> > >
> > > (2) I think that @rproc->state being changed on error conditions is a bug
> > > waiting to happen.  This kind of implicit error handling is difficult to
> > > maintain and even more difficult for people to make enhancements to the driver.
> > >
> > > Adding a simple error check will make sure neither of the above will happen.  It
> > > is a simple change and we are at rc6 - this work can still go in the merge
> > > window.
> >
> > Sure, I can submit a new revision with this error check. Sorry I did not
> > see this before, I only had a close look at this '->state' now that you
> > asked on the previous email.
> 
> Alright. To avoid having you to resend patch1 and patch2 I have
> applied them on my next branch and added Mathieu's ack for patch2.
> 
> Note that my vacation is around the corner, so if you want patch3 for
> v6.17 you better be quick. :-)

Thanks Ulf, as requested I resend only patch 3.

https://lore.kernel.org/all/20250716194638.113115-1-hiagofranco@gmail.com/

Have a nice vacation =)

Best Regards,

Hiago.

> 
> [...]
> 
> Thanks and kind regards
> Uffe
