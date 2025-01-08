Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D379F79FE
	for <imx@lists.linux.dev>; Wed,  8 Jan 2025 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329614; cv=none; b=JSBs1uo6/sAU6by2pevuJ8ITSxQAws8mykIR/JkNcyfE5c4O0tBBO9EFuuoTcOng5f+aJsqgNaBWInzvd6UPQXGvmVA6DbH4z5SZxforCGRGjVD15YGWwxLOdlEky7UREDG6cP1HdV4KQprXxYOCvmg0O+v4ZvJJAmKwcDhO5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329614; c=relaxed/simple;
	bh=MpogpyJZZomRuYBrR0RCmqcvLY8dmCcOt5jubI3rb7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9rPAd25aaaVFT4pJaENyBsHwImf/hCfpUWVgLJ3EfXr2IYiUyo8jpnlAdVSUHEd6j8ovY+C8q/PnD7WsPgXi5BKFIqyU1v7jE1Hm9GmynZWOqC/RyQdIgUfXaiq0Y4Vqk4kNbHnIY88M3qaxnSw0MpCLvPlToKs+rdHGuPj03w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=WtFDhzc0; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=tOhnGu0c reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="WtFDhzc0";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="tOhnGu0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736329611; x=1767865611;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EwDzKG89Ymx/QU9yuPa/mg303XLB6Tg6l+Zi/jlAIcY=;
  b=WtFDhzc0ARe+gqJDeUWZ+WwBvbzBdH4LsSeah0vkF0Bi37o7XTrZ+8LD
   frG0xyeKK7m/VUDq66QgyainJ4KGNcFuGC7wUfpkA7joKsHWNqADhwfIm
   td2BBgzEmVhkFiqEMlKxj6j1QFsRrJXt/JrQnmmwKltAsMLKnPVesn1cx
   ZZvj/6jPSBksyC79GXgcKR7qsSpNwrxg83xeNikskzgJIISZwc0hP6Ovi
   ag9EXUH2v2sGRAh4J81Wd5OLPRnndCS+Snf8/tcq6GVhx0K+OxvAGIuHI
   KiHe3HtZpcV/IpTNKsLd71PNVeoFjlx4YfHVpOXGxMOM08s0Vi7WdMxW5
   A==;
X-CSE-ConnectionGUID: IDIOolozTOC6mUvbW3yfcQ==
X-CSE-MsgGUID: x5ymoHilTAS0JUrHU8T2sg==
X-IronPort-AV: E=Sophos;i="6.12,297,1728943200"; 
   d="scan'208";a="40916184"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Jan 2025 10:46:48 +0100
X-CheckPoint: {677E4988-4D-1D00F64B-E6C57517}
X-MAIL-CPID: 47C7EC1946D9CCB4724F46AA6969121D_3
X-Control-Analysis: str=0001.0A682F15.677E4988.00E8,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F30F160D36;
	Wed,  8 Jan 2025 10:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736329604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EwDzKG89Ymx/QU9yuPa/mg303XLB6Tg6l+Zi/jlAIcY=;
	b=tOhnGu0cE3nBLFPO4amlKfb72Obw76/CSAf/acU0E3GLDRNueEmaBY4a6MLdi+THA/h6x/
	vdLE+4OUi6KUjH+HGkWH8WW4MGFHbWn0kf9b+k/zfYTTLr9UrkyJSj43PI6ximPDoRhBg2
	U8YzoZrgvv36fHUAzpuma/YBDbAIhcKSe6qaPU4NOZsDzqt71OTevGkBte7w+CO1NSKr0y
	SVaXnc0b7kwOsJQsN5CMiapVxRX3VDl5dCmCwE6ckItCqcGUyGdhMLd7kaOWnz+VMQq+UX
	8ZV6Tj6qeHMBmqm3uKYmBiJ3ljKxYsFONaSiBOsuOuLIk8tnN/kEXCjU3T95wg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] dev_err_probe usage for imx8qxp DPU pipeline
Date: Wed, 08 Jan 2025 10:46:41 +0100
Message-ID: <23817363.6Emhk5qWAg@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <b3499ec5-c751-4809-82de-9d937fe47c6b@nxp.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com> <b3499ec5-c751-4809-82de-9d937fe47c6b@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Mittwoch, 8. Januar 2025, 04:13:51 CET schrieb Liu Ying:
> On 01/07/2025, Alexander Stein wrote:
> > Hi everyone,
>=20
> Hi Alexander,
>=20
> >=20
> > this is a v2 of an old series still in my queue.
> >=20
> > Changes in v2:
> > * Rebase to next-20250107
> > * Remove 'imx' prefix for commit subject in patch 2 & 3
> >=20
> > Best regards,
> > Alexander
> >=20
> > Alexander Stein (4):
> >   drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
> >   drm/bridge: imx8qxp-ldb: Use dev_err_probe
> >   drm/bridge: imx-ldb-helper: Use dev_err_probe
> >   drm/bridge: imx8qxp-pixel-link: Use dev_err_probe
>=20
> i.MX8QXP Pixel Combiner is also in the pipeline, so imx8qxp-pixel-combine=
r.c
> needs to be changed.
>=20
> To achieve consistent log upon probe deferral, i.MX8QM LDB bridge driver
> imx8qm-ldb.c needs to be changed too, but it can be done with a separate =
patch.

Thanks for spotting. I've added both for v2 of this series.

Best regards,
Alexander

> >=20
> >  drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   | 13 ++-----
> >  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c      | 37 ++++++-------------
> >  .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 19 +++-------
> >  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  | 26 ++++---------
> >  4 files changed, 29 insertions(+), 66 deletions(-)
> >=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


