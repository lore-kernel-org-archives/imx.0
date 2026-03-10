Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8376313277
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155336; cv=none; b=T+HFZA0KVzRmSOZIDD14BLydksKMUQkKK5SzL0Y8gJt/dyt81odZNzuKGiFUq99BAgz0/vLVv4b3E2b3BIZpN8xSwvCiKjvJTTO1x695G7+dVWRMjxlyHrUV9QOo+uqkXol4jYM+WpZU5i9ExkD+AnlcBzqv4hgGKBqML/HTkGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155336; c=relaxed/simple;
	bh=l66roiogcZuRuWdg/BN7GAGFpuk8qIZkWg5A5bU5kEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ma/+SRuXcJCcvBaBPbxhbAedxQL84Zczru6xvxgZP/MWYSiYqXanN7jeVGsfV162KRxtvbgwtNJcPGIQ5lNBcYOZhogUp1k0yIC784SMPpP2zWaxFQO5fFwkfOu1119ol7h0Vz2NRBvtq9iIeDjxiHXff+lNqcmE9ZalzeidRlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mBd7LwoE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mBd7LwoE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-660dcafc85aso11979388a12.0
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773155332; x=1773760132; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=mBd7LwoEF4snhyvKh1ExDjCiOa9eoZG6OaC2Q70kU5d+8XaSpWcbAiwS2RLrEj5Acp
         Qy+E7GBQSJgOnLinN5FsbcExzrXBOp7DtGrqixkkn6wlHM2poDrmrNFCij9IxKVYuA84
         oxP/2w6+5ShlXGwzIn24+HBd7i62IkQ6scZdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155332; x=1773760132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=J2yOCKAYfs5GyLJorOfxmVDuUG8Phw2QaY6Kb0EQIq9jDZKlr6eeS66BxjCJWKgGNn
         J+igcQw+CVcIoqKlceR/2gpidVzcTbeDYyO8UGG6hQjjpXFLIjyIoK+hAUArwEKp2hP/
         fwbrSPNOwpxSIx/pIC4EdYet7n9cwG3/48wbWKLH4pxhY9rVTq/9zVKQifsS8qt5g84F
         Yw+KMYLbkRW1gtnXX7Qx7f2rpag0/vIORpa3VGJf9rD6kGeFTpV3mdAn1X3my8s7pjX6
         0feKZ/aUUoK3VPcXLLGoY1qlc6AuWLA9i3BbrnbkZggXoLqmLQ/EbwaYZebeqgpQwijv
         03SQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+CkOWChxQYcH/1lsIAwepE5a7M9rCJw2YYw2o+nwbHuGej5/DutZcEdGB2Kpa7w3nDUI=@lists.linux.dev
X-Gm-Message-State: AOJu0YysTZCPH4JAApem6ClH5JeCpgg4BYLgiIbF0bDH04nTLovqQ1yz
	C/hLlC5ajqcEvpg+PddFx7r6k6mNRb13xx0VtupUU2vFnRKO2dEycPtEyPC69WXBtxVs9OCJtEP
	Y2iJO3xFi
X-Gm-Gg: ATEYQzyC8V4wtxoRdAS+QJz3o6MD+WSaYgF8I2TEP5JM9njjrce2AhFhdFc2RH81L6V
	Od2bWtwbc9xyYUFlUXF+7Q5dKsGihpYfpjJ6Wyq5PNGFuna2tDqQV4FooNKaLiYmT10ki3cyW/P
	OezXO2OY5FmDrQSDYXLpyDd+Sqa0m0I8hLdWLIKKjjvkYmfyRoNYazUaOwM8irUl0cSuG+jYiby
	guU0Ue76rLgp3cuP5ulJanSoND6xoewjEkdXIDkTsR28UBQxM3To7ZD4450M6kGfC48tp+4tIjy
	N68pSk89Od8fHvdLzF/xXpOfhWYpn2M/4JPI1yW94wcrIn2RxYtuP9Ju9r6bV68V2W7qiHcvDch
	uFRawfZDdhdXjLCrx371uNLuezsCUuMF6MT1+RAMb+MK4vNbXRvPzKIQCjVNCmutyTxp/0xBpF0
	yQ4YJX4EF4riz9D546htZtcuecH0HeTNJVxSamOiIISjQhG2KHrW6wBJumsjWfEpl1HqK3Ah6n
X-Received: by 2002:a05:6402:27d3:b0:64b:5562:c8f4 with SMTP id 4fb4d7f45d1cf-6619d49a0e9mr8316020a12.7.1773155331774;
        Tue, 10 Mar 2026 08:08:51 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-662a07022ebsm1575701a12.3.2026.03.10.08.08.50
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:08:50 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so14292325e9.0
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 08:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDiXgtfy67Wq4rmLiQSmraHCu2iRbim+0Y7VPmrdOjQE9qut1JM21OidpwmYnDO6q5yvQ=@lists.linux.dev
X-Received: by 2002:a05:600c:1d04:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-48526983292mr236479455e9.34.1773155329681; Tue, 10 Mar 2026
 08:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
 <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid> <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
In-Reply-To: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 08:08:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
X-Gm-Features: AaiRm51YHmAMmjPRIWQTSvpfsMBkAMaTT684zHe2XNjk21TEkEMaZPx6RHcKG9o
Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 9, 2026 at 8:24=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Doug,
>
> On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> > @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void=
 *mssg)
> >         if (!chan || !chan->cl)
> >                 return -EINVAL;
> >
> > +       /*
> > +        * The mailbox core gets confused when mbox_send_message() is c=
alled
> > +        * with NULL messages since the code directly stores messages i=
n
> > +        * `active_req` and assumes that a NULL `active_req` means no r=
equest
> > +        * is active. This causes the core to call the mailbox controll=
er a
> > +        * second time even if the previous message hasn't finished and=
 also
> > +        * means the client's tx_done() callback will never be called. =
However,
> > +        * clients historically passed NULL anyway. Deprecate passing N=
ULL
> > +        * here by adding a warning.
> > +        *
> > +        * Clients who don't have a message should switch to using
> > +        * mbox_ring_doorbell(), which explicitly documents the immedia=
te
> > +        * sending of doorbells, the lack of txdone, and what happens i=
f you
> > +        * mix doorbells and normal messages.
> > +        *
> > +        * TODO: when it's certain that all clients have transitioned, =
consider
> > +        * changing this to return -EINVAL.
> > +        */
> > +       if (!mssg)
> > +               dev_warn_once(chan->mbox->dev,
> > +                             "NULL mbox messages are deprecated; use m=
box_ring_doorbell\n");
> > +
> Does this patchset leave some such clients out?  If not, should we
> drop this block and return -EINVAL already?

This patchset series got all the clients that were in mainline at the
time I last checked. However, it was unclear to me if all the patches
would all go through your tree or not, since they don't touch mailbox
drivers but the somewhat widespread places that were clients of
mailbox.

If all the patches aren't going through your tree, we'll need to keep
it like this until we can confirm all of the clients have been
updated. If all the patcheds are going through your tree, then we
could make it return -EINVAL right away, but it we'd have to do that
as a last patch in the series. I think it would still make sense for
the first patch (which adds the mbox_ring_doorbell() call) to have a
warning like this and then a final patch to switch to -EINVAL. That
keeps things bisectable.

What do you think?

I'm happy to post a patch atop my series that switches it to -EINVAL
and you can land it whenever you see fit. Would that work?

-Doug
