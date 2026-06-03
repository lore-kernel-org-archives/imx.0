Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C0749551D;
	Wed,  3 Jun 2026 22:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527571; cv=none; b=LvlhDLA0ZLFVFZ0hHwapgiodCJl3hNCVq8ErLBbkP8H90O+lkI78eWSAHXgmK7Qm4y1Ql3YVnSasXLQFfNTFW/etRdN7w37DY+LYKSccjd2SI9ijq+7M2pViop9M7lZfUwVsV9s3kmgPIkVZEmJ7FYYu2ers1sCPCkFNm3HjrkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527571; c=relaxed/simple;
	bh=PUzeVCGIovSTubV2xsMC10WBdsLwA6ubPXyZy14h05c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q2x4FgoXYSgRUPnL6UJFAdH+5/AqjDj+vL4trMS62gWnqxGSVyEa9J2IZglGkl7nFvDkATssY/W/hOj9XmaIpL5v+HZy+j3tTbbaVWBQwGF12cdVuV2f9YwyKlXLyp/2+7lu2klfXFVcymtJzwFEtIWDBCi74XXiA4kEc+sjNRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMfsjcTH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMfsjcTH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9A81F00893;
	Wed,  3 Jun 2026 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780527570;
	bh=XEjXzx1T9DyukGXxZ58RDZW/qKEh1PThKFf+0NOoJ3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NMfsjcTHAuCoZbkgvIaD3ujxGjsa6dE5VXaA4SPYAMFuxwajcW2b4fAhsCgTrfuMp
	 6lXYYJ7MnwnS3bjq2b0K+xyO9TuApRCQqAbukAOsg2m3zNMbNz0qoMBp/ettjCdBd3
	 EvDxKMpioFLNnz85I7GNNCQUA8N6OHtmJXntmehssuxAYAOCmIB+yCJh4T0fnCrHlu
	 UWP5qAMBLeNPaHhtLWaXti+1ZAZzhXs2dNKjHEGtnyY9C6aWrHf6kKW80qkoOuEB54
	 AQ9XeVyhQbZDGDtgoWNb6t6MugUzwrJ5NtHSJKFPp3JBxQmAEduC0QYOqeLBWkzX6q
	 pQ0pMJnQ/qEOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: imx8mm-var-som-symphony: keep
 RGB_SEL low
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <55fb7ba8f5249a0be5296a0b3523ce20a668a89e.1780527068.git.stefano.r@variscite.com>
References: <55fb7ba8f5249a0be5296a0b3523ce20a668a89e.1780527068.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 22:59:29 +0000
Message-Id: <20260603225929.DD9A81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added gpio-hog node is named `lvds-brg-enable-hog`, but i=
t is documented to control the `RGB_SEL` line and its `line-name` property =
is set to `rgb_sel`. This is likely a copy-paste error.
--

commit 9c97f65e1888df2bd494aacf3412a0fd8cf0a5db
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low

This commit drives the RGB_SEL line low on the Symphony carrier board.
It does this by adding a gpio-hog subnode to the pca6408 GPIO controller
to ensure the board remains in the expected display configuration.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
> --- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
> @@ -168,6 +168,14 @@ pca6408: gpio@21 {
>  		reg =3D <0x21>;
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
> +
> +		/* RGB_SEL */
> +		lvds-brg-enable-hog {

[Severity: Low]
This isn't a bug, but is this node name a copy-paste error? It is documented
to control RGB_SEL and sets the line-name to "rgb_sel", so a name like
rgb-sel-hog might be more appropriate to avoid confusion.

> +			gpio-hog;
> +			gpios =3D <7 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +			line-name =3D "rgb_sel";
> +		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780527068.gi=
t.stefano.r@variscite.com?part=3D2
