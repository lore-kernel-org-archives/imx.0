Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793092767;
	b=MprUoOj86s8mgkSZRGylmSY9uRNln3XkTl0X0+0I4OFM3TgUEBm5daNV0ew/YTJH7jlI
	 vIyh0ogWwznu0BW5tyJZDF6/fE5LW2pljsOvmPXurYDOKOV/i8pugBhWNcsGjpBC5vgHY
	 /+nM+xVIGmqgW2xx0bSPzGlCoDs9EFaQ0fgfbQ4RXeiYIiOoYCmV7tjlLAlbR9mKoUz4S
	 bx0yLVyBDSWrXw4hj3AwHxMTljukfU+d9foPC2nZXTiVzbmZ5dsm2HY0qCzAcSmUoTRSF
	 S8a60cKl/ME9B4qwhaAAbMTlqdA0vCrlwCTIYs9kQeHgSlf0Z4kI1+sE1HWaD1jUg7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QG+IwVQ9grDIq47IKAf02fmU2aVGD0WubOXaYAEOrr8=;
	b=BA5JJikmZu9ZBtpgqHq0MyiNIR6TCObvMLdzNwaiAs9HIlZGLVE4eWYZyNl4GOiVXpFc
	 jC0JGIyVndaI6FYkbZ/BCrU89lsQ1K24WtX2yRdte9pp8ki3wVcO7JoDVlIC4YcAk34bJ
	 mbbxdLGhIU04JxCqKCBl38OSIhhJIe5QcD8cVhSEiFe1wLz4zLA88u+YlBKEaIEeSViZG
	 ufkOjjVkLhfsdPvdd05Mffy94+6tSXNmAMhZpINdGUh99Du6LoIi0Jd5RvmJWy2SiEeY2
	 sZRVVlK8OOBXO9z36dKeebqnM1EiCPLmsV09waIG7DwiTIeQmklQiuncngbImtwhu2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NZz1Malh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D659606A31B
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 09:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D659606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NZz1Malh
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 28413201F14;
	Tue, 27 Oct 2026 10:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793092764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QG+IwVQ9grDIq47IKAf02fmU2aVGD0WubOXaYAEOrr8=;
	b=NZz1MalhC0cKTsSsbFn8UF9Si5rB1KtOJrXX70I6QXygIcl0L7pNM5xby4Kve8QhwDw7nR
	PgmUSyGgGNtlMxwaeWEfqXrRUtExKD8bvxzWNsDNoDtIRDMR5lE2ptkXmczY+TXKz5kAl5
	kYPvkFBJXaaPWhkdBnuyu7xrSgp76yPPy9HY62HfwYw4dP/yHlnsuFlceCQUU0tGkS//Iu
	lGLoxXKPbJ3TzCfXM+Om51BCedhVslEuolOvZXLrJToI4CsCQVfnI5nViZOF+MEdzRpbGw
	3pizT8qcaPc3DkV17pssN0b6LvhubRM05SAW985ScqBA801VuI0w/Yn0L1RX3w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793092764; a=rsa-sha256;
	cv=none;
	b=L/lcylgeLOZCcpCvWkHNvI2sTImq8U0XDLXWdTkeTAYnth7jHtxJECfTIswIFBmHDhXaB4
	7yHxHeHXM4xRHjllzp6MvPaUjrc2DBHXf5W5lCUDz7Q1rBR4zFkQXcI6h/RCBQ8uTpEvqb
	qGTqXOsG+fcXSj/RgXEhNWqK9TJ6+gKGbD1aBxdcRs4HwZ7IFi2j9+IAl9+bjzLGm6BQzY
	3ck2l1tFyJil9exKHlUvOpo+tm4sTmiEuUIcVvnZbziPrfDkI8H/9BQCc15VlmH2uqb644
	AlEn60ycaYXBWRgbdFnpKuEVzHb2j3qSjCmCNHGhHZd1cg9oY0Gdg4b4kXnnPg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793092764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QG+IwVQ9grDIq47IKAf02fmU2aVGD0WubOXaYAEOrr8=;
	b=WIA2P6FFE/ei5LMhuOuWf/pphPPiMCqmPMlWBPoCVeuH++xV/SDPcXstbQmoIfaZ46yr7R
	qUxJzg0jfRAEiXXx934kUw9hTqXRK1iyXn86GGBOQIxrjUEKlOfxiYKvanQoHz92+fep7z
	hsWHM/yt0FgnD7cGyFwmujIPQhKfEJG7hO5/L8vEhDsbjZUyXSl6tSh+LxNheIGlNGwJUb
	FMZZJausQWQk+wCZL+8kCaL0GZRQC+IHusZ5dyBRCW4YFhIda0j11WdRqpEKU0lpDdTJot
	BiPVYsr+5atchowKRXkOFGjcTckVV7kiK0P6iqh/u/G76VzNbRjuTEHGC7tiPA==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xLdL2-001PMT-0E;
	Tue, 27 Oct 2026 10:19:24 +0100
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BDA145D7AAD;
	Tue, 27 Oct 2026 09:19:23 +0000 (UTC)
Date: Tue, 27 Oct 2026 10:19:23 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>, netdev-bot+sinfo@kernel.org, 
	netdev@vger.kernel.org, linux-can@vger.kernel.org, kernel@pengutronix.de, 
	haibo.chen@oss.nxp.com, shawnguo@kernel.org, imx@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v8 2/2] can: dev: can_tdc_fill_info(): don't read
 automatic TDCV if interface is down
Message-ID: <20261027-truthful-okapi-of-youth-42211f-mkl@pengutronix.de>
References: <20261027065012.191348-1-chunyuzhiqiang@yinhe.ht>
 <20261027065012.191348-2-chunyuzhiqiang@yinhe.ht>
 <CAMZ6RqL-3EBC=hFmpRyxcD4YA3PiMMnC3o+bAxN+ABDGqCNX6g@mail.gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4vrkcp45w3iqkhqx"
Content-Disposition: inline
In-Reply-To: <CAMZ6RqL-3EBC=hFmpRyxcD4YA3PiMMnC3o+bAxN+ABDGqCNX6g@mail.gmail.com>


--4vrkcp45w3iqkhqx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 2/2] can: dev: can_tdc_fill_info(): don't read
 automatic TDCV if interface is down
MIME-Version: 1.0

On 27.10.2026 09:57:03, Vincent Mailhol wrote:
> On Tue. 27 Oct. 2026 at 07:54, ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht> w=
rote:
> > The automatic TDCV readback calls into the driver via do_get_auto_tdcv(=
).
> > Some drivers, such as xcan_get_auto_tdcv(), read controller registers
> > without taking a runtime PM reference, so calling this while the
> > interface is down can touch registers whose clocks are gated.
> >
> > Gate do_get_auto_tdcv() on netif_running() in can_tdc_fill_info() and
> > adjust can_tdc_get_size() and can_data_bittiming_get_size() so that only
> > the automatic TDCV size is skipped when the interface is down. The other
> > TDC parameters are still reported, as they are meaningful while the
> > interface is down.
> >
> > This is a defensive hardening based on code inspection; the automatic
> > TDCV path has not been triggered on hardware.
> > Signed-off-by: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
>
> Reviewed-by: Vincent Mailhol <mailhol@kernel.org>
>
> I think it is still preferable to add a fix tag here:
>
> Fixes: e8060f08cd69 ("can: netlink: add can_priv::do_get_auto_tdcv()
> to retrieve tdcv from device")
>
> @Marc, not sure if b4 would automatically pick the Fixes tag. If not,
> can you add it while applying?

b4 git, but struggled with the new line :) - fixed

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--4vrkcp45w3iqkhqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCauBsmQAKCRDMOmT6rpmt
0uIpAQDH1Yh5CV7Naz1mfslk5xWgp7/vsXgQ6q6lyDPVXRSs1QD/Y3Nqtav23Isf
DkthkKvMFxFn1yjVHXHdbW7ajuSxPgo=
=FaA1
-----END PGP SIGNATURE-----

--4vrkcp45w3iqkhqx--
