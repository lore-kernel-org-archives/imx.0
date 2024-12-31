Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AA116426
	for <imx@lists.linux.dev>; Tue, 31 Dec 2024 21:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735679813; cv=none; b=S/TV/NEUMefyIqGCYV8C7o+Vr+miHn4VZLlzEMLPvfYXJFdrYFg6PAjUjfEOQpXaSkRha5g1d/FI2MqpqEUoXlDk4cZU/9Hre48qQCPXyn5L0mv0Z6uWbTjgptjMz4QLePYAi+8P5ANhW6xAwbEc+bTzeidHPATkVMXSl4/Hml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735679813; c=relaxed/simple;
	bh=O9gaE2gxecQuv6srW9+WS4WA2QabXOi1obRPo0ao9fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0aKjwltrfEqld6m1ns6IE6eL5j0hGh5yh2WIgiO4+cTk19yxjcb81BOewocz2Sk3Lp+/Acfr6Gnls88Of2BqqD+r4SNqfIt0YnqKsaYuk+7RBzAJergObcjwH2VO+ZsOcuSGsfv92C/Usw3+ag0S47scAUeajbnQrFy71IoxfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=FB1uSwTM; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="FB1uSwTM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EDFD104811D7;
	Tue, 31 Dec 2024 22:16:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735679808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtVgKXIRkiie7ek16GqaWrkdviMLh6QRY/N1cq81sP0=;
	b=FB1uSwTMLCVnCsjpsRmRcGHlw30WLImCnUiOSbbtvPovQ32k18SGWw25Lj9FoI6O5W5NjR
	jhbkk1XyAMkHhDjxciNhQTen/ATKa4s5G82ziTVMUq9Uah4pWDGjD0ejFTYCRxVdvbDIJc
	wByT+ecB7c8w61Jjy89SR/7/C7uJMoZsrQQWBLPMXlx7YEGPp87+AoaTUKfkvFXym+bPDD
	8wT73Nec1STeCOYmh4pZbKtJ6pQY11S3LK2QDIgMD2mmacvxATm8oLbdgy5X1MVyIwi1eD
	8pYFLZVm2jyPXoB+9+sORaOo22diS7nTmV8OjDkOJDbfc2aDkBxlzukHaI9oiA==
Message-ID: <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
Date: Tue, 31 Dec 2024 22:10:51 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
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
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241231203136.GD31768@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> Thank you for the patch.
> 
> On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
>> Add a flag meant purely to work around broken i.MX8MP DTs which enable
>> HDMI but do not contain the HDMI connector node. This flag allows such
>> DTs to work by creating the connector in the HDMI bridge driver. Do not
>> use this flag, do not proliferate this flag, please fix your DTs.
> 
> What's the rationale for this, what prevents fixing DT instead of using
> this flag ? Adding such a flag will most likely open the door to
> proliferation.

See the V2 series discussion, there are a few in-tree DTs which do not 
have the HDMI connector node. The rationale is there might be more and 
they might come from vendors, so this flag is necessary to work around 
those DTs.

> If you can't fix the DT on particular boards, patching it could be an
> option. We had a similar problem on Renesas boards, which we fixed with
> a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> to create LVDS encoder nodes"). This made the workaround self-contained,
> and allowed dropping it several kernel versions later (in commit
> 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> compatibility").
Frankly, I would much rather fix the few in-tree DTs and mandate the 
HDMI connector node in DT, which would keep the code simple, rather than 
maintain a backward compatibility workaround for problem which might not 
even exist.
