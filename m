Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35221CFE0
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269946; cv=none; b=f+8MLQy88GGUzidGtP6sTWjlnoqWhDyjIGUCZ64muCuJhyYdRM5TG12oLwIrLapink18llSD6sFxZ4pe4XP9moJ6rHv/OjzgA7sSNhUTyuhjtwq1eJU89C+TVlhczUnsfuphj4Jv52wHhH5S3tU7Kjz8dlvWRq153P9++t+I+QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269946; c=relaxed/simple;
	bh=7IAHU1bTZLVNL+z2q+tVFDaQGWqRX4aIn1IVE5fYFTs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MLGRXQtV1nksAJvCf9ah3uzi5yQHziTCTVKqfRn0H1YmeFsJmp0FQ+ynf5E+tUVjTSaUs7xPA7wmVSG4nIz8B+5smGdB6n6SrJ1ppoRfBoGGQ/579dXaOQP3O46HIHHbG0ERRVxnFLnqLyWrqEWSSev4ZlchU/E2NgO6sUqBN4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PbGQSTw+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PbGQSTw+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0EEDC49F7E;
	Fri, 12 Jun 2026 13:12:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B323F60012;
	Fri, 12 Jun 2026 13:12:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E79E3106C869D;
	Fri, 12 Jun 2026 15:12:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781269940; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ugqk3paBNtkUpmNS8tCEk8xcfM99gRQHykB1GGB9Lao=;
	b=PbGQSTw+ZvVX1pFyLyVPEK3/vY1XM2NFXQyVjT3m3DmbXPwBOM0500DUhvgto0fxv7s51P
	ImghhWxXuM/T8KfimbSYI7lz58OYKRaaN6nF2kjm0sonGdmIRFidiSgJhAWrZeSz1JuRA3
	TILMuJmf3cEkky7ZairznuK2GLJSUQNdQSJUMlK0zFHt3nQNA2w4emEj1HHjYgrncwlM9h
	E61Qh3gdfPvoxd+5ENAVWTzko/DLed7oUf6W4s+rsbuz2V7Fm6coWhVynzuqe8trFTYH9C
	NyWLBB1HTqHWZoiMy16JIecyPXfvFWG8Pc8Ps2fkFkjlHFGweWzzto7L2oSpUQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 15:12:09 +0200
Message-Id: <DJ73HOYATZN9.1FQ8X1O2QHKEW@bootlin.com>
Subject: Re: [PATCH 04/37] drm/display: bridge-connector: store the
 drm_device pointer
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-4-45e2bdb3dfb4@bootlin.com>
 <20260608-imposing-umber-tuatara-62daba@houat>
In-Reply-To: <20260608-imposing-umber-tuatara-62daba@houat>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jun 8, 2026 at 1:34 PM CEST, Maxime Ripard wrote:
> Hi,
>
> On Tue, May 19, 2026 at 12:37:21PM +0200, Luca Ceresoli wrote:
>> Currently the struct drm_device pointer is only needed during the initia=
l
>> drm_bridge_connector_init() and in drm_bridge_connector_handle_hpd() whi=
ch
>> gets it from the struct drm_connector.
>>
>> This will be insufficient when introducing bridge hotplugging, because:
>>
>>  * some of the actions in drm_bridge_connector_init() will have to be
>>    performed later on, when a bridge is hot(un)plugged
>>  * the connector will be removed and re-added based on hotplug events,
>>    so the drm_connector might just not exist or its content be cleared
>>
>> Store the drm_device pointer in struct drm_bridge_connector for any late=
r
>> needs. Also convert drm_bridge_connector_handle_hpd() to use the newly
>> stored value.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> This is already accessible as drm_connector->dev and drm_bridge->dev. I
> think it would be great to list why this is different, and how it is
> different (ie, when it's set, unset).

With hotplug the drm_connector will be created dynamically, so it cannot be
used.

The drm_bridge->dev maybe.

But we have a pointer to the encoder, which is supposed to be always
present, so I'll try using next for v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
