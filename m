Received: from mail-m49220.qiye.163.com (mail-m49220.qiye.163.com [45.254.49.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B10D30F815
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516835; cv=none; b=U+92DSFXvgYllikGxpeO+3QE6U2ElDVe8Grot0PMdYjnY3Fy8hSCFSvTumq0KE5uJhuPDyaKSc49H6iSB6stBlGu1CBAVU84ARPDNdhNKrcimAS+QrkvluiTatDe5ZhjoX3tXLy230pP6ktrlbVzh56/Kt6JylR5YxTevQJ0rkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516835; c=relaxed/simple;
	bh=wDla5NyAgljsvaMvqYC5JGSoXENcFslDuleW6mXDGwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgzMHTu9SwywiJOBB9EhJ1R8q1ltOkG06SLjHI9D3kYv2cnSG+tvDyBzPl0YqnbQcHqWSKZ9n6pYp42fheHoeAFGjQZG2q7/gtTBaV+d/V6uA89XFLB2RDt5CzOcFigy9JmgN1rq7oYXKAUMTZ0iWJYA+wny5mmIoJrvdeJ0DaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=BBz6saw1; arc=none smtp.client-ip=45.254.49.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="BBz6saw1"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3865a941e;
	Thu, 26 Mar 2026 17:15:11 +0800 (GMT+08:00)
Message-ID: <ea1bf890-c4be-4d66-ad26-a6bdb58a9292@rock-chips.com>
Date: Thu, 26 Mar 2026 17:15:11 +0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/bridge: dw-hdmi: document the output_port field
To: Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Christopher Obbard <christopher.obbard@linaro.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Fabio Estevam <festevam@denx.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Gilles Talis <gilles.talis@gmail.com>,
 =?UTF-8?B?R29yYW4gUmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>,
 Heiko Schocher <hs@denx.de>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Josua Mayer <josua@solid-run.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Martyn Welch <martyn.welch@collabora.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Richard Hu <richard.hu@technexion.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Vitor Soares <vitor.soares@toradex.com>
References: <20260320-drm-lcdif-dbanc-v1-0-479a04133e70@bootlin.com>
 <20260320-drm-lcdif-dbanc-v1-4-479a04133e70@bootlin.com>
 <050c6532-8122-4ded-9946-3ce1a86d2be0@nxp.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <050c6532-8122-4ded-9946-3ce1a86d2be0@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9d296d244d03a3kunm1010b4977b1d91
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5OS1ZLSxpMSBpMSh0fGE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BBz6saw1bA1HipARZJu1Th3JeGDhlWRDZM5b3IG6nb6VPuZJDLQA30JTB/X6J79LLkbgUnkqaZqnmMnVOtKWw03gpXLqkD6fTgBZcfRXfa74ymJvbj3O7FKcBLPHT1zk8aZ8xOSoV6SuC+/1g7OjciB+8/8J4m3qKQN1tjIqK4Y=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=hV1UzNvduceK201Bbs4LBHoL7oLLk3YAabMlA/Ugb6M=;
	h=date:mime-version:subject:message-id:from;

On 3/26/2026 3:25 PM, Liu Ying wrote:
> Hi Luca,
> 
> On Fri, Mar 20, 2026 at 11:46:15AM +0100, Luca Ceresoli wrote:
>> The meaning of this flag may not be obvious at first sight.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>   include/drm/bridge/dw_hdmi.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>

First of all, these changes related to the DW HDMI controller work well 
when tested on RK3399 HDMI.

>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
>> index 336f062e1f9d..45f6ba1a8ee1 100644
>> --- a/include/drm/bridge/dw_hdmi.h
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -126,6 +126,11 @@ struct dw_hdmi_phy_ops {
>>   struct dw_hdmi_plat_data {
>>   	struct regmap *regm;
>>   
>> +	/*
>> +	 * The HDMI output port number (which must be 1) if it is described
> 
> I'd rephrase:
> The HDMI output port number must be 1 ...
> 

Yes, the output port number should be 1, but I found that the output 
port number in the Rockchip-side dw-hdmi driver remains 0.

Therefore, it may be better to adapt the dw-hdmi drivers across all 
platforms to the bridge-connector architecture simultaneously.

This would allow removing &dw_hdmi_plat_data.output_port and unify the 
setting of DRM_BRIDGE_ATTACH_NO_CONNECTOR during the attach stage.
(Just as the Analogix DP driver does [0])

[0] 
https://lore.kernel.org/all/20260319071452.1961274-1-damon.ding@rock-chips.com/

>> +	 * in the device tree. 0 if the device tree does not describe the
>> +	 * next component (legacy mode).
> 
> Maybe be a bit more specific about "legacy mode":
> legacy mode without DRM_BRIDGE_ATTACH_NO_CONNECTOR flag when attaching bridge
> ?
> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> 
>> +	 */
>>   	unsigned int output_port;
>>   
>>   	unsigned long input_bus_encoding;
>>
> 

Best regards,
Damon

