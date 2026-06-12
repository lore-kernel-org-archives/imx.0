Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB413D6CD8
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268304; cv=none; b=qLe2dU31swZPBtI7QgjyWVqGKLzCUNiP/Tp2stQXBoFhl1kQsmTjA2bdH8zBBmS/ejii4WAqWy6Np0s+i2tTZD+Q/uRBUw0FR8Fk43t5jaXFXdkb8ZKq1HFyf2EsvUcb//AXiWhObUf3CDo4wpAfgLA/6Onn8wP3vhaG0pjl1kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268304; c=relaxed/simple;
	bh=Gleb0qbLEeUZoIoKO88tFa6UOoIen2Eh49qEeyagqJs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=P8iHn65ft2i80+G4LhCOuHI625QUK3GgicytmoE3op4gFrjDwJZ+6i58UKN4EDheEP4bgD5BOxLgxdmowMOqXBuAwV/Hvu1PMgikxhpzxmLbgy3pbEGX7El6CkVr73qKqp4wp6m63mwbBXvgetWNORo2cCcODhZ68ebrOaPNQDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dFQd8k6P; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dFQd8k6P"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E2E9B1A38E3;
	Fri, 12 Jun 2026 12:44:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA41760012;
	Fri, 12 Jun 2026 12:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 226DB106C8A0F;
	Fri, 12 Jun 2026 14:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781268298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q7aYHV0vui2KpwKYP+HcA0t9W95kz+LHWdQ+dO9GQBA=;
	b=dFQd8k6PJ94E3ZZfjEYqzmkQPsYvoyTrrQlY4Ap40W2wN2QFEsqFoGSHPBKtSwsht7DU2k
	Pzjdc8EXl/e4irMwbnvHbVy23C4pBhLMD0lUW57jjyFdnRxbPzPfuwC0HB5m0GAdEDVQlu
	Gvkeypv5fnK/etR7C1B8B2BsB7qVFWaB2sNx6Y6CG2OJSowKF/G9zX+BaW4Hl7QAjB8x9l
	raAXLVg5BQk0hoh0UU75wZJIG4htMGFnWK23MlNkFNqt1EVQVxIz8gDWDJb9EEo2JXlTFP
	lP/htl8CFs/KmblKYtGA4Ny9yZF/BnQ+K4F4/DojGy2A3miZyk5PvapCL0wgnQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 14:44:43 +0200
Message-Id: <DJ72WOUW5FA2.G1MPCAHJQ13F@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
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
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>
 <20260608-rustling-infrared-turkey-e09af8@houat>
In-Reply-To: <20260608-rustling-infrared-turkey-e09af8@houat>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Jun 8, 2026 at 1:46 PM CEST, Maxime Ripard wrote:
> On Tue, May 19, 2026 at 12:37:32PM +0200, Luca Ceresoli wrote:
>> Currently the drm_bridge_connector has an embedded drm_connector, so the=
ir
>> allocation lifetimes are tied to each other. This is insufficient to
>> support DRM bridge hotplugging, which requires the connector to be added
>> and removed dynamically at runtime multiple times based on hotplug/unplu=
g
>> events while the drm_bridge_connector is persistent.
>>
>> Moreover the drm_connector is exposed to user space and thus an ongoing
>> operation (e.g. an ioctl) might last for an arbitrarily long time even
>> after the hardware gets removed. This means a new connector might have t=
o
>> be added when the previous one is still referenced by user space.
>>
>> In preparation to handle hotplug, allocate the drm-connector dynamically=
,
>> to allow:
>>
>>  * creating and destroying a connector multiple times during a single
>>    drm_bridge_connector lifetime
>>  * creating a new connector even though the previous one is still in use
>>    and thus still refcounted and not yet freed
>>
>> This commit does not introduce the actions in the two bullets (it will
>> happen in a later commit), it only moves to dynamic APIs for connector
>> allocation and init.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> I think this patch should be split in half, with the switch to using
> destroy first, and then the actual move to the dynamically allocated
> connector API.

Is it doable? drm_connector_dynamic_init() mandates a .destroy callback,
drm_connector_init() forbids it.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
