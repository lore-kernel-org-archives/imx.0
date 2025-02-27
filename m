Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524721DDC22
	for <imx@lists.linux.dev>; Thu, 27 Feb 2025 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740676071; cv=none; b=ZqESNV+eh0jHfYAznngTL+EoXVQ+h+i0cQ/54ryga5effti7kUEbe7aOWGCu1X/iIFlmlHCIghZSQgtz9SsUeR/rGJ73OEPb92BIkGqeaZqu6+ufOiy3LrZX2mRePgO6d94FeqQyGUd+cG7bcUEgAjoabsVGN4jPjtmVxWZYgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740676071; c=relaxed/simple;
	bh=7R74lr5594kAGxToaxvz8tq6hjGiWqrgb978VHTWwxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmakwwgqzyKaFBySloAK1nfm7bLENN9YuBzoTbAXC/LLVFAWo6EDxmaczMxjOVfvLY4GG/YT+tVy6byrvnam/0uIKQ2Ds2UphUf/UoMSxPVki0iOpeEIVRq7f7oJcqEYLnYWfe0k7ONijIRUGKNrBLod//Xp89vqzIZlg8TQRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRf3f8z9; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRf3f8z9"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso1300293e87.3
        for <imx@lists.linux.dev>; Thu, 27 Feb 2025 09:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740676067; x=1741280867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+oxit/fbFATP5S0oI9jk02pT67RxLAecxX72TBSPrJ4=;
        b=PRf3f8z9XZCGGaMArpdPZlIIabU/XiubP5ijRzykbOAwEHh7A8dc42jVctZAtlDlXd
         f497OyzRq86e/CVrMRkhl+XK7GjwkeeWjG044NKUzHm+Y7etbm3KBVZsvf1FzONofj6x
         nJNeWZmjdTvoZ0oDW2ha58g1Q43uKzsbpIBx3nJAet1r3BIKIFWXIr8IpO/IYs8Bj4iM
         cpG19SzN0t1sufSZ3wClwrdcTxkagpBx+/cnTef2GRC7oqRRdig4zfXLkcvhQb37JV7F
         R3DJCyACF53bAeqYJqICR8nPifREA7dGc0P8DU+Zg5bsjV9DUxpLjMUmW39XpTMrhcif
         +Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740676067; x=1741280867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+oxit/fbFATP5S0oI9jk02pT67RxLAecxX72TBSPrJ4=;
        b=pu15CwZ38Cx5XfKA8urRilIl2g5mRN72fA4c33JEAILL8BVPdnenS5QNgCh5YqN5/c
         qU17653R5Dpmwmg0QDlETtsY/1GSAm4muNN9rt6Iu7hqzkHPlgaFr+1TrcpB0SVPHjkA
         2DxubLI8YvZomPPqIk9t1O0nuScgFH248a18diGx5Uzz+3ujNXV9Q8TcrdIC7uL1dQ71
         nyBNvD1M3IxI0ePwPlbY+MsDerAgnR9+Y++CW04dnfanzMrOWMVIRtxtFD10UL9YV72n
         CbPTzeWsh/yO/K+TnTzJ8PsQDZUxVPQRbos0xkHeVrLvY2QHJCsuTt2FJYd4pydenoqK
         AZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj8pqkLHOUM+YeA7lpC5K40jcSK9lA8SHVTXaEVkTYyR0sXQg8nMtqnVgPQ0nfjRmDQ50=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCxTNPFNSCQVNZtniTzCYuY7s52sCwAbKcIHLB64+dbIbD3q7g
	0d4xD9ETGBU9xcwkquw0wWWFeJXIo7UvZ9y9GIWB2RSKAi5vUdj1ro+++c417byLstOc3n6KWYh
	MSDyNA+lE6LratsczDEYWlQdYQBA=
X-Gm-Gg: ASbGncvPwfpW/0VJLSGeFT2jmRzjr0oZbgW7pGkOFM5aMjYHP9u3vwhfvK92jfFjQpw
	s8PJp1La1JQbKDqnaqEAkPLFasy5wIi8l90JTa3bB9p1QlY0gDZqzh9xbZOPXsCMzSwkcicZlEw
	OLzfyeZJ1qPl2WdxWLqpn4kMM8K7AlCX8SHhYUldw=
X-Google-Smtp-Source: AGHT+IGbHwFw3Ei173z0Un2b6hE6mBlb5qScKRe0aoWLTdNiy0wIyLsDV/TjbMoZKWKVOebKb7C9sd0SzZzc+u29lkw=
X-Received: by 2002:a05:6512:3b11:b0:549:490e:240d with SMTP id
 2adb3069b0e04-5494c320d47mr80269e87.28.1740676066843; Thu, 27 Feb 2025
 09:07:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
In-Reply-To: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 27 Feb 2025 14:07:35 -0300
X-Gm-Features: AQ5f1JoOSEVimzZP3To5R1UEdgKOEY0K6S3WLSXvUvHm17C771vmwEyHDgADBUM
Message-ID: <CAOMZO5C0uS3jes=tbnM1D75n-OoAVDXQrfyn0cPZKwdNPViFxA@mail.gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Francesco to help review.

On Thu, Feb 27, 2025 at 2:06=E2=80=AFPM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:
>
> Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
> which is EOL, with the TLA2024 ADC and AD7879 touch controller.
>
> Accurately describe the new hardware.
>
> v1.1 of these SoMs is still described by the following DTSI files:
> imx6qdl-apalis.dtsi
> imx6qdl-colibri.dtsi
>
> The STMPE811 touchscreen controller is no longer disabled by default.
> The STMPE811 is self contained within the SoM, therefore, disabling it
> is not the correct default behavior.
>
> v1.2 is now supported by a DTSI that modifies v1.1:
> imx6qdl-apalis-v1.2.dtsi
> imx6qdl-colibri-v1.2.dtsi
>
> For each carrier board using these modules, a new DTS file was added
> that includes the v1.1 DTS and modifies it with this v1.2 DTSI.
>
> The original DTS can be used for modules up to and including v1.1.
>
> Ernest Van Hoecke (2):
>   ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
>   ARM: dts: apalis/colibri-imx6: Add support for v1.2
>
>  arch/arm/boot/dts/nxp/imx/Makefile            |  9 +++
>  .../dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts | 11 ++++
>  .../nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts   | 11 ++++
>  .../nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts   | 11 ++++
>  .../dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  | 11 ++++
>  .../nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts   | 11 ++++
>  .../dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    | 11 ++++
>  .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts  | 11 ++++
>  .../nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts  | 11 ++++
>  .../dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   | 11 ++++
>  .../boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi | 57 +++++++++++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi |  1 -
>  .../dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi     | 57 +++++++++++++++++++
>  .../arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi |  1 -
>  14 files changed, 222 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.d=
ts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3=
.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2=
.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dt=
s
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2=
.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.=
1.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.=
2.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi
>
> --
> 2.43.0
>
