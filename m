Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161AC3B894B
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 13:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012829; cv=none; b=Xr7Kso8tsm6sjEC5qmdKZd5LBuPfMsoXqspjEFlwVpB9mrWdBUFfUyhB89JEGWLmIj9FIFEnLi1tk3610kydwya1GsUDiqHC8qx3AizUvKlDF6YeKXoioIHbV2fqn0XtKCYQlD6was0mjBL7/eAPOzfJHIv3iBKNKMaWyeCyMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012829; c=relaxed/simple;
	bh=heQDfZkdRmScupBPm1I//0DcDOQJXMIFzeyMjmuXdiA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PO9XzA8BRDftugz6oPjUocPE1alGvnSGPCj58zt/jqOw/OIimzoNlaCbXFMe5hFxkoaeQkI3FjB5uVlvK4dF4druTqSHw7T15xSPIWTE6jva7OLvxoPgzQ1XGdsu6ZxqklIzYuYauTMEPuF1vqr3dpBKnc9hivkx1e6GOKis3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 655BEC3EEAC9;
	Fri, 20 Mar 2026 14:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 655BEC3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Maxime Ripard <mripard@kernel.org>
Cc: Marco Felsch <m.felsch@pengutronix.de>,  Marek Vasut
 <marex@nabladev.com>,  Stefan Agner <stefan@agner.ch>,  Liu Ying
 <victor.liu@nxp.com>,  Simona Vetter <simona@ffwll.ch>,
  imx@lists.linux.dev,  Fabio Estevam <festevam@gmail.com>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Frank Li <Frank.Li@nxp.com>,
  linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Thomas
 Zimmermann <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>,
  linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
In-Reply-To: <20260320-amiable-hairy-bullfinch-28bfda@houat> (Maxime Ripard's
	message of "Fri, 20 Mar 2026 10:25:11 +0100")
References: <m3ms04caaj.fsf@t19.piap.pl>
	<32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
	<m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
	<20260320-amiable-hairy-bullfinch-28bfda@houat>
Sender: khalasa@piap.pl
Date: Fri, 20 Mar 2026 14:20:15 +0100
Message-ID: <m3a4w2d4ds.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Maxime Ripard <mripard@kernel.org> writes:

>> > > -	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_MAX / 3)=
 |
>> > > -	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_MAX / 3=
),
>> > > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, DIV_ROUND_UP(1 * PANIC0_T=
HRES_MAX, 3)) |
>> > > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, DIV_ROUND_UP(2 * PANIC0_=
THRES_MAX, 3)),

> If this is related to the output resolution, the DT is the last place
> you should deal with this.

Well... just tested (v6.19 + patch) with 2160p30 and, surprise surprise,
it doesn't work for like 10% of the time. I.e., the display may freeze
at weston start and/or shutdown time, but otherwise works:

v6.19 (frozen screen while starting weston, same display, the patch
applied):
32FC6000:        2        2        2        2
32FC6010: 80000000  8700F00  12800B0   480008
32FC6020:    A0058  1000007        0
32FC6030:        1        1
32FC6200:  8700F00            223C00 EF000000
32FC6210:        0 89000000                 1
32FC6220:        0        0        0        0
32FC6230:        0        0   AB0155

OTOH NXP's 6.6.23 works all the time:
NCP v6.6.23 (a different i.MX8MP):
32FC6000:        A        A        A        A
32FC6010: 80000000  8700F00  12800B0   480008
32FC6020:    A0058    10005        0
32FC6030:        1        1
32FC6200:  8700F00            A23C00 97C00000
32FC6210:        0 89000000                 1
32FC6220:        0        0        0        0
32FC6230:        0        0   AB0155

32FC600x 2 vs. A is pixel clock inversion.
32FC6208 is config P_SIZE, T_SIZE + pitch.

More tests after weekend.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
