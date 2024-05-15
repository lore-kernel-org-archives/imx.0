Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EBD2206B
	for <imx@lists.linux.dev>; Wed, 15 May 2024 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715754765; cv=none; b=Ikn+te5zMEKWw1Bkvt1FnOH4JbkPDOG5dSC0usKygaJ7vSZI2Ljn2ChOoAKbuySXJIKGnod8j/3Q69wg/KktH6tE0sQ+PPOfYTEF1aWNtXVMtgo8bl/8ZFHK19ky3zrmeqCv4LHbDEL5wBuEnzo63Vre8g0qmOPcC43s+go+/Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715754765; c=relaxed/simple;
	bh=KfY81r3tZ/Hkt4mSS56cz85Y2IUiwTuO0BbunY6OYrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrv2Rbiu116SuBFFnXivnVs/7DH5cbkWgD+Kj/UVKzjaoYhMgVS30X9R4eF6fAvq50HOiN4dtuoIlxs1j8vQ3L3EN30gQmTYpssjjpkpSxoV59dJKWBKc7Z+D7n6nky0VPP/1bZXjUobDUr1t3wWfX/IGcs4adjtdlkJbsmLpHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=hUXYLIcN; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="hUXYLIcN"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 10DC7881EC;
	Wed, 15 May 2024 08:32:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1715754762;
	bh=yxKz/mVaOg0Legbq8tpkKXuafQgaBvHN7JQPbEcBYUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hUXYLIcNUNKyZYjGdt3ckjS9T1cXNZipk7600z67Umob9CdsZs7eD7p7/+mYjjGbm
	 petwdqQ1lGD5MBCRuaF+xnlKWFgYEqsRduVenT59/r7URVo6c7bf8Bgz7PwRnO2ONl
	 wDszJ8a4Kcy1kQkaLj3enTV9PR+8QFR4QmeCxKMSf0DMbo3QNIswcDvCfSpAxFke8D
	 2p0yWJrIwzQELG61yzvUw2DI57LQGtYb+FtcTTO3sRiLsjJCLE/UJIk/dyAwTDMVhJ
	 ahlUbt1bUoFiOh+SAeTVrbQlug/CWn0zRk0vE6BhwJJHyLc4vJmADouA1sZIlV265z
	 yb+eJkApFPvBw==
Message-ID: <8938c9d0-8041-4b9d-8f91-5b62aa7388fc@denx.de>
Date: Wed, 15 May 2024 08:29:30 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: synopsys,dw-hdmi: Document
 ddc-i2c-bus in core
To: Liu Ying <victor.liu@nxp.com>, devicetree@vger.kernel.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 markyao0591@gmail.com
References: <20240514220457.94571-1-marex@denx.de>
 <a8d19c8b-9406-4219-8128-3c9c60e1a34b@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <a8d19c8b-9406-4219-8128-3c9c60e1a34b@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 5/15/24 5:12 AM, Liu Ying wrote:
> On 5/15/24 06:04, Marek Vasut wrote:
>> The DW HDMI driver core is responsible for parsing the 'ddc-i2c-bus' property,
>> move the property description into the DW HDMI common DT schema too, so this
>> property can be used on all devices integrating the DW HDMI core.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   .../bindings/display/bridge/synopsys,dw-hdmi.yaml         | 8 ++++++++
>>   .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml    | 8 --------
>>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> Cc'ed Mark Yao.
> 
> rockchip,dw-hdmi.yaml documents ddc-i2c-bus too. Drop it?

Fixed in V2 and uh , I forgot to CC Mark (sorry), so I'll wait with V3 
for a few days now.
