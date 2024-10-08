Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBCE1DFDA0
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397413; cv=none; b=kU0BVsoT//O40mCbrTDNXC2+0/mLT7Jgt54xScPFsh5STkHCYPInAAN9TJOCIGrvuYetx0xBIc6G6Z7P7uLKj4viXwHNZOMZT8BUebgqc1YoQI98ah97VTrLMILy4EZhx/v9Y3zdSZg5hfm6BpQJo7Tkvdpyyhe7gS/2lnwfA4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397413; c=relaxed/simple;
	bh=xKTWbogi7rDKZ0L4Lnq6s12hOjhCMJLQw5BZshd3wNU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pKu2BgdlHCkt4ggeLJloTeHz8J88Ps9jpyA29b0VKaR5gWX3qO8hjYCUboSXo6VlHqalLCCEJqJTIZ/4OefdX04W/hqNoFJhLveUTFyNwLRKnDTBGyRaVtOstkJ/rkRCGUjbGGMp7oz5JUVtRFrqpiVWMfsjFJc4Os9W09tGu60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1syB7N-0007J1-6W; Tue, 08 Oct 2024 16:23:17 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1syB7M-000Nu1-Fu; Tue, 08 Oct 2024 16:23:16 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1syB7M-000Bnr-1K;
	Tue, 08 Oct 2024 16:23:16 +0200
Message-ID: <05c5b863f98bb61f67e79e83e05ca341285db205.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Tue, 08 Oct 2024 16:23:16 +0200
In-Reply-To: <0da39b8f-4cca-438f-9a39-40da7c34c895@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
	 <20240724002044.112544-2-marex@denx.de>
	 <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
	 <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
	 <b1c5fb155c77355ef2889b6e054a5c0696481ebd.camel@pengutronix.de>
	 <0da39b8f-4cca-438f-9a39-40da7c34c895@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Do, 2024-10-03 at 16:57 +0200, Marek Vasut wrote:
> On 9/26/24 1:16 PM, Philipp Zabel wrote:
> > On Mi, 2024-09-25 at 22:45 +0200, Marek Vasut wrote:
> > [...]
> > > > The driver is not taking ownership of prev_buf, only curr_buf is gu=
aranteed to
> > > > exist until v4l2_m2m_job_finish() is called. Usespace could streamo=
ff, allocate
> > > > new buffers, and then an old freed buffer may endup being used.
> > >=20
> > > So, what should I do about this ? Is there some way to ref the buffer=
 to
> > > keep it around ?
> >=20
> > Have a look how other deinterlacers with temporal filtering do it.
> > sunxi/sun8i-di or ti/vpe look like candidates.
> I don't see exactly what those drivers are doing differently to protect=
=20
> the prev buffer during deinterlacing . Can you be more specific ?

In the EOF interrupt you are calling v4l2_m2m_buf_done() on src_buf,
which should be the same as ctx->curr_buf in the previous device_run.
Instead, you could release ctx->prev_buf and then store src_buf into
ctx->prev_buf. Storing curr_buf on the ctx doesn't seem to be necessary
at all. The mentioned deinterlacer drivers do something similar [1][2].

[1] https://elixir.bootlin.com/linux/master/source/drivers/media/platform/s=
unxi/sun8i-di/sun8i-di.c#L236
[2] https://elixir.bootlin.com/linux/master/source/drivers/media/platform/t=
i/vpe/vpe.c#L1481

regards
Philipp
