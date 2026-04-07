Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3A23AA4FC
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565848; cv=none; b=nExaNNjWiCBw4Jv3GCgfJoZapTylTTTGrNbxdSd66gQ3O+XlkPiPGCcxcWSOO/0c0RTXRTTYyl/UF0dpFgWD9IPQgzua/xJZczTV9z86lAVhJyAPByB/WMZ/HDbjXxhA3zSH+kIC0PPCEgOZkJ90h8in6SQxb1Q7DaQPPwOtFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565848; c=relaxed/simple;
	bh=4eCfqGoK6C2ueQZKx6S7NXcX2FQyyva+vuYu0Lvkkro=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=gTzJdQP92zb1txi5jcumQ/7BkHfF2EuplJmv4T5M7bT103EA558y3//LjDRqjonRlAhKtj/VfpGkJ/SP8iQAoTchVQZYa2k4f9ihUAedCSuOLdhNSDaVahMfqEr404n6Mw+gyNU352P2RxGBeGiAFlOuqeP5ILXHn5GUJLAC5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xpJfVE+D; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xpJfVE+D"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D12AF1A31CB;
	Tue,  7 Apr 2026 12:44:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CE4B603C7;
	Tue,  7 Apr 2026 12:44:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B93C104500CD;
	Tue,  7 Apr 2026 14:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775565842; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=93hW5u7kA6zQFXa6aVbYkWf1SP6enbNwj09rJ/uKnY0=;
	b=xpJfVE+DhfpK6BJKwTs6G+k4orXAFM7qXHNM122mw7BmUf/+v8aWArISlO1AxW1py4zL0D
	l3eDoGsEeqfBg1NKMbO9sgJ4S7D6zRz49ioXvYzduYmPkCOilbY5pk+yTQcDsWpiF8RnXY
	IvAdF6hzJNMVcF/WwhBVJfWIdcyNRuoSdJfleLTioAxZEyY1+v1FmsBfCjyJ+6cyfJ020Y
	nnkewI+ugG+AwkXlJxkwrmjE1GtDuuHqFU1LCKorXBcpdBQgApB3iEY9zbt66+ARnv2mi8
	OnFqql8fiZh+ZZsIEtR6zuX+LesqN6VQWFDWaZi1M8Rtn2gIZNgpSpvHjWJtHA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 14:43:51 +0200
Message-Id: <DHMXK2CNE9M8.W9BXCX4I7WR5@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 08/11] drm/bridge: imx8mp-hdmi-tx-connector-fixup:
 add an hdmi-connector when missing using a DT overlay at boot time
Cc: "Damon Ding" <damon.ding@rock-chips.com>, "Kory Maincent (TI.com)"
 <kory.maincent@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Adam Ford"
 <aford173@gmail.com>, "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 "Christopher Obbard" <christopher.obbard@linaro.org>, "Daniel Scally"
 <dan.scally@ideasonboard.com>, "Emanuele Ghidoli"
 <emanuele.ghidoli@toradex.com>, "Fabio Estevam" <festevam@denx.de>,
 "Francesco Dolcini" <francesco.dolcini@toradex.com>, "Frieder Schrempf"
 <frieder.schrempf@kontron.de>, "Gilles Talis" <gilles.talis@gmail.com>,
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, "Heiko
 Schocher" <hs@denx.de>, "Josua Mayer" <josua@solid-run.com>, "Kieran
 Bingham" <kieran.bingham@ideasonboard.com>, "Marco Felsch"
 <m.felsch@pengutronix.de>, "Martyn Welch" <martyn.welch@collabora.com>,
 "Oleksij Rempel" <o.rempel@pengutronix.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Richard Hu" <richard.hu@technexion.com>, "Shengjiu Wang"
 <shengjiu.wang@nxp.com>, "Stefan Eichenberger"
 <stefan.eichenberger@toradex.com>, "Vitor Soares"
 <vitor.soares@toradex.com>
To: "Liu Ying" <victor.liu@nxp.com>, "Marek Vasut" <marex@denx.de>, "Stefan
 Agner" <stefan@agner.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>
X-Mailer: aerc 0.20.1
References: <20260402-drm-lcdif-dbanc-v3-0-27cd247a0847@bootlin.com>
 <20260402-drm-lcdif-dbanc-v3-8-27cd247a0847@bootlin.com>
 <88cf4526-ca8f-4b25-acea-347d92539a2b@nxp.com>
In-Reply-To: <88cf4526-ca8f-4b25-acea-347d92539a2b@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Liu,

On Fri Apr 3, 2026 at 11:28 AM CEST, Liu Ying wrote:

>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx-connector-fixup.dtso
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * DTS overlay adding an hdmi-connector node to boards using the imx8mp=
 hdmi_tx
>> + *
>> + * Copyright (C) 2026 GE HealthCare
>> + * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&{/} {
>> +	#address-cells =3D <2>;
>> +	#size-cells =3D <2>;
>> +
>> +	fixup-hdmi-connector {
>> +		compatible =3D "hdmi-connector";
>> +		label =3D "HDMI";
>> +		type =3D "a";
>> +
>> +		port {
>> +			fixup_hdmi_connector_in: endpoint {
>> +				remote-endpoint =3D <&hdmi_tx_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&{/soc@0/bus@32c00000/hdmi@32fd8000/ports/port@1} {
>> +	hdmi_tx_out: endpoint {
>> +		remote-endpoint =3D <&fixup_hdmi_connector_in>;
>> +	};
>> +};
>>
>
> There is a build warning(W=3D1):
>
>   DTC     drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx-connector-fixup.dtbo
> drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx-connector-fixup.dtso:12.6-27.3:=
 Warning (avoid_unnecessary_addr_size): /fragment@0/__overlay__: unnecessar=
y #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" =
or "ranges" property

Ouch, my bad, forgot to run W=3D1 after the last edit. Fix incoming v4,
toghether with the other improvements you have suggested.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
