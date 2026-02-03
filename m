Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB7B392836
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 07:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105058; cv=pass; b=d19fmir82gNTBs7IjScQuPqCVxfi5sxCGLpeVNAgsh223ox+ZwSw98Xu+Kh+7Qq/rAa+ZasCBqgQVCeIslA+nOAQyn5IZmPjfTrMFYBGndk6cz4eniNagKGM0N01sac8PEpue7WAeq6B5PpaaYczaqjn8+YUC/RBVN2s4akW/So=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105058; c=relaxed/simple;
	bh=z3uO4wDS4x6z936FnI7cggR5KRAC0BgutNuhO1txo6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGvYvwB1+JCd9AqKu6aAIUKcjnxdlLJ2IpctRcuvMm6xsGNyKdSSqTO42z7wej9O6IH2a0DFz110NQxgvbp1FyBDbLaoWLJ79oj/38zFDXxdkZYAlkvyCPArnsfQYiEiHCA4bfQCrUcxRdWdaNFgbwRjO+kAnI0ycnbBK/Vbow0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI+QyNXi; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI+QyNXi"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12460a7caa2so8078376c88.1
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 23:50:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770105056; cv=none;
        d=google.com; s=arc-20240605;
        b=fnmIUbQz9IBGu1HwoEshVid7B4Jh93Kdsrp6wasRzDfn2FLryZc4OgTb4+OXI4IhLA
         q/krCLfitop9hVuwInnBlhIJn97UW93iV8Qmq02PfEt9WT9RF7AJ7yYNVko3jueP96hk
         Qk//mollsHEE368pGFHfXbK9Xcmj1a1Gj8f+mqMEq7sjp2NEJBJIho6/MC6nuHyNrgCh
         pi1IU1XNaEQlrh5EKQziMfTegeWi/BYNcmETNzOlfeL8x2pQXdzC3ATN0MGqvCShof80
         7JwZGg1LWNfBULLQzNoQIIXPtv1M1a5mfUv8loIx2xUBaDhwtrsFQERlnK59DnauDlNk
         nq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=;
        fh=ke5A7ssMF4Q4lLzVfNB6/fnulQDv4IPd+fSc+9fmwKI=;
        b=UtNvvAVHZrHTM8AG1BfjIpwRXHvmUB3+YTsBlOD1a7fLHkcmXbpjawte4tUpSESdFE
         88jnkaNI57ufbiJbp3U2F9EgebsQTo+3H+XojoakJMRCETwpZ5SZV5CBLC0suk0htwq+
         ev8MIsVtZ9njL4f239TsluWFmmYAidLzHQCynM9dvtDkry32GQKiVmZJ0mtVrt6NDilU
         UE08Ob7YKuX4jVzZCrgijIolNvn0aUogalPpRruwYC2MKxU40C9++4SkRIJkxlA0yeBQ
         fVtEjFjjfrj1ZA9SvzhQjSLwhgoq9RyWAygYk+J56HvsGqihzrelbgOT4Bt/QILe6c77
         JVxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770105056; x=1770709856; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=;
        b=AI+QyNXi5QWtq09Ic7WN221+GvU7wGKVpyEACdz8Xbb7vlGlkKKprIuR3mtRt2mbtY
         RoIdgeCsi6lDlZSINX6Dnbllo77F1ees4EcR4TA5XIkH0rrxL2BSOfrkCHd0nAsKqfC0
         BfpaxiGS24UyX+DxtvhCnePoM+7xNJ+RAQpw0R1V8CfFEdknT0cOqoUD99jumgcy+BNh
         4LFjMg8bFqfjELLLrVLZooyL3zYnV+G1FzSUQ6BPhbqxgDjy0gcDDgFLGHVK48B7i0Nd
         h4PU2RUiqB0Zjd6qrQ/qIfW1shStuFodx4m86bcM9haJ7bWO0zGzAYbNYmS/JNaQ774B
         w/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770105056; x=1770709856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dzMuEZYMn/hj9SYdAXLTnPBjRskZLNxUP6ZIZEqwunk=;
        b=IAMrm9rmREbbPNXOESsJ4/wWpJfqYqQwh8Bfvpg1oMn3MUtiFnbMiC6FXNJRvpUOyn
         MWSWnlgw0hlRgvEe9zJqxX506v2ekdlz7EICIQU/4Nv8zorvaLMLLCX6uFygdqa+2n/m
         TRHBj8f4N0nxQSIrALdWMoQckPyGs5qDCe0a0yNX0bT0GSeL918Z3KxYQ3/2Ga7WzI4W
         CyaYaoNr0D4sX0zEZs+ftyaxW4xnIL969e5X3siPbztxsPDmOHqiYdJePtadas8XXJrl
         R44daV8OrD6Ir8ImVVXhQ186EtXy8VoETwX3VRS7gBWSA/dDPgQyJ/JHJOUPydo2Xy1F
         782A==
X-Forwarded-Encrypted: i=1; AJvYcCV2HWaSPJCGu5qMLDuPbRWJmyoPFDW0tF47trS+gB2EVdSM76z9wOSYdNhETMZLiNdFCo0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHRpe10OBRl/oSiKqfz9JBZbmT7S3NNwa0Fm7SQrA/eOCemMtc
	TDenJWT76Y5XLd8dmVKHdLYeH7a+7h/FSwGBdMjlwm879U4Q8swsO2to8Ju13PaVduy2QFwo79r
	iBTckt0V5RFcHbLfYyUOisnTYVxqpdCU=
X-Gm-Gg: AZuq6aKxc2t+LX/dP+Kigf4oF0AFHPVrg/ScedapWT3qvDCRpZKMbXWSkDl8lM0CyXP
	cS9HaXMax5bD2HIWfR4489GczFzZhjab2v9Y7z6nfeAqw0UymYMZT8Vi4HIQrJz1qLwCXWvKXTF
	nlj1kc0rbfSQTZ9b5JkTxkIalGvYuuVeBJd6JmbTvRZL7QI5TrvqiGLKLnl6s5LAe2SiXRAdAQ0
	zgvhbEkWBxzDhh7S/YO6bRzE68PKwp4smRyvWMqCTRrWgy1+7J9KBBYJZbAaDKEGExL46mrhgUm
	xFY6y/CJv5qOMIeAI8TK0oZ0qUTGTuzBylJ8RoHl+1003hC9oDnVBLoOd0woKR61S7QKWAYpc6F
	UkfBN+isRGA==
X-Received: by 2002:a05:7022:41e:b0:124:9e46:82fb with SMTP id
 a92af1059eb24-125c1010d65mr5955626c88.38.1770105056409; Mon, 02 Feb 2026
 23:50:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129-imx-rproc-fix-v3-1-fc4e41e6e750@nxp.com>
 <CAEnQRZA-nMai9-CEdMqnr2drqBRXXPOKE3a+_3j4S_=x-bM0pQ@mail.gmail.com> <aYDN6X0WVT9nV8fg@p14s>
In-Reply-To: <aYDN6X0WVT9nV8fg@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 09:53:38 +0200
X-Gm-Features: AZwV_Qi4gqYVwTTFEPdJsETuT6WyCitJtTK7rW3QVszmKRnozagvutFj3QflZ74
Message-ID: <CAEnQRZBVhijvq0VRTKXpW7va2Dxprzz-cnvvj=z90FPXRK+TSA@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx: Fix invalid loaded resource table detection
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Frank Li <frank.li@nxp.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 6:16=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Thu, Jan 29, 2026 at 06:02:21PM +0200, Daniel Baluta wrote:
> > On Thu, Jan 29, 2026 at 3:45=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nx=
p.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> > > resource table even when the current firmware does not provide one.
> > >
> > > When the device tree contains a "rsc-table" entry, priv->rsc_table is
> > > non-NULL and denotes where a resource table would be located if one i=
s
> > > present in memory. However, when the current firmware has no resource
> > > table, rproc->table_ptr is NULL. The function still returns
> > > priv->rsc_table, and the remoteproc core interprets this as a valid l=
oaded
> > > resource table.
> > >
> > > Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table()=
 when
> > > there is no resource table for the current firmware (i.e. when
> > > rproc->table_ptr is NULL). This aligns the function's semantics with =
the
> > > remoteproc core: a loaded resource table is only reported when a vali=
d
> > > table_ptr exists.
> > >
> > > With this change, starting firmware without a resource table no longe=
r
> > > triggers a crash.
> > >
> > > Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook fo=
r find_loaded_rsc_table")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Changes looks good to  me >
> >
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc=
 *rproc, const struct firmware *
> > >  {
> > >         struct imx_rproc *priv =3D rproc->priv;
> > >
> > > +       /* No resource table in the firmware */
> > > +       if (!rproc->table_ptr)
> > > +               return NULL;
> >
> > I wonder if we can make this change generic because it should happen
> > on other platforms also.
> >
> > Maybe something like this:
> >
> > remoteproc: core: Only copy loaded table when valid
> >
> > Copy resource table in memory only when:
> > * the current loaded firmware provides one
> > AND
> > * there is an explicit request to have the rsc table copied in memory
> > via rsc-table
> >
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1281,7 +1281,7 @@ static int rproc_start(struct rproc *rproc,
> > const struct firmware *fw)
> >          * that any subsequent changes will be applied to the loaded ve=
rsion.
> >          */
> >         loaded_table =3D rproc_find_loaded_rsc_table(rproc, fw);
> > -       if (loaded_table) {
> > +       if (rproc->cached_table && loaded_table) {
>
> But we would be doing the check for rproc->table_ptr twice (->table_ptr a=
nd
> ->cached_table should be the same).  The way it is currently writting for=
ces
> vendor specific implementation of rproc_elf_find_loaded_rsc_table() to do=
 the
> right thing.
>
> The merge window has been pushed by a week, giving me an opportunity to m=
erge
> this patch.  Should I do that or should we continue discussing the best
> approach?

Let's go with Peng's approach:

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
