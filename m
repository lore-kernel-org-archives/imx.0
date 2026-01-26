Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDB62F83B7
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417520; cv=none; b=eSnh4STSM/7EDgh66Sd6I65l2F2QJJAVsr0d/SwkfpSTs15zAjfwfKhkoFj3VoUpbDiKq0TnxPLn3KPb7TCCMNNtbeP0Za5YCcRkhx4onrovRCwOl0wKozcMDz6I6fMA9fHjC1Bxw0UFN816T1fa0O9qQHq8jjbu8v6+4d76qB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417520; c=relaxed/simple;
	bh=JUG/fmK2RVt4yTO2i7fNlfhJP1TZvqM8Z2olo81C66M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Sj4F1dxgaXFRNvB9zKcxLGze8qF6330VMUiVyPDuTzmZqi2w9BZ0kFx8mIL3eyT5br+yfGkocKVZkp7JY+HFAPLqbpMbcTpbQWCSvxZmNGI7MiadriJ3grH20/Gs9T9RU2Kn1NRmxA+2PwG0VflDCvy7LEWWsi6IPDeD+7csYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QedPXVXD; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QedPXVXD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7E1A41A2A52;
	Mon, 26 Jan 2026 08:51:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45F5960717;
	Mon, 26 Jan 2026 08:51:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0EF6119A80E2;
	Mon, 26 Jan 2026 09:51:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769417515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YoimUg/B3WMdwPjCRvv8ClMn1Rr3hFGXgkVjA9JOOIg=;
	b=QedPXVXDwD6tu/9yJqyZ7TIZOoQUoEcFq8esUex1XnWQ/7sm1bFOA2z39idJnnow/kk7jh
	4bX3+4Bql4HHg0wqoLaFx8rcPJlzoP4Ec7NI8I1sc3nY7unHATPwtp81uuyUwggtYUNuVF
	I11hqr3BcWARPJ5sA2i+jelLE8m0w/eeN3y3bC4ZDSuxCIlAw/aivEBPr+4u20+WMlshVO
	qfnQreqggUqpQoXr5MSEXcPPNYDOPot6IY7nWQSIqHWMNv8qoIQB16jWyOB9bin6jWH+x+
	jXD8zr35RSom94S4/PC3dmjDMKQYOvxdKgb5Wjd4Lu4JkspNxzPyBAQyrPRTmg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 09:51:49 +0100
Message-Id: <DFYE5QDGOF28.2S7XJ1IFZIMX0@bootlin.com>
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for
 imx8qxp_pc_bridge_probe()
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
 <DFYDRSZBQBND.QSY119QND1GE@bootlin.com>
 <42f86084-5200-4dc0-86a7-4719d7d19cf7@nxp.com>
In-Reply-To: <42f86084-5200-4dc0-86a7-4719d7d19cf7@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jan 26, 2026 at 9:47 AM CET, Liu Ying wrote:
>
>
> On Mon, Jan 26, 2026 at 09:33:38AM +0100, Luca Ceresoli wrote:
>> On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
>>> In case the channel0 is unavailable and bailing out from free_child is
>>> needed when we fail to add a DRM bridge for the available channel1,
>>> pointer pc->ch[0] in the bailout path would be NULL and it would be
>>> dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
>>> pc->ch[0] before dereferencing it.
>>
>> Thanks for checking this code and providing fixes! These drivers have a
>> complex code path so I had a hard time in following the logic without ne=
ing
>> able to test on hardware. Apologies for the issues emerged.
>
> Thanks for your quick review and hard work!
>
>>
>>> Fixes: ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the n=
ext bridge")
>>> Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to de=
vm_drm_bridge_alloc() API")
>>
>> The bug was introduced by 99764593528f, while ae754f049ce1 is not changi=
ng
>> the bug, so for the sake of precision we can remove the first 'Fixes:'
>> line.
>
> I added Fixes tag for ae754f049ce1 because it is the first commit which
> this commit could be applied upon properly.  Maybe this helps some tools
> apply this commit or maybe tools are smart enough to find ae754f049ce1
> automatically?

Uhm, good point, maybe it can be a useful reference for the stable team to
backport the fix... Well, let's leave both lines then:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I'm applying this series perhaps tomorrow (if no one does it before).

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
