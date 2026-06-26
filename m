Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783FE279DB6
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 01:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782438952; cv=pass; b=Xxro6f45ZuJphqurIi84pmH6UweR9sEmGSfj6SI1eWzz6NCqXswanhhyiaj6kMblNZEFzF3EQ1k4QcjSPmUHfoM1YPBa9EYjU/Tf6Gbf1rWdC6C9KSz9UH5o12pVuYLXHYatPoTd50mkjZWgDUHT4HR2pncVFou83m8d8yQO+m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782438952; c=relaxed/simple;
	bh=jXiXb8BB8/5rZZmokBeg/dECudwiIK4cvNgjgqBgQ3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKVOsJWvNcJNtMERHYaj4wNBlwsWXUmDNtnncfNOLuxz+PaPaq4EXHuutcj6oeV2n1f1pyQmgdxdakapmSm2L/jCd53gsEJfuU67PiA9RnABgEKOgl16R4vUhFYmhHzZgVJwoCmr+b/VzaTwIby9DC3lBRoJoCx1o5BrzaaUfM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAx8b2wO; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAx8b2wO"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69796a9f04bso812768a12.0
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 18:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782438950; cv=none;
        d=google.com; s=arc-20260327;
        b=WwMs3N12iIGS/vKg8h+FXvlqSzEP41diuOp1d8nf0JgoCg9sSM0cy4HvgJ6gGQtj5n
         pZ96HwcEgTZ2z0OeHWuls/GHCUzsFJBVjpLk5YNargIpJSHJbVFZNg6zkQ5CA/xEi2DY
         HI9m/j85eXhtRxGnrvPittDq+RSPTikhK7JSF1cwIhuMHvTh1pBnkssLjgimZuVKzdSs
         LycY6/19itI4PRgyDqPuWsE+l1fEjYj35esGh5cEr7Xu5vsaQrYqOYtu8gSY34ZnkJhb
         Opac9iQNvp0hUSBplXNYkkam58tQhumGEhcRPWwQ1LEZxkl9eA8bsCrL0Nptd81uhsEe
         mTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LNZy2c6rQcybgL+bCAHWO3UrpbXcc8ANhnoFPYD99Hk=;
        fh=q8nE1/1atpeSQ4ibqPNZBLWhGUdhC/Y6+TQRiV/dbgg=;
        b=jltmViOi69Xuro0kGOe+HwDXCXKwJn+ACUy5jOpKR6PfXjF2GwF/eVN2RIQEylEduV
         TO/wV4xCbmquzNBxfANiyI7lMm7grDewrsATwbBzbG9GUE4/UWN7ZZ7X2NpO4sWoQdjg
         kVUZ6TBuVTZH/zZAxaJGzrD2OrcMuLbgVmR+ar3z2AgJfaDRODzrheCKJYkRadUhIgN7
         CMjWc+dAyYdhZEy0R2y60C42tf1ZJIiRnKDMGEZLA/psBQdl0SyGQjTybHyOGFvZnT+3
         c+BIKzUPMBPhG98/LuccIPf71EyvmgEaPI0C0s9ie0P3Q3jYq8Db9PL4eJx0/1iut+Uc
         SQBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782438950; x=1783043750; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNZy2c6rQcybgL+bCAHWO3UrpbXcc8ANhnoFPYD99Hk=;
        b=mAx8b2wOW4jK4ww4yfaXPpVwWJ9L92obyXgJNcFENwv3YTTCimiW2urJElShZKz9ms
         tFnY3zzTcgr2gbd9mSKB2i0CoUF5tDfybVm9TR3WAy1LagL4tvddbbjSZFSTBg8tfgWW
         n1w9HC3nT23seJmfShNih5PlY8RYBu9nnVZQww6dQ5YWeEX8WHOYavP9iFpm9sYaHo11
         Ff/6BIJphxVtSlT2yJCFOfDjbISLZ2SmBnll1MDTjHKGy0DSJLQxxdeY3K/W6AyNDXgw
         UNQ7wMd4JcXebpDo5Bce4W9kq/nm+Ca9sj1bqqDahk5G7hT/EoXlE2/MDFNi2hxBwK+y
         2dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782438950; x=1783043750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LNZy2c6rQcybgL+bCAHWO3UrpbXcc8ANhnoFPYD99Hk=;
        b=Rz+MyrJelMZeYm2/hUwhNUixh09Z3ajh9G3610cCNyDBdF9m+0IrJVktIeqRkbiQa1
         qXTP+pAdl0cmI0VEj72bkIJuTN9l4Lv4IOy5kAeVBSOnf2P21zXuYA3MCpB1ayhTM8eT
         6sr2m+Uy0isJX+6Uprj4Y3jmC3SCcgWFTRciL07jaqmF6HkuanTHSLgH/+434/stXe6r
         YkaSvOxzYLs2R6w1FvqW8brnSamIH//W5dSBIeqn1Yv/cRD5BkPfd1viS1062uSe0d2R
         yPSwUz/qKZGZ2GWFqgYE89BmEKbRI7FU/t2LxzuzBIBJoUXeeM4h6JxLGmz6bfmV8+2i
         tDKg==
X-Forwarded-Encrypted: i=1; AHgh+RqzPLzHuTDBdDTxD2caOvrxnN5cyUIIRPBE9OmqPYlRKL9A+nUAl1dbyP12sV54S/4KCCM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAlwKrqiRkbzlz4LNW1vzcKJdAqNqMBAcq5CjYg3ynlOwOVTIR
	iRj50B24K8VasQnNch8e44oyZWPeA1DAB/DIXp7wUinCNj2gJSc1PoGPe4uqyPGqZbmZDuXs2JA
	GMi7Ehgzhr62uK0Kj2KXcLvRdJJYioDc=
X-Gm-Gg: AfdE7cmzPoWU+HKHvlxEoZBdc1W3AOkV7eKrJ6pztpqAYS1tGyccJaDS/zzlKM8bkkQ
	Xnz6hw3vgg0wbKP6G4ESwjP2CLGSsyfge84OZ0RLog1MBe5QfchgUkoWNdJd/cfOx/X+owl0wJ6
	7gUt78nYiIwZ7tffbDPQKmugoG6gqNIac20H58bXh0rSZ0QpIXQ6MySWHY9NMpYjO+kvvYs7C3d
	oqixp/vla5RBhovvGOYnOFFnX/OUrFAZRvGH9IT5axgadNBIMjQrSy5jq6sxDFkXrq1o3meCMOq
	Cf+q8a0=
X-Received: by 2002:a05:6402:3512:b0:697:eece:eae0 with SMTP id
 4fb4d7f45d1cf-69810a3a8a5mr919346a12.6.1782438949713; Thu, 25 Jun 2026
 18:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625071130.93544-1-liem16213@gmail.com> <20260625160219.55116-1-liem16213@gmail.com>
 <aj1UR5ddawsdMbZC@SMW015318>
In-Reply-To: <aj1UR5ddawsdMbZC@SMW015318>
From: liem <liem16213@gmail.com>
Date: Fri, 26 Jun 2026 09:55:38 +0800
X-Gm-Features: AVVi8Cdo9F6_HUwGPZkGfKdDVs1g2IkW69-hNTuPosIJl9Kc44faaQDJLD5vnmQ
Message-ID: <CABoz+=00tywisdxcmkF_F8rOYg=BMtzZDsTN2JOXfzEwsQu01Q@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: imx: Fix slave registration error path and
 missing timer cleanup
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andi Shyti <andi.shyti@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Biwen Li <biwen.li@nxp.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Thanks for the review. I'll split this into two separate patches and
send a v3 series.

Regards,
Liem

On Fri, Jun 26, 2026 at 12:16=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Fri, Jun 26, 2026 at 12:02:19AM +0800, Liem wrote:
> >
> > There are two issues that affect the i2c-imx slave handling:
> >
> > 1. In i2c_imx_reg_slave(), i2c_imx->slave is checked at the beginning
> >    and the function returns -EBUSY if it is non-NULL.  If
> >    pm_runtime_resume_and_get() fails later, the error path returns
> >    without clearing i2c_imx->slave, leaving it non-NULL.  Subsequent
> >    attempts to register a slave will then immediately fail with
> >    -EBUSY, making it impossible to register the slave again.  Fix
> >    by setting i2c_imx->slave =3D NULL on the error path.
> >
> > 2. In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
> >    disabling interrupts.  However, a pending interrupt might already
> >    have started the hrtimer (i2c_imx_slave_timeout) before the pointer
> >    was cleared.  If the hrtimer fires after i2c_imx->slave is set to
> >    NULL, the timer callback i2c_imx_slave_finish_op() will call
> >    i2c_imx_slave_event() with a NULL slave pointer, and the
> >    last_slave_event check loop in i2c_imx_slave_finish_op() may cause
> >    a system hang because last_slave_event is no longer updated.  Fix
> >    by canceling the hrtimer and waiting for it to complete after
> >    disabling interrupts, before clearing the slave pointer.
>
> Please use two patches to fix these problem. One patch fix one problem.
>
> Frank
>
> >
> > Both issues can trigger a kernel oops, system hang, or permanent
> > slave registration failure under certain race conditions.  Add the
> > missing NULL assignment and the missing hrtimer cleanup to harden
> > the slave path.
> >
> > Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Liem <liem16213@gmail.com>
> > ---
> > v1 -> v2:
> >   - Instead of adding a NULL check in i2c_imx_slave_event(), cancel
> >     the hrtimer and wait for it to finish in i2c_imx_unreg_slave()
> >     after disabling interrupts, as suggested by <Carlos Song>.
> >     This avoids a potential hang in the last_slave_event loop in
> >     i2c_imx_slave_finish_op().
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.=
c
> > index 28313d0fad37..04ffb927aba9 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -936,6 +936,7 @@ static int i2c_imx_reg_slave(struct i2c_client *cli=
ent)
> >         /* Resume */
> >         ret =3D pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
> >         if (ret < 0) {
> > +               i2c_imx->slave =3D NULL;
> >                 dev_err(&i2c_imx->adapter.dev, "failed to resume i2c co=
ntroller");
> >                 return ret;
> >         }
> > @@ -957,7 +958,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *c=
lient)
> >         imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> >
> >         i2c_imx_reset_regs(i2c_imx);
> > -
> > +       hrtimer_cancel(&i2c_imx->slave_timer);
> >         i2c_imx->slave =3D NULL;
> >
> >         /* Suspend */
> > --
> > 2.53.0
> >
> >
