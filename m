Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E470395ADD;
	Wed,  2 Sep 2026 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355086; cv=none; b=ADdOj0y3AFQkrqBfmtbFBujRG1jqHaIH/j3T61WA7bTdp3cNQdvIJJqd0pfhURa9Yxq3J8gsrNK06KhCQdlcLKmBBTUHdh+NNaeBNEe9RQMnjpBGqy+aPdQBnr6U9espDibCYCgWEKmFQQCO/Dp3RNhfJD8aIzDJIE6s0s1vazc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355086; c=relaxed/simple;
	bh=FaW4DF6I4sQMAZvzAH7EuS6Qin+QBflxvQO7UTWKE5I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KE7d5NH9+7tTPfOTLdXkBwdiObjDWg+YoLZ/xoPocPh2kme4KXkabIyM2dw5+QeiljPcFMayNhtt6V6k/2AFk0D+wxM3dxDP/PSTQwXccx9XVQ+QHUpqsncGvPxM0ANItFIMoMRKwN/KreU3DpBUpPwGJqIZI0Gi78BITP5skd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uw/mAFj/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uw/mAFj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4381F000E9;
	Wed,  2 Sep 2026 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788355084;
	bh=092UnTjGsdGgQEyxFnMhtkkt6iXQsZLQv67kupNL5Ag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uw/mAFj/h0YdoHMEC9OjFm0uEj9v0A3Bwo/uqgZPYaDeFcX5uaDXHktO4P8MM+Gi0
	 RQKllH5ok3Xc+luyMfcreY+DMnwmfiWHJKDIPOQvuzPamzcughzIPOLmUa5PfsDO22
	 B2tFd1tw/UGohtWm4ZSjqmz3EjqZ+YnYaodqdbaqvFG+mYDjMzGtdc+Nrz/1OVTo0f
	 2OaaH4UYgPFGlfhHE35SHY6U4L1UepMbfzhYaS9eGnVBO0dEGnNAQYVgmkRAtx4Rso
	 F2SMJDklIS6+uCyxQ0OmU3RwJW9T5im7Ve4ZHmukYQiEa2z/x24qCDmadWR/50C3E6
	 QTNSpmQPISoAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] ARM: dts: imx: bx50v3: ignore HDMI rxsense
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ian Ray" <ian.ray@gehealthcare.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260902130117.2731-3-ian.ray@gehealthcare.com>
References: <20260902130117.2731-1-ian.ray@gehealthcare.com>
 <20260902130117.2731-3-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 13:18:03 +0000
Message-Id: <20260902131803.8A4381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `ignore-rxsense` property masks the `RX_SENSE` bit too late in=
 the interrupt handler, causing the PHY to remain powered on and failing to=
 invalidate the CEC physical address on cable unplug.
--

commit c6070e883038c9a4fefc26add73992b31945db06
Author: Ian Ray <ian.ray@gehealthcare.com>

ARM: dts: imx: bx50v3: ignore HDMI rxsense
   =20
HDMI is converted to DP in the B450, B650, and B850 boards; as such the
rxsense must be ignored for hotplug detect to work.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi b/arch/arm/boot/=
dts/nxp/imx/imx6q-bx50v3.dtsi
> index 2c8d2ab8cda13..8e129b1bdbbfc 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi
> @@ -174,6 +174,11 @@ m25_eeprom: eeprom@0 {
>  	};
>  };
> =20
> +&hdmi {
> +	/* converted to DP using STDP2600 */
> +	ignore-rxsense;
> +};

[Severity: High]
Does adding this property expose a logic error in dw_hdmi_irq()?

Looking at drivers/gpu/drm/bridge/synopsys/dw-hdmi.c, the masking for
ignore_rxsense is applied after the critical state machine functions have
already evaluated the raw phy_stat:

drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:dw_hdmi_irq() {
...
		dw_hdmi_setup_rx_sense(hdmi,
				       phy_stat & HDMI_PHY_HPD,
				       phy_stat & HDMI_PHY_RX_SENSE);

		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) =3D=3D 0) {
			mutex_lock(&hdmi->cec_notifier_mutex);
...
		if (hdmi->ignore_rxsense)
			phy_stat &=3D ~HDMI_PHY_RX_SENSE;
...
}

Because RX_SENSE is permanently asserted on boards with this property,
phy_stat & HDMI_PHY_RX_SENSE evaluates to true during an unplug event.

Since dw_hdmi_setup_rx_sense() is called before the mask is applied, it will
receive rx_sense =3D true, which skips clearing hdmi->rxsense and leaves the
PHY powered on indefinitely.

Additionally, the CEC invalidation condition evaluates to false, failing to
invalidate the CEC physical address when the cable is unplugged.

Should the masking of HDMI_PHY_RX_SENSE occur earlier in the interrupt
handler, before evaluating phy_stat for these state machine operations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902130117.2731=
-1-ian.ray@gehealthcare.com?part=3D3
