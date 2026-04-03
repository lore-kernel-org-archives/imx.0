Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDE199FAB
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 04:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.187.100.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775191397; cv=none; b=tVdXdpYUGrfJZuCzHnEbyiOsgclZ7UnV5UdOT2j0Ey5fbzwIa99IwFPJcK/J3Rf61c7z76s9WmmvxCudldDHu/xf11hQVysdGo/zgV0of5mzzTtxVKFEwlLxQOIqwxArBydxdzhAZ5mCcObXN807J5Gn3D30gFVtlQT99HpgxUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775191397; c=relaxed/simple;
	bh=yScm3kieahjAtXlCHqey7p4V3JTRegM5yQAQuQLvFJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tdrBYf23odzLvxDXhludgxGkd6P0ZYycw/VuGzv+Bi25+Ghdj0BJPzdt5RRJdwrloyyCmGht77izzbQodCfWO76mKkgHVtp5GdqrZZiBzWuuo5DhQkI9GYdj5rGoGokqDxJFc5SjrAtk89Sl8Lj/8YlMD1Z7pKaMiwq601cCZr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl; spf=pass smtp.mailfrom=piap.pl; arc=none smtp.client-ip=195.187.100.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 029CBC3EEAC9;
	Fri,  3 Apr 2026 06:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 029CBC3EEAC9
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
In-Reply-To: <m3ldf4mzh4.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Fri, 03 Apr 2026 06:36:55 +0200")
References: <20260330224619.2620782-1-paulk@sys-base.io>
	<20260330224619.2620782-4-paulk@sys-base.io>
	<m3y0j8mhoz.fsf@t19.piap.pl> <ac6eQcDS8lr-A4ia@shepard>
	<m3ldf4mzh4.fsf@t19.piap.pl>
Sender: khalasa@piap.pl
Date: Fri, 03 Apr 2026 06:43:11 +0200
Message-ID: <m3h5psmz6o.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Krzysztof Ha=C5=82asa <khalasa@piap.pl> writes:

> Also, the 25 ms in the patch (commit) message is no longer accurate.

Aaah, it's before 7 a.m. here :-)
On the second try I was finally able to parse that sentence. Perhaps.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
