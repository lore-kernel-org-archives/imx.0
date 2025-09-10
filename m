Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454F22B9B7
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 00:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757465170; cv=none; b=gyNtQVMELM5mWLFV7tc9N1MWbQfS8gZc5ng9ob9dpOdEydpLBl6CEJCddky96st2rACZzZ3OUqQcZd7dLRSB1vXdAkX9HA5ML5ko/do6mPWXFtbDObhP+j4TVCM+/mhPgxMvY6Cob6M3M3blr3Jrh+2ZreDj0wOG4TrhmXRY01k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757465170; c=relaxed/simple;
	bh=0xeNo3BIaFmDervAKBZFHy5VNEvD7UpMyijC8RILg2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyEPSJ0amTIxNGfxYAPW+mfWiQ2Ftw4eooW/w/6KtVaEy843YMGW9stBz0h6nfOllkFbyixERwjDvHq9n80qVzvl9hHD43nx5PEr7KceEQpq3HepWOaC9X4GNUca+AWkgmU7PBWA5RsFxowyvz3NjHgoyg8yBDJWxkeNPyu90m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tNkojI/j; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tNkojI/j"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-74595f3852cso3910865a34.0
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 17:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757465168; x=1758069968; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxHnVOKMxdbHCeN1exbpC/acYFmora29Q0FWi85N+KU=;
        b=tNkojI/jZvQLeKszNif3zwar/i7CoP1qMnU9q+eslByhYJ0J5MA4+ykrkYTROw6AG7
         ko8BuWfa92xNB4AhwtpnAlYLznLGF+LNSfwojWiKz435NHmdTD7XOn4hfliYdppcEgWl
         xk4m7GvRQ2Y1+BwO5UQHuijB6yTVm//9q05HAM0zcWP8DflSUkicJ9+h60m6EsUfzCQP
         mBXxeKdZpPrrskdpUiZedIMS2hdVcXHy+1wc77168QjNWsQkYkejtgokUtnzT4WSFgih
         ZUMNEZCWelpRd74lt3WuM2lzqzhhh87MQh4bYBP2nGSJV2LuDKa9ZgPwioSDzbleXB03
         hh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757465168; x=1758069968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxHnVOKMxdbHCeN1exbpC/acYFmora29Q0FWi85N+KU=;
        b=dZ74jusN3Dh6cgAmChlWvMAirrYrh90iFlSXllkAjpKxHzz0/u4LSAq42GEie1ieCY
         3MZodlI61MtbVaLvDVstgEmy4d1QzIRlhFDOmP+HyvV5ju2ZR44UJc5YG97VUyd/tt0K
         xQ4FAWU2yv3r1KwhXgxmYHo4t9IDPxLpbaDipuPyYpPsv9t2v8My/ucYnBY5ZWdUjImn
         9CJdrqcqDeThe3vwSG/8G27W8ev0UQfMFmiXpONcx+S5FSCXyHOcaqeS8+QekmL76Dle
         zzNeNh8lHBcG99Yka6sh5DZVAUQdZvV2kpy1MNoKQMsQ0osMMkFbEsUzmpntoD0Msn6p
         R25g==
X-Forwarded-Encrypted: i=1; AJvYcCUF9lMMDoIkFSqCzsrw0hisMWfbTmOop3VyCNr1ShPmguAKowrOHBpW8APJLsnVRYbOUVc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCg7ebXyGr407yL/WB6HuzvdRRJ+bIajuumacTjs85+aViPbC5
	p/6DukCAfozkuecuw4C7E/Ds8zugDUIBzvXlvgDQdy3hVxUZDc4gLTmeEEXHES/lY2rsW4bEVNx
	biu1u8oBhmiCfbHsLqqcflsm8WkibfnUOWRZqa8DI
X-Gm-Gg: ASbGnctYgZU6GFIe2JMhXXubYISxStzJCjOfUy17009JS4BN0E+rvc8rVLgy5jbRZst
	pd77aHCIgmnTgSSngKee1prW3jLWtQlrFOkXeNzc8KjlCwrY25wKIacxmovmdBGdkhPDqcgSMfY
	qR90UDTJD2dS0bbIUpiGBSUSiWGF6+DVoyprcAoot6VshWXCQUi/jp4q25NrLDCYA6AnRwt+c7p
	YuvlgKAdUFwoPGDRGYvP5gEDIkk8+/0/9UatgkXFmNa
X-Google-Smtp-Source: AGHT+IHen2BYd8vMpeqeYFzDF2cbgdfdpw1ttr7Y2zzPp2DUPEaVr7tMF+cZhwars9gYnqRJU3aWs9RAdaz2FqpWS5Y=
X-Received: by 2002:a05:6830:64c7:b0:741:b500:a412 with SMTP id
 46e09a7af769-74c74fbc057mr6945712a34.19.1757465167899; Tue, 09 Sep 2025
 17:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909080733.567796-1-xu.yang_2@nxp.com> <aMBSUFib937/hY/u@lizhi-Precision-Tower-5810>
In-Reply-To: <aMBSUFib937/hY/u@lizhi-Precision-Tower-5810>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 9 Sep 2025 17:45:30 -0700
X-Gm-Features: Ac12FXy1hVTyTGZcztjic6tSU2NxeIqp_c8I5wETuPszbEVCsqIADfcWNrbs8ns
Message-ID: <CAPTae5JfwpqpNm+9WVrhQ1X0ex7ohh6j1Dfj-rk7GhGHKVhKJQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpci: add wakeup support
To: Frank Li <Frank.li@nxp.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 9:14=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Sep 09, 2025 at 04:07:33PM +0800, Xu Yang wrote:
> > Add wakeup support for tcpci, so if the user has enabled wakeup file,
> > it will call enable_irq_wake() when do system suspend and call
> > disable_irq_wake() when do system resume. Due to this driver supports
> > shared interrupt, if the wakeup is disabled, it will mask the chip
> > interrupt by default to avoid affecting other IRQ users.
>
> Is below look better?
>
> Add wakeup support for tcpci. If the user enables the wakeup file, call
> enable_irq_wake() during system suspend and disable_irq_wake() during
> system resume. Since this driver supports shared interrupts, mask the
> chip interrupt by default when wakeup is disabled to avoid affecting
> other IRQ users.

+1, The above description looks more cleaner to me, otherwise LGTM

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tc=
pci.c
> > index a56e31b20c21..2a951c585e92 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -949,6 +949,8 @@ static int tcpci_probe(struct i2c_client *client)
> >       if (err < 0)
> >               goto unregister_port;
> >
> > +     device_set_wakeup_capable(chip->tcpci->dev, true);
> > +
> >       return 0;
> >
> >  unregister_port:
> > @@ -969,6 +971,36 @@ static void tcpci_remove(struct i2c_client *client=
)
> >       tcpci_unregister_port(chip->tcpci);
> >  }
> >
> > +static int tcpci_suspend(struct device *dev)
> > +{
> > +     struct i2c_client *i2c =3D to_i2c_client(dev);
> > +     struct tcpci_chip *chip =3D i2c_get_clientdata(i2c);
> > +     int ret;
> > +
> > +     if (device_may_wakeup(dev))
> > +             ret =3D enable_irq_wake(i2c->irq);
> > +     else
> > +             ret =3D tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
> > +
> > +     return ret;
> > +}
> > +
> > +static int tcpci_resume(struct device *dev)
> > +{
> > +     struct i2c_client *i2c =3D to_i2c_client(dev);
> > +     struct tcpci_chip *chip =3D i2c_get_clientdata(i2c);
> > +     int ret;
> > +
> > +     if (device_may_wakeup(dev))
> > +             ret =3D disable_irq_wake(i2c->irq);
> > +     else
> > +             ret =3D tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip-=
>tcpci->alert_mask);
> > +
> > +     return ret;
> > +}
> > +
> > +DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
> > +
> >  static const struct i2c_device_id tcpci_id[] =3D {
> >       { "tcpci" },
> >       { }
> > @@ -987,6 +1019,7 @@ MODULE_DEVICE_TABLE(of, tcpci_of_match);
> >  static struct i2c_driver tcpci_i2c_driver =3D {
> >       .driver =3D {
> >               .name =3D "tcpci",
> > +             .pm =3D pm_sleep_ptr(&tcpci_pm_ops),
> >               .of_match_table =3D of_match_ptr(tcpci_of_match),
> >       },
> >       .probe =3D tcpci_probe,
> > --
> > 2.34.1
> >
