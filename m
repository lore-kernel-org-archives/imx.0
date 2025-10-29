Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99A8223DCF
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761742928; cv=pass; b=rufadz8diEvcNEX7aOROHu+GViWTYtFO2UvgHgzo/FEDvImVrBykLXzEVsYfoHuJlM4bZeOi+c2odeUS7vz/Cfta6i2I3OtKcnzfxvQ19ftb/C2EDRtRzSHygyN6wz+MY1qkrYprIHgRyJLMp4Edm//pYBWLuYLByn1P0Nf3olM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761742928; c=relaxed/simple;
	bh=nxJ0l8pFIkUd1XOOatN08dN48GI7BMxEKiJskrqIjPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRzQN9C/65aUrnon3tG0b/8OfkFeH+dIHZi3FGGvpeZHa0cwQK8LY+K8cSZ3gXPlP9a8iJHorMWzFx3yYlmSs6FxxtgoSp/BO1lK22b2/fEdAM6bV3cbBjM1EIkoso4T3AVr8jxazfITsfQedEqkawWjxc0zFSvzSmdjqfo5Kms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=Ns5WBBOn; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=H0xwOUXl; arc=pass smtp.client-ip=185.56.87.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="Ns5WBBOn";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="H0xwOUXl"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-q1dl.prod.antispam.mailspamprotection.com; s=arckey; t=1761742926;
	 b=XsdYMY7I+p9Gg0WBdSHaK8+4+bWTe85jeyqSt6aUJELCQyLZuhN89EYZYsppQGONs7ci8dSuwT
	  ZiNuAnk884pVoDmBcU0x3JhWmASTtMvyECsq1j2YLLiCQq5mUBakrRN4YElJyDdLSMArSwSm2u
	  b0Q0p54pY3gn+5VslGnxGb4rZTu/ZWLcfAzd4/EV30PKUhwJRwzJE6WhHxw90gLL+Y5L7tS5+w
	  f897gyAs9AYzN7qa6SEpHeyS8UtQXWmhNrIfW+vo497nPidJuLf2TniZLqOY0i3FcKgvQx+QjX
	  pqRTtj1Zlb5tP+JG1XMCmr50P8DxIwa2wnQHEWOKyaUpgA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-q1dl.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-q1dl.prod.antispam.mailspamprotection.com; s=arckey; t=1761742926;
	bh=nxJ0l8pFIkUd1XOOatN08dN48GI7BMxEKiJskrqIjPs=;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	  To:From:DKIM-Signature:DKIM-Signature;
	b=0ItO1XA621PWP+X5mSfUBuFgwrbJBOS+AqN/FCLXKFhQ1ruDv/xAytGBCS+wsYZ6rydVhcC6MJ
	  M4uTb/U1EUw1q4G1ssRoMAec24A6D+SgA59HiPgUNrR5IT2YEH0mvjdx7rWDyfd1eO54yDEppN
	  zTJcisnx4IZSxXTtQKfcHaWyfOZucjIGDUD3F61P6A/74kRyK3J4pJfeh0FHszHpal6sq1L+df
	  FqZdTdSjSqL2PJE7e1aDpFRbMGgYbO6YI7/DS3IsZ8BdX5z/R4uLFCApZamdh0/384j0O/n+t+
	  l2xE4K1DI0hp/Nv4GXL/VvaNlAzr168xjcwgpAuC4FsyMA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=3vbMUDHqHdbLF0JamSxILfazqzvKVxLGjQW/n+lyM2g=; b=Ns5WBBOn1MDxeRptkRx340Rzsp
	xULgYCpcfCM5UUsVm7P0nBhXAPrGOppMqCjT4+6pFVSaz/BcQad2JuOGvUVaasVT/3HP6NfdEE/cj
	xw/NdQrtxwmM9B6njdDWsW4dtM8VMcx8kklYnM7MysL7RSI3PuBEVYKifPjih1cxLOY4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-q1dl.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vE5oK-00000006WtB-20Gr
	for imx@lists.linux.dev;
	Wed, 29 Oct 2025 13:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=3vbMUDHqHdbLF0JamSxILfazqzvKVxLGjQW/n+lyM2g=; b=H0xwOUXlsVJKBjrSJwFCyxItJe
	4q8UpJeUIFhDmIEzqQSDJzAaTmZ7QpfDX0WA2kzQTqHXmYrss0fEHSs8p5elLMVRAE2EVCoKfPlY0
	xq3pn6P1tgyPf6bHega40w7ggju/lDPR8FmN0PA/eoddE+78s1XXruwK7Agajd3LsSaw=;
Received: from [95.75.8.65] (port=19648 helo=fedora.localnet)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vE5nq-00000000FE6-0Uqj;
	Wed, 29 Oct 2025 13:01:26 +0000
From: Francesco Valla <francesco@valla.it>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Liu Ying <victor.liu@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Fabian Pflug <f.pflug@pengutronix.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ldb: add support for an external bridge
Date: Wed, 29 Oct 2025 14:01:24 +0100
Message-ID: <2756377.lGaqSPkdTl@fedora>
In-Reply-To: <1a52c081-ebb7-487b-850f-e50fb36b739a@nxp.com>
References:
 <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
 <1a52c081-ebb7-487b-850f-e50fb36b739a@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2568054.XAFRqVoOGU";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 399e7702e13b7888b09f7d479724526c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vE5oK-00000006WtB-20Gr-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-q1dl.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

--nextPart2568054.XAFRqVoOGU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Francesco Valla <francesco@valla.it>
Date: Wed, 29 Oct 2025 14:01:24 +0100
Message-ID: <2756377.lGaqSPkdTl@fedora>
In-Reply-To: <1a52c081-ebb7-487b-850f-e50fb36b739a@nxp.com>
MIME-Version: 1.0

Hi,

On Wednesday, 29 October 2025 at 04:41:51 Liu Ying <victor.liu@nxp.com> wrote:
> On 10/28/2025, Francesco Valla wrote:
> > I was trying to add display support for the i.MX93 FRDM on top of the
> > patch sent some time ago by Fabian Pflug [1], using some of the work
> > already done by Alexander Stein but not yet merged [2], but then I
> > noticed that the support for LVDS-HDMI converter bridges was missing
> > from the LDB driver already present for the i.MX93.
> > 
> > Not a fail of the driver itself, obviously, but I wonder if/how the
> > existing i.MX8MP setups (e.g.: [3]), which use the same driver, work
> > correclty. Unfortunately I don't have the i.MX8MP hardware to test them.
> 
> [3] was in my previous patch series[a].  Only patch 6&7 of [a] are applied,
> so for now [3] doesn't actually work with i.MX8MP.
> 
> And, patch 3 of [a] supports the external bridge this patch tries to support.
> 
> [b] is another patch series which includes my patch.
> 
> [a] https://patchwork.freedesktop.org/series/139266/#rev7
> [b] https://patchwork.freedesktop.org/series/154381/
> 

Thank you for your answer, it's much clearer now.

I'll drop this one and wait for [b], then.


BR,
Francesco


--nextPart2568054.XAFRqVoOGU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRUrtjevJ039mawAeLir2xSXEi5AAUCaQIQJAAKCRDir2xSXEi5
AH56APwKzsvlloyWlfPnMHnak/8E8bYBfPmKrRKeQQQedjSq8wEAg3BhwGYJnq5+
NGhnp06M8E4EpL9w3NYZ4PZVND0UWQo=
=PUAv
-----END PGP SIGNATURE-----

--nextPart2568054.XAFRqVoOGU--



