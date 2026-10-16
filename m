Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AB130D3FD;
	Fri, 16 Oct 2026 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140595; cv=none; b=f2k+0kZz2vW6fAd5mvw+8tf5JfU7X2TU0RXxtpGys2LxGFJuDKKh1qEi3XIRrXxGnVANMwWWBsXhrr6AoJ3Sebr+QLI6OJRtUfYL3ecksNgD5437ieSndZL/3az1g0LMq+cUqyW6fjDyF1eh7+FeI5ILhYY7qLpAbK3rC4c/lG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140595; c=relaxed/simple;
	bh=doY9dwU4kk/9HxCcoeI75NguQ7tfDFvYNcEhN0YGXVQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tAT5Jh03ZKHyGA9/8X8Nk8gET7jaael9WlwOvwX9nm6dpk2rwHbPqjAm1tcIVweiuFngSj7QDKKtH3qVFWXV4REkSzvtDfvsbBGUKrvct5B6ZQ49v/Y7z4T2nvHUFA1tmj10/CUwMSVURPPB4HbnTmDDho/CKw63wwh4OCeD0CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKhZfJvF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKhZfJvF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4461F000C4;
	Fri, 16 Oct 2026 08:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792140593;
	bh=43vEFq0+LmPvjuAkTMbcMsHEZp8P1hA8nPOWKPhbDXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NKhZfJvFj8DTSh9bfJCMo6yMsc0CtTrZ8bbf5uFlAhFm5HlZKJptaGUNkCbB9VLFs
	 WZe6o933Os8XaRRpXCyOnJ3X5qPKDXT9RdffhHJ4pGzF2S20BENU6Feirmh0iN8QB2
	 wzmwOKKJelbizoOKuytBujXJSmVvWdEoHDCxAb1Hku0VzytV9ChaE7F1Crc4V4Kzxe
	 HMjV4ehZT9YaZBbGKiZsZwHD+S+cbZg4n59TEqpCEGe4nYObLCQlyhWzcGEiA5Sxq4
	 1Kl7Tkxq42Ffd0dPWaT50kbwIWlu2/AY87anGiFL3+AzklLd1qSRbV2ZF4gQSL6btt
	 nb9TKVN7JYacw==
Message-ID: <sashiko-outbox-174034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC
 input
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <5309337578f99886c804c8e4ee82643574f1c19c.1792139809.git.stefano.r@variscite.com>
References: <cover.1792139809.git.stefano.r@variscite.com>
 <5309337578f99886c804c8e4ee82643574f1c19c.1792139809.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 08:49:52 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: dt: imx8mm: stale DMIC audio routing to Microphone Jack
--

commit 9bda3c8c55088e18eaa9e764f1a00912ea93534f
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC input

The digital microphone data line is connected to the WM8904 IN1L pin,
but this connection is not described in the device tree. Configure
IN1L as DMICDAT1 to enable the digital microphone capture path.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8mm-var-dart.dtsi
> index c5f0e22f549b4..183b4f7af009f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> @@ -300,6 +300,8 @@ wm8904: audio-codec@1a {
>  				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
>  		/* GPIO1 =3D DMIC_CLK, don't touch others */
>  		wlf,gpio-cfg =3D <0x0018>, <0xffff>, <0xffff>, <0xffff>;
> +		/* DMIC is connected to IN1L */
> +		wlf,in1l-as-dmicdat1;

[Severity: Medium]
Does this patch also need to update the simple-audio-card,routing array in
the sound-wm8904 node?

Currently, the routing in arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
still maps IN1L to "Microphone Jack":

	sound-wm8904 {
		...
		simple-audio-card,routing =3D
			...
			"IN1L", "Microphone Jack",
			"IN1R", "Microphone Jack";
		...
	}

Exposing an onboard digital microphone (DMIC) as a "Microphone Jack" causes
semantic confusion in ALSA userspace. Audio routing daemons like PulseAudio
and PipeWire use widget names to distinguish between built-in microphones a=
nd
external pluggable headsets.

Leaving the newly configured digital IN1L input tied to an external analog
jack breaks userspace jack detection logic and presents incorrect routing
options.

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792139809.gi=
t.stefano.r@variscite.com?part=3D1
