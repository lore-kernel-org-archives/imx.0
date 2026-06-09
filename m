Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F280438E8B5
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997528; cv=none; b=IebljXHWr1XgZlpTsav7FBCUE3fvu0GUR08PGGoPl5wOHrCdrCYdA58NX7A4KPl+VdGTHJQBT1aaxE2UWrksCRrF6DWqO9BnObVSjwuIdpMZijlXjoGeN/uHbP+RIu5rywTlNG7QyNrIkgAp8onYEwqcBbzjd/VUoQA+To/LFtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997528; c=relaxed/simple;
	bh=5ueL5vXJrar7gXIMeqOhrIxGRJ5PWmKivvsq4y/4eNY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jlWbXt734yhkw06zweJgL0NB+V7Ud7zXC/AStkGttNfeu1nZgBah7uu8goqbZvGDoUAUL33Iyp19MHCgtjk7W+NFFYj2mbVXrEehdk1X6fHQYD0pjLXLiFEewZz/0TtX2S5NqHh6ZHq6UmMgLdbiKn4UtA0v0tebXQ6J9Yuqb3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=v53Jn3IK; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="v53Jn3IK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7EB9B4E40969;
	Tue,  9 Jun 2026 09:32:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 516A45FFC1;
	Tue,  9 Jun 2026 09:32:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66026106A2B00;
	Tue,  9 Jun 2026 11:31:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780997523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6zXrAUk1pFWryVHJ+cTmWZacOn6b/LzGd6CUX95U4bk=;
	b=v53Jn3IKQ5rZa2HCyXQ90s8wLx3ywQ0LmCHWSpsKOlmG1GMrLmdJxhURMAuhdpUyfinCA5
	kBWsBqIZCUE3jUB5DcF7VI5zsALo2/URxkoqIMpU9T5QbnrPR7dQO093j8HHedbVVOo2g5
	r7eYn6p2PY5AgtYgjfgsbmtDruRPk1bLjSAsX5o5/XT2voEgPPx/+iWWcCTepf/A3Xw1xV
	IqOLuAjykmVA4gL2UkS3NucPuWkEIYICi2KknBjygTjP6z8FaoZqD3OQ/+lhvN87bd3wYM
	PKSmwi8rne9T2Lttqex5iV4qcahwOiAynoxVzOj/A6pU/U5ZTAbSOVGqGZbk1Q==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 11:31:59 +0200
Message-Id: <DJ4EXH5Y424H.3455WD05N981M@bootlin.com>
Subject: Re: [PATCH 25/37] drm/bridge: shutdown and cleanup on bridge unplug
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
 <20260519-drm-bridge-hotplug-v1-25-45e2bdb3dfb4@bootlin.com>
 <20260608-resilient-outgoing-panther-9efc53@houat>
In-Reply-To: <20260608-resilient-outgoing-panther-9efc53@houat>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jun 8, 2026 at 2:07 PM CEST, Maxime Ripard wrote:
> Hi,
>
> On Tue, May 19, 2026 at 12:37:42PM +0200, Luca Ceresoli wrote:
>> With the upcoming support for DRM bridge hot(un)plugging, bridges can be
>> removed at any time withotu tearing down the entire card. When this
>> happens, shutdown the pipeline and detach from the encoder chain the bri=
dge
>> being removed along with all the following ones.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/drm_bridge.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>> index 7f2d1a81d730..d45fb74ec8c2 100644
>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -462,9 +462,17 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>>   * it won't be found by users via of_drm_find_and_get_bridge(), and add=
 it
>>   * to the lingering bridge list, to keep track of it until its allocate=
d
>>   * memory is eventually freed.
>> + *
>> + * If the bridge is attached, also disable the active output and detach
>> + * this bridge and the following ones.
>>   */
>>  void drm_bridge_remove(struct drm_bridge *bridge)
>>  {
>> +	if (bridge->encoder) {
>> +		drm_atomic_shutdown(bridge->dev);
>> +		drm_encoder_cleanup_from(bridge->encoder, bridge);
>> +	}
>> +
>>  	mutex_lock(&bridge_lock);
>>  	list_move_tail(&bridge->list, &bridge_lingering_list);
>>  	mutex_unlock(&bridge_lock);
>
> I don't think this makes a lot of sense to disable the whole device at
> once. The connector, encoder, and the CRTC might, but the whole device
> doesn't.

Indeed this is wrong. Dmitry pointed it out during the discussion at
Display Next Hackfest (see my report in reply to the cover letter). The
drm_atomic_shutdown() call will be dropped.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
