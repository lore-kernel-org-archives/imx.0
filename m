Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600747;
	b=eNGYUsy8+qozH1xAZniOE6z89wA8UxRtSL3s8f1DzlCHFYRWf9LYK5pxZAx8YcJ2Qflt
	 R4Y1PCIs1PHuLEOG1RbYJSUZBzUe9HHwQmCL47qGuN6b80aOEW/ELRLJlW6PUJsOdKl59
	 ZuFf/NxEUx0RXOzZSJtktLXcN0GTsZGCc9y1oPWPMfk4Icyh86t+OgrynqTQntdJKDJgT
	 KwcCq6z7nj/C1XupyldYYAm+qbsCpaBxOATo+gK+i2NYLv3PzRqsoQcLFzb2O5lXRtPrN
	 EIiOxKZ7MwNUvDhQ89hOi8bflgSftrcnmYwwK7awRSP7f63WBF1nQ7FiEeEG3leN9ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600747;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d1c/Y23MrHMxdPyS7VmHlasLolRXmNyJUvMgjxxdNAc=;
	b=uMHNAK/tQW//zEUTh7JIDCtN5guqvTK733ji1yf7Ib1tmob9ArFL3VxJw2Nwk8yW97Vd
	 9D1+aHVKh9f7n9GDTi9MIeue68jzOQmwPCdw7vweXbGzPltnuXtbqZSZV2qR+CIi1Oi7K
	 oCry+ADyjWrRl/v/P/xEIlZ4rMO+dVH4X4FNLFx5P/2SD7ek3B2mNsCYB1yuSd5gQnzhi
	 ruE2g7n54xC39DS6SrBXbrYCaAiv23vXi8+tTvAJXch8eluxB/cP+meI6o8Q6AAkERwZK
	 DqVywsx3+0Ogwi16utAmjp91SaRkHLF0goy4OmwzJqfW2GRoLtsArbTdzI0j4z51y0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A/ETobGO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C6A606A321;
	Wed, 25 Nov 2026 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A/ETobGO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683BC1F000C4;
	Wed, 25 Nov 2026 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600746;
	bh=d1c/Y23MrHMxdPyS7VmHlasLolRXmNyJUvMgjxxdNAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A/ETobGOO8F5X81jcNkn4ptgYlVDd7PkNkPnG2JhZ9tetyuoQToPM67sK1ScIwMxI
	 IOxkrRq2cZ9nAVyNQKrtdGVWoEU00sIBYVKOFk8sWRvgF5CnPDYosRMDFhDetYOzaP
	 E4aC4yCBFVlcWBsv7znx/1v6nsVSIaHeDUPdq9RZwlkqdKG62l9YtpSFXaaoa36gnx
	 LZjSbCkn4WRvKWvZO2LJiUWwgBuqgoIExtaNSIT5htjxSRxICZPUxKKqTl5wJLCyKf
	 vB1rdPDUNmK8HcmZ+HBJQBg5PvxqeD2HgVmpbIjnMn9fL3mu43d6QPNx9pLRLRxM+s
	 HSHYghtDZD7Vw==
Message-ID: <sashiko-outbox-233084@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8mn-bsh-smm-s2/pro: keep SDIO Wi-Fi
 powered during suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Waldemar Rymarkiewicz" <external.Waldemar.Rymarkiewicz@bshg.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261125094825.3873696-3-external.Waldemar.Rymarkiewicz@bshg.com>
References: <20261125094825.3873696-1-external.Waldemar.Rymarkiewicz@bshg.com>
 <20261125094825.3873696-3-external.Waldemar.Rymarkiewicz@bshg.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 09:59:05 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: imx8mn-bsh-smm-s2: cap-power-off-card defeats
  keep-power-in-suspend
--

commit 088cbe9bdf022869f185b3a15de5fbebcc1d6394
Author: Michael Trimarchi <michael@amarulasolutions.com>

arm64: dts: imx8mn-bsh-smm-s2/pro: keep SDIO Wi-Fi powered during suspend

This commit adds the keep-power-in-suspend property to the usdhc2 node on
the i.MX8MN BSH SMM S2 and S2 PRO boards.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi =
b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index 8dee56299cff4..917ef96774988 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -264,6 +264,7 @@ &usdhc2 {
>  	bus-width =3D <4>;
>  	non-removable;
>  	cap-power-off-card;
> +	keep-power-in-suspend;

[Severity: Medium]
Does leaving cap-power-off-card set on usdhc2 prevent
keep-power-in-suspend from keeping the brcmfmac SDIO Wi-Fi card powered
across suspend?

keep-power-in-suspend only sets MMC_PM_KEEP_POWER in host->pm_caps, while
mmc_sdio_suspend() checks host->pm_flags, which must be requested by the
SDIO function driver on each suspend.  In brcmfmac:

drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c:brcmf_ops_sdio_su=
spend() {
	...
	cap_power_off =3D !!(func->card->host->caps & MMC_CAP_POWER_OFF_CARD);
	...
	if (sdiodev->wowl_enabled || !cap_power_off) {
		...
		sdio_flags =3D MMC_PM_KEEP_POWER;
		...
		return sdio_set_host_pm_flags(sdiodev->func1, sdio_flags);
	} else {
		/* power will be cut so remove device, probe again in resume */
		brcmf_sdiod_intr_unregister(sdiodev);
		err =3D brcmf_sdiod_remove(sdiodev);
		...
	}
}

Because cap-power-off-card sets MMC_CAP_POWER_OFF_CARD, any suspend where
WoWLAN is not enabled takes the else branch, removes the device without
setting MMC_PM_KEEP_POWER in host->pm_flags, and causes
mmc_sdio_suspend() to cut card power and re-initialize the module on
resume.  Should cap-power-off-card be removed here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125094825.3873=
696-1-external.Waldemar.Rymarkiewicz@bshg.com?part=3D2
