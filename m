Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055641168B;
	Mon, 10 Aug 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385519; cv=none; b=PR4sZcUY0ZD4TVfzxpDM/vqPPmRQr+8KLSi0xYORUs19cUSO27HCnvWYBkfcrjF/s26fl5V9JRWhd07IG8cNJauk1gcJKe5RA0oiSHALUikVR1HHgYC1iVKzW4mBj8YXpWs/or58U53CeFGzHTlbr+hxGQ86vQvW3ZaiiacZemA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385519; c=relaxed/simple;
	bh=RrvoLnqQxE/e2WS8Q/GCYzTeWhrDvHju7YEphRsosyM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cHDPR+0skG09fo6bLqyQmMrl/g8+AueznYTqbbKpnyJjDAgc409oKIRNMyU2JYVdu5cBem5T1PQhvldFnAIjUW9wDOWyVPJoM+x2K8T7LrGZ30vzLVypFeLDr9Osm3vIi3GqoTJKlKCLHcADU6Sg9gtOhq60WxduXGNsEwyWWuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbBt6/vV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbBt6/vV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095B71F00A3E;
	Mon, 10 Aug 2026 18:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786385517;
	bh=kaWzpB554MYcNVDlKFU9XLv8frA/WcmGb+8iMsVqF0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YbBt6/vV35+RIXLZXKWr0WhVg1jMw5ehrTcuqRY45cQMjjbbGkA95tE3AAf2wzSVP
	 34QLgL34e4A+eoUTEA3Yj5bSMlSK8SlJjI+Ffz/YcgLFPJgnKAy07XgFrFbEDbE5vH
	 qj3z02Wc45vSxniw4qJMZK6zLWK44F0CZM0TqSAb6e08fS1fn44bujg3FQn/nWeKVi
	 bZ5a4pwERN71BX2dZn2dO0fVpKAaVIi/8pYNm6KjnJNpxkstkM3kKzT56YYUxpb/GM
	 bGEwODf1ZzjziX7Kar2MbJdKzyKCmuivPpQxa1jJfz45M6fx3y2GLr2/ZDdppc0bsu
	 8UeI9uad51ehw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] ARM: dts: nxp: imx6qdl-pico: Replace
 clock-frequency in camera sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 18:11:56 +0000
Message-Id: <20260810181157.095B71F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch adds a blank line despite the changelog explicitly statin=
g it was dropped in v2.
--

--- Patch [6]: [PATCH v3 6/7] ARM: dts: nxp: imx6qdl-pico: Replace clock-fr=
equency in camera sensor node ---
commit 71890897809f09d8572aca4c1562adf06208b09e
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor node

The clock-frequency property for camera sensors is deprecated. This commit
replaces it with assigned-clocks and assigned-clock-rates in the device tree
configuration.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/=
dts/nxp/imx/imx6qdl-pico.dtsi
> index ca4cb986efbc2..0cc05d084f9bf 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
> @@ -233,7 +233,9 @@ camera@3c {
>  		pinctrl-0 =3D <&pinctrl_ov5645>;
>  		reg =3D <0x3c>;
>  		clocks =3D <&clks IMX6QDL_CLK_CKO2>;
> -		clock-frequency =3D <24000000>;
> +		assigned-clocks =3D <&clks IMX6QDL_CLK_CKO2>;
> +		assigned-clock-rates =3D <24000000>;
> +

[Severity: Low]
This isn't a bug, but the patch changelog mentions dropping the added blank
line for v2. It appears the blank line still made it into this version.=20
Was this left in by accident?

>  		vdddo-supply =3D <&reg_1p8v>;
>  		vdda-supply =3D <&reg_2p8v>;
>  		vddd-supply =3D <&reg_1p5v>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810180604.3034=
255-1-laurent.pinchart@ideasonboard.com?part=3D6
