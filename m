Received: from mx-relay87-hz1.antispameurope.com (mx-relay87-hz1.antispameurope.com [94.100.132.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E2F2D8DCA
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.254
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228308; cv=pass; b=sJRZxMeGXxSM1OgzBChXy21T2/SO1ECLwEY4z/qqDRVqUA5OjI88yndsVGgljxaEMyJqo4nm9Q3EEdB6pWtqXDXZJJJKddwJpN4zFTmq7KYfx+0Mi4x4LZXwQeZp8O9eScyyPS8lPSExnV1n9qtKDQOFlm2X4gp/BbJH0U5Zl54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228308; c=relaxed/simple;
	bh=bZ2zMBOqCI4gSRYdvAN5yceGY8g7ev4vHxJ6FMgFQX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cmxrc1yKpMAdmJ8PQ2paVMgR3LKBK0+x0+0gxlPoEbTE4n4aUflyu3hAx0iiFpZ3m9ef/t3IotYlTz1pAC8LzvNBjTsfql2yR9Wwq9aOLU0VChDbERq93MeEq8S2zxBtC1KoKsmucVDOHiRbPZI9igeluEMErcFuRZWapJi/ZoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LKpPo9I2; arc=pass smtp.client-ip=94.100.132.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LKpPo9I2"
ARC-Authentication-Results: i=1; mx-gate87-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=3sTwvMaOD2KlqMJn2cmd2U+t/IC6uSpDaPUIgltSHNY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761228225;
 b=sjwC30dy896xwCvYnKrJdyhn0buO+zQC/nYACNOxdhKmi8vBSLh0cMBfBK7vQNMpW9/IsHje
 ANzoHBTwPvFOcU8SqF7FbGEL7hnfW8a8aAdlLKmkeqpEMAtJwf4j6mHs9rjuaTkS7W3aqUNABvs
 ChIUzDEwAgH1qgMkGT9PviwI2mw44/0YTEPq2X/SNY4OF5QCfeGObrm3v3RnD4xvx7F2ZrCIRnr
 TAxHCYCGsez5BD85hMAr2K5sSiHt6GNcpUpchUagNZA1zU81YbqxHm51gcP2GOAXoEI5QdhYa2u
 notHbfcLGIk8fVGRh2iS1ISPqU/T9+LLF/gwWXIFZRE+Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761228225;
 b=Yk1wP6h9MN/JS8kjP9WZYOQD4rlwYHVcJ9XUSv4pg/lq2ZRYoFG+hxa/0YOOZvDOWCaBOmXf
 CNQNhXi8WfUuTnbxr8nafeqdJiP8WqInCN0hucqaWAM+okVF/lOW1y1B5EHsBI/f7+nfXdaoyjF
 YeyaJSkW5LRptnnaZ0ufn2YEcTRAVQ1Ur7cmmYjkB98xV9/HhdJ2TjQ/B3rsiedAxqU8glVaEj8
 kRer4zd67Ihw5Z4Yk+hwZvBqPxQxgBox8fa0By36k9mWlKxBgfou8wswZ7KivMnSt3MUCQ8pzxt
 fU53yxbtfGKkrZl0vbAop4+M1Q2bGgU7x0wrFCYBFVxog==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay87-hz1.antispameurope.com;
 Thu, 23 Oct 2025 16:03:45 +0200
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 81F9BCC0CC1;
	Thu, 23 Oct 2025 16:03:37 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev,
 =?ISO-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>,
 =?ISO-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Subject:
 Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting and
 Ethernet
Date: Thu, 23 Oct 2025 16:03:37 +0200
Message-ID: <3381308.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
References:
 <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay87-hz1.antispameurope.com with 4csnnQ15tNz29l9Q
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:a7de4b4405587fa83fe7bed496fa611d
X-cloud-security:scantime:1.783
DKIM-Signature: a=rsa-sha256;
 bh=3sTwvMaOD2KlqMJn2cmd2U+t/IC6uSpDaPUIgltSHNY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761228224; v=1;
 b=LKpPo9I20bjxvVw/UPHASH70Hcuz5ohKrXSKgFQdT2nbiaYEHQ8tm6Qw/C++D9oQdqhOY6Q2
 epMiH/UCgGRngnbjzxZ8WrI3emIDLX9RXkDKQo7qYFXXZZLTX9sVtHEF8co5PEMgYcDRrHpDH63
 RCF4OeqpPyIdkCjSzlpwL3EJD/hvGpSa3aRPljSaVhGuVSfClEYdWbZjXBOOGpsAUjaXQCVNXDA
 yoP3lxqFJZKBqKXVSJDGN2wNGt6yf0PBTq6nctOKaYVa9BvmwPGEt+NNuWmzn+Shd49/Fqwoyr4
 z8WR+R1xxb2IvhWs1WdJS2YHEezY6P3BH41SKdRWmpwQQ==

Hi,

Am Donnerstag, 23. Oktober 2025, 14:19:15 CEST schrieb Jo=E3o Paulo Gon=E7a=
lves:
> From: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>
>=20
> Enable the necessary missing configs for the i.MX95 to boot and also
> have Ethernet working:
>=20
> * CONFIG_NXP_ENETC4 for the network controller driver
> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
> * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver
> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller
>=20
> Signed-off-by: Jo=E3o Paulo Gon=E7alves <joao.goncalves@toradex.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e09=
43e7b0e1dcee3a9 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=3Dy
>  CONFIG_FSL_DPAA_ETH=3Dy
>  CONFIG_FSL_DPAA2_ETH=3Dy
>  CONFIG_FSL_ENETC=3Dy
> +CONFIG_NXP_ENETC4=3Dm
>  CONFIG_FSL_ENETC_VF=3Dy
>  CONFIG_FSL_ENETC_QOS=3Dy
> +CONFIG_NXP_NETC_BLK_CTRL=3Dm

Are you sure this should be module? Shouldn't NFS boot be supported by
default? I might be wring here though.

Best regards
Alexander

>  CONFIG_HIX5HD2_GMAC=3Dy
>  CONFIG_HNS_DSAF=3Dy
>  CONFIG_HNS_ENET=3Dy
> @@ -615,6 +617,7 @@ CONFIG_PINCTRL_IMX8DXL=3Dy
>  CONFIG_PINCTRL_IMX8ULP=3Dy
>  CONFIG_PINCTRL_IMX91=3Dy
>  CONFIG_PINCTRL_IMX93=3Dy
> +CONFIG_PINCTRL_IMX_SCMI=3Dy
>  CONFIG_PINCTRL_MSM=3Dy
>  CONFIG_PINCTRL_IPQ5018=3Dy
>  CONFIG_PINCTRL_IPQ5332=3Dy
> @@ -1349,6 +1352,7 @@ CONFIG_CLK_IMX8MQ=3Dy
>  CONFIG_CLK_IMX8QXP=3Dy
>  CONFIG_CLK_IMX8ULP=3Dy
>  CONFIG_CLK_IMX93=3Dy
> +CONFIG_CLK_IMX95_BLK_CTL=3Dy
>  CONFIG_TI_SCI_CLK=3Dy
>  CONFIG_COMMON_CLK_MT8192_AUDSYS=3Dy
>  CONFIG_COMMON_CLK_MT8192_CAMSYS=3Dy
>=20
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251023-upstream-imx95-smarc-defconfig-8972db535918
>=20
> Best regards,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


