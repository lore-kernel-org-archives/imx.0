Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26CD48033F
	for <imx@lists.linux.dev>; Wed,  6 May 2026 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076896; cv=none; b=gMRrk31jue1VXjEeBAznKDClY8onln+ELQb/yalMvuo4vNQ5RLAKcnLZOVBy4yTwDeF3R6WXBrGxLO0pHLSX3C1SwHsd0d0MPdCGeQd4pfhsMa8HkYqaZar2H3lmhUcgAD1tbi1+FxCbdY6TvFswBQB+G3dURJasNeCefW3Tooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076896; c=relaxed/simple;
	bh=S/kmyfCtgRcnnR6uKuRsciK1a6EFOEAiOWDDIUPH/n8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1eFxDUpjlpVsglxyfQjXFPxPlr9I08WB+R93YwjVR8zEYM/F+Xha38K46sckDVXWjMVb3bQz1qCoATQCKjjDxL1yqRPhvHFW8Lyy9smDaWcXe8ZFEqW7Yhb0vF4urX64Nnfilk42AcsCRX9E+d7viN4nF99Ecn86Qo8Qf2oEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0TWWejF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0TWWejF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC8BC2BD01
	for <imx@lists.linux.dev>; Wed,  6 May 2026 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778076896;
	bh=S/kmyfCtgRcnnR6uKuRsciK1a6EFOEAiOWDDIUPH/n8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P0TWWejFiVyGwBeEGQrswyDGhgdW3tEtXcFMPmnguQ8KcsqeSQOXhsZoC63lqhyb1
	 QmlbF8fsIgMfwR6YxJgd5qY2LHmYtDUROxTPmuthCQPOXlzWT7ZzmrslZSdS40CIYa
	 DfwGCgJlb+o3MaVxHG7+SS0gk9F2yfPPrSRWQLVtGDnAWsMj5Wk7q0qHFt9N/GmUPR
	 xmVXMFYvPwe9jmt/1m46Cgb6S3RYyniJIegzXa4HQ4n2fNZmzDK7g3vZhnCZlRi87C
	 xFfN0ManqEBJD90kQ3GaX5yB9dl1NUv+v+wEObvaHsQ+zcnGyUPMi056dk50UzOwFc
	 ipcCbzgIEgF7g==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bad54961385so1047515166b.2
        for <imx@lists.linux.dev>; Wed, 06 May 2026 07:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9a1KVK4C2Tyt4E3opkTiMPjHDbXGCgsgEZylhWcZlTOktnoBOfmMyvUOEzz6EdnLarLb0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW4uq7kZH64BG3xcEDD+LVZI3ctnn96STTxnIl8FieWamB4Usm
	nge3vHMAuI3wC1dFvbhaB/eSABBRTW/QJiUFsf+aI8aokGIf66NZhYt6KEnLpG4T7zbIeIqhf75
	1D8roTghCeau1sHB+m2+GJFPBUKdBLw==
X-Received: by 2002:a17:906:ef02:b0:ba7:b198:7d25 with SMTP id
 a640c23a62f3a-bc56d13529bmr176376066b.21.1778076892767; Wed, 06 May 2026
 07:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
 <20260505141538.GA2547282-robh@kernel.org> <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
In-Reply-To: <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 May 2026 09:14:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com>
X-Gm-Features: AVHnY4JuaUtVhW_AwoHvUdOyEnlQ7azzni1rJEniHezJvRpnnGicHK1-9_FNIHQ
Message-ID: <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com>
Subject: Re: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in
 reg property"
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com, 
	victor.liu@nxp.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 10:46=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 26-05-05, Rob Herring wrote:
> > On Mon, May 04, 2026 at 10:21:42PM +0200, Marco Felsch wrote:
> > > This reverts commit 16c8d76abe83d75b578d72ee22d25a52c764e14a.
> > >
> > > Remove the 'reg' and 'reg-names' property from the LDB.
> > >
> > > The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
> > > (i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
> > > register ranges with loose register definitions. E.g.
> > >
> > >   - On the i.MX8MP there is one register which controls the AXI
> > >     threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) - IP=
2).
> > >   - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 settings, P=
XP
> > >     handshake, ...
> > >
> > > In conclusion: it can't be ensured that one register belongs to one
> > > dedicated IP and the LDB is rather an exception than the rule.
> >
> > It is fine if there's a child node for LDB if the LDB registers are
> > consistent, but the other misc things are represented by the parent
> > node. It is certainly not a requirement that either everything be in
> > child nodes or nothing be in child nodes.
> >
> > What I don't see in this series is what problem does this fix? If you
> > are going to break compatibility, then there had better be a good
> > reason.
>
> Hi Rob,
>
> with the upcoming i.MX9x SoCs the parent syscon (BLKCTRL) controlls
> multiple other IPs, e.g. a DPI mux added by commit 3feaa4342637
> ("dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and
> example").
>
> During the discussion of the above commit we agreed that the sub-devices
> of the syscon shall not use the reg property due to the fact that one
> register serves multiple purposes. In the above case the same register
> controlling the dpi-mux also controlls MIPI-DSI bits. The MIPI-DSI bits
> can be abstracted as drm-bridge as well. Two sub-devs using the same
> 'reg' property below the same parent seems odd and I don't know if this
> allowed either.

It's not generally. There are some exceptions to define things at the
bit-offset level rather than byte level.

> Now the LDB is also part of this BLKCTRL syscon device but requires the
> reg property. TBH, I don't know why the reg property was added in the
> first place, due to the above fact (multiple sub-devs - same register).

Probably because we asked for it, but we don't always get a complete
picture of all the h/w functions (though we ask for that too).

But nowhere have you said the LDB registers are mixed with other
functions. If they aren't, then there is absolutely nothing to change
in the binding. If they are, then yes, we shouldn't have 'reg'.

> Of course, we could limit the breakage to i.MX9* SoCs only which is done
> by:
>  - https://lore.kernel.org/all/20260329-fsl_ldb_schema_fix-v1-1-351372754=
bc0@nxp.com/

The rational for that doesn't answer my question either.

>
> but I don't think that this would be nice from user and from maintainer
> perspective, because:
>  1) The same LDB "IP" would have a different dt-binding
>     (user perspective)

It's not the same if the register layout is different. The point of
having sub nodes is because the sub-block is reused. If that's not the
case, then there shouldn't be a sub node in the first place.

>  2) It introduces another dimension drivers need to care about
>     (maintainer perspective)

I thought Linux didn't even look at 'reg' here.

Rob
