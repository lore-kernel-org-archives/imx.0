Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC02175A6B
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 06:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071588; cv=pass; b=m04QhQ8zEpc2lNePfve+zJMWGkG9WmEq8zkp3qxbMtIEYVVLy5nNjbHutooYIxOx1z6z10JgWhWhza5U7sf0XCthNq3FYYlWLWop1K1/avr/36r6fVyGdoqoXlkoRyVIE0GMtlWxAazRr2ApTlkxiVmzXA7ldvHuwwzZvFFPKnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071588; c=relaxed/simple;
	bh=w+aCkB7GzTruqjui/BBALB16dGjcRhG19xahcuw2XJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOg3X97m6Unv9z2dJ9/iz00cgVOUccmjwyPoh57qArWi6wv+mI6l7LHcvnj6wdHQWI6XLlYorWFmX4X4NRHiEnrxYRVPmjgK6VRyCuA8RLgc4UWh5QbZ7VWXPLvX036huJXlKzuGu/aFK5MokyXVzOGOamOYOZ52HD3eGWPiIrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kitLFp+n; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kitLFp+n"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so11672577a12.3
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 23:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781071585; cv=none;
        d=google.com; s=arc-20240605;
        b=LvGc6xwrY/ZPeD036jX6mufBBZ2aOaxZYBiuWGfaevmRuWx+F5c2Jg/iZXSaSM0hFS
         BGTpg1g23U6VteXQGd/pn6xa3rTZI1CKGRuzzQfXWE7kt4N1y3G8aTK1D9GDnniMQYoG
         qMLdi/8sDcZvcGRa1o37Jt642bezC66imp3elWAyjPkycPbDMo/KgbZS8I7AbdXDZ/jr
         MzE7YxFDNDDEVSn2gZ0O6qCrqqchVdSgO3E+tQ+UqU8aHXY7ATMj8CIdR5fHiKGsm8ug
         uiJmeN6qQ6Is4VDoQzDsUpA9cwKqah5I154AvgDXxk78dysWZaLPFzzVxyKwAG4UO71z
         JYUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sf27jUZrV/4ePYlo+ltQi/cb6ikm1nezgKuVcZuPbNE=;
        fh=qHquzxqVwOjQHSn8xz34Q6U8BAUDLYgPyT/49MJ46kY=;
        b=Lk9CB8MmnEyuGAwUetM9FMb2qY6PQ6+Kyt3F3rjJ12zzeYWUlyb/2Ao0FGGuyxM/Jb
         hH5u4PIyUiZCn9dMBURHNmtwk89tHglLKBopKrDE4IBmWkD+UbwqXt31Gf35SgPcAQce
         mR/v9Trim56LJyQM3K5Avwzlpaubg9Yi8KehxoXkHmt//IoOcR41tcEmzaW7nNhkZ+VI
         l1r1h38dU6EL4nhb+29BBsekBdUK1nIUHV38X/ZYzLHANG1vAr2JQhl2Y8iJ3j5a3T9s
         832K6g0yHvSunwJ0oEvYNA1k7iJkKO/wqNNOWCHXxTaUs4JVgbLXNqCri0l/+VllcQmj
         tmMQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781071585; x=1781676385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf27jUZrV/4ePYlo+ltQi/cb6ikm1nezgKuVcZuPbNE=;
        b=kitLFp+n/5E8oGy5qgfzgKjXBqbUdn+xQH2WB1uxDggD1T/Kil6izbHORIRE65iMug
         E+/O1GVoDxaWTtc657BLs4X3TQfLfqqm8Mb7npw1ignYSOpLcmzjMthnSgZyddxKooUg
         28WZIOkWDWB09uLD9472AzqOUIV7lYf0GAaJtgvLNmzLb0/To9qHLSL/eW15iZHFoDIv
         WDZT5HNY13z2MxqiRGcQxblBKeYTlZVIrhcG4tpRLMEqJ/oF9fwKvulqQXYf3AmObM0H
         k6pyMnlgz6g7OHFkFg3EumZjRnJSwnBso7FpIgZBahUHTpRr/krJ0gFFMAbyjUXXg9WO
         9Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781071585; x=1781676385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sf27jUZrV/4ePYlo+ltQi/cb6ikm1nezgKuVcZuPbNE=;
        b=YIbxMBQA1jW8Ui5/Lv4lPvOiN0Tkqp535ufl9GfodtWac85KVoj0Yj+oYDZVwovApg
         I0bjL3hPuQwaCrQ5ZwDHogXT8q9F+OH1KD/f5KuNrKmjh7NHi2ICcGAjfKLfu8IOVnsi
         Bu8JTQBZrq5wADNbpBJA9qfqwQg5ZaDRJqhzEgSz94lPy1tn9fe7bijAIJacN+gtv3Ph
         1kmFN9ocBHvmaAcXNewE4BMVlUShYSPVjGPB7W6cDtJhvVEo6/L1CHP3uRJSej/wAhEb
         x3EGInJpgRj0dGvpooYe0YZaK1xUYZfhyYKm7TQPcnH9l3uB49OymdwnI/nYymi0nTXg
         s7Yg==
X-Forwarded-Encrypted: i=1; AFNElJ9PQqumUdGtKbLOVJ7JRXFGy5Jp/OEhXzRztWT7OW/2Dr06sR0AhcStbEUpko2apHmqgDw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuytlHx1wUmn8Q8TPtsJqAhVeedEPdlxj+epEiDvkDqRoMpqpq
	68+HofDaKV4i6UnCZGLp+JZlTDBMeFgtDeHaPJxlaSJpLfaqg3KdZKJQm3wUgR0m/LwSI7WFH+t
	hJ8AXUE0Cin8cBpk4/g8JUuqJlbGgxsQ=
X-Gm-Gg: Acq92OGsiPpTw27GRXbHs/OAZIEgzRXDmeKna/QjV0yupF79sLdCGmwcD0/W0lA4jRa
	1kcVJzDFX7x6R0M1apVnvY8/ZDPwG6ybhGv8Z1lgtv4Mn/eotb+Ne3BWS87zd6DrLu9DmLqyGY2
	IW1luWa/FQonr9PpbHXo8/zj8vpQoupv2PXGILcX3CGHl1gTl173qF6md+EpA2mVVaEkNaxZ/CJ
	Qnn7oyTaDygy1vMZvsB9CJ7Codq42pYH1QkMOo71DqbPLwM50U/csjffERIqFVJ144ToRmPPqxP
	vANN2zoNnX+w5jdJZLT8QcmJPvbZNz5OL/gs6b8gRXfc3DVwxvi7HlziDhtd/SL5jWvWiKpgZ7B
	lXfOEjVNM0+JOD8JHI77pBkDkTp9BdLV9FzPwYV3qvqtezeyqDsTSe3PsRRnMCire/pbuP2BRUY
	WvfQ8=
X-Received: by 2002:a05:6402:5216:b0:687:1c98:a19a with SMTP id
 4fb4d7f45d1cf-68fa4f3d294mr12615404a12.13.1781071585304; Tue, 09 Jun 2026
 23:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609223717.41670-1-rosenp@gmail.com> <20260609223717.41670-2-rosenp@gmail.com>
 <aii6RX0321fJV99W@SMW015318>
In-Reply-To: <aii6RX0321fJV99W@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 9 Jun 2026 23:06:13 -0700
X-Gm-Features: AVVi8CdoKJGr2CY6Ts2b1YU7fzVQIRGuXCKSNkOV6YDrgIls9cvowFQd_CqCISg
Message-ID: <CAKxU2N_KcPHAAd=JO6CQuJMqs3PsQd9HBtdW=KbLGOKbfB4H1Q@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] serial: mxs-auart: fix cast type for of_device_get_match_data
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-serial@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 6:13=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wrot=
e:
>
> On Tue, Jun 09, 2026 at 03:37:14PM -0700, Rosen Penev wrote:
> > of_device_get_match_data returns const void*. Cast to unsigned long to
> > avoid implicit integer truncation warnings. All the data parameters are
> > correct anyway.
>
> It is not worth to fix it by this ways. cast void * to int/long is not go=
od
> at all.
It's just a compilation fix. The same solution is used in many other places=
.
>
> struct drvdata
> {
>         enum mxs_auart_type type;
> }
>
> static const struct drvata chip_imx28;
>
> &chip_imx28 as drv data.
That's a lot of work just to avoid a cast.
>
> Frank
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/tty/serial/mxs-auart.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-au=
art.c
> > index 697318dbb146..de97c0f74e7d 100644
> > --- a/drivers/tty/serial/mxs-auart.c
> > +++ b/drivers/tty/serial/mxs-auart.c
> > @@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)
> >               return -EINVAL;
> >       }
> >
> > -     s->devtype =3D (enum mxs_auart_type)of_device_get_match_data(&pde=
v->dev);
> > +     s->devtype =3D (unsigned long)of_device_get_match_data(&pdev->dev=
);
> >
> >       ret =3D mxs_get_clks(s, pdev);
> >       if (ret)
> > --
> > 2.54.0
> >
> >
