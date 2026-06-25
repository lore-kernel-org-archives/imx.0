Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD7C37F73E
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425849; cv=none; b=GViV4RIksUuD3E/g5PihZo8S1C/mU4QrP9pHLm03qxY1wK3Hn3WmG8ll0m/wsOknBZFb6Cb9Y54xiLwypQM+g74xb5yHhHXhu0JJUiMiUAaCQd1NW3C4VMos0ODIHcVqJRarrqgwQBJWdpZ9aReUQZJvZwi4rzlWMhD2tV34mGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425849; c=relaxed/simple;
	bh=I1cXCOm745RXm5RvaDuUdNXcHFBmJV3+a5GoFtpPT64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOJX40LUDf6k2tCMQlONtvhrduHq5NW384tRl9W7bhzc/gwGXuFKaraCqhUCr+yo80qwTn1SXnL3R5lDxV/h74k8XqMRLBdh9vNs9whOoaH+BWLJzU8CtoE8Snf+YKYzW7znz9ZvSMxW9jqyvoZnVhDMgiVPzCqvMFqnypwTObE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOlR0wvk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOlR0wvk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so3204175e9.1
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 15:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782425846; x=1783030646; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=k+3GoXf2mrfA1KP6AU6rLpBytQHse5+WqLmVOpgycR4=;
        b=NOlR0wvkeK0P00sPtXPrpymz8UZR8yCHVjQy+7KSxfwA50i2aPYMmbkvvKEaIrtdAF
         zBuAQpOsxvSgG0okVIXJ3AeEbCBoU7eM+DvrrPb5X/mp99IxzfeW9wi/rS5tULSTjOI/
         PwW8hB5JNx9JBkdngI55ZutCdEqFXrplqK4xdz26h5sEZDuR+sxv5/5AM2IXBhS6zBD1
         0m0RMa5HmepF1jwXUKB2vU8V4imz13yrYFNLJ8j7FnwlovgYuLTpLgfLRBIhG2914KA0
         hbYJw18qEe0Ja1CesKcABhp6r9yqCpLBW5jGjTu2e9qMob0Kx2GYHcfYValMCMI1Sk+I
         sWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782425846; x=1783030646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+3GoXf2mrfA1KP6AU6rLpBytQHse5+WqLmVOpgycR4=;
        b=oLCs+LdT0ufv0qqmiEms0Qww14TTAIXVA1OeQHUyccjdIcZK6dWGhqWz8KzWZTQlQw
         rhMbF5dm4jGvB/IawpGQfEtjD7KyE2IAXGE9kz0wHpbevzit3amd1lwsPlhG8sl2JxSq
         ULtyUA96uv9e3Kp4mZBlQol9vi0upFO8ZMUwYN+uTPkTvKsXflFpmX+12ncPti06DXAt
         2zPqBkH4F/bO/7OQkMW2zdP1eBY60SOljkbYJq3u+zYLCRcgOdImfWgRop5WFVu7abtT
         cCpGudyd3Y8dPBfloIuyOTKR/S7jZVwIrRub3QxQNNO+pCWnlwo17hXp0TW0vtYDvSGF
         gfHA==
X-Forwarded-Encrypted: i=1; AFNElJ+EnX8tBeqF3ZkpUVTOL1s6h91MeAlC9ZvAO9TpDsZ81IWmNqiB0J6wgOjxXMUwPN/QG6k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2WHCFKrYFOt76w7W0iX09O14dsMq4Odrkm2W276snMU//pN0k
	doTrqD2WmDPyOtKL6cIxIltYTcf1gSSMr0Za8LgYucIEAeHho4TEVGBQ
X-Gm-Gg: AfdE7clnoMjU0ikf2P+RIyM6sT7vwPNXuMB0aNiAZhYUXQrzyjpXSgeNldFhCXOipJH
	klLUtsjoamijWa/2mhowbqQxDNe7GpihiaB9Iy3jvpN7XjFwJ1Atiiig0/Xbl9ToFzMs5ux+R2d
	XkUp8NEE2alVtxDCWd2aqH+xklIuDWr+zHRQ7c4ht2iyMgKvOEVapiRy40XaAh+lGySfURxt9hf
	jiAjqES0D6AyBONz5OjjB8eedC5VWODaSgJrl1NpklpuXChvyUcCHah48hnY1BJ3LENNiaqvExa
	wzSLG4PjsiRcxKGTQzfmHpA7pQk3Mn9h/71f7Vczl2iVdOHgOqlqb64+xhHNiMU1jHwf2I6lvtO
	IJDD9gvRYmw1G51rTLWuNFtzm6yQjuafyMhf+/i6BTbNsgpdumGS0bhwrVtacqo89cAP3LX6vJS
	VK5ZC4EAWTEN+3lJd627qGIqwGAENyjTDAkxt5BNV3XIVSz0Jb5GScWE8nbtVwsvEVpc7ZpRkCC
	+DumXtw
X-Received: by 2002:a05:600c:3549:b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-492668acc8cmr62424645e9.32.1782425845982;
        Thu, 25 Jun 2026 15:17:25 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269071e49sm27961115e9.10.2026.06.25.15.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 15:17:23 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <4a35af81-8dc5-4c13-93cc-52585f84372b@gmail.com>
Date: Thu, 25 Jun 2026 23:17:21 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com,
 Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shenwei,

On 6/25/26 16:54, Shenwei Wang wrote:
> +config GPIO_RPMSG
> +	tristate "Generic RPMSG GPIO support"
> +	depends on OF && REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default REMOTEPROC
> +	help
> +	  Say yes here to support the generic GPIO functions over the RPMSG
> +	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
> +	  i.MX9x.
> +
> +	  If unsure, say N.

You've got GPIO_RPMSG defaulting to REMOTEPROC, which is also a
dependency, so it's effectively the same as using 'default y'.

But then you've got "If unsure, say N" in the help text. Usually this is
used when the default is N.

- Julian Braha
