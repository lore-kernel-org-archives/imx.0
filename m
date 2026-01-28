Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714B135A93C
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 18:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623239; cv=none; b=Z/mmc0LrUGFCk3wkQp6GUTrzvxJQawzijxPC2amSZuF8Cw9m8vj1+hhrRAr/7xBKzPBJL6U5zEzAUuWc57EaHJEMgyV1ncIgtHlxt97mQ9pxOnWv3Jvd/zG2cj7D2W8VjI9GvdssgFh6paBIK10suxPyhfaQkAn8/9WmO07T/m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623239; c=relaxed/simple;
	bh=dyoBRz+YKaFKy9Fnxlp28K3ZsMfWJ8f/rzy9rG8gPqI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=f9sKjJc3xOhVV5zPR72ERGgvMNQkgcd2raGpr4MCZy5WxsihjQuguI0kqwGsTfoR6EpXMP8EKjtDVC8nsysOBZ2j6XMD+j4ikwVs2nJjs3jn6LXBXBQuOqU+1CXTKLHgz49/biELB/Kqk10yAcurOTt893ZBfleF9yUJAf5bSnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C7XvoYg4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C7XvoYg4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 239531A2AD0;
	Wed, 28 Jan 2026 18:00:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB1E16071F;
	Wed, 28 Jan 2026 18:00:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1C7A4119A8687;
	Wed, 28 Jan 2026 19:00:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769623235; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iYR1JKFU/xuxQ+QTiSdf69T2RlRcjVvApnn5tuFlIA8=;
	b=C7XvoYg4XAy5+d4HTkKakM5O/Xg3YecyV+rsWkKJx4db51531cLLZsXxKHeoG4yFvhm8rV
	DdgCahO+FNkIlVTQnyazu/Aua6UetM9IVZonyf8kTO0TFHzno0ylp5PKS4UguYzBbV4+Iu
	VXLToaGcGchtTU+Jeqqxy8zXuKccFvKbTleXlBQIaTEqraP5apbR2z9kGR26kKyPVXFpig
	o08yjqkHcr9TjtfuQ9Y7z5F8WBYsjEJwOSlohTDvuOI6CYNe+h/VTB3lg7ikeCz1V2kQPD
	KVhz5HBnS7Vh8j4ClacwvM7D9Mc1LbMj+RxV+fapMxiUqY0Jsy97tedakTT0Qg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 18:59:57 +0100
Message-Id: <DG0F2I1W5EKK.28CCEYZVEDM0U@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: (subset) [PATCH 0/3] drm/bridge: imx: A few fixes
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
 <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
 <DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com>
In-Reply-To: <DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Liu,

On Wed Jan 28, 2026 at 4:26 PM CET, Luca Ceresoli wrote:
>> Any reason why patch 3/3 is not applied?
>
> Yes, the reason is there's a patch conflict and I still have to find out
> how to handle it.
>
> Patch 3 by the rules [0] should go to drm-misc-fixes because the bug (add=
ed
> by [1]) is already on Linus' master tree (since v6.17), but it does not
> apply there due to a conflict with an unrelated change [2] currently on
> drm-misc-next.
>
> Note that [1] and [2] are the two commits mentioned in your 'Fixes: 'tags=
.
>
> I had a chat with Maxime on #dir-devel about how to handle this situation
> but still haven't got a final answer.
>
> I guess the correct way is:
>
>  1. apply patch 3 on drm-misc-next, where it applies cleanly
>  2. send a modified patch for drm-misc-fixes, to fix ASAP the master bran=
ch
>
> Would you send the patch as in item 2, so it can be applied to
> drm-misc-fixes and have master fixed ASAP? Note iit should not mention [2=
]
> in the Fixes: tag because [2] is not yet on master. I can send it of cour=
se
> but you can test on hardware so that would be the best option (and I'm a
> bit overloaded at the moment).

Nevermind, I've just sent it:
https://lore.kernel.org/lkml/20260128-drm-bridge-fix-imx8qxp-pixel-combiner=
-null-deref-v1-0-2138d0933cf1@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
