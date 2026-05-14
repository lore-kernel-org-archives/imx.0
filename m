Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D2A34402B
	for <imx@lists.linux.dev>; Thu, 14 May 2026 18:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783900; cv=pass; b=f+wHV8e1Uvn+jNhKDFxqaesaAu0DSj6vqEpxpUkjn3dsPMMFyHbzkghCssGuFkr6l/SdLBAqXP6cZ3wp1urxuZQzsUre3WmSj4Q6mf/ZbO1QocSsJNFFTJzDoAHpyCCaOaoVl9X+1xmxTbWlJJcvZ6QvyaCbztaSFWPnEswkuBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783900; c=relaxed/simple;
	bh=QmmK3gZXRGs6+Ov33ViGi5VndHouGarK1Vb3M71UiFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GseVyd5d//Nl6KaQB2YL8bSO+ua2vgl/Pb7T2sLwooeTK70S5oQSIPiILkKrrTv9WFxJkURygQXyzdunPsUuIOfVZlOXc0mbaqTMz784g/1pArfLvL+9jiEV0rV+Z8h3dOkjJN+IUJgdemF3BXUHG4xCt6mHJd38j1RJQqCbLls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MFMpE3y1; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MFMpE3y1"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d55b97f358so5750844a34.3
        for <imx@lists.linux.dev>; Thu, 14 May 2026 11:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778783896; cv=none;
        d=google.com; s=arc-20240605;
        b=UOa+wqEEY+SDp8RBvCcJMdxeNcJPZZa9ClNiTBwEIyYCRwMGJ2oTaaiCYrdszXHtbt
         NHwPVyGz+/+k1JiO0k4iAnvE0RRnK8ioauAjEH3Ycs6JMg1qcbwyBCGvN3/+yNdvpmcH
         l6pOGHwTYkvh88pPotxEnDzzphIXRxBjJ2fkZ6UKB4Q+Tpm/z2sDukau21/qBw2K1Xup
         YK+9PZjkEgXEzwk9deUnj0YkPk5ySYGEcfOT6dAz+LbakxUlTYB639KX0AufD+PUrzy3
         o4SpjULkeqjzZmqIAV+7ghOlL/quaHjobgoNKSaVo+X9r4OGOXu+zckCaoatOFhlwt6+
         1I3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8d3m45v6Iw/R68LfgUS67OuzNpSS1/BQBBitSivrqSE=;
        fh=6EA17R1xz589oAuDbd0Y3UuuTnMhxBPqPJURvf0dTWo=;
        b=k87I0rTFEeY31fleLagdrryL/6mNj1jH906HeQWnD4MnKM8wd4qH3RNrEXUfF3wMgn
         4ENRRH3l04f0YTvXscysNaB6EcpTQZ3Eb0Qdy7fAPW3fbSGLz0v67E4iShUaRCWSf9Z4
         sgER5DX6JPHqnkV/JQVu1KcT9xYrHpojXWHBU0TL7FcUv1cfdFZPecJrQY0A3FvH5ow8
         bSercKqmTwiC2beIoYyiy06ODwizxPt8u4WZmZiR0hGF3LnNgXJTy7vABOSfqWE7vy7t
         +y3dqRScAqWgBDwidKq1mvH7lSSs/gF3Ik/5/2dKU/JnUugIzAJQGw8V1ot0Ne9xpENP
         x1sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778783896; x=1779388696; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8d3m45v6Iw/R68LfgUS67OuzNpSS1/BQBBitSivrqSE=;
        b=MFMpE3y1ot5TXZXUJtyQAf30A8Bzh7ePbgZ2msvUBUAh1RUjnfc9INl4mRh00kN184
         SoW5UvGpqq4+f6vlWWIkiYSBXIYpYOY0PPje4rc5Carv9jijzIMY9e75YEXKQnHOmF2c
         zPhVebLCbEzfvBHzKTjEHTA5koyNFynXefazNA0MN4TmhZStiZiCjsUWgGXkGqnFQgsw
         XMQ10TIvOxqT/LmsnXitJda5grcVxYFezmy4O3fof30HyaX4Kn7o1gxV6+nYjCAZr5wK
         7ba6Ajjgpfy6dWUyyHEey8lI7ARGY8zPnPRgtMrl3MF2B44Tss68blh5P5KfJJkHa162
         tkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783896; x=1779388696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8d3m45v6Iw/R68LfgUS67OuzNpSS1/BQBBitSivrqSE=;
        b=onIyD49UtSpIzPN0zKkoZMlKQZn2z/j4556ZExvuw7u3gSPJrNxTf18mu5tyWg+sbS
         WNQEwie0c8Rr5tH/Gl4Yq2Y+90ovxzWWjo0OQTeltAF7AQL8WceGGR4adMLKX9rDOWqy
         sLonVSgo57E24bNLL4up96pMLfN+7Gt4T7tCMycN4aJku/nYXqzkJuZ0unwb6OV2nIph
         D7j+xXtmurYYvxqWSARkZ9C1SwTzITiX0O8/2sfoQTeNceqBV/X3NnzDL5ftl5wkWqmb
         LBMzmqiiy7zRtHwjE/N9Gz+yW/zg0iYZdhyL2ySrfwII33frFl2rQX931Y9s9pDUD/du
         Pp1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/L3wIBrDtSH+IsWORcEQOi77xo9m8KVJ+eeATHHvPGlAE0/yrALflwFSr6XkSNusBrWOk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/nvgl4F6mAKn0g7lGH1LtxHwBZe0dwQdRSMlpJVHBT+O4Nt88
	DlTherNSzOBMAn9wxvQJ1sw7kfHjrG2tZCCuvt3jxpCaFMoNfMj3iJLeS4ee32P4M4aBk2HCJ4v
	MAxhjL3bgwBn8gmiOkvHMUYjBdSewuoenlLuGhJNX
X-Gm-Gg: Acq92OGlUSgGK9p/ygm3tEOJcqOQ4J0lKmq2pPgvUF7lR+AO/4et8XB/SE8qJxUEgu3
	+0KLcRBDSDu2VToMrSvi+RezPxKwoRB7NQ4qbyExRgoUv4jNt/4vT+y/YUA85C8V5+/zS5zFy4J
	WCmnps8turf/D5lsbiCh997dfoseOdBnFwuzds35oVWy/Q5QX6btOPxZql7i0WZoLDl7ou1Xkkt
	o7izEydJL3N01hKjEkt/IemnQuAzKlFi2IcN5slNRBska+s7X0YlMrn4zkoAUchT5YlPP43vs8g
	V+AOigXxI/INTI1I/uZfeDtg8k6ltAfjncqAK2kwySNJ/48I
X-Received: by 2002:a05:6820:221e:b0:694:9a0a:6fa9 with SMTP id
 006d021491bc7-69c94319189mr457604eaf.26.1778783895868; Thu, 14 May 2026
 11:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424074009.2979266-1-xu.yang_2@nxp.com> <ae8tabVDj2iH6IQf@kuha>
In-Reply-To: <ae8tabVDj2iH6IQf@kuha>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 14 May 2026 11:37:38 -0700
X-Gm-Features: AVHnY4KBVyf-SG8Xkj5bjhwsikanhfJWOZBg7c_1lmiP6TpWVoU1BDbUjw6MAe0
Message-ID: <CAPTae5KX51fbs8Yd5LKtRhgOXKFEWzg8AE1Z8eUovTuxonYetw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: fix debug accessory mode detection
 for sink ports
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org, 
	m.grzeschik@pengutronix.de, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 2:33=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Fri, Apr 24, 2026 at 03:40:09PM +0800, Xu Yang wrote:
> > The port in debug accessory mode can be either a source or sink. The
> > previous tcpm_port_is_debug() function only checked for source port.
> >
> > Commit 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into
> > accessory mode debug") changed the detection logic to support both role=
s,
> > but left some logic in _tcpm_cc_change() unchanged, This causes the sta=
te
> > machine to transition to an incorrect state when operating as a sink in
> > debug accessory mode. Log as below:
> >
> > [  978.637541] CC1: 0 -> 5, CC2: 0 -> 5 [state TOGGLING, polarity 0, co=
nnected]
> > [  978.637567] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> > [  978.637596] pending state change SRC_ATTACH_WAIT -> DEBUG_ACC_ATTACH=
ED @ 180 ms [rev1 NONE_AMS]
> > [  978.647098] CC1: 5 -> 0, CC2: 5 -> 5 [state SRC_ATTACH_WAIT, polarit=
y 0, connected]
> > [  978.647115] state change SRC_ATTACH_WAIT -> SRC_ATTACH_WAIT [rev1 NO=
NE_AMS]
> >
> > It should go to SNK_ATTACH_WAIT instead of SRC_ATTACH_WAIT state.
> >
> > To fix this, add tcpm_port_is_debug_source() and tcpm_port_is_debug_sin=
k()
> > helper to explicitly identify the power mode in debug accessory mode.
> > Update the state transition logic in _tcpm_cc_change() to ensure the st=
ate
> > machine transitions comply with Type-C specification. Also update the l=
ogic
> > in run_state_machine() to keep consistency.
> >
> > Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into=
 accessory mode debug")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> FWIW:
>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> > ---
> > Changes in v2:
> >  - update tcpm_port_is_debug() in run_state_machine() as well
> >    as suggested by Amit
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index dfbb94ddc98a..6d258efae6f0 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -732,9 +732,14 @@ static const char * const pd_rev[] =3D {
> >        (tcpm_cc_is_source((port)->cc2) && \
> >         !tcpm_cc_is_source((port)->cc1)))
> >
> > +#define tcpm_port_is_debug_source(port) \
> > +     (tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)=
)
> > +
> > +#define tcpm_port_is_debug_sink(port) \
> > +     (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
> > +
> >  #define tcpm_port_is_debug(port) \
> > -     ((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2=
)) || \
> > -      (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
> > +     (tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port)=
)
> >
> >  #define tcpm_port_is_audio(port) \
> >       (tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
> > @@ -5176,7 +5181,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >                       tcpm_set_state(port, SNK_UNATTACHED, PD_T_DRP_SNK=
);
> >               break;
> >       case SRC_ATTACH_WAIT:
> > -             if (tcpm_port_is_debug(port))
> > +             if (tcpm_port_is_debug_source(port))
> >                       tcpm_set_state(port, DEBUG_ACC_ATTACHED,
> >                                      port->timings.cc_debounce_time);
> >               else if (tcpm_port_is_audio(port))
> > @@ -5434,7 +5439,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >                       tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC=
);
> >               break;
> >       case SNK_ATTACH_WAIT:
> > -             if (tcpm_port_is_debug(port))
> > +             if (tcpm_port_is_debug_sink(port))
> >                       tcpm_set_state(port, DEBUG_ACC_ATTACHED,
> >                                      PD_T_CC_DEBOUNCE);
> >               else if (tcpm_port_is_audio(port))
> > @@ -5454,7 +5459,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >               if (tcpm_port_is_disconnected(port))
> >                       tcpm_set_state(port, SNK_UNATTACHED,
> >                                      PD_T_PD_DEBOUNCE);
> > -             else if (tcpm_port_is_debug(port))
> > +             else if (tcpm_port_is_debug_sink(port))
> >                       tcpm_set_state(port, DEBUG_ACC_ATTACHED,
> >                                      PD_T_CC_DEBOUNCE);
> >               else if (tcpm_port_is_audio(port))
> > @@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *p=
ort, enum typec_cc_status cc1,
> >
> >       switch (port->state) {
> >       case TOGGLING:
> > -             if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) =
||
> > +             if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio=
(port) ||
> >                   tcpm_port_is_source(port))
> >                       tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> > -             else if (tcpm_port_is_sink(port))
> > +             else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_si=
nk(port))
> >                       tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >               break;
> >       case CHECK_CONTAMINANT:
> > @@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *po=
rt, enum typec_cc_status cc1,
> >               break;
> >       case SRC_UNATTACHED:
> >       case ACC_UNATTACHED:
> > -             if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) =
||
> > +             if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio=
(port) ||
> >                   tcpm_port_is_source(port))
> >                       tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
> > +             else if (tcpm_port_is_debug_sink(port))
> > +                     tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >               break;
> >       case SRC_ATTACH_WAIT:
> >               if (tcpm_port_is_disconnected(port) ||
> > @@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *por=
t, enum typec_cc_status cc1,
> >               }
> >               break;
> >       case SNK_UNATTACHED:
> > -             if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) =
||
> > +             if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(p=
ort) ||
> >                   tcpm_port_is_sink(port))
> >                       tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
> >               break;
> > --
> > 2.34.1
>
> thanks,
>
> --
> heikki
