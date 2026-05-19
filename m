Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152621B4156;
	Tue, 19 May 2026 04:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163285; cv=none; b=WLea3zPEnkHBWm9Ai84ppXq7PA5OECyNYgCOWUETuODTFMWhRVrTc0a5brNVyNetyUimNsueAKKvZWwOjbnHw1vbXi1BfgrvL9mSKFxQah0Ns+ii9rGBrOn5o6wuyFV0d2uUwkfrz354sztRMOGxswmIFI6XyGTEqfvX4YBEpOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163285; c=relaxed/simple;
	bh=apfHh9NdaAR8H6oHPJ1Dep9eGdExGnRCypopoid+nDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VppRVIo4PK9V5qReXphRUJCkaGHpWzgRE+T7UdXU4eU/bGlA5OuCaUtvrzM6wJYxhTuXaQggeBdLmmCrWt95SDFoJWRLZ0oE3ZdkAUwLGS4rPuvw4kQ4j5KidLsLGprgPoFoGkl89e2R89Jz5dFQwIJbaovP43H9bfGBK0hCwFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OL78+znP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OL78+znP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F85C2BCB3;
	Tue, 19 May 2026 04:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779163284;
	bh=apfHh9NdaAR8H6oHPJ1Dep9eGdExGnRCypopoid+nDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=OL78+znPoYduJqPwYytogtx+mhJq7IMbEF/oyanGVsCkdQIdX18FDmpYaxDyw3oPR
	 TTNVlQDFEIuOUfKMAkx2bswJck+mJfjidUmPZyARmLhAoHIJhRp0mMgQMXjjuWUYSZ
	 c01Mgkl9vCjXiFOuS63wmuKlCuA7Nmcn5mM2f31eWZ3iS3aNd4OFJ6FWB3eFjnDi9M
	 iJpBmF4f6ihg1GKS00b0tePjX3qgtmoaPZPq6gGHe+1VQZ60wCqP9N5lpTnIeukenc
	 RkqxE1qsEXTchrEbU/pQDb3drn5u7tYtiiuj0RlXcd4D8tIZZXKBTKgBht0BkGARPW
	 VMzpMy4R9bP3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] media: synopsys: Add PHY stopstate wait for
 i.MX93
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519-csi2_imx95-v4-4-84ea4bb78a88@oss.nxp.com>
References: <20260519-csi2_imx95-v4-4-84ea4bb78a88@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 04:01:23 +0000
Message-Id: <20260519040124.69F85C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Waiting for the PHY stop state (LP-11) after enabling the remote s=
ensor streams introduces a severe race condition, causing initialization ti=
meouts and capture failures.
--

commit 804a163365664b371b9f8e8d039f139d325044c6
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: synopsys: Add PHY stopstate wait for i.MX93

This commit implements waiting for D-PHY lanes to enter stop state on
i.MX93. This ensures proper PHY initialization by verifying that the clock
lane and all active data lanes have entered the stop state before proceeding
with further operations.

> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/m=
edia/platform/synopsys/dw-mipi-csi2rx.c
> index 92178a3dec5d5..8a34aec550ade 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
[ ... ]
> @@ -556,10 +562,19 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l=
2_subdev *sd,
>  	if (ret)
>  		goto err_csi_stop;
> =20
> +	if (!csi2->enabled_streams &&
> +	    csi2->drvdata->wait_for_phy_stopstate) {
> +		ret =3D csi2->drvdata->wait_for_phy_stopstate(csi2);
> +		if (ret)
> +			goto err_disable_streams;
> +	}

Is there a race condition between enabling the remote streams and waiting
for the PHY to enter the stop state (LP-11)?

In dw_mipi_csi2rx_enable_streams(), v4l2_subdev_enable_streams() is called
just before this wait_for_phy_stopstate() block. Enabling the sensor stream
commands it to leave the stop state and enter High Speed (HS) mode to
transmit data.

By the time the polling loop in wait_for_phy_stopstate() reads the
DW_MIPI_CSI2RX_PHY_STOPSTATE register, the sensor might have already
transitioned to HS mode, especially since the polling loop uses
sleep_before_read =3D true. In HS mode, the lanes are actively toggling and
are no longer in the stop state.

Could this cause the polling loop to never detect the required stop state,
resulting in a -ETIMEDOUT error and causing the stream enablement to fail?

Should the stop state check occur before enabling the remote subdev streams?

> +
>  	csi2->enabled_streams |=3D streams_mask;
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-csi2_imx95=
-v4-0-84ea4bb78a88@oss.nxp.com?part=3D4
