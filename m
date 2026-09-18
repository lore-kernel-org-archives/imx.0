Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0BA51FCD4
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756260; cv=pass; b=OsgqbKQXn8/KBsY9hexc9gkirigtKCiDlYUSHMuqcLstOoUYlNBqItVZtKvwPXc6yFXk+YIonsCsLQJXJnN9Xtq4GCqm7fuQNm0T9OyH/mwiKyYMmZvK08mTmJpVd4uEK9FH1YbYKLyANsm5oJArs0PiHgLGxTZf2EbY8NX5/2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756260; c=relaxed/simple;
	bh=Z3GCDadB22nJ3H8dlp8oFEKsrJ7JLQwFPKhgk/HwR1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjZtUbtuqN9FeXB6p/apPC20g3wUSyzdQg/iJlLURtncWfBMphQjwCEh60U54vxqrwMQc91pqWSk6C2zNsoe2ZiroZhcRRDNFnOzQSp6g2E3QlJNE73t+5wvo1Juf4d6P8Yy7fzo67ux09RlxVuSe4Zgd2/RbTTUq1naTIK75QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsFHG+Hr; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsFHG+Hr"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso707072a12.0
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 11:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756253; cv=none;
        d=google.com; s=arc-20260327;
        b=hRdLFAqT978OTK4UGuy3kniopkAruyQBAUL02ZSdwbHcOwRpwqfuBiGMa75ys9KgJg
         VTR4LqDRj8L52TdI+FyuNLLW8TO09dYKcX7viXdil7z6dUT6G5DcbEmCXI5oXNFPIMht
         gl32Skw/WBGe9mhfWI746XSyrZusYzfpIj1R8NJyktMxoLxbdxyB0J0kMGXeHWHdwg3Y
         S7RFir/pgoIwDP1oW/ZQaMtiAzgBoHQt6UAIQBS/ry66w5k/h4K2S2ya4DM2vdmYsIUS
         SP5tRjbOTjVW0nDOMK8qXgG5FrOCH5ZjKZxqQ3LSPJLG9hX27b/1KWgh2UBSqPQTnvbU
         5OIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        fh=OuykdQgKZWx9ES81NQAWUqa8DF81+JYWhLQEE4c+iJc=;
        b=OzfWvGVv/VY2ZsBME+likm4jAMb998dDPSGiLrsn9Mkcq5c0g/bzLAthuD+mUlhy7l
         cA5CIGee7t/I8Ui0+MyM4mNMsmJ93QPvX8aHZFUlIumP/uzhdwd9AX4rpJ8d8T0zGiS1
         Jbu58hLpj7J/vwbIYwEVdSAJrr2AjvdDqFT7zGYJ5NQAWp8SISWPhPxdfCe8v1HSbk39
         w1eCClW6tz5KKanV2749Dulj7nVHMISxrfwqjgNN3PTz72hc2ih+H141O8AM43P8Gq+r
         n0xefYfZUtf35rW6fJY6GHhl353qhOQCx6NwnmdTgU2Nky30yVNm7m/KvlX5ZtTcFiqI
         VTGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756253; x=1790361053; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=VsFHG+HrPSDx6JhEjpFE/eFB0p155f/eQ3XS5Pq0V5wTsUS+A0or3gesiYMMqCZx9e
         pZJW9Z/eo5CRRp67upG2UFnsZwgk/Wyvr8xRCRAKR5sxRtnQYPHNGb9bx9m0wcd/N1EI
         hvyuAz/UHISu65KCrMtXYi1qIvvj/GGoYcf/9ZixpfXRKGFTvqrxo73yIW9Pw5CCr/Ag
         NInR8C/ntiFZKn+7nQ3PCAcoeoLiS+XqVpmzfI6OORk9fxf4lK6K3X9jgCjs8iEMc5dE
         VqbwZRPFRw4YCZ2NZECbHTM3V8fAvLfnv4BXovOpsFdpWtZMpwW+drmzAymTPxy4qTCp
         RIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756253; x=1790361053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=ir9dwSLnu9V2+pHlmnJDbrQ02314nZ2ertYPBNz60/IFlRUeT4ySJn0ABJyp5k08B/
         irgHakainJabTx3slYCMBM3kOmo9fp27aUGrC+ca9qvLeV4m+0i1LJ+LChjspKoxS1/d
         EsraRje+p1SIoEqxQSsDqfcWtLIW8e5NfGYMzmuYeyJwl45xiPSq54QdKTJeTtCdNAiK
         JwdlXS88j6QtIvCr7f9q0ZZ5CTf05i+Dxsx4s+aw6WV1+ywF0J9HEatx2Ye3AZRCP7dy
         Mc3PtXT597/Ju0aLetFEPCRaOO3CGkgseafX46i8bSsBlps0K6pnxC57/g0LhLJHe1bN
         pkzQ==
X-Forwarded-Encrypted: i=1; AKwUvByMa6/N5EQy/vQFpv5nU+ltefs+jXEe81+NJvVP7dvjqaJN6UmJqcY2O4boTIYZcApP8NQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nPtD/aZ3u0y4FjJarb+caNj+f93ZJ0kwZke5fuU4Rkf0WipQLl
	aAn+IysPtiNWfT1QeiEh6b2nmf4PzQHlCBnu7I9Sb0+X4DgTl6VoyAYpJde99NfskBXPvw2LcKi
	q1NHec8gzJfuPPURCciOJmmwPWwYkcUM=
X-Gm-Gg: AYBFou28kRkNuCWTXvVaQUDN7Ua+J6CSDFbHNVExQi6BuWFmEcTYonsJ25XI/1xhlGz
	d5x1nZURjtQdFFa4cwDmvP56KeSF5dor7ogR0pSj/PbU4qrFFcvi9v68VsMfRkIzboDbEmGBaUG
	lbLc8MQMtwsfgPyh3vimQ4NgA09hjMTzFilaNn3QsSiv7dXM52bjRXLj5CS2ROMTpcmULWb0hnN
	oTyCM2s60ZqrBHyQKbTH61brj28UF2ziJtg3a07t3IB+Gojcy9xVBMONgnuwSPHTcJdUeSKQFpM
	J/0PSI9buvQUIPt+MypuatnR+fZ8AwHSRR/k/Q5YfMUvMz241xIDOhVUCtDQ2Pcw/rXVX3SPSz+
	2BiXG3e/l3oa8
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id
 98e67ed59e1d1-39e6c69f55fmr655165a91.65.1789756253090; Fri, 18 Sep 2026
 11:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Sep 2026 21:30:41 +0300
X-Gm-Features: AcwNN1UUuDTcQsQdT6LSC3YiQR-XJenFcyp7p3MxtUdbO4cYi1dTxigUEDSEcPc
Message-ID: <CAPVz0n2pZukL2tnaJef-N=kRiudVLN7RsTjKJJkTqp9-_k7HwA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:44 Kier=
an Bingham
<kieran.bingham@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the nvidia device trees to use the new
> definitions.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++=
-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
