Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F62FC882
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 16:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763570952; cv=none; b=ibA4XWMZ7M4e3z2T72L76zypZmpp8APZk5FNfcGIYlHS3CfOzN/loFfLoNp7zfdWiTHep840EVNYqEy9WcEu7HPRmIzV10W6eQQx5lL8Wb8jO3qJnunJhIDYayySIZmqhDvKhinykWdAoDJQajQeTKS5PoXNkZXk3Muz9ceF6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763570952; c=relaxed/simple;
	bh=vlI5pcVj/wX6eyOTaoSyFq9KmSkUqGYX/bgIU1OrGD0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U6f2klvm3OcqE5HKmBHgAk1sPgCn5CQ6VSyQYfmZDlYFqkaztWPL0+PTbJev3gkIQ9iW/pQU+BiZxlO3MnAGmqwwl+lgxgqByjsTBi0LxBmULjI22YAgc3VIr4MgnlK+sQs8VkQBiYQ/rT2hHWGuSmugkiiOLiSS4zPTBYs0ikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kxUt1rgN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kxUt1rgN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b387483bbso5575641f8f.1
        for <imx@lists.linux.dev>; Wed, 19 Nov 2025 08:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763570948; x=1764175748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+BKTv32VzHjWL0NXMYpgvUxDlBNuCFA53q1tVGjGOw=;
        b=kxUt1rgN1KbY5YZfjEuc8vTT1nCBMuuMo0cBTyS1l/+L0tXsqZsUx7QNMuubuXlPbx
         qwQN92J+flASoDEGwvSl0HM3i50rIJjz1rvatcLwPHQlKX54k6XqiC78SS67PvODhUvB
         vmYSRultwhv5i5x+/RdLNG8eDBptU+B4M45LMUr1/F5I1S+SgmiFDjq3nzBO+4xlAGOY
         wZ72pLKBuc4+ZvDvREo/y0/9kM9GQ5PET4vuxB5tNRMtsTJXgxxMEQzjLTaE/iyRVeBX
         NnmRsuhQDO0i94jSXlB2KRCH7NSyiffnk9WEG3bCkyGSJWS/5Yyyb3iLDiQcFaVv+PAT
         bKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763570948; x=1764175748;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+BKTv32VzHjWL0NXMYpgvUxDlBNuCFA53q1tVGjGOw=;
        b=fo7BuSCNYMSf8lysQCuoqpJYFNrmkzjzzlgv1PGDqZWvMZwqa7AOvh1MRnaOwkEgZ7
         bRkE7jPCdLEqJxRfuh2ykATtG4Mn2/Az7IFud4qXP+4ZjXznr4IYqRqDwGc/ba0QifCF
         JkkV3C2laotQqwXnkXk4NWuHG9KqRHEipf/RJA01hXRhvXj3XXkNmWoLUZwYn4J7hj6P
         o4epz34jdAGc+KIDsTGIu0m+alOmd6S+SbucTJRXDS7ZoK/VrOKHHRodTBlbDAkFO9jx
         IIJVXjTBc88UAZJeQScqpjlQZ8yldEriz1fqaKbhYX6p0WjXYcj13UsU5UQUR+7eWPSA
         TpbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVBzt/2QH7SqZlN8Ewz9+a+hMIIM2Vqejx2Hq/aQ2g1JeSumeCggUW1IKVHKG8sIV6/Kk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxShqP99442HR753dAhPYRsMXE7e9zBIYiQ3qr5oTdRPZioe8TR
	JTvbSrTDnTLaB7tb4YktZBN2rKKLIMs5VnIblRqzkr7vXmLUcYgeXk4xShwwl2ud7Rc=
X-Gm-Gg: ASbGncvLmHe2SjxXo87Ih7VaBY1KcwsE1HM23tdFM1pdM4jJl2F7RCE2F8cD8eWbmGN
	wKNfpI6HwC8hLfh27pSIPngkZNOx9kqbpq66nrPZKRsGNRRwVhMkA3ZEtAqjpBHxYT5giMOqnrU
	j9mHZyH09uDpPMa53BLTV+1jE6CqC8je1gkg+lUoaw8nh+BHwQuBqd3tN74E96HKK2rh0d/3Q4x
	WXjZc3COm7aGeCUnHAqfBk8MvL7b1/aK/YFP9YQ0SORASL0ueM1QL130hJYROyMbrLepovIpeyv
	DXF1VcuQitkrnm6Z4JO7BFPoNHB+BmsKTSg3TXfm3rX1X+Urj+N1VJ+TSFGkC0zmbmJAVftRzzA
	yf89Zl/YbuSLzOvbO+wIZdjK/uaJsfvpGzoTFC/8ZCI4yHQf0OZ10f6k2aVtMLIkfx4+jZT4WgP
	nJ/dkwX9VmgrAmL/5BDDl1aY/DDYEkriHGNtBEPTg7bg==
X-Google-Smtp-Source: AGHT+IGarLhroHkX7qTmCRjo26XJBz7LFy48hq3bSCrrSEHsmi3uQiS1f6ngL2AlJBr3sKmOqBWAhw==
X-Received: by 2002:a05:6000:200c:b0:42b:31a5:f032 with SMTP id ffacd0b85a97d-42b5934dad6mr21284526f8f.28.1763570948041;
        Wed, 19 Nov 2025 08:49:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:49:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Josua Mayer <josua@solid-run.com>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-input@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
Subject: Re: (subset) [PATCH v3 00/11] arm64: dts: add description for
 solidrun imx8mp hummingboard-iiot
Message-Id: <176357094703.280640.18246985537228820663.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:07 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Mon, 17 Nov 2025 13:28:42 +0100, Josua Mayer wrote:
> This patchset mainl adds description for 3 SolidRun boards:
> - i.MX8MP Hummingboard IIoT
> - SolidSense N8 Compact
> - i.MX8MM Hummingboard Ripple
> 
> This includes dt bindings and a range of bug-fixes:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[02/11] dt-bindings: display: panel: ronbo,rb070d30: panel-common ref
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/779640415ea28abb60bb7641d50f1d9cccaa4d73
[03/11] dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/72539c4b9e482f397cc9340bcd97bb7643c0692d
[05/11] drm/panel: ronbo-rb070d30: fix warning with gpio controllers that sleep
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/93f5a0dc2b7c2df71a93e0fc59edae474bb84c6f

-- 
Neil

