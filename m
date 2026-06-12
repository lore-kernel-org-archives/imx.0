Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00517374E62
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 12:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269074; cv=none; b=NtQhbPWx0st4xRkrhl61hQK93esfEug9h0cRofjwB++JgOUow1TOdRyv2ieL5TW3Er1BJrT255GpuOdog9xY5cXNmtvu80ZXEC30ew9364yIRnxQftXoM2vama+oqD/nc+uC9eBwPcg5kUg1rkY2JGvTVcY7cpGFtfJNv0zXQwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269074; c=relaxed/simple;
	bh=6B714fJIr1cKyRvLd8BqwboTpStsTovlsXJpNPNfh5M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Et4bonMtC6s5bDCbVjR2DZHbA0vydvTc77TzResVPMuJAXEHeYLM2rvXxLmXND4EsMPlLuC1JdJu8+gEUKIuAvSr8w3m56kU9NasW7uz8ZfympDyLD4vCtLCnTT35ALuK5xeHTVfImGJb0pX6MDL2R0yaOkElbiXpou5SGtaKfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YBj5v2Tl; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YBj5v2Tl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BA4BE1A38E3;
	Fri, 12 Jun 2026 12:57:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DF0160012;
	Fri, 12 Jun 2026 12:57:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 356A1106C8654;
	Fri, 12 Jun 2026 14:57:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781269070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6B714fJIr1cKyRvLd8BqwboTpStsTovlsXJpNPNfh5M=;
	b=YBj5v2TlRFS7FzMpVJFcW9745pOLogkHXsOYMGcZc9CEbYT+XBawiZy9kRXA34i5OMG8n5
	IOU66bs2FCFw6mhk7OJsKDtj4qQ8L5sydbxQdb+bz3u9uj6uWjQes1KzkHfnANBKMnQW2O
	YjF38hRS2hqAsNuVZozosRTEgGfG1Cmb85s0XwlJczq1BesI8dZiX+u9NkDtTSZXAi4GeG
	xjBJXH4rLkIpQmPZJWUrF/p3lnYBTja4/7UHoofCpsthpcbkJy6DC8U5Ap5mZ4R7IJxsIK
	dtnliPNKVLCNbAnoAm4MTbSux2lUMax2Gi9dEuwhjaquhb89xSpxsPhxwP3QKw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 14:57:39 +0200
Message-Id: <DJ736L2DR8H8.35296DRNZ1OW@bootlin.com>
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
Subject: Re: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-6-45e2bdb3dfb4@bootlin.com>
 <20260608-little-lyrebird-of-competition-c25f7d@houat>
In-Reply-To: <20260608-little-lyrebird-of-competition-c25f7d@houat>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jun 8, 2026 at 1:41 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:23PM +0200, Luca Ceresoli wrote:
>> Currently drm_bridge_connector_init() always returns the added connector=
 or
>> errors out. When adding bridge hotplug the bridge-connector can be
>> successfully initialized without creating a connector, which can be adde=
d
>> later when the pipeline will be complete.
>>
>> For this the internal function drm_bridge_connector_add_connector() must=
 be
>> able to return a valid drm_bridge_connector even without any drm_connect=
or.
>>
>> In preparation to support bridge hotplug, change its return value to be =
the
>> same drm_bridge_connector pointer it gets as input, or a PTR_ERR.
>>
>> No functional changes, just changing an internal API.
>>
>> Note the return value could now become an int (0 or negative error) beca=
use
>> returning the same value received as input does not carry any added
>> value. However this would be change a lot of lines, so leave such change=
 as
>> a future cleanup.
>
> You just created that function and changed "a lot of lines" already, so
> I'm not sure that argument holds.

Do you refer to the previous patch?

My comment is more about the following patches. It means I separated
changes moving code to a subfunction from changes to the the return value
in separate patches, so that each patch is trivial to review for
correctness.

Makes sense?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
