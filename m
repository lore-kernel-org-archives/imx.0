Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2844B318ED7
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624659; cv=none; b=RDkjoc/FdXxdlYSIkdSGZpi4USLlSK6vXOXOckv5n9isykzzA2nAD5AxPmRruynU9bP/7gYJh1d2tSw7W00EJ6Nb8Kt1Bowl3s5OG/slAsCBOkIjrOZQH7FvKV+8+IQl1e0RUs+ibO9JgEtCXuSy4oBKcPajJQdUsDUnI4CpIEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624659; c=relaxed/simple;
	bh=kD10AQXHuuYRjz03UahPRNts53dNZ7kV63Dyk4GVcts=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=DaHhIsIFGGRblRxHAjv0MQ/RaiuvkiIua47UfBRwtU+VNnNPmOKu5pm7J/4BCJk5DDqHUgPX9xspq6O25PzRemkF8MQjUK4PkhFmG3YkJ9OeiOHdB3sPhsblV8HdBHOV1F/OEHP09zOkdzI+V3RS5k+8PKcmBy8D9w3ci2UTb3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pCE97cT6; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pCE97cT6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 221CAC5874C;
	Fri, 27 Mar 2026 15:18:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A14160268;
	Fri, 27 Mar 2026 15:17:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85438104513F2;
	Fri, 27 Mar 2026 16:17:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774624651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=samQROhlH4N1aha94rTVBjEKplzD2m0FuRpbiICT/nQ=;
	b=pCE97cT6DMcM5Pa+btyh7njrKz5HZTvdev3UK+68sOiqtIEKSvHdE6yQnzgD0dfQ0MRLBZ
	bPhrzsyzKbOvPXUqOh7DXE/5oCY2Ev5KPoNaUEXPxdPPlT5iu4GWbuSgZTDf8+r4bX7YRY
	vto5XGJK9F73IUqDcej6wbwZusxHJgI0ef0GKKSsBOTkSCbxQsx0PsIEjdL4u0lCEIqcd9
	As9FZeZOG3haFdHjm0REDOBGEJGzu0DkTBE2SV9Dqhr70ujDAouMYYXMsz5ZKFv25WUiC/
	NqJA4AyX4/frpauz7xiTscRyhT3eyUSldFK4lD0vO/C5SXDBlBQswb7O79V0FQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 16:17:17 +0100
Message-Id: <DHDNXJS3543H.382JEP1XJKOQK@bootlin.com>
Cc: "Marek Vasut" <marex@denx.de>, "Stefan Agner" <stefan@agner.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Liu Ying" <victor.liu@nxp.com>, "Rob Herring" <robh@kernel.org>, "Saravana
 Kannan" <saravanak@kernel.org>, "Kory Maincent (TI.com)"
 <kory.maincent@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Adam Ford"
 <aford173@gmail.com>, "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 "Anson Huang" <Anson.Huang@nxp.com>, "Christopher Obbard"
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
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 7/8] drm/bridge: imx8mp-hdmi-tx: add an hdmi-connector
 when missing using a DT overlay at boot time
X-Mailer: aerc 0.20.1
References: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
 <20260320-drm-lcdif-dbanc-v1-7-479a04133e70@bootlin.com>
 <20260326082843.GB2670326@killaraus.ideasonboard.com>
In-Reply-To: <20260326082843.GB2670326@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Laurent,

On Thu Mar 26, 2026 at 9:28 AM CET, Laurent Pinchart wrote:

>> Many dts files for imx8mp-based boards in the kernel have such a connect=
or
>> described and linked to port@1, so a connector is added by the
>> display-connector driver along with a bridge wrapping it. Sadly some of
>> those dts files don't have the connector described. Adding it would solv=
e
>> the problem easily, but this would break existing devices which do not
>> update the dtb when upgrading to a newer kernel.
>
> I think this series should also fix the in-tree dts files, to pave the
> way for removing the workaround.

Fixing all dts files can surely be done, but it won't allow removing the
workaround. Any devices shipped with a dtb without the connector and
upgrading their kernel later on but not the dtb will fail as soon as they
upgrade to a kernel with patch 8 but with this workaround removed.

That said, do you still think it's worth adding the hdmi-connector node to
all dtbs missing it?

It should be fairly simple and IIRC it would involve a couple dozen drivers
at most based on my initial research. However for most of them I have no
way to know which type of connector is installed, would it be OK if we
describe type A when the type is unknown, just like
dw_hdmi_connector_create() does right now programmatically [0]?

[0] https://elixir.bootlin.com/linux/v7.0-rc5/source/drivers/gpu/drm/bridge=
/synopsys/dw-hdmi.c#L2601

Also, if such a change is to be done, I'd definitely do it as a separate
series, to avoid adding more stuff to this series in-flight.

>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>> @@ -25,6 +25,23 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>  	  Choose this to enable support for the internal HDMI encoder found
>>  	  on the i.MX8MP SoC.
>>
>> +config DRM_IMX8MP_DW_HDMI_BRIDGE_CONNECTOR_FIXUP
>> +	bool "Support device tree blobs without an hdmi-connector node"
>> +	default y
>
> Can't we enable the workaround unconditionally ? Distributions will need
> to enable this option anyway as they can't know what device they will
> boot on. I fear a configuration option will confuse users and waste time
> on debugging.

Sure, good point.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
