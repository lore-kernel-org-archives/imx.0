Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5561DC99C
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 14:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736174202; cv=none; b=i9e42oHgkBGRLPtVvrLCZyVC+i00epNoe91Ri/R6f+qpUn36EDcqrcwEriX5XhfdPe45Si8b+9EgRQ5zzn7B1whlJunz8dr8rqWDj1v6YM9g28rFeq/A6HrkHo6Z9R43NI9MjbHVoCz8TuNC35oSsr0DVbDNP6Mc/ZPcO6Wd9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736174202; c=relaxed/simple;
	bh=ZSqQEYHxQ445ycJU7lyhqN/qpjOmoRsXlbym7bsnDbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LryXJJ7jdcop61PKTglthZXUQvI0D+2QG7aX4oWxKCL8joRasquG/r7uIHvp01oX4s/AnaMmTTrOirdEFfMrRPZg/v7XK3qqSuPPU4ug1rIA79g6PdWcAeeTSmraRkSh4irLm8R5NKf8c33nxSeu6O4ZJpUnebDSm36sh39Klbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnHWbTvu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnHWbTvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736174199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h5hcIYBd2cFpQ/iFdFgXHOmNme6Kj/cPc06DAfBxeQY=;
	b=gnHWbTvuYwB73wuZpc2v+QyMuD1BisfdTGAb0IYRlfFeUd78jneoerh8mTXOJ1JuH+3oZf
	tPHE1OKvqHZq4RzUtcyy01oRU6NZhfLt2w3FEOUuOnuxFmxZNU+uMV+Ovhm7Z51s2wFjgU
	KovJMLbHGvgMwHKeXTGTmb37wx8xa3Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-v1lylwRtMiaRh-LxMOOvYw-1; Mon, 06 Jan 2025 09:36:37 -0500
X-MC-Unique: v1lylwRtMiaRh-LxMOOvYw-1
X-Mimecast-MFC-AGG-ID: v1lylwRtMiaRh-LxMOOvYw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-436723db6c4so82338625e9.3
        for <imx@lists.linux.dev>; Mon, 06 Jan 2025 06:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736174195; x=1736778995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5hcIYBd2cFpQ/iFdFgXHOmNme6Kj/cPc06DAfBxeQY=;
        b=lhKpFS1KOahwlRd2M+FtB/UZXb3qmoU7AtsK0RM2CQoBb9+Q+P3RV5eBuu2dFyYVTb
         XmNhNm6kBoCjwDKOve/XfGq2XQxu6OyL9dO5/vrX7l1ieQ4K15YEUORCqKg7L9GFwZpb
         wCuNRSHKOJp0mTxL7BMLWZ5nBJoPESA2Vwi5QTiS5lBSM81RMa94vhAoQSn0i6xNIpAj
         KT5UNVo6EHfxYs49Xq4rzD5EGoav0uo4YcdC3IJ9FOsXuvGSEoFUlybpjzk0Z9MmnSe4
         cA7Nmma7JzA5qAiyvNGEmeRCcQNrilA9fEgVri/5kRQvSy2Z323IPEvCFZRNvi2kx5M1
         8sew==
X-Forwarded-Encrypted: i=1; AJvYcCUTST5naGcMfod7C4n1qCpd6i5lSiz4LxRKym0zxJdfR6qbP7ArH7vYJuQAdIPN8U7b6Nw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIVG5yg6OuALBFjqcl+cXBXrd+biVZkuRFVA3SoXj6p4PB0/4R
	JUGImqJBC2m4zhhaxJRG3JF/njvhQXcYr8GddKTv53Fy3Zz5qIoiGT1rjZtd9CM4coIHRSICOTz
	9qQZ8ssg2K0kylUg6MPibBK7Xmrj7DWd8zPlr3LRXsDBeoywfDQ==
X-Gm-Gg: ASbGncvoAyQz6mP9anHarKwXOoUOMP0MdCdSe8sAzJbUyVtEsC2WgHpAhR8bRokE2hZ
	ntqQ7GjHPV6BicO5nJL2Fyj3KGfQTMEkmWj0kZ4eg1iSxVeHmPLEmGFa4eUBYF+xLBIDhvmE7eW
	oc4yW5oo6jBtUVCyGv92EoGzjx5+cZuS/irynN+9ZI2avJ8HQGSbfkk9LplEJ0L4xDMENpyHfem
	Z7MLa97vPl/wA9Jez7+drtLyX9B0GmX
X-Received: by 2002:a05:600c:1990:b0:435:294:f1c8 with SMTP id 5b1f17b1804b1-43668b93834mr397724255e9.28.1736174195193;
        Mon, 06 Jan 2025 06:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0zUq0wMUNH4AGrWwr5yK1Wt7AJ8lyLbtSAp+NItR7fypEguExnUJqnsC50MI52YtRVFYQdg==
X-Received: by 2002:a05:600c:1990:b0:435:294:f1c8 with SMTP id 5b1f17b1804b1-43668b93834mr397723965e9.28.1736174194695;
        Mon, 06 Jan 2025 06:36:34 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661218f43sm573410285e9.19.2025.01.06.06.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:36:34 -0800 (PST)
Date: Mon, 6 Jan 2025 15:36:33 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Abel Vesa <abel.vesa@linaro.org>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
Message-ID: <20250106-fabulous-tapir-of-acceptance-c4e3e7@houat>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
 <20241217-brown-wapiti-of-promotion-e3bec6@houat>
 <87bjx2tf3y.fsf@bootlin.com>
 <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="l2x26wlw7urnozbm"
Content-Disposition: inline
In-Reply-To: <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>


--l2x26wlw7urnozbm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
MIME-Version: 1.0

On Mon, Dec 30, 2024 at 05:22:56PM -0800, Stephen Boyd wrote:
> Quoting Miquel Raynal (2024-12-23 10:43:13)
> > Hi Maxime,
> >=20
> > On 17/12/2024 at 13:47:53 +01, Maxime Ripard <mripard@redhat.com> wrote:
> >=20
> > > On Thu, Nov 21, 2024 at 06:41:14PM +0100, Miquel Raynal wrote:
> > >> There are mainly two ways to change a clock frequency.
> > >
> > > There's much more than that :)
> >=20
> > "mainly"
> >=20
> > Or maybe I should have added "on purpose".
> >=20
> > >
> > > Off the top of my head, setting/clearing a min/max rate and changing =
the
> > > parent might also result in a rate change.
> > >
> > > And then, the firmware might get involved too.
> > >
> > >> The active way requires calling ->set_rate() in order to ask "on
> > >> purpose" for a frequency change. Otherwise, a clock can passively see
> > >> its frequency being updated depending on upstream clock frequency
> > >> changes. In most cases it is fine to just accept the new upstream
> > >> frequency - which by definition will have an impact on downstream
> > >> frequencies if we do not recalculate internal divisors. But there are
> > >> cases where, upon an upstream frequency change, we would like to
> > >> maintain a specific rate.
> > >
> > > Why is clk_set_rate_exclusive not enough?
> >=20
> > I am trying to protect these rate changes from subtree walks, I don't
> > see where setting an exclusive rate would have an effect? But I might be
> > overlooking something, definitely.
> >=20
> > ...
> >=20
> > >> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core =
*core)
> > >>  {
> > >>      struct clk_core *child;
> > >> =20
> > >> -    core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> > >> +    if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
> > >> +            core->new_rate =3D clk_determine(core, core->rate);
> > >> +            if (!core->new_rate)
> > >> +                    core->new_rate =3D clk_recalc(core, core->paren=
t->new_rate);
> > >> +    } else {
> > >> +            core->new_rate =3D clk_recalc(core, core->parent->new_r=
ate);
> > >> +    }
> > >
> > > Sorry, it's not clear to me how it works. How will the parent clocks
> > > will get notified to adjust their dividers in that scenario? Also, wh=
at
> > > if they can't?
> >=20
> > The idea is: if the flag is set, instead of accepting the new upstream
> > rate and recalculate the downstream rate based on a previously set
> > divider value, we change our divider value to match the same frequency
> > as before. But if we cannot, then we just keep the old way.
> >=20
>=20
> The exclusive rate code could support this if it doesn't already do so.
> If you call clk_set_rate_exclusive(child, <constant rate>) followed by
> clk_set_rate(parent, <new rate>) the core code should try to keep the
> child at the constant rate, or fail the clk_set_rate() call on the
> parent. It should be possible to confirm this with some KUnit tests for
> clk_set_rate_exclusive(). Similarly, if another child, child_B, of the
> parent changes the parent rate, we should speculate the new rate of the
> child_A that's protected and fail if we can't maintain the rate. We need
> to start generating a list of clks that we operate a rate change on to
> support this though, because right now we rely on the stack to track the
> clks that we change the rate of.
>=20
> Initially we thought that we could do this with clk notifiers. That may
> work here, but I suspect it will be clunky to get working because clk
> notifiers operate on struct clk.

I think notifiers are great for customers, but not really adequate for
the clock drivers tree. Indeed, you can only react to a (sub)tree
configuration using notifiers, but you can't affect it to try something
new that would be a better fit.

Like, if we have a PLL A, with two child clocks that are dividers. B is
initially (exclusively) set to freq X, and then you want to set C to 2X.

The best thing to do is to set A to 2X, and double B's divider. It's
simple enough, but we have no way to try to negociate that at the
moment.

Maxime

--l2x26wlw7urnozbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3vqbQAKCRAnX84Zoj2+
duj7AYDidThds1LFflb8OweKnRrNPu4M0tpfbKNRxlViGeUwfGeosS89X8zOl5WP
yBs8cfoBf3W2e/SASrJLpQctBMdyN2XKiw8Hpa9n9cLwlnq7mQteUYczwt9dWEyp
r6A1YHUBOw==
=VbDO
-----END PGP SIGNATURE-----

--l2x26wlw7urnozbm--

