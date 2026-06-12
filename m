Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45DB37F731
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269003; cv=none; b=Ah2iDtWv8p61DLL1hwOLxF1TmZDKNG08t8z4W0KgEAFsRsZhDAUyt1IHAx1NZmcl4N94T8tgHm0q8JKIrrU407AiHpkqCok0SAlno5o610VyzODhX4l01VCnGKwaIP6q6z0NXF5F9h4U5mjwxQ8i2YkwzfONWRLIhHQFyvmgeto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269003; c=relaxed/simple;
	bh=RwgNOPvBgxFHt3/Je6aNlMukEHx0Uyu/zHkbOtBP5Vs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=YC1dfVYptX4qhzUNCFqmFazcb8b4deNNsAc83KrpkDmRTgONSZ2SrjiXJOsGf7szjhwo4L16GcXvBNb+y+gB8T+gvpHi8X7iME4RFVD3GCajvszjRjiqxvtRzSSJWWUlrYcB8X1oAqVzeYSriaJ95EinG2Sn+xg5+ub3l+Vujho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=08oWSqoR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="08oWSqoR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 58A311A38E3;
	Fri, 12 Jun 2026 12:56:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2103B60012;
	Fri, 12 Jun 2026 12:56:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08CF4106C8A54;
	Fri, 12 Jun 2026 14:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781268998; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QWgaATuoAKFQpxfZIkw0EI47Xu+CY02gQbwSENrgRrc=;
	b=08oWSqoRpdjvs/baLaFBFKfqQKGcttUE+15yalrO+7G0oIcDfFlazuHuTuPalT8w6tUXHl
	H2M3D8KcQljoSCY/vWa/Co/s1CCAeQt8UrpDYp5zeCjSWsjpc6c+DN1zbn6owZT3T9Mj5d
	yolr65EuEGx5SLMIBHHfxQYy2fW10HLDXOx0wHG9be2QkY8S//pZVyBqDxsGWAw4Ul8DN5
	Hwe3IibqJeY8JRcRiVYY0lwW1NDbOnSrdNzsT2Abtl8pWxp6UsCP+hXDf4bMMN/axupjkR
	5dZWc0DJlQJRJvnIYPtGjtugZCd5vYk9wG2+LP4uECWVV5P7q5CjGPcmLINjUQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 14:56:24 +0200
Message-Id: <DJ735MTNMYD1.3LPNV404V8PIU@bootlin.com>
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
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code
 creating the connector to a subfunction
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-5-45e2bdb3dfb4@bootlin.com>
 <20260608-mindful-heavy-frigatebird-be9faf@houat>
In-Reply-To: <20260608-mindful-heavy-frigatebird-be9faf@houat>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jun 8, 2026 at 1:40 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:22PM +0200, Luca Ceresoli wrote:
>> In preparation to introduce bridge hotplug, split out from
>> drm_bridge_connector_init() the code adding the drm_connector into a
>> dedicated function. This will be needed to be able to add (and re-add) t=
he
>> connector from different code paths.
>
> Same story here, explaining what you need later on that calls for that
> change would be nice.

Here's a more verbose version:

    Currently drm_bridge_connector_init() does two things:

     * allocate and initialize the drm_bridge_connector
       (which embeds a drm_connector)
     * initialize and register the embedded drm_connector

    For bridge hotplug we need to separate these two actions:

     * the drm_connector needs to be added and removed at any time based on
       hotplug events
     * the drm_bridge_connector is designated to create and remove the
       drm_connector, so it must be persistent for the card lifetime

    As the lifetimes of drm_bridge_connector and drm_connector become
    different, we need to create them in different moments.

    In preparation to support that, split out from
    drm_bridge_connector_init() the code adding the drm_connector into a
    dedicated function. No functional changes, just moving code around for
    now. A future commit will make the drm_connector be created based on
    hotplug events.

Looks good?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
