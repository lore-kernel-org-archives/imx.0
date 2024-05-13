Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB1F1474C7
	for <imx@lists.linux.dev>; Mon, 13 May 2024 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715589665; cv=none; b=YQ1U7lsFoXh0/XQtNLmV8dW5E64fbek+emmYplrzKZbE6KxFDYxX1ec4Pxx9d1K5vdinukyik3QHKmhsdpbD1U4/vAeu52Kome3qHkLqXs9eXz0suw9Ew0WZEWdDmIdli6hN6tc20Z3YuikbglrO7EdmDqfJO8whNIZStDZGeT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715589665; c=relaxed/simple;
	bh=6Qe+Z4SzpwQnD/xZduFUuZ+qeUgZmflyk3fkh5lZ93s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frPRkGF8iESbjb6hNcUu7ZddX573+9PPTWLUfRdmjH5jruMfSFr5tndxDQjBBkDzsPYi1zRSnfky2y3FV/ovgo+Td2XPKp3sZEWk4Y3ZQnDKLCbdid1dcsX0cCX7gbtKOgum9Wxnnj9Kz/WA94BG/s9nsJhTx8Boxc8Bqif+QvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jRwY6lJv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jRwY6lJv"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5724736770cso9484a12.1
        for <imx@lists.linux.dev>; Mon, 13 May 2024 01:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715589660; x=1716194460; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSDRwv7jk6IAgHWtX5wD76uWRnyIu2E9jN3RV77i0HQ=;
        b=jRwY6lJvLtlMeUELfNGPikg5bdf1j5DfO3dAQ04KQw2tI9zBwObZ4qJV5dRaMXh8Nx
         adJyedzUCo88j+dbYCpyvjLm+6slKFk/FtbfxYObt8YlFopxx4Op/Fb3BSTv8ftg5pNG
         1NK7BCwhXT/SksSRMYrx9SebbOhAdGFX5eZm02j8n+RIBi5j7W4zic6bmRmCWCQ4uShs
         z1DDSCByEJyvEIeuky7PKGpnWMtf/4qlsw1ljKUWO4RBuWwXwKDv4WH1wqaVqG24d50k
         WSR1jTFjsVRj/YmE0dWqUOkR+LV/9KCTLSg4gGfZT/LWOh768f/ERXi/p2CkmvgOpdxe
         f96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715589660; x=1716194460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iSDRwv7jk6IAgHWtX5wD76uWRnyIu2E9jN3RV77i0HQ=;
        b=I++1XLmyBThKQjs6I8aMvnfLRwPKu2adof88vYaCnsbg3ZAREwm8AIN5/94BKIitF8
         I03lu5IqcfwkUyfqn7rt8JXl+LPKZL9zNzhbpaRmExNNhzkM/Q0SGw3qyh8hwAEik7i5
         M13BnbER1R30RpEhKyLCQb8lnT1DmgHJcyvNwyu1PgaS8sUaeam3Ke+ZsBzsitMEvre3
         CpApZ8BDrZBvWnwngRTpZ5pFL2IpjjlgeqP0otf43/u6dfgFEl+PCBvw6scYlZCUxLWS
         kmp20SDMxTK9OZAdhnNIV+BB7wsjCY+PIQHj/8TNiowAa+wb6kMLa1qWk7kvH0lT3RIU
         FaSA==
X-Forwarded-Encrypted: i=1; AJvYcCW1zF/YDM511rlszjoS4IjilotubSQ7ztwpvKdfxTQSSqB61X9d7l7xEgebNBigcow+fDFDXcXDVTMwhwdH+yHu/1c5
X-Gm-Message-State: AOJu0Yyq/UNP+ftyC9cSN+OSQa2VZZnqAFtjxsWX+ApTzpu0Hn4T2Qdo
	acTAVkg9EOTU8UvDNCYVzEJa1YrgmHljoYKFyiEjXTYz/OEV238+Osif56hDyggG8LZqmJv/tul
	Ss+bWHpdkrCxH4a2Af3OLPtiffBIGVyk/WnEi
X-Google-Smtp-Source: AGHT+IG57BWFXudd7m8JcDciNBmtXJbh5+hfFHuyw1l+yn/mpSNaGi+yGRv/Cgp0O9O0ywU03d4iur9Dsc9F5E9hlnM=
X-Received: by 2002:a05:6402:2153:b0:572:5597:8f89 with SMTP id
 4fb4d7f45d1cf-57443d30921mr260807a12.6.1715589660140; Mon, 13 May 2024
 01:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240513015127.961360-1-wei.fang@nxp.com> <CANn89i+EQDCFrhC3mN8g2k=KFpaKtrDusgaUo9zBvv0JCw8eYg@mail.gmail.com>
 <PAXPR04MB85100C1A06253C0AE1EB36C288E22@PAXPR04MB8510.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB85100C1A06253C0AE1EB36C288E22@PAXPR04MB8510.eurprd04.prod.outlook.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 13 May 2024 10:40:46 +0200
Message-ID: <CANn89i+0xtG5hg2LsGvNOueCAkOac_UccXWq-Eeqt1a40EkqBA@mail.gmail.com>
Subject: Re: [PATCH net] net: fec: avoid lock evasion when reading pps_enable
To: Wei Fang <wei.fang@nxp.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, 
	"richardcochran@gmail.com" <richardcochran@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 9:53=E2=80=AFAM Wei Fang <wei.fang@nxp.com> wrote:
>
> > -----Original Message-----
> > From: Eric Dumazet <edumazet@google.com>
> > Sent: 2024=E5=B9=B45=E6=9C=8813=E6=97=A5 15:29
> > To: Wei Fang <wei.fang@nxp.com>
> > Cc: davem@davemloft.net; kuba@kernel.org; pabeni@redhat.com; Shenwei
> > Wang <shenwei.wang@nxp.com>; Clark Wang <xiaoning.wang@nxp.com>;
> > richardcochran@gmail.com; andrew@lunn.ch; netdev@vger.kernel.org;
> > linux-kernel@vger.kernel.org; imx@lists.linux.dev
> > Subject: Re: [PATCH net] net: fec: avoid lock evasion when reading pps_=
enable
> >
> > On Mon, May 13, 2024 at 4:02=E2=80=AFAM Wei Fang <wei.fang@nxp.com> wro=
te:
> > >
> > > The assignment of pps_enable is protected by tmreg_lock, but the read
> > > operation of pps_enable is not. So the Coverity tool reports a lock
> > > evasion warning which may cause data race to occur when running in a
> > > multithread environment. Although this issue is almost impossible to
> > > occur, we'd better fix it, at least it seems more logically
> > > reasonable, and it also prevents Coverity from continuing to issue wa=
rnings.
> > >
> > > Fixes: 278d24047891 ("net: fec: ptp: Enable PPS output based on ptp
> > > clock")
> > > Signed-off-by: Wei Fang <wei.fang@nxp.com>
> > > ---
> > >  drivers/net/ethernet/freescale/fec_ptp.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/freescale/fec_ptp.c
> > > b/drivers/net/ethernet/freescale/fec_ptp.c
> > > index 181d9bfbee22..8d37274a3fb0 100644
> > > --- a/drivers/net/ethernet/freescale/fec_ptp.c
> > > +++ b/drivers/net/ethernet/freescale/fec_ptp.c
> > > @@ -104,14 +104,16 @@ static int fec_ptp_enable_pps(struct
> > fec_enet_private *fep, uint enable)
> > >         struct timespec64 ts;
> > >         u64 ns;
> > >
> > > -       if (fep->pps_enable =3D=3D enable)
> > > -               return 0;
> > > -
> > >         fep->pps_channel =3D DEFAULT_PPS_CHANNEL;
> > >         fep->reload_period =3D PPS_OUPUT_RELOAD_PERIOD;
> >
> > Why are these writes left without the spinlock protection ?
> For fec driver, the pps_channel and the reload_period of PPS request
> are always fixed, and they were also not protected by the lock in the
> original code.

If this is the case, please move this initialization elsewhere, so
that we can be absolutely sure of the  claim.

I see fep->reload_period being overwritten in this file, I do not see
clear evidence this is all safe.
