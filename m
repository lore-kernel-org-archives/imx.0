Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0833C9
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735597245; cv=none; b=DhT5jTtt5zfFM8X5aqWhbGPS3k24kEMsdSIjsB4f939c3LL33J87X07QT0X/GN9y04hIiO1I75TQv/m1NsVyuqGL7G6WKp2nmnbemdFCcQBjUx5u9+r38Tg1DOx7BvtOGxyQ71g0mi8NSIeUK/c5UOkow7cfkJ7sm6vtk2vQzyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735597245; c=relaxed/simple;
	bh=HvA2qAjw33ZC/G7JpN9bqDMBcPjflPuTEMfgikiVhxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3K1Yn1yXqPeDNZAhvOI/KL4bzfg81Lilg8EZ5CU+oUGYeUMjl5Cb7/VreA1rIZY+VyT+8ECUIPqiKPibygVUA63kYwtM7qH0fJOFWKIGLVqDsalqMWNQSBVPKm3/UYHd8dAh+4g033Z5Ww7wGv+5VggMnHPWp2D8K6O2zt2qEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QomD+4/h; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QomD+4/h"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FDC9104855A1;
	Mon, 30 Dec 2024 23:20:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735597240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5MA8xyqbIBeJ0Pwy7IN+375Ka0H3nD/YtEWmgaypqI4=;
	b=QomD+4/h4aDrfaPORZZL2G3oQZCoYjRspDHcJvk04g+LbLGwYe7lX/Ut9k/DT6VCCf47ZI
	030uCoCI4B4gbmrw/dcQP2UvmPNs/FcyI0811H4EOugYTVcXoo5wB9DjyyV1giQmkR2t29
	KupnLhochVeXxE1HGeJ/3/5qTcIQ7LJvkufaTVv0izwku1hiElU1kgiWi56IBvycnu0uyC
	k5zteYbB943Z3kKYhnUFm7uBRpK4aFiSL7rHQOk5+779jflb1aPDEgoCUtQl1hra0R+wf7
	St0dscX7LILf/ZiqCd6IjfPZVKtrdtite3eM/TUGZoh+HtbbydA5eCKmSDjQhw==
Message-ID: <85d87cf5-26cd-4d71-b9ec-71d5e16d4e0b@denx.de>
Date: Mon, 30 Dec 2024 22:44:25 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/bridge: imx8mp-hdmi-tx: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Ying Liu <victor.liu@nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20241224014701.253490-1-marex@denx.de>
 <nehmmkv22ortkw6ngzlhjqo7emxsptt2dzoulln5ili52uswfp@h3acrwrad2y5>
 <75dc6f74-f828-49ac-8bf6-41fd4e197855@denx.de>
 <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/30/24 8:04 AM, Ying Liu wrote:
> On 12/26/2024, Marek Vasut wrote:
>> On 12/24/24 5:21 AM, Dmitry Baryshkov wrote:
>>> On Tue, Dec 24, 2024 at 02:46:14AM +0100, Marek Vasut wrote:
>>>> The dw-hdmi output_port is set to 1 in order to look for a connector
>>>> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR
>> working.
>>>> The output_port set to 1 makes the DW HDMI driver core look up the
>>>> next bridge in DT, where the next bridge is often the hdmi-connector .
>>>>
>>>> Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>>> Cc: Liu Ying <victor.liu@nxp.com>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Stefan Agner <stefan@agner.ch>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: imx@lists.linux.dev
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> ---
>>>> V2: No change
>>>> ---
>>>>    drivers/gpu/drm/bridge/imx/Kconfig          | 1 +
>>>>    drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 1 +
>>>>    2 files changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
>> b/drivers/gpu/drm/bridge/imx/Kconfig
>>>> index 9a480c6abb856..d8e9fbf75edbb 100644
>>>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>>>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>>>> @@ -27,6 +27,7 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>>>    config DRM_IMX8MP_HDMI_PVI
>>>>    	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>>>>    	depends on OF
>>>> +	select DRM_DISPLAY_CONNECTOR
>>>>    	help
>>>>    	  Choose this to enable support for the internal HDMI TX Parallel
>>>>    	  Video Interface found on the Freescale i.MX8MP SoC.
>>>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>> index 1e7a789ec2890..4ebae5ad072ad 100644
>>>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>> @@ -101,6 +101,7 @@ static int imx8mp_dw_hdmi_probe(struct
>> platform_device *pdev)
>>>>    	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
>>>>    	plat_data->priv_data = hdmi;
>>>>    	plat_data->phy_force_vendor = true;
>>>> +	plat_data->output_port = 1;
>>>
>>> Quoting my feedback to a similar Liu's patch:
>>>
>>> This will break compatibility with older DT files, which don't have
>>> output port. I think you need to add output_port_optional flag to
>>> dw_hdmi_plat_data and still return 0 from dw_hdmi_parse_dt() if the flag
>>> is set, but there is no remote node.
>> Looking at the upstream imx8mp*dts , the oldest commit which adds HDMI
>> support is commit:
>>
>> 3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on
>> TQMa8MPxL/MBa8MPxL")
>>
>> That already contains the HDMI connector node. Every follow up addition
>> of HDMI to another device has been a copy of the same commit, with
>> connector, so I think it is safe to say, no upstream DT is going to be
>> broken by this change. Do we care about hypothetical downstream DTs
>> which may be missing the connector ?
> 
> These have no HDMI connector nodes:
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts
Huh, I missed those, thanks.

Would it be OK with you to fix those DTs up and add the missing 
connector, rather than introduce some optional port workaround for them ?
