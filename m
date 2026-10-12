Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674894D37B9
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829578; cv=pass; b=X679vPfUqD9iz8foCjrntMFpZumheOMWfmAGrosIFqsZIQxnrEwvuFnJCd8Fa+jSPdm5/xPXNmiHZhQ7DLrExsq9rs1ov9jNcrKkiZpceKWz7CE7CI6JDzpyWfOr4BkPIKE82VEysVQctZXNZcRmCjc5N0FQUjgc4jTLehf9v6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829578; c=relaxed/simple;
	bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rupMagISm+Qy7XVf/XuS15CwzIlIWMe7gNo1txg4QsZDkTx29xwgJr9PbNoAMcCAdoKceZGYdox6fP1OSf+CR1UcGY7o94XGEkJ3ciJqWRoXZ/icVWy7VKSAi1FF2yDbpuRFb+UG2BDmAPPccrbjNMOF2dwec0VpkWxS1QTpGP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPVravb3; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPVravb3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2e36c3478aso279745166b.0
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 11:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791829575; cv=none;
        d=google.com; s=arc-20260327;
        b=TP13L0SFncSMGuDAt/dS5XzaB+b9UfbT68SFamFk9fkt1kgak8QpJ5YEU1v3JyRSqM
         2v4usv5tiLxHO1rTtlVeqLGhn8gbD2+L2IvuPZKfayOhrQ5qqBOSE+Bzn7jhNqECNJ3Q
         yNX7Ii1eATtqdH1qh34M6J/03Rp9CtAA33GyGXej7EPc/ZV+i0bjeShhZDC7KH14SBMN
         TNpEAXlBpPMvq5LQEGzKZaVQPIclDUS0xkEGGRSEvbmYZqhq3gU0eeSvHMjTZeuAHKua
         wjxEerUY/p8pR819glpB7hbs7qID+XaZaucER4ICvWUC4hXG8hbIjuo7qZg8byLj9TqN
         OPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        fh=r7RvZefZogrdh372/ox1VSjAdYeEnGoE0OgejCcqm2I=;
        b=ooH0M32EgO2UIAxci4LcMu2+CPZcaZtnFM57BifY8IQnQYTboWIkfY6bGiPixZaI3o
         rvWRdPnVzB72Q+W2Cae2/tGHd+jI0Fd4AmAhIumAIkTrYTNHjK5iFyrESj4MW/kkOeAD
         pCpJvnl48MT6YibellOITfZBW7ulrtJZyROotyKrF4zy2/McVLcraN1GdYDWSBXSrNPV
         NGJPaWj84Vgq0l2W8yOwHdMgwOF2VHhhD2gc60LeXF6r6fyv3q19RQ3vc2hi3juCuya6
         aEDQ8k0+x70rReugES4sAqX3ELdiFWi5Y7e3tyx1lXgR37fQg+9bRHP3s3PU9zlP/GPl
         n+uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829575; x=1792434375; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        b=bPVravb3exhS9eSHXFiCR7+ULu+/Xu/KPH8C9CUpSc49/JKfa/UeR5AqPgIo89Ca1C
         M+zhP7Ck2zwlleS/IEuqWk63cBZs7FDT23OWAvHuXPDGFTYyN+1PSXtUPLHizAMs6MP1
         uAAdRCsMTwp4S3jgcEktrClRQJcD443Gz9FoiTS2g/56KP28lVPGBB4ENjoG8XCSD80B
         OPhVITQGnjuR0OPNVZ5wnQtBI0Rno3bCMVOQcPK0X1iYrq6JxWUo9dy7hwei9T3uvYU6
         Ddx0FNg7ptD25DBvZO4Ll+ac/WQSwJbJrjwL9duyepqOXNVl4jW7hQV3+/Xv+XDWaEZK
         WQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829575; x=1792434375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        b=DXm8Lxs1oDd4KgkEQTM3E3VqoBe08rTy2BStinR5aGnJGkstCvUOVq9E5qTNX5QB30
         yUagnlzbpZNuDoYX9Q44ZX0BW48F9EQpwdCsGjHH5KRF9h0OPNpwQFTn0DWladwj9fW/
         y3t5RwfaYB2YxDeOGwRUhg/45drcjImv8T4SayYOp8ThJJiHBIaB+fme7tQracuhL4Aq
         4X3dHyws6XFQRE2x2D6TsG2u7jHy4ERWjxcgKJHRfcK7my/frTeBjFb6VvpJoJwtc1Oc
         39SixR5Mpad6c/FB6UiSEqKXnnCTR6b9DJSwmeuPvGgnV6IQthh8GR8gvgg27VJzPofQ
         jF8g==
X-Forwarded-Encrypted: i=1; AKwUvByxGN+mASl8PYciVEBPcJblYJX6XbwqPkJqY5kLGIEevqsQQK/EiMyfcnsI1v50cINIZTI=@lists.linux.dev
X-Gm-Message-State: AFq9FYJn211J36IHrDj1rUEnaYOCZpXqpWs01/feFUR4bQUvLz1JgSet
	CUfoxeq73H925GArqTcSMjq6fMbZsueP5AnG0wuWDqkLcfcTBUIhJnLsdwkk9xpzxgFqtN7iM6c
	XE4hPnBqeieKVsSjVBwDsDvjKyL/eu5I=
X-Gm-Gg: AYBFou1wMNhCUCK7J73nxMqUy+1llvamCdj+j84plcmra5pXffxGLV18T6BHzywdQP3
	pdbudomrVFCu87coqVOcFJ5NdbJLxHODxjCO7NwDWH3ztoERLsWFZVKiyyPVtHfXFWOmLxXTFVa
	qcmvdpCWDfTvbw47NXx6gpkN7h3+IhVlf1CVbUgiMWlM8SyxgUqUGjc328ZLD6BpUuA+tXCkmXB
	ZoDGKQwFLbZGEsnLc94W9x+QnEImu5GWgLExZ/dX7rlh6kb8X1f1AIjQMjS3Ncwhsz3jaDf5HSv
	SaM6pK1Hfrnawi7wfLqBnTCsXBeaKcs5D/iyas1bQoqhPDn2bDEa9UEaVOOnepID4zdFmEpRr4x
	1eAAp5ubGN7y9ioJL2rcK7a+u3gJzPdyOVQ0ewTz+Q8ty0vOcbzZDi7lVXr+cYZiUliitFTrO0R
	Ia94JlkSt1d1zR/RJUzM5lkP31Aq8zSg72dMe/Gy4G
X-Received: by 2002:a17:907:3e1d:b0:c2d:d27d:ef88 with SMTP id
 a640c23a62f3a-c31aa0b5511mr1082097066b.42.1791829574275; Mon, 12 Oct 2026
 11:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com> <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
 <asytkrYip+v2vl/i@shlinux89> <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
 <aszHhGylycuDIY35@shlinux89>
In-Reply-To: <aszHhGylycuDIY35@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 21:25:38 +0300
X-Gm-Features: AclHuK9Yv8wpNcKas8ocynagdzdCNr0lM7euheMiilCMFZqAJfrfDJ0QKY2cll4
Message-ID: <CAHp75VcJsjRk5v6=X_ut_S_vLLu24tHieOy43ATAH2Mr3P2RyQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:37=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 01:30:04PM +0300, Andy Shevchenko wrote:
> >On Mon, Oct 12, 2026 at 12:46=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com>=
 wrote:
> >> On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
> >> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.=
nxp.com> wrote:
> >> >>
> >> >> gpio_set_wake_irq() can be called concurrently for different pins o=
n
> >> >> the same port, so use atomic bitops when modifying wakeup_pads.
> >> >
> >> >The code doesn't modify any reader part of this member. So, the above
> >> >paragraph is incorrect, right? Otherwise it needs to be clarified how
> >> >assign_bit() does change anything.
> >>
> >> I will replace with below:
> >>
> >> gpio_set_wake_irq() can be called concurrently for different pins on
> >> the same port. The IRQ core serializes per irq descriptor, but
> >> different pins have different descriptors, so concurrent calls for
> >> pins on the same port run without mutual exclusion. The plain |=3D and
> >> &=3D on wakeup_pads are non-atomic read-modify-write operations that
> >> can lose updates when two CPUs modify different bits simultaneously.
> >> Replace them with assign_bit() to make the modifications atomic.
> >
> >Right, but the code does change only the writer side. There is no
> >reader side that was changed. So this patch does *not* add any
> >atomicity. You also need to check if the reader side already uses
> >test_bit() or something like that. Otherwise it makes no sense.
>
> The writer-vs-writer race is the concern: two concurrent
> gpio_set_wake_irq() calls for different pins on the same port both do
> a non-atomic read-modify-write on the same wakeup_pads word. The old
> |=3D and &=3D compile to separate load/modify/store instructions that can
> interleave, losing one CPU's update.
>
> assign_bit() uses an atomic RMW instruction, so concurrent writers to
> different bits in the same word are safe.
>
> The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)
> runs in noirq context where no concurrent writer can execute, so
> reader atomicity is not needed.

Thanks, now make sure that summary of this is in the commit message.

--=20
With Best Regards,
Andy Shevchenko
