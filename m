Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E85400E1B
	for <imx@lists.linux.dev>; Tue, 19 May 2026 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203966; cv=none; b=fbevx+Un3kX/2BS7CPPipMI8fNgWKgNsXggeVtoBKK7fl/onpCHN+xBXtRR4diL/XXqRbC//RwtEUvIEzhIni2psEh5tBLEt3T8DFedN5TxqS89jrLrEoP0XgnQlt+qrc+EWiUroT/+Q2qXkcCYwK2AXKj6T+GhpxbJP72j0XTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203966; c=relaxed/simple;
	bh=hCrBEIZfioLWNiUwANxK4I+0OvSRmFvvo7djd05KLOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZB355gl6ye740d/t9MRJ9h30H/jfi5nSXtIHsHPieyd8c2tonjdfIWfSibfdFyMB4YYKEfixy2QLyxp4a2UBSd+JnBiutc2RQdQfflOC/DoAwze80wzBfdStoRyQvK8IH5EJwUhbf5jMmTdyhlHBWDcY7X9Rn9dZ7xo6uo2Y3X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=aKUtM7zx; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="aKUtM7zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1779203953;
 bh=UysSrWx2IaBnmq7p+RKc3cNjOUxboHqJt85KySMdL0U=;
 b=aKUtM7zxR9CBNmTevvNgOFk89rSqEMwWO1aRXK/MrZpaQYBecfwJDDsVR1aENQonRmpcahq9l
 Mqzh2YwUndiwMhMUyjI4N2g+BsdGKzuO6uJjt4MR1Wi9qqFvrhbegnGJljyZZ05SPswAma7rS2H
 5Y5s8VaJY/K1nA4OjOjqTJgnaJtJ7ID8eaMG7ltyYZn/T+lIAXFD4cirywF0zB5NkMYTxjXmRp4
 MMoEUFR0tlKgvObfD0SaLOVe4hSqFlTldZSKpPy/bGqVX23BEXLTvHTPrGshTxPaJMde4ZJVkkC
 Ds1LJiZrxy/PXFXExyYvEsXWy+wh/sUx9s7sPvfdPHbw==
X-Forward-Email-ID: 6a0c7f56b6cbacb3a8d0c696
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e90eddfc-2f57-418a-ae05-43a411d72b99@kwiboo.se>
Date: Tue, 19 May 2026 17:18:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/23] drm: bridge: dw_hdmi: Hold bridge ref until
 connector cleanup
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, Liu Ying <victor.liu@nxp.com>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@kernel.org>, Christian Hewitt
 <christianshewitt@gmail.com>, Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-5-jonas@kwiboo.se>
 <177919241969.545972.18169905222569864569.b4-review@b4>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <177919241969.545972.18169905222569864569.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Luca,

On 5/19/2026 2:06 PM, Luca Ceresoli wrote:
> On Mon, 18 May 2026 18:01:40 +0000, Jonas Karlman <jonas@kwiboo.se> wrote:
> 
> Hello Jonas,
> 
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index b7bfc0e9a6b2..9d795c550f8a 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2600,10 +2609,14 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>>  
>>  	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
>>  
>> -	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
>> -				    &dw_hdmi_connector_funcs,
>> -				    DRM_MODE_CONNECTOR_HDMIA,
>> -				    hdmi->ddc);
>> +	ret = drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
>> +					  &dw_hdmi_connector_funcs,
>> +					  DRM_MODE_CONNECTOR_HDMIA,
>> +					  hdmi->ddc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_bridge_get(&hdmi->bridge);
> 
> I'm not fully following the code paths, but both the report and the fix
> make sense to me. Only I'd move the drm_bridge_get() before
> drm_connector_init_with_ddc(), to avoid a short window where no reference
> is held and the bridge might be destroyed before drm_bridge_get() is
> called. I'm not sure this can happen, but it's better to write the code in
> a way that clearly makes it impossible.

dw_hdmi_connector_create() is only called from dw_hdmi_bridge_attach()
so the bridge should already have a ref for the lifetime of this call.

I explicitly chose the placement after drm_connector_init_with_ddc()
to ensure ref count is correctly balanced without having to add a
drm_bridge_put() call in any error path. I.e. connector destroy() is
only called when drm_connector_init_with_ddc() succeeds.

This code/call is also planned to be removed in a future series, so I do
not think moving drm_bridge_get() is necessary unless you think we need
to protect against possible bad behavior from DRM core?

Regards,
Jonas

> 
> Otherwise looks good.
> 
> Luca
> 

