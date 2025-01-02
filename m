Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAB4C13D
	for <imx@lists.linux.dev>; Thu,  2 Jan 2025 23:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735860232; cv=none; b=T1QaeK69KMHAtTfpxZ6Sn0W2mr5HPz0a0WjnhyKnU79Cm4VcUeaQIdo9Ecxfcc6Okn2hljOlJuPk/8EEBx7dMZE+SmbvM7+d3bFbBdjaOTlRM0e3uk7tMeaOxDdzAjgENIOXpqtP51gSDI9umc9U1TdGMfsgXggTnH6s4/Qm5g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735860232; c=relaxed/simple;
	bh=hag6xHofvIzI5jwpgDDt4ItO/8/cFkttKNsseQTpdbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kz4C5E1Jh0ZPF8hpdOp7GtjJ6ayuJLVyIyqFIakB5IHM2eNBbS4lUYwnwSavdZdO4Ja9n5kS/wy+Li475etjOP+js7os3qhCHgJw0A33DkH/6w7+Yjn/yY7ysv0mwqWTeA/tiuApNsxDN5ngzEUfXN23mdpMoVQdkj7vlyqEU0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Kqbeg/Xq; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Kqbeg/Xq"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 629A4104811D0;
	Fri,  3 Jan 2025 00:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735860227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbVTKj22DdIODp/G/2Y0eA7B9M37L5pcHT1rwZZk/Z8=;
	b=Kqbeg/XqeuBhAlmLvyOM2Sizn2nbZv+MyR/M+3ljCa1k8+hadZA1KHSq1QhDmXt4aA/XEV
	wISkaeVHQP820WAs87CtyBZsX6bNVLr5xZcFi3TQJ1EojlrmXjEoJlPoo92MNK7QJWHzV1
	hlb6abGRd6cNSlTk3tDgNBJnqvklvZYl4+qYmqkPhMusO6Mnq2e6lR2GIUaMwdjoV8S1ul
	6m2/xwTy1pxswXg+5Fw5GhllyWtTUd5cT8GwIfkw0tW43b3G0El3x6egyGbEtMFxDZrjwL
	+AGD2jHyzmBhFaRMTATqc326P525I7PngwACEuFXwGHI4RB38xVWkoxcee6h2A==
Message-ID: <2f2bdcb1-6d83-4939-9dd0-3fb206202273@denx.de>
Date: Fri, 3 Jan 2025 00:20:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241231192925.97614-1-marex@denx.de>
 <20241231192925.97614-3-marex@denx.de>
 <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <u4hjoteybchte2fdmxle5rsu5jbohm7hjjoejrxiqa6lszqm56@6facok3v55kg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/2/25 6:58 PM, Dmitry Baryshkov wrote:

[...]

>> @@ -97,13 +100,36 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>>   			return ret;
>>   		}
>>   
>> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>> +		ret = drm_bridge_attach(encoder, bridge, NULL,
>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>   		if (ret) {
>>   			of_node_put(ep);
>>   			return dev_err_probe(dev, ret,
>>   					     "Failed to attach bridge for endpoint%u\n",
>>   					     of_ep.id);
>>   		}
>> +
>> +		nextbridge = drm_bridge_get_next_bridge(bridge);
>> +		nextbridge = drm_bridge_get_next_bridge(nextbridge);
>> +		/* Test if connector node in DT, if not, it was created already */
> 
> By whom? And why?

By the HDMI bridge driver, see 1/4.

> There is no display-connector bridge, but there is a
> normal bridge chain, you have passed DRM_BRIDGE_ATTACH_NO_CONNECTOR, so
> now it's a proper time to create drm_bridge_connector. You have added
> the next_bridge_optional flag, but it should just prevent the dw driver
> from returning the error if there is no next_bridge.
So what exactly should I do here ?

If dw_hdmi_parse_dt() only exits with 0 if there is no connector node in 
DT, I don't get any output on the HDMI. I have to create a connector in 
the HDMI bridge driver instead and not here, right ?
