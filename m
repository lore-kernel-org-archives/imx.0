Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1C32139C9;
	Thu, 28 May 2026 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007131; cv=none; b=ZdwiJ8CI5ubZPTS00cMiEjC19N2QeUw7SwNpJMK0PJj5iETnH2oxEyapmtznL7LKDbiAF3jR4AwHF0iuowyrc4fPnFpQuwW7kQTIP4S+8lJ/GAhhzVVREk2oA6mVOmxdDdg0p0gh3UQtLQ/brcRV20EqUKkqCFvBsQFoiYpFSRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007131; c=relaxed/simple;
	bh=oNPnKeeB/VGAYuNi8T6SLmTVxfbQZulXfOxQ9xwXUQ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b8bqH2od8uiLI+79Q6sXofdn40xCTsGNEi0YYdODmdhArFqkNCIkWIAJjQBIzZn4USZc4LFG1YGW+J4emLH1gaNt3SvAHQqkKWi6TKygA1JFjGdsybK3OBwrOPeVo6M0N6CVpw71oapIb6EdMqe8I0elh/TdoE4DtZIfPrWFJ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+jSH3Bv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+jSH3Bv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAB01F00A3A;
	Thu, 28 May 2026 22:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007130;
	bh=j8zQm5Lv/13WN4F9GShad56Ydifs12o4VwIYSKGEsHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K+jSH3BviXAc0ADmnF9riORanlwulz/ftMqaQBWp3/o/UXV/svclqCQh35sO3u9pY
	 j8HSbCA3xg1LRSqa8xNjBJTfEqPTQ6x6gGhxZz49+Vhtn7miE6WWCmW0pwGCsH0/Uj
	 matZyZa4eVYkO7YxAUNnfU/yYodYf4KPgn2PeWKqJ9c8Etoms0s8zJPOn7FlOAUKGr
	 F2KvJTNVKMtvBO7uMxC7x4X6QIzEnynZuH059johnlubnfsSfGej4jROZ0K5Hbj7Ni
	 1qGVDzMHn6AklTaKA+CZZP/dl78AqFLSrmSTeJ5bJ5p7gUwj4nhlaOI7Z1rvqoiF1s
	 MkttWhcSXawZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: add TPM reset
 GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260528220550.34891-1-stefano.r@variscite.com>
References: <20260528220550.34891-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 22:25:29 +0000
Message-Id: <20260528222530.3DAB01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete implementation for Sonata carrier board: missing TPM =
reset GPIO for i.MX91 DTS.
--

commit 0e430ef40e9b74a6759e3f9cd5622101a105206c
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx95-var-dart-sonata: add TPM reset GPIO

Add the reset GPIO for the TPM device on the Sonata carrier board and
label the node accordingly.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/ar=
ch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> index 0f3d2e488f4a9..d2c7d83e1624a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
> @@ -274,6 +274,8 @@ pca6408_2: gpio@21 {
>  	st33ktpm2xi2c: tpm@2e {
>  		compatible =3D "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
>  		reg =3D <0x2e>;
> +		label =3D "tpm";
> +		reset-gpios =3D <&pca9534 0 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Since the commit message indicates the reset GPIO is added for the TPM devi=
ce
on the Sonata carrier board, is there a regression here where
arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts is missing this
update?

The Sonata carrier board is used with both i.MX95 and i.MX91 SoMs, and
imx91-var-dart-sonata.dts instantiates the exact same PCA9534 GPIO expander
and ST33K TPM hardware.

Should it be updated to include the reset-gpios and label properties as well
to avoid leaving the TPM uninitialized on the i.MX91 configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528220550.3489=
1-1-stefano.r@variscite.com?part=3D1
