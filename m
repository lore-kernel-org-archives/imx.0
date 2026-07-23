Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D3A371CE9;
	Thu, 23 Jul 2026 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791328; cv=none; b=bTucYrhfujownUEC5K78ooUm72n0ObPKa7AuwYSdJZN8M90GVMejx2utXrFACxKFSNvGUZUgVZd8+xAt6ebdLVA9GuTCX82sEaqfR6GGM6y4s+mVDB86rpKsAyErIUVI/jqzXNQeyCvjWmUwH6PQrc1Wu6OEaayO+nlQkEoaQLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791328; c=relaxed/simple;
	bh=9Y2Ka4lciInxtmwaIcC1N+yxqH6odHJVEyOP8rtUpd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bfI7ZAl4r9a8ya1L+QE7AG5fFPfs89OoavwAyKFHM+ad8H7cXR2kFVUpQTPW20NRxz/n/GoWkS+71cBRaFqLAV7U8tpigWdQB3kN7ULV9jlgJ/6XHD5oNdYmT33P6yieibJ4ycqvlTtnIeU5eLFAsrEM84Ve6fu37KYcrb42zss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRg4sDul; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRg4sDul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92621F000E9;
	Thu, 23 Jul 2026 07:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784791327;
	bh=Kw7QYMCmCsFOkbFi7p6P6y+8Qz4AQ+K8jXtbbdfNoQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LRg4sDul6wpFbU181m/Z2yF/v4Fc6/Es+/Wn1Yyh6r21E5h4mTjfJ7CGrZ6d6AdhR
	 1NAiAqiul4xo6iB3whxfEPcs+7xprE/yuguLk+ADlLTQ/NZryCLzVu3LIDevVTsgZn
	 M4vGarSpmuORFrdOf7jFwlajUEBJbA9U1EhIJHX03qxyAyhTncv6o1fqaIMRTzBhVD
	 T79ubURniDWUPupem+ej9bItmPFjtFJJO00A121Kum08Phu6de4pOj6b4MitNJx43Y
	 imdEBlmxlvhoQ+v6yKNXZB08/tCNs3pOeOD85fBdDm33ieXIjNQUq9GzxYOVX1c0GH
	 EdZUjKVA6k+ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: imx93-11x11-frdm: factor out common
 parts into dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Guo" <qijian.guo@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-imx93w_frdm-v2-1-b108a76b2e40@nxp.com>
References: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
 <20260723-imx93w_frdm-v2-1-b108a76b2e40@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 07:22:06 +0000
Message-Id: <20260723072206.E92621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch contradicts its v2 changelog by moving the board-speci=
fic `lpuart5` pin assignments into the common `.dtsi` file instead of the b=
oard-specific `.dts`.
--

--- Patch [1]: [PATCH v2 1/3] arm64: dts: imx93-11x11-frdm: factor out comm=
on parts into dtsi ---
commit 35cb24d7221e1d0efbc151d7ebfd44422372ffdb
Author: Joseph Guo <qijian.guo@nxp.com>

arm64: dts: imx93-11x11-frdm: factor out common parts into dtsi

This commit extracts common hardware definitions from the i.MX93 FRDM board
into a shared imx93-11x11-frdm-common.dtsi file to allow reuse by the Wirel=
ess
FRDM board. The FRDM-IMX93 board-specific .dts is updated to include the
common dtsi.

> ---
> Changes in v2:
> - Move board specific lpuart5 pin assignment to board dts.
> - Move pcal6408 node to board dts
> ---
>  ...11x11-frdm.dts =3D> imx93-11x11-frdm-common.dtsi} | 129 +---
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 679 +--------------=
------
>  2 files changed, 7 insertions(+), 801 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b=
/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> new file mode 100644
> index 0000000000000..5c8fdd77ec15b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
[ ... ]
> +&lpuart5 {
> +	pinctrl-0 =3D <&pinctrl_uart5>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";

[Severity: Medium]
Does this contradict the v2 changelog?

The changelog states "Move board specific lpuart5 pin assignment to board
dts", but the lpuart5 node and its pinctrl assignment are being added to the
common imx93-11x11-frdm-common.dtsi file here.

[ ... ]
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins =3D <
> +			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
> +			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
> +			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
> +			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
> +		>;
> +	};

[Severity: Medium]
Similarly, the pinctrl_uart5 pinmux group definition is placed in the
common file instead of the board-specific dts.

Could this incorrectly share board-specific pin muxing with other boards th=
at
include this dtsi?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-imx93w_frd=
m-v2-0-b108a76b2e40@nxp.com?part=3D1
