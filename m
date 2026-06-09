Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18213793BE
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997468; cv=none; b=Y/MeAhaw3jJfPw7sjshdV1nZ6PxMCsJvLY8R/edqXRsjm6CuzkaRpsMV3lXOVvyHQ53GBXrUgdfevLE5M9e4LHrMoO2rh1+KWPkFajT/YfU5howDM7+IO+8QAUB3J0o+zFlp/gLSSsuxaOeT1peKhGS+l20zVguIDlKeSnh45sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997468; c=relaxed/simple;
	bh=4mRBPNmR1OtFkGxuqAKs88NJp8h9p2yjslNUV+/qzLE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qk6UdkC859Ua2J+z5WC7Ir7sNIRLFvFskp2siiFkXeQm/XCQ0LrbBLxjO0enCo22Q7zDpXUR2T+awfqSJrEfpWOeJ5ZA1zs2dexg3vqozbFFLePIU9n0b2h5pzYs+XZVBpf3kRa04+rD8JBdH57gMdnshlqwpY/AEMuI7Gu8G1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xyprXdNF; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xyprXdNF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 625AEC4FED7;
	Tue,  9 Jun 2026 09:31:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1C835FFC1;
	Tue,  9 Jun 2026 09:31:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2156B106A2ACA;
	Tue,  9 Jun 2026 11:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780997463; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4mRBPNmR1OtFkGxuqAKs88NJp8h9p2yjslNUV+/qzLE=;
	b=xyprXdNFrB0MTFjyuj1yRt4FGoAYSUSksWS7Jm3cTcx0eI+zTv4/9QMmFUmHzFSeN7BfpA
	Oh2kQLxV4VhmWk8y0DUWCH6baH+UYkAyrIvn7YYbgM11mEVLLTWGlkdYw2/41Z7j/QjVmU
	SdeN2Sbpk8SLYhLbvz72roOjWsMh9PyH7lh+3HQ+ebMbgYEoxnx7m1Ac+ixwcNRrnqJOLK
	JyDVQ7iKg7ADJ1oL9A4wmAH/xPTrNp0Q1+gt9TINL4PDuyQFT0Xt35wOXZ6EIvzo2NK5ul
	6fM2APzJlzP/fZJYdVvX1U3vPjjxj6qK2qjA84MEZy71oY+zccv+Z83Ln3pMQQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 11:30:52 +0200
Message-Id: <DJ4EWMIX84PN.3VTENLJT2FWDH@bootlin.com>
Subject: Re: [PATCH 26/37] drm: event-notifier: add mechanism to notify
 about hotplug events
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
 <20260519-drm-bridge-hotplug-v1-26-45e2bdb3dfb4@bootlin.com>
 <20260608-maize-rooster-of-youth-c0bbde@houat>
In-Reply-To: <20260608-maize-rooster-of-youth-c0bbde@houat>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jun 8, 2026 at 2:13 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:43PM +0200, Luca Ceresoli wrote:
>> In preparation for supporting DRM bridge hotplug, add an event notifier =
to
>> allow interested parties to be notified about events they need to react =
to.
>>
>> For the initial implementation of bridge hotplug, two events are needed:
>> bridge detach (happening in drm_bridge.c) and MIPI device attach to MIPI
>> host (happening in drm_mipi_dsi.c).
>>
>> For this reason implement the event notifier in a new common file that
>> event producers can easily use to send events.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> So, you claim in the commit message that it's about a hotplug event, but
> the only events are the bridge being attached and detached, so not a
> hotplug event?
>
> And why a bridge would want to be notified that itself (or another?)
> bridge is being attached or detached?
>
> You need documentation, and a more descriptive commit message.

Yes.

But before that I need a decision about the scope we want to give to this
notifier. It is a very generic module, with basically no dependencies, so
people will try to add more unrelated events and we'd need to set a
boundary.

Options:

 * Should it be for hotplug-related events only?
 * Should it be for any DRM event that needs notifications?
 * Something else?

I'm happy to write that in the docs and commit message once it's agreed, so
any comments would be welcome right now.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
