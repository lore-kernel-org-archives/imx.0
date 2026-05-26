Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630924A0C
	for <imx@lists.linux.dev>; Tue, 26 May 2026 00:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779754472; cv=none; b=aQdEXptW8affp2S5JHUYA7QW2+gasw+pdWCSm9q5UHZtroYMpWXhmViJeJWyU25fPQ1GSpe8TJheL8oVEqDEQO/pBhnuTuad7C1LmelU6pzKiH43jdiw4WAu6EjFCzAQQOjjqY5aVonK+iuQL8AMvIJa7vhWzIB1w5Ci97W8GMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779754472; c=relaxed/simple;
	bh=Vp7Jio/vsZh3XQA/CyPcX2F0P26k8s8Df1lXL0etR6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMRiWSKdn+NEQav9lmyHiKQiEAa1c40RsxfrAfml81L3c83twnhLtp2O9OCX4kO2qMA1rjpktzzz/hf7jKyhFGTlNdGDZThrMPLewueUp0DORXYvLRvZLE47UshEeGpSB+jKhdX3Y3EwW1S/Mo80nzs2HStFJK4/A+iVV0fgGmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GLJKN8yC; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GLJKN8yC"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-961780b0ba1so1303232241.1
        for <imx@lists.linux.dev>; Mon, 25 May 2026 17:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779754469; x=1780359269; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vp7Jio/vsZh3XQA/CyPcX2F0P26k8s8Df1lXL0etR6U=;
        b=GLJKN8yCbnCa4Uml+jOXBVfcukJSOkncPI1lNBkVTpZsLWVxQ24FqXSI/liswmyLye
         SVt+vgPbwuKt07nGMQm7JtOY1j2lrjQG98v7nmpmX91IETIbduo+CJ8m8/dXmNVO7b1L
         8WcqbhrRyxV0prdN/t9lypFhevqOCUIgOR3/vMWpeOsIx2pDr1e3eQ3HRzhehh1fdoKr
         vTuu9Sogf02TYlHPZP9jFF517ujZfm1hVLXKcaOfwdE236dRfNe5HNs4O7FgX0ovnclN
         Jxm+QEU91o7EV2teGsSfmVVfRPtHUaL2twHQ+wGdacbiXtWO2fF1EzTUUie+KeuWx7xj
         /SSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779754469; x=1780359269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp7Jio/vsZh3XQA/CyPcX2F0P26k8s8Df1lXL0etR6U=;
        b=e+cCm1VdOPIlf/rL9RX5NopeVNFNPRmkqis0hyd3969vuuBOiMD97K0ja2jDv/FbVb
         uh7sDE1SXQ4MIcdWOwV5fNRrQ2D4vYFBOW4NTrdykpCW+Goa4Mjv6lP3T5cpdwDVfNmT
         eRCe+mTHaDV+YCnWCoHRi/VXy3iRdvm3nIUkyyuTZ7lz4ZgbVgzuWQiBqfNYE3t+QILQ
         kBFJDNoyWd22ZMF3SIx3NddAQgH7lDvdJ65s9680RZzP1HVANchKaNDZ5vEhAQD2gqwQ
         Ky46pi4ZwuCfQGaI4BrZLc+N74C1xFtLX/sf9mTtehTBpeDHegJ7LExwo8OfzjbdUMf7
         Xabg==
X-Forwarded-Encrypted: i=1; AFNElJ/xWZ8m44jIN3FpX7umHsFxyY5AGVwq0aK//W2j7mgQovi1rQqWC/lK+1vVveQ2E4W5IX8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPrFhwm4er15DEUx6l41/MDvzxENDE/xkGJyT6zog4DqCmFrZl
	yBm0U3gwV6mAH+dWTDnXjyaTvnIEsppZWzas53s4llJs+XCAr64REU6En8ng+u1s+28=
X-Gm-Gg: Acq92OHe8l4tggz8bcttLtAzUlG2gviyS1/+tQ6fDK19a2kEL2unHwM5HoG/7h6LZvg
	o3GnSjZtqMXGTSSQ9gV9hKUMqKsxcQym4PrfVeQ8GIb4W8BX5gqqIF+cUUf3mn0ksD/kBaOhjI+
	DX/NOcJCtlbifvRIQyaVhvqY+DO5M/an0pSadX+txmSYV0e5FLpR2z5LwcGqukbjhIgL3c+zEdN
	IONFCLyUwOs37l8IBb1Og02mEuRzj9gEu+OsfbUjBGWHy2oQfSQhl1UXTDS66eIp4dN7//IEpZr
	EreZrZeKiWDr63G8QsqbBBO2oQqd93j75jlwGtJba/yhHBtIIf8fx8PvlVo8R6wWNu0D6hjC9BQ
	SSYOEmiUNTG48944gPdzF0zgy4nfxq4/yHr9d43Iwim6/lMC/mi5gmIJO8JaVNAWeaZ6a97jOZ8
	Tp1u0LucDDv4R1Dc7KAls=
X-Received: by 2002:a05:6102:1494:b0:631:3b92:9dcc with SMTP id ada2fe7eead31-67c8398e867mr7695261137.27.1779754469441;
        Mon, 25 May 2026 17:14:29 -0700 (PDT)
Received: from acer-e1 ([2804:7f0:7542:d224:a24e:4c0b:adf1:58f4])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173b6d3a4sm12075526241.12.2026.05.25.17.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 17:14:29 -0700 (PDT)
Date: Mon, 25 May 2026 21:14:23 -0300
From: Ronaldo Nunez <rnunez@baylibre.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: linux-pwm@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: imx27: Fix variable truncation in .apply()
Message-ID: <ahTl3xm1qkDPYxVv@acer-e1>
References: <20260522191348.6227-1-rnunez@baylibre.com>
 <ahHV_GIwdWvTu-ms@monoceros>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahHV_GIwdWvTu-ms@monoceros>

Hi Uwe,

On Sat, May 23, 2026 at 06:55:40PM +0200, Uwe Kleine-König wrote:
> . I haven't made up my mind if I create another pull request to get the
> patches from the pwm/fixes branch into 7.1. If not, it will go into
> 7.2-rc1.

Sounds good, thanks.

> Sashiko found a few more issues in the imx27 driver, would you like to
> address these, too?

Yes, I'm already taking a look on those issues.

Best,
Ronaldo
