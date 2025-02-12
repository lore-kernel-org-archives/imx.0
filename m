Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600881FFC66
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 20:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390692; cv=none; b=gEn6LN1s+0Cnk7JHJ0Pn9XPEjRtcTJ1I9Fv0s5mAk520jwvAOTqIcM3B00D3A7f9jAASw99+J1gHZhiNMX1VSjp4Dbqvafz2YCVqOBpYtwbYQTpn5q0xxlGlM+RZP3pvpABYBUoFpy79X9EHT2ZAOAYRYdUQ89JMXtnt5v3TMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390692; c=relaxed/simple;
	bh=j+J2VmaL2sBTod1+ELLX37mlLaK9BAiuTDjYikEkCZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YN5XD6RV9O1qfoxAM06sENKKPUs0J+N6XnIQKUDn0Ga01q9K6fV+9/8eRCX/17Qu+nIGkcDt2UNT4E6GWXUgzNcZkfelkKVsGRqwiFakoz0RJ+uAgk9cdNuP4kmFC1UmiCK/kddF2506cvIJUtk7kSrH0IP6jbZjimK4MV1pg+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnVxCNqm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnVxCNqm"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7b35a004aso3262066b.0
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 12:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739390689; x=1739995489; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TCppI8y93cboRnNPyFDL3rH6Gq98I5rJlO4BpN7swr8=;
        b=xnVxCNqmHbpkwn8CSupK3hu9kOFdNuncmnET9mqmz3+FCCs7TjWDRq4PttBZE3r6yo
         WDoPFXn87VO925rZgbC6U2z2eq/XC3B81IohLmjW6rz4zOML658i3fRzsX+xpLUcVoS0
         fRHEnHb5WO+H067+LryO3x0zTxAz0yal0xc3fjIA3ikaypA1DRO0WGfjuEw1YttKALE6
         PL3f5ocHL/KhyU2pQp62NTrG5qujvmTbTWRSiwrL6WuTe3Abo63lFLExCgeaSLqmfOmR
         F/C9H4lrkJ+19BPi5z564UeJDQbOizFoGi5pNBLQMdap9zUvfami46NpLDYyZjoZBBVm
         F/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390689; x=1739995489;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCppI8y93cboRnNPyFDL3rH6Gq98I5rJlO4BpN7swr8=;
        b=llu0mHAbJB9hDXuIjeWBn+6/6r56dQ6boP4VkPo1IjNLQUVymXvXSkHvhhy76eLDJj
         KpFrLTsWJN0lxfWqpQYu3eYd9BsFaQnzA+Dut8Qk3NqAqEWKrtJagg367iKPZnExkyZ9
         C8EN92RuKACkoCbNpEAmSG7vgeTDFUSS30uJBRpfvAWBnLhtxsynAe2gpbx5zj0WxohE
         BPeXbrBzfn1B8cpdsalt5opyl0jR15ZoBk7YdaMVfBWcMk1IGbeKVMb+qvxCubboCH62
         hUm/7DURJAbIN8zOtayMOeWSgGQbQkA+HuAjehBuX5H0wpos5LIBkNdv7eJxPGSqwPRa
         wEAg==
X-Forwarded-Encrypted: i=1; AJvYcCUF4Ax/egW0aBz4l/uP3KONdeonYA31VqPv2SOd5cJu4QnL58BnyzCeIzRxqIKWaQw9BSI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMzgq8UNt6OpavYO66wWO30dHU4scMeR0kTpwEb6e4eLjGmcNL
	ljfPVH3Q+opQn2PMxdfVyJzXHQZ6KN3RtrQtycMnHd/rVGqu7cSwPmLmdLNbqiA=
X-Gm-Gg: ASbGnctneRcR0ydHohH8xQXWCHIhJqqNLEKWoeULPnmLrc1Pcp+sJHuZI35hGahD39g
	7Tsw4BVpUwv/wwhabcuj5sDMHq4cc/fKbwflamUsUG02bjTBWy0uqGIMc7OKiwG8fQRMs88Omxc
	Uamqtx31zQXvjXhYaACAV/0iVNC1DBFX7tX63INZpBuVIeapwMiRkuHDh96tIF35PrKCzKmDxWs
	85+zdqXPehZLSJCr8UfcM00Fug0i+IpzXT9XMw/BmGsZKzF1UyclOMP8MczxWcmFqkIVUtffTsD
	G6Q93kHLsoQ1FTsKEzLA1q5iaQ0dDDn7itU=
X-Google-Smtp-Source: AGHT+IGkl11bv2ccUEKxaaQCvMxLK4FjNadbwKCT6A2Anh1DkgIvsPGgQ2iR8jPdG73PRBdgMlJogA==
X-Received: by 2002:a17:907:728b:b0:ab7:d10b:e1f2 with SMTP id a640c23a62f3a-ab7f34a0d8amr145810666b.12.1739390688613;
        Wed, 12 Feb 2025 12:04:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c520a3a2sm641974966b.158.2025.02.12.12.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:04:48 -0800 (PST)
Message-ID: <251cbe57-da12-47a8-bcf4-be0a0c4082f6@linaro.org>
Date: Wed, 12 Feb 2025 21:04:44 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: i2c: Add driver for Sony IMX728
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250212195656.69528-1-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2025 20:56, Sebastian LaVine wrote:
> This series adds a V4L2 sensor driver for the Sony IMX728, and related
> devicetree overlays.
> 
> v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Your Cc list is neither correct (incorrect my email) nor reasonable
size. You cc-ed several maintainers which are not responsible for these
files.

For next version or any resend:

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

Best regards,
Krzysztof
