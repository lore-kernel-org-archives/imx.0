Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD9F35E1A1;
	Sat, 16 May 2026 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958426; cv=none; b=VXdKdtUjmp4dPRVvVCpU5X6D1yk9wOy2F2RrCQO29fqwtDMitU87uePbXxB5acvCqJOSfpyfkQLlWvcHuW7bBYEe2JhVdKqW/SWtU7/oSrRyiHh00l3rs/1asrpV34ZJtXZfzbVyI8u4R+UF5ijfGY5T6h9FgbeFe5v0BfQiv3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958426; c=relaxed/simple;
	bh=IActPDY/uwaLnqH5VofbeByS/fMz/FazPRV3SkuzJ8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tsjBhwrMM4RVNOtqS9hNryqoHorhGwDvwJtL+8l/jmoPInfwQv4/sryeSONN/th3KAdu13IL6CV4skX94+U+EajMIjXJF97SHxcB2HSWJ6dsIxw+bNuo5qTmED79fnBS0GjdPN+LongiYRd9PMWzs/6SoweXFwW0suvz+GZL1GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiYBsRK9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiYBsRK9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEFC3C19425;
	Sat, 16 May 2026 19:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778958426;
	bh=IActPDY/uwaLnqH5VofbeByS/fMz/FazPRV3SkuzJ8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YiYBsRK9BIrilTfM8x8tpERGRBQhBETKvV6Fl7hIbD8EdSmrBflqdeeWnpMDiygkz
	 DgGkumWCmVO/0E9ibpghVkTk+lhYzyZdnWOgICSeKD3DYBYTIY7TPGQbrsA1NCt+yX
	 zMcrF+e5pJeSW31ftomDbjVol8OfMaGGI1eMgS4HVu4PL8ELJ7ENDRpD5Q4K9bieXt
	 Iv8lI1YXV1lRAiATKi7pLHf1OdGI175IcicTxoKM5yx0JTIFknkC8vyeRVISAvnChy
	 s3vWt2mZDfYOawtlSDfBM+hYlA28f1KDz4U0eYQU+FugzkixQ2vfkc5DVTLL229bnG
	 4HwGMor74EIsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 09/22] drm: bridge: dw_hdmi: Invalidate CEC phys addr
 from connector detect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: neil.armstrong@linaro.org, linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260516183838.2024991-10-jonas@kwiboo.se>
References: <20260516183838.2024991-10-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:07:05 +0000
Message-Id: <20260516190705.AEFC3C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Moving CEC physical address invalidation exclusively to dw_hdmi_co=
nnector_detect breaks CEC functionality when dw_hdmi operates purely as a D=
RM bridge.
--

commit 05206110d2cbe02dc5e2cae3b6c3e7d2d8cdbe48
Author: Jonas Karlman <jonas@kwiboo.se>
Subject: drm: bridge: dw_hdmi: Invalidate CEC phys addr from connector dete=
ct

This commit delays the CEC physical address invalidation from the IRQ
handler until the connector detect operation is called.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 5fd26ff8f55b4..aae1b890167b1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2472,7 +2472,17 @@ dw_hdmi_connector_detect(struct drm_connector *con=
nector, bool force)
>  {
>  	struct dw_hdmi *hdmi =3D container_of(connector, struct dw_hdmi,
>  					     connector);
> -	return dw_hdmi_detect(hdmi);
> +	enum drm_connector_status status;
> +
> +	status =3D dw_hdmi_detect(hdmi);
> +
> +	if (status =3D=3D connector_status_disconnected) {
> +		mutex_lock(&hdmi->cec_notifier_mutex);
> +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +		mutex_unlock(&hdmi->cec_notifier_mutex);
> +	}
> +
> +	return status;
>  }

Does moving the invalidation exclusively to dw_hdmi_connector_detect break
CEC functionality when the hardware operates purely as a DRM bridge?

Before this change, cec_notifier_phys_addr_invalidate was called directly
from the hardware interrupt handler, guaranteeing execution on disconnect
regardless of how the driver was configured.

In bridge-only mode, the connector is created externally and
dw_hdmi_connector_detect is never executed. The DRM core or downstream
component instead calls dw_hdmi_bridge_detect, which was not updated here
to include the CEC invalidation logic. The CEC physical address might not
be invalidated on unplug in bridge mode, which would be a regression.

I see this is addressed later in the series by commit 795c172faddab (drm:
bridge: dw_hdmi: Update EDID and CEC phys addr in bridge detect()), but
this intermediate patch appears to introduce a functional regression that
might affect bisection.

[ ... ]

> @@ -3106,12 +3116,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_=
id)
>  				       phy_stat & HDMI_PHY_HPD,
>  				       phy_stat & HDMI_PHY_RX_SENSE);
> =20
> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) =3D=3D 0) {
> -			mutex_lock(&hdmi->cec_notifier_mutex);
> -			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> -			mutex_unlock(&hdmi->cec_notifier_mutex);
> -		}
> -
>  		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
>  		    (phy_stat & HDMI_PHY_HPD))
>  			status =3D connector_status_connected;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516183838.2024=
991-1-jonas@kwiboo.se?part=3D9
