Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64093F0774;
	Mon, 27 Jul 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147358; cv=none; b=otW45RvVTj153b1UWbeUVSn6EEOIXrJG9pBwigVUWoNb1KDtegIZ4+iZA/r+RPlnIphr0dNMo8EVn/UdJy1YgarpZA7NyghS95CSD6sK0rJpZ/tqDKhLb8J02YvjxvuZlaNpgRh8498uFlO5TRIU0PZniF2/HRC3xepKNb643+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147358; c=relaxed/simple;
	bh=xvKoeyD0YvPoF7qb6sFjOd3GdICxL0x0+mBYgOfMBpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rq7Zu6PQs5qLKYMpc8BBBuxXhaxqKrfbVwJq7leyGymQlwF+nUOxtZfO1RzNIrwvl4paiXkqP9iCVkle+Kdjl2r4g3Amo1kEY6kzDJ9ko76//7hpDTnKVOre/c6aHZzAgmf+JYNpQmVQ84oJcU7A7LWsMgFSRNMGEm2BT5jNptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZErYUr52; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZErYUr52"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8867E1F00A3A;
	Mon, 27 Jul 2026 10:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147357;
	bh=YmrL/S7ryEu7mvwIovRA43yBQszeUhCxQRrdZlnlngo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZErYUr52C1KxD2Wrv/ezZl4iqLcOqMuqet1Yr1hqQWsy/kEp1W5b8Ij3Z77Jwx/5q
	 XtqRVdE6bm93cfG4Nls6XI7QBI2AwgpFx8f0QY9+G266xgYaEmrld4oB4u0ipakmzo
	 5kvThRO82TqD95wZrqD6IWav5Lv/1+aKKZo25OPbV74JhqGp9UsMbABKXZqWsluv3r
	 0xMEcafC+12xjnd4E9JI3IFKiPTTAaDLPfSt5nrnHRl825hrbIkJ4uMERW3sLGX+Gy
	 ZtKV/RMQLtkM4NlfF+5Gh3MyzJ7riGHoweVaqTqAdlyHVfVZTA01SWHHWAxzB435RD
	 SUQZ5sEzinPjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-5-fa8f71dfc56f@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de>
 <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-5-fa8f71dfc56f@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 10:15:53 +0000
Message-Id: <20260727101553.8867E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing touch controller node in the device tree overlay.
--

--- Patch [5]: [PATCH v6 5/5] arm64: dts: imx8mp-skov: support new 7inch pa=
nel board ---
commit bd24f58ff22bbd1df246534579e3ab608027e17c
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

arm64: dts: imx8mp-skov: support new 7inch panel board

This commit adds a device tree overlay for the SKOV IMX8MP CPU revC board
paired with a 7-inch JuTouch JT070TM041 panel. It also updates the Makefile
to compile the new overlay and device tree binaries.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070=
tm041.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm=
041.dtso
> new file mode 100644
> index 0000000000000..20e987b36c53a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.d=
tso
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	model =3D "SKOV IMX8MP CPU revC - JuTouch JT070TM041";
> +	compatible =3D "skov,imx8mp-skov-revc-jutouch-jt070tm041", "fsl,imx8mp";
> +
> +	panel {
> +		compatible =3D "jutouch,jt070tm041";
> +		backlight =3D <&backlight>;
> +		power-supply =3D <&reg_tft_vcom>;
> +
> +		port {
> +			in_lvds0: endpoint {
> +				remote-endpoint =3D <&ldb_lvds_ch0>;
> +			};
> +		};
> +	};
> +};

[Severity: Medium]
The commit message mentions that this board uses a different 7-inch panel
with a different touch controller. However, there doesn't appear to be a no=
de
configuring the touch controller itself in this overlay.=20

Is the touch controller hardware configuration missing from this file, or is
the touchscreen initialization handled outside of this device tree overlay?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-v7-0-topic=
-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de?part=3D5
