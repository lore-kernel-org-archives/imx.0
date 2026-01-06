Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428F83314A9
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706141; cv=none; b=WvGJQ2EpLelhwvwod0DFuFS5iQcFpyGuUH4Z1JhZmIN0Ku2BGHEaLcxkUENiFKAuIuAClRK31doOvdJxHQQZ9vgAQGF3m9sDBvZQkqieZKzYLM2gshnmuGCGZCgcRKyikg/djwvS/p6OrjP3RaDpfmpJQwRQGh///6ps9AsWWqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706141; c=relaxed/simple;
	bh=1P1MLHblIEblLscCyAsxLjS0olkfH791KSwC5KO7UyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arePji9cTCfum49CaOPGcQhtkdasbAPE2as6ICulxiXLPwrA8ydSSgvld3DMXFBFW+SeDdecai50nBgavgJoGVcMaTmInpIwv5bkac2ma7wc1JH8nyFdfEc+oKKXwIQaptNKa59WeJ/GqPgRRQo7nGAuum9gSPNvTQM4HHQoUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bpb6GnqK; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bpb6GnqK"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-598f81d090cso1008119e87.2
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 05:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767706136; x=1768310936; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P1MLHblIEblLscCyAsxLjS0olkfH791KSwC5KO7UyE=;
        b=Bpb6GnqKyk8thUolkXeErtcTMUFZ+sEknhfs6zZ5vfPvhiJ2Uh+VCyXoxKp5lwtADk
         lV/6GWxSgiRgIWQNqxwjdVaAUNFGUGmwOJlOq35rui48zWCghp4R2i9RdnQmuPSHKegq
         kuf6M7Mqyqu03CHsbfFqeyHfS8FNSvW7DSXVKR5kO1CwrVidKW1lu5L/aLqlAxPBYn+G
         DxbXht8qtl9jgT2QjsCxJAxXw8oB0GIReRf7Cpm2hMNDGIcgGRWYNBgdC+PsRHxb7cp/
         uX0KRuUxA43wlHNSxdRAewNO0YId1eJsomC/oF6KrfiDKXuLHcSi5yC/QU25tSlyduo/
         zk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706136; x=1768310936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1P1MLHblIEblLscCyAsxLjS0olkfH791KSwC5KO7UyE=;
        b=Q2i2LH8Dmj2aI8FhQws4DvTGumSB2f1aB5U6u0xIIwMVVLaICMSxcZPoyIVOtNzDAi
         26St0kzPLsLlwJCRsFlgk5b4k5+/9MkmkkcRUDmaBWt2peG1SQ7NQUo2bEDu4BWMFhhh
         eca2uqEfCsoO5lo3+GeDIiKFq9DSp5rKkIIkEt4Sa+yqYoDWq4Imn/5VC5IKtjf67arq
         1/pjMEFH6TONkANbPTBD7Tv+KzXsMXcJheIFXJrv3Mo9d0xuLmGuQEIGSkomI2f4grlK
         tXLB46lHSwfkgaFJOumxEqeRpka6u5CIASgL+OZYLPz/CFvnubAVR8X3st0Ca0Z/P8VW
         Dp6A==
X-Forwarded-Encrypted: i=1; AJvYcCXIN//2GkIieBEaoocZsgpdDGrFTh9rt/GBValgzYa+NnWnglvBTwK0UFqS584RRJ9roUc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfeAni03OvlJL5xFKmq2lQzcys9XPFCR9ExivvJF1XUVoUpORp
	5t99ZbSnniBtyO1oh2mWXKm22xp3zdYi3P36p0zcqELsehziwiZCp1EeOqGX9GEJwyBGG6B/2R3
	lWVlSwhX8BVVrfXw4Mg/7FYxNYFWDro4XNClISD9q7w==
X-Gm-Gg: AY/fxX79uUyB3iS0dqvXSKQhziudtgAbjcIDp4G2/Tg2CbcVSBHFV3dVo2p95YFIAr+
	vIPulQPpd8n9ULViXj1RXyupqPt1XSe19B9CUrt9ancFWJo+pCH4SVFhptxgt9xl+/6Bkp/yLis
	n1//kkiSSQ9P5Qt16ytwBDF8htWteSZcNK7vFuM2vavTqvqOfk0aMWcgG90Pv/108p0oCRyLWI+
	hNSMkhzF2ScZvL0DuOECTypGM+N9yUjhpX0M/5ZlRpwdF/BRSSzqEHj+uaT44sJFaWsfyo=
X-Google-Smtp-Source: AGHT+IHkKfseNVlbexy7OYWanrOUhCQ9xbT4x6amCXeiCeHgnckAsxqlsczo+X6SDJmlQDkKr5zQ1Uvoi6Pw/dvfyTY=
X-Received: by 2002:a05:6512:688:b0:595:7854:af77 with SMTP id
 2adb3069b0e04-59b65225f3amr1166436e87.22.1767706136101; Tue, 06 Jan 2026
 05:28:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com> <20251205015428.643-2-ming.qian@oss.nxp.com>
 <CAPDyKFpt-GL-RFcJ5mTWFqaRfy1dQJ7LL8OBCoQK0+zPDFEzsg@mail.gmail.com> <16eb88083b68e3701f22799d8ccc20b800b59d61.camel@ndufresne.ca>
In-Reply-To: <16eb88083b68e3701f22799d8ccc20b800b59d61.camel@ndufresne.ca>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 6 Jan 2026 14:28:19 +0100
X-Gm-Features: AQt7F2rDAkeOIKvNG1n_1ix69cFZ19Y_sfdt-a0UsEok8udvX69D57IFSE6PaYY
Message-ID: <CAPDyKFrWx3FwNDAzYrsQTaoZtmaM+bnx=Q7c5vxjntv4L06BiQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: v4l2-mem2mem: Add a kref to the
 v4l2_m2m_dev structure
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: ming.qian@oss.nxp.com, linux-media@vger.kernel.org, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Jan 2026 at 19:08, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi,
>
> Le mardi 30 d=C3=A9cembre 2025 =C3=A0 14:39 +0100, Ulf Hansson a =C3=A9cr=
it :
> > On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
> > >
> > > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > >
> > > Adding a reference count to the v4l2_m2m_dev structure allow safely
> > > sharing it across multiple hardware nodes. This can be used to preven=
t
> > > running jobs concurrently on m2m cores that have some internal resour=
ce
> > > sharing.
> > >
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> >
> > I certainly don't have the complete picture for how this needs to work.
> >
> > However, I was thinking that rather than using a kref and having to
> > share two specific functions to update it (v4l2_m2m_get|put), couldn't
> > we just use a device-link instead?
>
> The device link seems to be intended for power management, I'm effectivel=
y not
> familiar with it, so thanks for the information. However, my impression i=
s that
> this is indented to describe power management dependencies on siblings, b=
ut this
> was done differently on this SoC (way before my time here), the DT seems =
to
> describe a block controller which is common to the two (defective) cores.=
 So
> power management wise, its already handled.
>
> Be aware that my intent is to rename v4l2_m2m_dev into v4l2_m2m_sched. It=
s not a
> dev wrapper, but a helper object that will schedule work coming from N
> v4l2_m2m_ctx (per open() calls). Making this helper object ref counted ma=
kes the
> live-time management a lot simpler, and since its not a dev wrapper, this=
 patch
> is not creating a second refcount for the same object.

Okay, fair enough. No objections from my side,

[...]

Kind regards
Uffe
