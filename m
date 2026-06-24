Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE92D1916
	for <imx@lists.linux.dev>; Wed, 24 Jun 2026 15:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782315268; cv=none; b=CTT2PF8mkyLWYYlbXQ/b22Z5YXy1aB/N36DG/UpW7O6UgV0KtdR+dqAsmsZ4koUod9VKircJBfxd0Y9+aIhtAoD6W5w+7sclV1c6cFEBrUy2PUFtbrw+ffZQbGtRnLhqSVpjqPsdkoE/yQ2xQ4g/Q6VruO6O+kGsLv2AZkOZFQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782315268; c=relaxed/simple;
	bh=42Ed64+3wm0Z8NK99dtzeXWSZhG0dOiv/Jc+q54mDck=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Wu7HMXpDJJxSXclu0btr7eYKxzK6cTfGhFTPK70JqKY0n4UTqq4c9AMpBkvIwye4VUQ04ppRMrDA60n3lafIaPHmEpZpZs+fSajYnWLS/miU0xJGe6UQ5LCdgIdAeC0DFF3Fk9pp47AxWvMX5Xk0bnLfnve/xod5PaSJ9SIsYjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oyQNmsCI; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oyQNmsCI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DC3281A0913;
	Wed, 24 Jun 2026 15:34:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB872601C5;
	Wed, 24 Jun 2026 15:34:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EAC5106C8382;
	Wed, 24 Jun 2026 17:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782315264; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hQIzpvMfwF06Dy+Dr6X7XbgYJ2zdNKivwH5fV0BlR9A=;
	b=oyQNmsCIcNTgs68aF1WzEwUyaqMGrQDkkQYBeAFupUMciys441g2Pmpqb9q63M9TgB3z9E
	obW679sV3ac8zlACQM9Jmg/vA1v3ow+j/P/Xhfnreqz+gfsGN0Qft8YbEltzMW38iraK5G
	9iEx3IU3pw62tpfcDlC29EJONLP21quC1Rlrlhpp4LfK2hpOrdisPqhb0sZ1oOElcLMo3u
	oTaeeKfmEJ1VM5c5SAWIaeFvOjdocre7HQHMPxIxunAsVG/t7aa/fRy61Zs8UWONtYA4mP
	QamLzEJxL0b9mjX7CEKx7PilFcaI1roV0COlX17AIapF6umjrYF86R9VRHohCg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 17:34:14 +0200
Message-Id: <DJHE108R7TU6.35ECAUQ8ZX041@bootlin.com>
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
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>
 <20260608-rustling-infrared-turkey-e09af8@houat>
 <DJ72WOUW5FA2.G1MPCAHJQ13F@bootlin.com>
 <20260624-judicious-enigmatic-hippo-b13ffe@houat>
In-Reply-To: <20260624-judicious-enigmatic-hippo-b13ffe@houat>
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime,

thanks for the feedback.

On Wed Jun 24, 2026 at 1:48 PM CEST, Maxime Ripard wrote:
> On Fri, Jun 12, 2026 at 02:44:43PM +0200, Luca Ceresoli wrote:
>> On Mon Jun 8, 2026 at 1:46 PM CEST, Maxime Ripard wrote:
>> > On Tue, May 19, 2026 at 12:37:32PM +0200, Luca Ceresoli wrote:
>> >> Currently the drm_bridge_connector has an embedded drm_connector, so =
their
>> >> allocation lifetimes are tied to each other. This is insufficient to
>> >> support DRM bridge hotplugging, which requires the connector to be ad=
ded
>> >> and removed dynamically at runtime multiple times based on hotplug/un=
plug
>> >> events while the drm_bridge_connector is persistent.
>> >>
>> >> Moreover the drm_connector is exposed to user space and thus an ongoi=
ng
>> >> operation (e.g. an ioctl) might last for an arbitrarily long time eve=
n
>> >> after the hardware gets removed. This means a new connector might hav=
e to
>> >> be added when the previous one is still referenced by user space.
>> >>
>> >> In preparation to handle hotplug, allocate the drm-connector dynamica=
lly,
>> >> to allow:
>> >>
>> >>  * creating and destroying a connector multiple times during a single
>> >>    drm_bridge_connector lifetime
>> >>  * creating a new connector even though the previous one is still in =
use
>> >>    and thus still refcounted and not yet freed
>> >>
>> >> This commit does not introduce the actions in the two bullets (it wil=
l
>> >> happen in a later commit), it only moves to dynamic APIs for connecto=
r
>> >> allocation and init.
>> >>
>> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> >
>> > I think this patch should be split in half, with the switch to using
>> > destroy first, and then the actual move to the dynamically allocated
>> > connector API.
>>
>> Is it doable? drm_connector_dynamic_init() mandates a .destroy callback,
>> drm_connector_init() forbids it.
>
> drmm_connector_init forbids it. drm_connector_init mandates it.

Something bogus in my reply, sorry. :)

So you mean splitting in:

 * first patch: move from drmm_connector[_hdmi]_init() to
   drm_connector[_hdmi]_init() and add a .destroy
 * second patch: move from drm_connector[_hdmi]_init() to
   drm_connector[_hdmi]_dynamic_init() +
   drm_connector_dynamic_register/unregister()

?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
