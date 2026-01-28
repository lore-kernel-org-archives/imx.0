Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FB331DD97
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620754; cv=pass; b=UWAl1+7155DzE3OQ2quPMQQ5skg8KHyG4Ngptz8n4UHEk1MVq+acxGbK7gSd7j8TiDP0LdrKxLsp9cmcBdHmN6UVvKnikzKLBD26W9KAsmbyJu5toI1/yEmcpgtFj1OixE+92k7//L+nGuJmO55y0CRRBoHU5Z9YyL7ZicJ+Riw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620754; c=relaxed/simple;
	bh=HU+2qV9g/s9S77R3j/OFeZGFjqpC0FxcFKPAXfJCMbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBCjDf7xs3ztKvHUe//bbJQyWm3j9UhTSQHXP2PZ7WVJvfA21MAHYGOsfXvc66HxP1JhLw28oxje8I9XiP3UVyQ5k5hTRsBl0kGUeTH//eYSgFJNFLPOlOemBWmSWd6LkKtaUxt4GGcyeYjC9l1fedrsOvzPrJ6/rz/hFjh6ib4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSHa7yiZ; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSHa7yiZ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso164079a12.1
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 09:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769620750; cv=none;
        d=google.com; s=arc-20240605;
        b=iy3UCPy12eAm5qZ001m5WkaVOm3m/ZyQPXrKQhA9RjzXT9GzBp+slJadp/oHkIro2c
         aeniOawyGO2YDL5fQ9adC0tp04YO936yE5B/5UFzfkLd1Kp0QYUcdFmwZH9GOTyA+XPl
         gDZUpL7rTYlmOmAL+7p03CqMT8m1mFfNEBHwJL+IMNN6enbViKSdDMk+fmawQkELNOc+
         3DkuS0zPM2d8hvm3YRTMUhuGGXO2B0vFrb0bX1qV4MZZKE7uM0zrfC+jtziS4w+nlycg
         /T9xgs6jIoz/2bc3UaBpeWSUpBxi4bncuwL/kPiSy1gl94mvCXD8ExOHkwJCqwha3I5P
         1Dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=;
        fh=e+0cS+aNy9JAo3oGtnmilx2+rwtCfJ0kc2a6ZWZtKpg=;
        b=ip6FetgVORYVyFuT+euaE2U0UUhdUVUn7M8KBY3GuaUyO81giDS3I77C2q374MCWCj
         MC57UrVWP29sU5YriyCDV088dB1/PT/6dNgXhri2RdwqTkvuTKE6TXlGLFS3QolPNa8W
         l0rEuiCIQ4VCuv82ONwpNog1cy0R6SKZUyBBUXtfJh+D1YGGDo2l+63k94MhTIhPjge+
         KLjbLqNQtE5A0lWREZE3SeBdAKaqaKsYxuWPVX/P034wcAn5GerpTBHYRXK4b0I/GYhi
         UiUuaPxpykA9KKb+fnakEEmcSfQOiwlbAsjvks4pDNWd8+CCTUoWMYo+LP2jyGQwe6Ox
         AjYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769620750; x=1770225550; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=;
        b=tSHa7yiZ4C5NXoc5051wNO1kSI4Daik/dLB6yJIZHB7eFa55a2NNylaB+MmjjrMSKO
         3I6VY6XjeDE/DWrf/QtNAmr+rtAB0j3YXtFO/bRXieFgSg2Q+q97+0MHhonV6RY3xyzA
         SGfTiXEw/j6qTHZOAqjc7R4uuptyuSbUii835QUaIWW0OpTV+ychBka3V0NLSLR9nNg9
         gfYM9qNdEmx/3Mj4cpewtOp4heQJzAFHxycRfHgBo50XaRHk5v6z1m1YXQx/UNcEfmeY
         oYjAfyaL1onZhJ9bnqGcYJ5Cv3pQbl2nKt5VjKmSK9A7eTrOZFvxuKZN+dRYYKvT4BBt
         NpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620750; x=1770225550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6U2T5XiBkgtqqoIWwFJ9MeumwoEccaKOI8Bpx3K3Oc=;
        b=Tu3XMG+h7LTydctbIHvjV7eYc1kChRmndgHt1yRE1YIBNSTNtLoLhl7rUiVX4AhgSd
         Y8sh60zFlgaEwWYeR13dq3JVi9gb7vpJSiPQKDwgUSU7I/oedWvsqoC6BvLhOR8gQk8x
         qyspj4uNxEVhTObZEy9iaIR7gUeeX0pfyCvmcDR+bM7SFBvqreI4kKUqTLOaCKLf5/AA
         XqEcglWyoE2B8sAnqufcx5T6FneG0bc5UPxH9vhTvfjwhV1/MXkz/JaphUtwGwPvB8Ic
         tMsqI4EVm0TQePaoYwYJP93Ge1B+bBrx3afDcdAvCn27jVL+0Gn3691uLkfhvY4fD5NO
         t/ug==
X-Forwarded-Encrypted: i=1; AJvYcCXqW5XZjoV9awdjdjjHoleg49H8AIjNxFT5uAcjLpOqf9z1SFLCsAE6i6l9ZtjPPdtirHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6NooDsAteYQTHuQRdhrH2tnZBsLQaXZUXH2K3u+YJq20RYjJm
	F2TdoAjhOSwmj+43qOR5RVOvwPMFmOcX7HoR7JM/XyGAPup+nme4toVp3Z4aqG+MDMoJcvhWPcU
	lFJJSNoK+8jb/dvwAl3CPnyWQYGJQgWKJpL3N+v+TnA==
X-Gm-Gg: AZuq6aLfCf6xHyFMZ6oLg+LZJHWST0Acw5QRDtUwuyvM/45t3rEwt0R0fLwI9nKYOvo
	OjeweNTxoMGhWj1cYS7SbEt4PqErTMQvhAnYyMz+crUA5FFsE9a1xiP1mToryzaaeKIxCVsbf8I
	BFqBC69s+wI3qFO+AtJoTckP/frvbz4+2XRo44Js7KP+jpFQcC5qw05FFp9iz8ITN/2qRjbasqE
	AjR0LWL6Q8YKaN7J5a73RJ6vu+NOWguNjwvsB/K6O40jz2y1XHBCxCRui6bk3rv7WoKnl/wY66E
	92Dpe1mjS6CBWcSzW5ZyahU3btEDGQ==
X-Received: by 2002:a17:907:9620:b0:b6d:73f8:3168 with SMTP id
 a640c23a62f3a-b8dab15be8bmr411653466b.3.1769620750053; Wed, 28 Jan 2026
 09:19:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260127-imx-rproc-fix-v2-1-7288fcf74385@nxp.com>
 <CANLsYkznMVh240wMUZGayJHRzsUV-NNTiU+ezpLt3rjcwSn5Wg@mail.gmail.com> <PAXPR04MB845923F8485ABF7DAEA390CB8891A@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845923F8485ABF7DAEA390CB8891A@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 28 Jan 2026 10:18:58 -0700
X-Gm-Features: AZwV_Qi18JCueG1u3J70NR_1Vvtj-phyG744RAEAtU4_AnPA_NPI-ZDjNCfkuhc
Message-ID: <CANLsYkyrz+A1iEabGZ6rFybFo4=mM+TPVDRSckFB2YUS_7aKow@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Not report loaded resource
 table when none
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jan 2026 at 20:22, Peng Fan <peng.fan@nxp.com> wrote:
>
> > Subject: Re: [PATCH v2] remoteproc: imx_rproc: Not report loaded
> > resource table when none
> >
> > On Mon, 26 Jan 2026 at 23:51, Peng Fan (OSS)
> > <peng.fan@oss.nxp.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > priv->rsc_table is not NULL if the DT has a "rsc-table" entry,
> > > priv->indicating
> > > that _if_ there is a resource table in memory, that's where it should
> > be.
> > > Function imx_rproc_elf_find_loaded_rsc_table() is buggy so the
> > > narrative about a previously running FW with a valid resource table
> > can be dropped.
> > >
> >
> > (sigh)
> >
> > You apparently did not understand my last comment.
>
> Sorry about this. Does this looks good?
>
> Daniel, Iuliana, would you please help review?
>
> remoteproc: imx: Fix invalid loaded resource table detection
>
> imx_rproc_elf_find_loaded_rsc_table() may incorrectly report a loaded
> resource table even when the current firmware does not provide one.
>
> When the device tree contains a "rsc-table" entry, priv->rsc_table is
> non-NULL and denotes where a resource table would be located if one is
> present in memory. However, when the current firmware has no resource table,
> rproc->table_ptr is NULL. The function still returns priv->rsc_table, and the
> remoteproc core interprets this as a valid loaded resource table.
> .
> Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table() when
> there is no resource table for the current firmware (i.e. when
> rproc->table_ptr is NULL). This aligns the function's semantics with the
> remoteproc core: a loaded resource table is only reported when a valid
> table_ptr exists.
>
> With this change, starting firmware without a resource table no longer
> triggers a crash.
>

Yes, this will be fine.

> Thanks,
> Peng.
>
> >
> > > In this case rproc->table_ptr is NULL because the current firmware
> > > does not contain a resource table, but the remoteproc core still
> > > interprets the non-NULL return value as a loaded resource table and
> > > attempts to memcpy() from rproc->cached_table, leading to a NULL
> > > pointer dereference and kernel panic.
> > >
> > > Fix this by returning NULL from imx_rproc_elf_find_loaded_rsc_table()
> > > when there is no cached resource table for the current firmware. This
> > > ensures that a loaded resource table is only reported when a valid
> > > table_ptr exists, which matches the remoteproc core expectations.
> > >
> > > This issue can be reproduced by:
> > >   1) start a firmware with a resource table
> > >   2) stop the remote processor
> > >   3) start a firmware without a resource table
> > >
> >
> > Another sign you did not understand my last comment.
> >
> > I had hopes of merging this patch but the changelog is too garbled to
> > be salvageable.  I suggest you ask Daniel or Iuliana for help.
> >
> > > With this change, starting a firmware without a resource table no
> > > longer causes kernel dump.
> > >
> > > Fixes: e954a1bd1610 ("remoteproc: imx_rproc: Use imx specific hook
> > for
> > > find_loaded_rsc_table")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Per Mathieu, Check rproc->table_ptr, update commit log
> > > - Include R-b from Frank
> > > - Link to v1:
> > >
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > lore
> > > .kernel.org%2Fr%2F20260122-imx-rproc-fix-v1-1-
> > 36cc64369a40%40nxp.com&d
> > >
> > ata=05%7C02%7Cpeng.fan%40nxp.com%7C781fb4227e024211e71c08
> > de5dbb609e%7C
> > >
> > 686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639051256532
> > 530786%7CUnknow
> > >
> > n%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAw
> > MCIsIlAiOiJXaW
> > >
> > 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=0
> > 3sG8la72ysD
> > > ivP9SMmA9Ry2YaiMvCjsHWAWaGFOVQw%3D&reserved=0
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index
> > >
> > 375de79168a1c8d11b87ac1bd63774a3feac106d..f5f916d679051936
> > 0f446f063e09
> > > d018c5654953 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -729,6 +729,10 @@ imx_rproc_elf_find_loaded_rsc_table(struct
> > rproc
> > > *rproc, const struct firmware *  {
> > >         struct imx_rproc *priv = rproc->priv;
> > >
> > > +       /* No resource table in the firmware */
> > > +       if (!rproc->table_ptr)
> > > +               return NULL;
> > > +
> > >         if (priv->rsc_table)
> > >                 return (struct resource_table *)priv->rsc_table;
> > >
> > >
> > > ---
> > > base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> > > change-id: 20260122-imx-rproc-fix-e206f8e6e477
> > >
> > > Best regards,
> > > --
> > > Peng Fan <peng.fan@nxp.com>
> > >
