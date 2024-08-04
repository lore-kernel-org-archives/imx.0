Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057393BB32
	for <imx@lists.linux.dev>; Sun,  4 Aug 2024 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722790922; cv=none; b=s5Bm1ouJP0gg1PBWISsvEz23LKxAIk2n27XzK+wn9+a+9/z2Ob8MNGX1nZNiorqhMOXW3Cl9PriOhHU9KmNABjTraW7eyFqIbBCi3pAdcxdu4lh15nADvYR/tXAWEWgEYwj4DkT1kl6BJA2VOSv+JwAO0cbKKNLEooHU8JcO60w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722790922; c=relaxed/simple;
	bh=kpQlaEdhAW7vK2ragtpelAvJnomK5FZAbYvv0t68cZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMUkHaDXDnyYaYxTsRwlkkm2vw+peDFbrM25HHo56ssLlyf5BbZskv12Y2uF3DSaplK+Z247H1b1R9S3N+qAEPxBBaBKd/fecPUKmq7q49Mw1sLom7vUbq4AfKiPLivrpd9xO72uf73LdBFz+U5X7QC6XJ0BgHlXr+f3hK+09+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yWGLlQ4e; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yWGLlQ4e"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7b80afeb099so1159509a12.2
        for <imx@lists.linux.dev>; Sun, 04 Aug 2024 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722790920; x=1723395720; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pyg7jDsFcnKSN08nIcoqB8ycLlfubfs0gLDzgt2d1jE=;
        b=yWGLlQ4euM5kyp4StUrDb131B4IMO/k1vSj3MPJZ2+oHcpGJIgDbcSYpfBRSAH8ZOC
         EqGaL9pZiV7VFa5KQoudFnqF1M5ENtmba0K+v1A5IXiL0ATUi6p8G4tcQEJAZLIil3Rw
         rNiucyihZzSikEiUto5v1oToh/4n1iggWk4/+c/UOIE0s9ydxddS8BHzw6egt0rvFmDy
         I7/I6rhVLAxWdc6lHjmN0k3hLzjwQNohj297xSUBKf2mlZipc807y6BsQcYkyvLbwQMH
         3qPbzFnYb/lRusbImhPi25S7lBdQ8e+lMpTgFlJ3p/nddz/kgoq4vDy7isBL7FR7ZaC+
         WrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722790920; x=1723395720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pyg7jDsFcnKSN08nIcoqB8ycLlfubfs0gLDzgt2d1jE=;
        b=LGpD4fKW+6ZltdiRgUcmXB34NSWYGB4ZGsk05pbQeNxUHLXKNZgwu2qUkBkkXIOmqH
         xOd4LdA4U/noumV+PpzSAZu+9F82xtq/ptSRSYsCHazm8xdr6GPoXNmXtZ2wx9VcbHzc
         ZvJtqDnvdZavw0USY44fQ4B+73ouFAGvvhqzNiQA17RUW6p6i+jr90cCqVipbNkK86+b
         iEJ49lMvFf0yz4NfW5rWyUp4afHHcEvpETl7A7cf0G3LNBW8ik4oVr3ZhvUvHoMWYYKp
         T+kMciMOBgHdCkP+zqsyIU/F6o3QwAdBaOtfSIZ2hcYqROnlqvlVZrw/mK+aAf14SqU4
         Pubw==
X-Forwarded-Encrypted: i=1; AJvYcCUUu4DdkdqlyaC3jpofQCNzIKTK1s0X9PW9Yzc/zhL3hbhFUinm4w90baMO5F0Ff9JSU3Bq9l4Kh4huPrw7bJNYyZBj
X-Gm-Message-State: AOJu0Yx1LCGDopRLOYVo1p/m2RrZ/Ig0rQ/rqf/FV1BjP9TLcvgcUKbz
	eemjU0Ef7bNCV69+BKxdpjQNmQHrGtWpjNTOoueuIUOfqaYMKg+RgIATLQiOwDzjldnhgyw50Uv
	JZVl5VLMRt/4j/KtaHbRD11xs2boPs0rbZHMr
X-Google-Smtp-Source: AGHT+IG2LqNbcRbg55j/WaygkTsf3QKobNF91cU62zTQA4AWUL9aEIDR4n3Ue6ihWo4DJ9n0K7R2IwfrdFEzsMhFxC4=
X-Received: by 2002:a17:90a:714b:b0:2c9:74f2:3b24 with SMTP id
 98e67ed59e1d1-2cff94142f7mr8483195a91.12.1722790919752; Sun, 04 Aug 2024
 10:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240802064156.1846768-1-xu.yang_2@nxp.com> <qo452qwsquqfumcsvlczotdjvyqu2y6itufglldxrlxjv3ganm@6rvhfye7mobv>
In-Reply-To: <qo452qwsquqfumcsvlczotdjvyqu2y6itufglldxrlxjv3ganm@6rvhfye7mobv>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Sun, 4 Aug 2024 10:01:22 -0700
Message-ID: <CAPTae5LAwsVugb0dxuKLHFqncjeZeJ785nkY4Jfd+M-tCjHSnQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: avoid sink goto SNK_UNATTACHED state if
 not received source capability message
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, rdbabiera@google.com, linux@roeck-us.net, 
	kyletso@google.com, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 8:43=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Fri, Aug 02, 2024 at 02:41:56PM GMT, Xu Yang wrote:
> > Since commit (122968f8dda8 usb: typec: tcpm: avoid resets for missing
> > source capability messages), state will change from SNK_WAIT_CAPABILITI=
ES
> > to SNK_WAIT_CAPABILITIES_TIMEOUT. We need to change SNK_WAIT_CAPABILITI=
ES
> > -> SNK_READY path to SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_READY
> > accordingly. Otherwise, the sink port will never change to SNK_READY st=
ate
> > if the source does't have PD capability.
> >
> > [  503.547183] pending state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_C=
APABILITIES_TIMEOUT @ 310 ms [rev3 NONE_AMS]
> > [  503.857239] state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_CAPABILIT=
IES_TIMEOUT [delayed 310 ms]
> > [  503.857254] PD TX, header: 0x87
> > [  503.862440] PD TX complete, status: 2
> > [  503.862484] state change SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_UNATTA=
CHED [rev3 NONE_AMS]
> >
> > Fixes: 122968f8dda8 ("usb: typec: tcpm: avoid resets for missing source=
 capability messages")

This patch looks OK. However, the original patch 122968f8dda8 might be
regressing compliance
(https://www.usb.org/document-library/usb-power-delivery-compliance-test-sp=
ecification-0)
behavior.
Will send a follow up patch if we notice any.

> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> -- Sebastian
>
> >  drivers/usb/typec/tcpm/tcpm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 26f9006e95e1..cce39818e99a 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -4515,7 +4515,7 @@ static inline enum tcpm_state hard_reset_state(st=
ruct tcpm_port *port)
> >               return ERROR_RECOVERY;
> >       if (port->pwr_role =3D=3D TYPEC_SOURCE)
> >               return SRC_UNATTACHED;
> > -     if (port->state =3D=3D SNK_WAIT_CAPABILITIES)
> > +     if (port->state =3D=3D SNK_WAIT_CAPABILITIES_TIMEOUT)
> >               return SNK_READY;
> >       return SNK_UNATTACHED;
> >  }
> > --
> > 2.34.1
> >
