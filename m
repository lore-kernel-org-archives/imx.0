Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244104FB9BD
	for <imx@lists.linux.dev>; Fri, 25 Sep 2026 21:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370971; cv=none; b=eioOQq0n5wnXyEqijiygfrKALHoysj7E1Fcrc5ESrot0udujH9OC0u4gWKeE5j3BW2CX3NthI/TVZOBDXK8XFCFPHa03CH1LcmTAzJ/cORt3c2765W/Me+KvIxy0dX8nzzAPTSve9Acq2BnFRLfZcghRzPDu7wu6Hb3zF6810oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370971; c=relaxed/simple;
	bh=IiOuPbtnCcIY+LvqnlYO+tAjpv2SzZg8BQjeknfXbdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oj9GEwy7fWksamt00M7KSVXX5hdkuWBDRmkoO66OcMxNm8XZPaVXLQKaGCiHo8IIl+/WMlSKYP48hX+j1sTryy1XdtVQMFutHKDprfyYGLi6oc1iQAp3JZ9hYLXL2ckkVZ6SQS1yvhpmdUIoGSq4gDD1R9Kkhv9B5tQgxPJT6sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdyNDN3G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdyNDN3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15F71F00893
	for <imx@lists.linux.dev>; Fri, 25 Sep 2026 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790370968;
	bh=o7vv2zCnn+8YFHVHlCAGyM9+OpN94jh7Pzu1l+wtiw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TdyNDN3G70qnR90wz9poIu0G3/yuYQ2Og3m0yLnaVSDlUswTRq9W4a0vGyiZ1jRAk
	 pWgltJ87NiUOJR3liXOk0uX9GXKhWY8ejJkk9VA6SZVZnb5lo+MMBdAPVgpCA0u77T
	 1rUavcxAvXe7OonnMHM3PYzctZCNiXdI9RM7gtkcXZljk0YcBlno827Tt4k5V4uLjX
	 hiccwL69s0XCS6sw1W5sYmidXGKw/+o8suurGtmQDa/5E1XrASKng99N9iQq5/V/P2
	 nazgmd2Pohgq2fpwQnR6V384oMkPWXW1g6hgTyEJ2B9NZ3oGok1i9DqaDSlMRg8y3S
	 bYA5p6+tn0p0Q==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af3a4f193so106182466b.3
        for <imx@lists.linux.dev>; Fri, 25 Sep 2026 14:16:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBziS2w03P++tTKeQR38Nwg2bqKj6hZmMx1IrNe36FGZJ/aOLa023AEuAa189K+4IWkuRvE=@lists.linux.dev
X-Gm-Message-State: AFuF++kk7JfVRyWBANe0lZLAbBXgl5LdAMiQ3vc19UfimdfrEodx+9rK
	pi5NmwB9LokhMBkIUjk8W3ROJPO4zLgY1lsjalDOutKBiC15S46ZNJX/KS28MBFexttyqwiWXYp
	S6ju1DCNHycHlaKr5zD/hFAAp++xAtw==
X-Received: by 2002:a17:907:a68b:b0:c29:6400:ef8e with SMTP id
 a640c23a62f3a-c2ac262e026mr623148866b.42.1790370967328; Fri, 25 Sep 2026
 14:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923211312.3793073-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260923211312.3793073-1-Frank.Li@oss.nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Sep 2026 16:15:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLKjc2KVbnj=Tyq2Vk_KRV-M3REv3TvwfA_D2R8CU91vg@mail.gmail.com>
X-Gm-Features: AclHuK-zZXzRBN60UkCEC4cL7VJx068Csh0ck7YdxPUbq_OiVD3z-aiLcwOJiIg
Message-ID: <CAL_JsqLKjc2KVbnj=Tyq2Vk_KRV-M3REv3TvwfA_D2R8CU91vg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-solidsense-n8-compact: drop
 undocumented adi,led-polarity
To: Frank.Li@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Josua Mayer <josua@solid-run.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 4:13=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Drop undocument property adi,led-polarity and adi,link-st-polarity.
> ethernet-phy@0 status is disabled and no in tree overlay file to enable i=
t.
>
> Fixed below DTB_CHECK warnings:
>   arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dtb: etherne=
t-phy@0: adi,led-polarity: b'\x00\x00\x00\x01' is not of type 'object', 'in=
teger', 'array', 'boolean', 'null'
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> cc: Josua Mayer <josua@solid-run.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
