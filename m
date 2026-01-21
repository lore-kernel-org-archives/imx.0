Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05D8421A0A
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009007; cv=none; b=haMhjmOQgBzGMxinAA6ZiHsePq2XH/+AuYqrzkev8M8YYhMGT1Yf2MVUV72KwZ1KziV7RMD/YL9GePH8oqRrgNOnlyERY3uFsVNymcEDRbTF0exAQQZ8Yqw1qxGg1Zk+aY9ugjMiETLHYegZ77Aqmeq37hnFbc2l+/iJ6A7ZjGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009007; c=relaxed/simple;
	bh=iFZDwVA7Uf5gTTRjwXE5KL6hD6mjuWvyyFd50SkCOww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0KPDHe3bCNcgZn9WPcl184JMXPkcvPzbVoQgFqrrAY/xbyg26LUbUEmr1U2/11let6LzRY6WdEVus4sdOZa3gR2WcW4SVu+kDxOW0xZJKkM6RDMZK1ZisFddBWSRPgxUWj6D2XY5FfhqE146zeHzjOq7qCnbPp4cVdNYn5HAP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHDrl9Yv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHDrl9Yv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8913CC19425
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769009006;
	bh=iFZDwVA7Uf5gTTRjwXE5KL6hD6mjuWvyyFd50SkCOww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BHDrl9YvUw1kUmyeB5MKtI+9Si9Ol+wXHBplkBKPYd0u6pOod8g+vZMCRzh3eakKZ
	 hxZjqAfUj/a/W3kjBtsXY32Xbx9a3K6gkviSTuquB8U2InBWDrtWxASH6XhKl3Xkum
	 v3rjLqGs7uW2h5QpPZRfiNem8VLwG+aFK7BUg8+mH5s5pfsHJiJyE2PeZQ5+QE+a5L
	 2wzpfED5ThqUGvwIEi8bBzAwhSmusA92wsvS3RVP4UI/H4CspPPYiIi5KHhHPV4kry
	 vpy0Rk8i4nnLzrQOpQlngrMwDebpVBqS3BGVC7aiNetk+R2Cuqh4KGCHLT8SQ0+9fB
	 f8AeZgJbgoYVg==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b876c0d5318so876033066b.0
        for <imx@lists.linux.dev>; Wed, 21 Jan 2026 07:23:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXX0/b3PDPltSHrwpEH7/U+w24WbzJ86br/chZNU1NUiEOsqHJPB/JsSPaaYvIYUSex7Zc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgKkQ5rtbXAq4iWYJuYVaNDLUWdgmnVB4Pu84+V7Lw7+Z05D+q
	RJs+MV7RgMv9tBfkxpLeP+e7lF0sHwHQYcdEsIhMKVSeSfS/oUzHk/irFytubEumzbOYToW0NXs
	QbJPU/kG8//8MDhCp3qUrx0q6mEUZ0A==
X-Received: by 2002:a17:907:3e8c:b0:b87:2579:b6cf with SMTP id
 a640c23a62f3a-b8800348798mr476675266b.41.1769009004718; Wed, 21 Jan 2026
 07:23:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
 <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Jan 2026 09:23:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLLZXwvht0KbPfoMVRhp0doNh971rKKv3FoCOTDjoDWKA@mail.gmail.com>
X-Gm-Features: AZwV_Qgxsl8jhK-Kzr0JzdnglYTDbfqkbMibvySBi5iB5cvgn_7BXkMMMsPSmxU
Message-ID: <CAL_JsqLLZXwvht0KbPfoMVRhp0doNh971rKKv3FoCOTDjoDWKA@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 9:25=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> From: Liu Ying <victor.liu@nxp.com>
>
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.18-rc1]
> [m.felsch@pengutronix.de: add bus-width]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++=
++++++
>  1 file changed, 78 insertions(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
