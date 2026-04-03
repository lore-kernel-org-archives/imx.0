Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C581317164
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 04:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775191028; cv=none; b=IPoStbJ/JbswzDHfVKbcn7BRuGJEyDMUQnHF+mA41amabRTWYCS0+WQW/xoV1sNvEsuvCLMa0697kov13oUpWLjlksHigaV9SUnurrqkPUoJKbUA2eS1Dx504J/k6CTEq9r84WH3xmpUPpTN5UVJ58TaNVrAwfs2+Wvxql14jBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775191028; c=relaxed/simple;
	bh=yQu3wuvVPvlhjYHEI5d0Lju6sjhC6BNA7+E/6NBDJkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pht1HAQ8ZCZdUthrADTHZToC81dpmjXIJHLGFVPiDSii+9qH51kGb/Z1BGZlWwKoU8iOVkCwM3j9Nl9vQE4lpmhLl+oMvYl6PrR7js2q3aMkWUESyBcPVz8DaNoD+Cb8FtfiBScETobiTjv7Z8usEPJKiN0FTJoCUnYKcKWfjAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id A7806C3EEAC9;
	Fri,  3 Apr 2026 06:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl A7806C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: <dri-devel@lists.freedesktop.org>,  <imx@lists.linux.dev>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  Marek Vasut <marex@denx.de>,  Stefan Agner <stefan@agner.ch>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Frank Li
 <Frank.Li@nxp.com>,  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  Lucas Stach <l.stach@pengutronix.de>,  Marco Felsch
 <m.felsch@pengutronix.de>,  Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 3/3] drm: lcdif: Wait for vblank before disabling DMA
In-Reply-To: <ac6eQcDS8lr-A4ia@shepard> (Paul Kocialkowski's message of "Thu,
	2 Apr 2026 18:50:09 +0200")
References: <20260330224619.2620782-1-paulk@sys-base.io>
	<20260330224619.2620782-4-paulk@sys-base.io>
	<m3y0j8mhoz.fsf@t19.piap.pl> <ac6eQcDS8lr-A4ia@shepard>
Sender: khalasa@piap.pl
Date: Fri, 03 Apr 2026 06:36:55 +0200
Message-ID: <m3ldf4mzh4.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Paul Kocialkowski <paulk@sys-base.io> writes:

> Interestingly I tried to keep the clocks always on as an experiment and it
> had the opposite effect: the DMA engine would get confused every time aft=
er the
> first mode set and disable. So for some reason the disabling of the clock=
s seems
> to mitigate the issue rather than aggravate it.

Interesting. Fortunately we have a workaround.

>> > +       ret =3D readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_5,
>> > +                                reg, !(reg & CTRLDESCL0_5_SHADOW_LOAD=
_EN),
>> > +                                0, 36000);     /* Wait ~2 frame times=
 max */
>>=20
>> I guess this comment is not necessarily correct - at 2160p30 one frame =
=3D
>> ca. 33 ms. Still works, though (I guess anything more than one frame is
>> enough). I don't know how long a frame on HDMI (or LVDS, MIPI etc.) can
>> take. 30 FPS on 2160p is common because the i.MX8MP can't display 2160p6=
0.
>
> Honestly I think we're good assuming 30 fps (33 ms) is a lower bound.
> And the current 36 ms goes even beyond, so I think it's fine.

Right. It is just the comment in the code which is not exactly true.
I.e., we "wait for at least 1 complete frame time". I guess.
Also, the 25 ms in the patch (commit) message is no longer accurate.

>> Also, found an issue. Perhaps unrelated? Powered the board without HDMI
>> connected. Then connected 1080p60 display. It came in 1024x768, console
>> 64x24 :-)
>
> That looks more related to a failure to fetch the EDID from the monitor.
> 1024x768 is the default fallback that is used in this situation.
> Maybe check if there is something wrong with the DDC lines from the hdmi
> controller, maybe pinmux etc.

No no no, I did that on purpose - the monitor was really disconnected at
the boot time. Only then (but before starting weston) i reconnected it.
But it indeed appears to be a separate issue, a software one - a mutex
deadlock on access to clocks and power management. Both enable and
disable paths interfere there. "I will post a patch when I have a patch
to post" :-)

Thanks,
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
