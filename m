Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8983A1D1F
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 14:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981875; cv=none; b=MkweRQAofWfPSBwzPUpnr2vUJunIxojCwi/SYDZGlbI5jS0armLXtq6cKqD3p1IA6T2O+OpYXBe0VATwA3BOUvT5nEP/fQIISsPZqAi7p0s2WiqZPhqEKyivzACWoLClv/VdQSniHgGVKb1hi9KrweZn5u1R/8Dw77CY5aJhOzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981875; c=relaxed/simple;
	bh=yAjEzU0lnm6w9HbHvxnWCw8lQ0bKDnGFd7xXe5yjJo0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dmpjFdhdnDuF1ZT5vjR9cwiE5bJcX54phpr8wC8xCrAvZCKGDhDgxUHdxTBHg03bcvzwcQ6ozPpNvVn1QCkqR09VqoWvbcKevmsqbch+7Vpaqp7bxrN+0OKicalpQNFDAIiB6V57v4vCcwi+l+Oos0DG0iqDahXKXs9vFJSGJic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xrG4jKk1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xrG4jKk1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1797C4E41C61;
	Wed, 17 Dec 2025 14:31:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3C3E6072F;
	Wed, 17 Dec 2025 14:31:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08228102F0ADF;
	Wed, 17 Dec 2025 15:31:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765981869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yAjEzU0lnm6w9HbHvxnWCw8lQ0bKDnGFd7xXe5yjJo0=;
	b=xrG4jKk1868Dv7dPhgpQxbWfGUHPcegpZHAbpsi68LNt1qCvLavT7qg6pk0LyAOpy6g8vf
	uCI/c6WhBKRbvJfH/9PevUAINIRZeoOldyX4fOqO+SKCVogGMwcD+YyeCa1fh6K0TiTtqw
	i7q5sRSu4GJyjVf7mR9Y3/Qri1jAxFNDNws2wV4hE/ssLWNgu61nMSLCC09UXg1/i5guEu
	143vac/E0zy0QYBvBIJMD6V50VaSq7IRSfaV3EGMI8yx/9ZEj9u8cmOSJceVeRYhrjLvTr
	yt97q0vB58aPCsDXYu3m2nq3B4klQ0rtZb1eI7qcWYQlJfN12/1sBA27uTxx/w==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:31:01 +0100
Message-Id: <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com>
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexey Brodkin" <abrodkin@synopsys.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jonathan Corbet" <corbet@lwn.net>, "Kevin Hilman" <khilman@baylibre.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Phong LE" <ple@baylibre.com>, "Robert Foss"
 <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo"
 <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com> <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
In-Reply-To: <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime,

On Wed Dec 17, 2025 at 11:15 AM CET, Maxime Ripard wrote:
> On Tue, 16 Dec 2025 18:58:34 +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() does not increment the refcount for the returned
>> bridge, but that is required now. However converting it and all its user=
s
>> is not realistically doable at once given the large amount of (direct an=
d
>> indirect) callers and the complexity of some.
>>
>>
>> [ ... ]
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thank you for the prompt review!

All patches are reviewed now except patch 18 which has no reply. I'm just
pointing out in case it's something you missed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
