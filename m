Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077213B8928
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 23:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773358094; cv=none; b=s2fpkyNb5LIfMtt0TJP1Rf7EDIJgMBe8/2BKhv7NEtrKzVA0PtzZPBaQmIF6RRPQg5X6H+stMfIyvNVafa93yxu91FUAAKUFApG2/d/Pe3nTrTbX20VcMqQ8U8/ZRzuKuXCV1cwN6V8j6yQk7CxIeTaR2YGiUHspXzdUra9vK14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773358094; c=relaxed/simple;
	bh=8mla9mePvAq4Xablus8JVx/cPFUAF5rSy0uAweJQ9RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQT4pv9jB5WvoyrTcVuISgCZenep/IcwT3Wpk30lvPjY1DcSVTGDCnEgFul9wPAYIwZgE6yiNswys08aBhi063K9LzCQZBHnrsNU1kzWT2eIlPFGZnShq/Uz8ORJ2mcVypkJleEBtZjqaLvvNEGLqIOSE5HUNQkML0KR7Q+3U5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Bqq3AcVn; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Bqq3AcVn"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDC8E107870;
	Fri, 13 Mar 2026 00:28:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773358090;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=D4U67KyPuip0+4wF0EN2QGlBhdOHlDVkwPXiAqd3gVI=;
	b=Bqq3AcVngYY1S2QMommyl6BcmySjmlHZQjknGYE5eo30yFZ9fhuzWw20+bAw4jHQ/xo767
	6QDoVskFY99f6xcCyru7yQ7xty/qhoZ8NuIFqCywcwgFirhIBkYWq7kbwA1FwlVa1vtDcB
	MbUp0DeQkUud1rl1Sh7nvSqPel4k8bVN9okOynihllrdVUCHeJNdIYIBkFfXxJWZ5f+kov
	QNMTEAtYM2bdeI34/pCoY35hm3G3+xZWxvSTrkWzd6cA5U6wXmPAre56Um8ZOCygsFM/rm
	61DDY2ylIlwfD4DpDHKLWtf7F6ahOBrxYvZF3eeIRJOryMg2nulAoThfVJUruA==
Message-ID: <d320187b-0770-4d9c-bafd-119d99ff453f@nabladev.com>
Date: Fri, 13 Mar 2026 00:28:08 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: parallel-display: Prefer bus format set via
 legacy "interface-pix-fmt" DT property
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260110171510.692666-1-marex@nabladev.com>
 <0d3a41526ba02eee28457fafc95f5152a9c7bb4b.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <0d3a41526ba02eee28457fafc95f5152a9c7bb4b.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/13/26 12:31 PM, Philipp Zabel wrote:
> On Sa, 2026-01-10 at 18:14 +0100, Marek Vasut wrote:
>> Prefer bus format set via legacy "interface-pix-fmt" DT property
>> over panel bus format. This is necessary to retain support for
>> DTs which configure the IPUv3 parallel output as 24bit DPI, but
>> connect 18bit DPI panels to it with hardware swizzling.
>>
>> This used to work up to Linux 6.12, but stopped working in 6.13,
>> reinstate the behavior to support old DTs.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 5f6e56d3319d ("drm/imx: parallel-display: switch to drm_panel_bridge")
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
If there are no objections, would it be OK to apply this ?
