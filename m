Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626840;
	b=aoq6H/r/4LH1vNy2INN9CvuhmYGEgPn7Ia/EFCdM0xQgDBFfUOfNHVgriOQqzVb+cAFs
	 WLcNp15X71gAPttFMAir471tZcKZP5T3zXupveOUG5cwGxf/NkdxJ+qpi0N0nxFGW0YEN
	 9B3PZyRIVnrhZiCwHfwk4jM6vlGOtIBnUN/YYIJ7WR/KKvHLVpQctZZUH2aWQicLCGY5P
	 nMjeM1yDUd7MFi0kUdPsHWgscdOyU+8arhOFCsvXovG0pPtYB/5Kx6MXKwgKeKGzpHoD8
	 W3A0bdxRPAuQxkhEGl1PnyiNWkEzzZz8E6mZpR4U55le37yzklVGBikqV865MYnHn7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
	b=m/wOas8UJVHi/wCnccHAr1rl8BaZAQlGKIY2XvvR/bP98rr00MihBnn95tWYvYL+RJ9n
	 CcqAokZDjSkzVTESC9PsxjCCzkJeb8K5aDIFroEObzIL4EO/WPCrD+izjHrP9lnft6YcS
	 ZFTc4avDmdE1dG0A6L7Hw6BRoBS/dYL+CsPodK90HNc3ELN2pxKzwdryFM4i6RsHpo50I
	 5nyvBi0UPseaxD4LLi9FEEK4E+Bk85CfZHIU5JigVLRQQW5Yp1jvoWg77HiAaCE8qwR1n
	 8GwDSUbpaFBssbXHyawB3Fdihw/hNc77X8SMKonxWaHDbmVNYA8Ra1axxmZmj8SHOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yVSk7cDd;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DCD60A2622
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 13:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80DCD60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yVSk7cDd
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so32286095e9.3
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 05:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626839; x=1794231639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
        b=yVSk7cDdyNuCuYn1UOwd5TgFG5fh1+8ILqblyL4AoErzVyo04psV+hrp6OYcGzoCT2
         CHGyJQvkczncVfmyLzlIr0lWS3UcGb0Ye4xWX160b/Rto037h2eBIY7aZX1BVbSH7DzK
         orF4m/M2LYMFW3Mi6iILpdEVPQd/a8H7Ux7Yzo49cTbOkjTG5LXlQqLiX9epYsOML1hB
         6K3XDGJL7ZA4nwrM4dAF04PTUDzMuVQGUhozkhMh0IUngyF8NkqR3N6O2mjoS+GTa9+5
         KBWBo25VwIy+LLfRHl4O7/QJqYpU7aU/ZT7mLT+HeOAn3pYQ0+oRvvk80Lnh3kErNiJz
         53HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626839; x=1794231639;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwvQ1K/T5ntTIih2Uajc562qVZy7T1bItsBHgcFYO5c=;
        b=QatznPXQbG237FN64yG9/dHYpHSZpZjlsz7+B2XawCfsmZhpCJv/xi1TuuUgXrli2M
         GzUpUhEJE2B2Rwg8McuktmKYe0TarWhZm2iwjDKX4kYT8LR0qNwf+1CztUGnjP3HQEHI
         8pnjj6ax+dkRFn+xbz1jOh3326uA14S907E9zD6agyMCEcgmZn0GSSdvAIDJSs3yjZER
         AYasOcgD52JqJEPZSZ1KqX46HHHqPZFb2PLNlVoH8YJTZH5AIR8gOxaZQbykkJKaKqXY
         T/1lBiDCvNqDtFoXsHT+RO8YR4yZRqcTYpql3q1X3q4W+3iUVAWqFAwU1DQI/Hi3YtYO
         l2rQ==
X-Forwarded-Encrypted: i=1; AKwUvByoGoiKCxGXYPBInmIWQ3KUolba/74FU0eQSiu6jtyxVW2XDOXpuR4GyWs0jMNTEBYnWfs=@lists.linux.dev
X-Gm-Message-State: AFq9FYK/PgjMtuGaHiW2zju6d6n6qe74SPvag1ilSElaf7LDffWEBehn
	St8BmQGBscLNjFTf1/rfE921xsMZjhNNZe68+wiqzXdhRmiFXohNCGyD8NpI1l5H39U=
X-Gm-Gg: AYBFou257trWMe72xvsGuSVoYQJhmnAShSzgxAvBKlFTaPh8Fwrho2e52RL58oqQDm8
	W3/sD9OJIo3bBC0F7Efq470+H6ix+WYX+eifIHsUlg99zDNxjCvVlsxJI7DZpuWxGB0jHvqrwry
	O16Go5l/aqBzkNvOTenlkiWVY6xqZIC9JnzFC7Z7zuUW6NMgeAv/yatVyORiv11sXbD24xbBvPw
	Gz82Jg9jhjRlfYMBokmEPaJYz/T64zsdwDNDRZAVWP7o/b7yaS9oby5jbmdV2w4uGoESHLFjjM8
	0kLwqDY0/w4FXxDLsZsLNaUIrQquII6dq1pjd+eQ6qFmKmV/eAmxsHuBeUv87hBut6Y5ef32HT/
	rinbs6kzaguTgcgkn8E0cRb0vVDiPIgvEm4dj41PHmXaaRdUWwgjd7mNr5tI20/DUcZDbYpHLUe
	F1DnQwUslLqSayiDET5EBClHghZ8P8FJWM6RBrRg8CqVZgxjjlkWPKLoC2fqVd+ge1ngHMRlQ/k
	HWJlAFyiDqqBCLYuzjNtTPHY6nmGYGsofFMESWKR984cucNJBvoIev5i4ZVzVfKe9vHl8JkUw/h
	mQIMvDuXXAi+HDc2dGDgNfg2rMpJty7a+eBWmJq97pZCmPplbA==
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr237869415e9.10.1793626838793;
        Mon, 02 Nov 2026 05:40:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Primoz Fiser <primoz.fiser@norik.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
In-Reply-To: <20261008053850.2941955-1-primoz.fiser@norik.com>
References: <20261008053850.2941955-1-primoz.fiser@norik.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: panel-simple: Allow
 "data-mapping" for "auo,g104sn02"
Message-Id: <179362683780.3310106.8889373164273856192.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:37 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Thu, 08 Oct 2026 07:38:49 +0200, Primoz Fiser wrote:
> As per the AUO G104SN02 datasheet, section 6.4.1 "SEL68", this panel's
> SEL68 pin selects between 6 bits (SEL68 low/NC) and 8 bits (SEL68 high)
> per color over LVDS, i.e. an 18-bit or a 24-bit input format.
> 
> Currently, the auo_g104sn02 panel_desc only allows for the 24-bit
> configuration by default. Boards wired for the 18-bit configuration need
> the override introduced by commit 1cd3ea3e4b12 ("drm/panel-simple: allow
> LVDS format override")) to describe that instead.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel-simple: Allow "data-mapping" for "auo,g104sn02"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/47459027812c73d4826f5f78bc8291cb59a5de3e

-- 
Neil

