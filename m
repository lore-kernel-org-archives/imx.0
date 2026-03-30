Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DA43385B6
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774883439; cv=none; b=GZdEpwN4oQyVMr/zrDrqszYIl2pr8mkvhOVuCy5+ikztCtaY6wR1yBrhUUz2SBoaXg1dgnQrwOp3tZzUnZEiwPUQAyEJwSN/GFERzcXJY7eXcz/YBC5jPiR+gbrQpbUCvXb5WCdgffrO37xDItDxClvZGdoOsHmuwmkqTYNyG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774883439; c=relaxed/simple;
	bh=M1WZaq9jiSBE3SqBfaSHaD8aDhIbmjsb35iPCx83Vvw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Oz701DKYvaKNb02ifRZKbSCL7+qpA2kOIfvcZ4jFymvr64KCK+cRDt+KAvvr8oCVJjo4wlc3hAqNtpNpy+mzeqVFLRVd6nhMPYvq4N/m8I8dNGDDn6wORyf/N3Rsrv7PyohtJMVO5kQlWgdRUJBbLgp+QgoEMtbOi+SMxb1afyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MXg8UvK8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MXg8UvK8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E02511A308B;
	Mon, 30 Mar 2026 15:10:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3EB05FFA8;
	Mon, 30 Mar 2026 15:10:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8AE9104504A6;
	Mon, 30 Mar 2026 17:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774883431; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p1MeQWrS6eGeRuRaT9b0wX2w36pWQDDzuAhBPQ3PoRQ=;
	b=MXg8UvK8KWtJw7KB3Rap3NGvp1/8bEh+95uH9XyT2Di0JupAl1bF/aIQADEyMy2qElkrTB
	ODmctauWYW8JMtSu3vWYwV22bNPtCN0WcLP6vs5HaozqoLlZayxN3vu2UfOVkdCyldTFxl
	C8ZwyzAbV+VIN50/Wc6ddFc0haY1pWQGzeX1AGsdb8BqEBJ/Mi+zDmwydGS4smiEdXIizE
	Z7Wuxs0lWOb49XE5riMNWwFldiv6uDfizpWrsO3dkhaiBl/Rt3wkxKqvTG1WNbpeCvnpYw
	nYxD+pcPlsmFJ/kGWG9wl19T5zbryW3eKyl/g+l6pzKdvyYudDG9qKeU3OuSCw==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 17:10:14 +0200
Message-Id: <DHG7NSIRPPRD.BMUFZBW10LNK@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 4/8] drm/bridge: dw-hdmi: document the output_port field
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Adam Ford" <aford173@gmail.com>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>, "Anson Huang"
 <Anson.Huang@nxp.com>, "Christopher Obbard"
 <christopher.obbard@linaro.org>, "Daniel Scally"
 <dan.scally@ideasonboard.com>, "Emanuele Ghidoli"
 <emanuele.ghidoli@toradex.com>, "Fabio Estevam" <festevam@denx.de>,
 "Francesco Dolcini" <francesco.dolcini@toradex.com>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>, "Gilles Talis" <gilles.talis@gmail.com>,
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, "Heiko
 Schocher" <hs@denx.de>, "Joao Paulo Goncalves"
 <joao.goncalves@toradex.com>, "Josua Mayer" <josua@solid-run.com>, "Kieran
 Bingham" <kieran.bingham@ideasonboard.com>, "Marco Felsch"
 <m.felsch@pengutronix.de>, "Martyn Welch" <martyn.welch@collabora.com>,
 "Oleksij Rempel" <o.rempel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Philippe Schenker" <philippe.schenker@toradex.com>, "Richard Hu"
 <richard.hu@technexion.com>, "Shengjiu Wang" <shengjiu.wang@nxp.com>,
 "Stefan Eichenberger" <stefan.eichenberger@toradex.com>, "Vitor Soares"
 <vitor.soares@toradex.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Marek Vasut" <marex@denx.de>, "Stefan Agner"
 <stefan@agner.ch>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>
X-Mailer: aerc 0.20.1
References: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
 <20260320-drm-lcdif-dbanc-v1-4-479a04133e70@bootlin.com>
 <050c6532-8122-4ded-9946-3ce1a86d2be0@nxp.com>
 <ea1bf890-c4be-4d66-ad26-a6bdb58a9292@rock-chips.com>
 <DHDIOSVSDG9W.B7BW87297KT3@bootlin.com>
 <4396e94d-7b88-4599-a938-3c1932a2f9cb@rock-chips.com>
In-Reply-To: <4396e94d-7b88-4599-a938-3c1932a2f9cb@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Mon Mar 30, 2026 at 3:13 AM CEST, Damon Ding wrote:
>>>>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdm=
i.h
>>>>> index 336f062e1f9d..45f6ba1a8ee1 100644
>>>>> --- a/include/drm/bridge/dw_hdmi.h
>>>>> +++ b/include/drm/bridge/dw_hdmi.h
>>>>> @@ -126,6 +126,11 @@ struct dw_hdmi_phy_ops {
>>>>>    struct dw_hdmi_plat_data {
>>>>>    	struct regmap *regm;
>>>>>
>>>>> +	/*
>>>>> +	 * The HDMI output port number (which must be 1) if it is described
>>>>
>>>> I'd rephrase:
>>>> The HDMI output port number must be 1 ...
>>>>
>>>
>>> Yes, the output port number should be 1, but I found that the output
>>> port number in the Rockchip-side dw-hdmi driver remains 0.
>>
>> Really? I checked all the bindings in
>> Documentation/devicetree/bindings/display/rockchip/*hdmi* and all mentio=
n
>> port@1 as the output port number. Can you point to code using port@0 as =
the
>> output port?
>>
>> Should it be true, that would be unfortunate because the output_port
>> variable does not handle this case. It's used as a sort of bool-or-int
>> variable:
>>
>>   * as a bool [0] to find out whether the DT is supposed to describe the
>>     output port
>>   * as an integer to tell the port number to parse in DT [1]
>>
>> So saying "please parse port 0" is impossible.
>>
>> [0] https://elixir.bootlin.com/linux/v7.0-rc5/source/drivers/gpu/drm/bri=
dge/synopsys/dw-hdmi.c#L3310
>> [1] https://elixir.bootlin.com/linux/v7.0-rc5/source/drivers/gpu/drm/bri=
dge/synopsys/dw-hdmi.c#L3315
>>
>
> Aha, my description might be a little misleading. The
> &dw_hdmi_plat_data.output_port is 0 on the Rockchip side, so the next
> bridge will not be parsed for it.
>
> Then I think the &dw_hdmi_plat_data.output_port should be 1, as this
> helps support the hdmi-connector and other bridge chips.

Ah, OK, that's all clear now.

> BTW: The Rockchip side dw-hdmi patches for bridge connector support will
> be updated as a follow-up to your patch series. :-)

Great! Don't forget to Cc me.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
