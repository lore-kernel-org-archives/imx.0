Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF428DF1F
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667506; cv=none; b=Uuj0LFbIapebOD/o7Ck/a136x8n4MS4yogi0Kw8jJSuCB6/fL3O21q9Te/ucGLfNW3q+8/ysh3LPiP4/+UbysVUIBk43/LcJA0MunTcOBFMKCoBl6AbWc5Pus3Yw3E3068/FVqtF6jH1/OAXHiyACBrAjp7TsOkwUmDuxO1j5sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667506; c=relaxed/simple;
	bh=gwFnzLYaJfKcCfh+pyp+KlQNtwa+sdrlP9NP/uuwW/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdF+FrWAjubUXC0XhPORqv3f7wo7afxbwbPzkjwkRKzTAFiKJHL2ZMTjkFUl6aMpFfvS9ZeJhIFlm7RApcLa6AkIL2yWKqlhhMGiHKozXGrzfJK7VwTtpm1hgHv8qx3HDikCezvOePpuNK3VoasZZJF536HSVmiROkqIbs6fO1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JKgXZo4h; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JKgXZo4h"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-611f74c1837so9528737a12.3
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 05:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752667503; x=1753272303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r8TPF263FfctyCdIjb8gMnd6mJUseIXmAnCVMsuE8LU=;
        b=JKgXZo4h1CejxlvvVLdAY5W8jBK2MmxY61inrUTdC/2eZxsS85AbHrZBeHuT3laCc3
         PTgeWvJEHfFZBfXCcga0o2oe3p+B0TKyOOLCUvuV9TB0hNhIbA+8dMB1YCFlpCaM+GO+
         pF2UUfJbPJx3u6qoXhSvM5vZHzusRpiTzC/nwDBaENYwt98EbJhl7hi/YEhbCdMgXDpX
         2rl8RL7j9dCMone/Es0+sZRJZwg7UY0qBqRNOMJpw8VPTMJRGQpgjT0siOedkJl1Z3cW
         ymlvipQJS8tr0lD90WUWGMWPp9SxpUR8pjTlTAeTcBWR2gUQ8mcbr/cZR3vwyIDQjS5t
         YxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752667503; x=1753272303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8TPF263FfctyCdIjb8gMnd6mJUseIXmAnCVMsuE8LU=;
        b=O+1TNki98I03fryYzgsrQFrn+ou6oRCzQ48sTIojXXkbdZLPGa9B78rV3YjgseZzRE
         FNaRFQ2uGR4aiTM3lttqcWRk2dPHKxTmFhSvNEnuot9h+INd2vkTzxF22l5uoWktBpd+
         /wMFga4/K5UUPCOVC3/s7Ag/2mMMdri5ZYWxurIAbRqg1nihOgN/iUV3vW6Atuq51enD
         +oZ3DRCwC1OqkJTHpABJzmQrHt2oG+eOxFSWZye/h9Ldz0z6HzevvN2NsgNitePl4cH+
         wNo4pqFIZ7TDegf1+rdRdVHkkrjKFBfvF5ORjjhtqt7nzqa4PLyEW8RyT9FzFmPn6u15
         3SBg==
X-Gm-Message-State: AOJu0Yx27kliKin7Ap0nxkD+j1P8pg6N79SNrjvXP7Nfjzhfr8YZQGX4
	7qj+VOCUlBskNAzY+o8SgJRulvzxUie5P1GDLHSILDEc1nZM+sk3PMx1++DZrhjuiq8=
X-Gm-Gg: ASbGncuJ2Q5kDVwvoYUSagUjA1oZcp09iUv43JQbHe0jDxm9ew1rNKtkPIVhiDJUn4Z
	N5153E6z+zjB/E6kYurRe5PoCWW/8W4txnXFhhTAo+sD9U6AvpgVx91IgMJilslaXEPBRlMS0xy
	SkadDiEAUxs/4JjvaeHk50SpSdBq5z33KfKQ4GtkJ1u5N64bSu7xZLEYr1tZr5ctNmUzEQSo445
	xyT6ZY79RVOzPHDZGWwWFr9v8AhDseUtTDakJPlsXXbqgIMHH2yCtAe2YkGWZlBsTPxHTJqY+JE
	ByzHwnvFELpl6x9GdQifttQGNX2tvyvxy+LMjcbud8yubX9d0wmVBZ/HNcJu50QYpIxHsQrKTTW
	KnyPlXvr8GS/G/xRrCq58hYO6W3DV9A==
X-Google-Smtp-Source: AGHT+IEHWN0R93F6utf9eOM9iKnjv5S7ssfr5R2MO8UdDd3ai68a3PSrvOh737Pa7gqaj1wFZ0jbCw==
X-Received: by 2002:a17:907:7207:b0:ae7:cb7:9005 with SMTP id a640c23a62f3a-ae9c9af35afmr267572766b.35.1752667503179;
        Wed, 16 Jul 2025 05:05:03 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c15sm1185884366b.117.2025.07.16.05.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:05:02 -0700 (PDT)
Date: Wed, 16 Jul 2025 15:05:00 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] clk: imx95-blk-ctl: Save/restore registers when
 RPM routines are called
Message-ID: <aHeVbInuGbZM7TUJ@linaro.org>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>

On 25-07-16 11:15:06, Laurentiu Palcu wrote:
> If runtime PM is used for the clock providers and they're part of a
> power domain, then the power domain supply will be cut off when runtime
> suspended. That means all BLK CTL registers belonging to that power
> domain will be reset. Save the registers, then, before entering suspend
> and restore them in resume.
> 
> Also, fix the suspend/resume routines and make sure we disable/enable
> the clock correctly.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
