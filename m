Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E31465A7
	for <imx@lists.linux.dev>; Mon, 13 May 2024 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715585386; cv=none; b=bWRZ/Zy9bF9JkzKgB9Pc0fgbsu+jcjiCKVkEHAKX0JRZOpOW5Nl5N7FcA/KcwVdLmc9Ba6Elj+7+Yot2p/rkYnSKqiOZ4r9aoFGtYdVRQ0CqxKC+llj0rntua7EUVWHq7T8iEjZ/ZJ64mZC7VavcwYpnIBJtQgAIJS8vtvv4mtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715585386; c=relaxed/simple;
	bh=IzPgdw0K49eRhw5jtIZPmynlarK4dqQ229YsGJcycyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mbn+y0LVTPgP9qmnq0T+jJ4os6rjlzVCb98f6Eso4/4zCA6Uh3Jv5kJ3xOM2P2sD98o7TuoHL08wR6OW6S13/3wimGhBO4+6oqTu4oTlHQBtoHQq31CLbLcqcBHFjop7X3pcN3NaU9nBG+unY1O1uWn3KeqXWJvN+okcLQgoAGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=elLoRJVT; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="elLoRJVT"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso13709a12.0
        for <imx@lists.linux.dev>; Mon, 13 May 2024 00:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715585382; x=1716190182; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAY4/lorGsuZXDngCKORi6jmMI4bRdFCzdsTXkDAPOg=;
        b=elLoRJVT3DfjAtQLbVuxHSHpEIFm+HSj4YRNaOVay/dV4Pb1/qfMZ8e7F+YrQGEn9b
         1sOBccSzDBkMhO88lAe5ObOYvC1CSHlfvsX0XFVYCl+KNQ/huJELyzJEmtLYxRA5j011
         vSN7qRw/KgQ9N4gr3KOpSn3FI/4/lFXWjJ4YT67i2grLBER32vgpoVQ48Dhj/zuqHwoF
         elwuZ2eMimoEq2xh9NBO6xZ3ByYVehawV1ltTldy2tYeHdRHglGKjWV8hiP2LOqfSZ5e
         P5V8hwUjL4i0y0gcuJhJ/RUYNDDjz72VTn5grx/4La8nZRZDwHiYvSEmzjAd2OLxdw6h
         pSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715585382; x=1716190182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAY4/lorGsuZXDngCKORi6jmMI4bRdFCzdsTXkDAPOg=;
        b=kWKO01cZG63VELmsQj+o35Mk3P8ZYLvjL56j/LhVUPD/rYjs1I/sl6szJIi0He/IfP
         BP/8nIwrG/Ydu223tHIQjmfKwN3xynNE7k2kojbCdrw0AG9mnsj3WSOpvs2rp2p96BNz
         WAsht9mAuZFmx7BgfFzCybyCzDmNRAZjS2McIZLcZnUOQW2+au6TdY/30sf5ySmCXIJt
         RllfrDkVz2iGHyu2ZfvdVLvTeHZQkBo5so9cDE4fOlj4JCAbeIMGj+cBG4KRWqGhnvNJ
         OG5pF89A8CDFMqi/b53OGodaP0mxnBWOyzFHXJCxJXVeLPqKlFmGXOq4T4r1ESMBsonz
         L01w==
X-Forwarded-Encrypted: i=1; AJvYcCWLLni4/RwuyDYz6Z2pIGyN9Z/FeyiGMy128wq+U+SpK8oUje3yL+n155aAhpDW5rR4ni56tf6SjVIf27Hnrf+LLY4x
X-Gm-Message-State: AOJu0YzqCWC3kF7Q1LPJsn67+cqFh9GvJwG2JI8Iwj2e5BK65Z8+RK9c
	fhLSKpSW9efjRx2+bwv+jnpneFzyzxtaExQuxCxCtiJeJ08TPT4bxkHO6xj6BpebQNz7qKPPzIc
	LAx7GoxndWLde/e+SERu+q4I0EcCAy4oDupVY
X-Google-Smtp-Source: AGHT+IGhtol7Ka3Q9hALBhyjhXgfG9C+/LulSKbBCs7IbilYl6XQXtTboOY2HfvABdOkS/zVQlGEo51pnJ6tSHLdWqg=
X-Received: by 2002:a05:6402:2228:b0:572:57d8:4516 with SMTP id
 4fb4d7f45d1cf-5743a09ba38mr227370a12.2.1715585382186; Mon, 13 May 2024
 00:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240513015127.961360-1-wei.fang@nxp.com>
In-Reply-To: <20240513015127.961360-1-wei.fang@nxp.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 13 May 2024 09:29:28 +0200
Message-ID: <CANn89i+EQDCFrhC3mN8g2k=KFpaKtrDusgaUo9zBvv0JCw8eYg@mail.gmail.com>
Subject: Re: [PATCH net] net: fec: avoid lock evasion when reading pps_enable
To: Wei Fang <wei.fang@nxp.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	shenwei.wang@nxp.com, xiaoning.wang@nxp.com, richardcochran@gmail.com, 
	andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 4:02=E2=80=AFAM Wei Fang <wei.fang@nxp.com> wrote:
>
> The assignment of pps_enable is protected by tmreg_lock, but the read
> operation of pps_enable is not. So the Coverity tool reports a lock
> evasion warning which may cause data race to occur when running in a
> multithread environment. Although this issue is almost impossible to
> occur, we'd better fix it, at least it seems more logically reasonable,
> and it also prevents Coverity from continuing to issue warnings.
>
> Fixes: 278d24047891 ("net: fec: ptp: Enable PPS output based on ptp clock=
")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/fec_ptp.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ether=
net/freescale/fec_ptp.c
> index 181d9bfbee22..8d37274a3fb0 100644
> --- a/drivers/net/ethernet/freescale/fec_ptp.c
> +++ b/drivers/net/ethernet/freescale/fec_ptp.c
> @@ -104,14 +104,16 @@ static int fec_ptp_enable_pps(struct fec_enet_priva=
te *fep, uint enable)
>         struct timespec64 ts;
>         u64 ns;
>
> -       if (fep->pps_enable =3D=3D enable)
> -               return 0;
> -
>         fep->pps_channel =3D DEFAULT_PPS_CHANNEL;
>         fep->reload_period =3D PPS_OUPUT_RELOAD_PERIOD;

Why are these writes left without the spinlock protection ?


>
>         spin_lock_irqsave(&fep->tmreg_lock, flags);
>
> +       if (fep->pps_enable =3D=3D enable) {
> +               spin_unlock_irqrestore(&fep->tmreg_lock, flags);
> +               return 0;
> +       }
> +
>         if (enable) {
>                 /* clear capture or output compare interrupt status if ha=
ve.
>                  */
> --
> 2.34.1
>
