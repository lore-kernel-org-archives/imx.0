Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D398ADDBB
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 02:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736131878; cv=none; b=S08ckvtMa88R8s8D1IStgI4Uggit2kvC7lQ6MDEDUtiuR03uGm8tIXnkG4dZV6sslxKwdV8eODYW+vdBbhtvkqiMxUW4bf3Tu1FTt2KL3iDgeoI0e1SNhRBqmHZ4mXa6FS4T0QBYK9EXsXkN5UkIt1HxoN9TI1cgksBGIyhTRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736131878; c=relaxed/simple;
	bh=9CcdvAs5XtvF4xRH5loRFdoRWlffGh7aUrJiDk/DsrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fh6EhobGFDDdjYIoJwSGokyU+1BksQ7l5NKcQAZ52zE6Sr9SbFdsLUH2PQkt0mdGBY9khaNuH/VNgd4R6RmvgmWZJzZbGsoBsyzaArFuSFWRYDYxc6Y7kq3XGf5y6zTLog8mJH22pzg6IRAol6xAPUk2yjsJqJ8sTPa1n09Wmeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=T9ITUC6f; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="T9ITUC6f"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0559A101CAF7B;
	Mon,  6 Jan 2025 03:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736131872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJ/N98GUomXDkft85DxAvNEuUOqGWE/KcZAgHDK0jeE=;
	b=T9ITUC6fQelTFwjAEEJ5m2WGy+lRIqB0Lu2y8bX9Yd30G5cxtC9Yh5P4HdPJhMz2myWR0J
	IecEuDfsrsVlO4h9QdnBwPonalU6JMm0YF0TiFz244f8sw+RtnREMZW4NLXVECPqS+OPGX
	tsnntiH/BG7jFX7wu4PdwjCc4ANTVQ2Ctvh2soprVwDJ9NnfJuudFoEGqEXNdi1n2rttfw
	vb0o6esPRuD/rf/jDhxv8kYXjY7Op2gHMFDyubWSVOBQFajmVgaGtNouiB7Nbgi5jiwZoA
	vIrXab+KvqVkaJl4eC6MQc7QzvfC0oEwsWirw67d0dYSGRnrnx+ojFZoEFhvHQ==
Message-ID: <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
Date: Mon, 6 Jan 2025 03:48:52 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250105190659.99941-1-marex@denx.de>
 <20250105232219.GC21164@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250105232219.GC21164@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/6/25 12:22 AM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> Thank you for the patch.
> 
> On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
>> Add a flag meant purely to work around broken i.MX8MP DTs which enable
>> HDMI but do not contain the HDMI connector node. This flag allows such
>> DTs to work by creating the connector in the HDMI bridge driver. Do not
>> use this flag, do not proliferate this flag, please fix your DTs and add
>> the connector node this way:
>>
>> ```
>> / {
>>      hdmi-connector {
>>          compatible = "hdmi-connector";
>>          label = "FIXME-Board-Specific-Connector-Label"; // Modify this
>>          type = "a";
>>
>>          port {
>>              hdmi_connector_in: endpoint {
>>                  remote-endpoint = <&hdmi_tx_out>;
>>              };
>>          };
>>      };
>> };
>>
>> &hdmi_tx {
>>      ...
>>
>>      ports {
>>          port@1 {
>>              hdmi_tx_out: endpoint {
>>                  remote-endpoint = <&hdmi_connector_in>;
>>              };
>>          };
>>      };
>> };
>> ```
> 
> Are there any in-tree DT sources that use the old bindings ?

See 
https://lore.kernel.org/dri-devel/AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com/

The rest is fixed, thanks.
