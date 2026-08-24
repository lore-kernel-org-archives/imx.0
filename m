Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F463769F9;
	Mon, 24 Aug 2026 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787539378; cv=none; b=Wjj/uWFkS7ccUC+YYUDMO+OcEayuuuyvxTg3jmwcp3WiPAdLOqgBkoR300599awMwrnJMOqnKFCmM2H1JyepC/URBYha21uxy5FOLeNyCY8FTTT5urHiHnnDOghTCw66B9pbRydPE8sYBLWZ1yPdefNn2bAExN1T+bx9SYyK/WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787539378; c=relaxed/simple;
	bh=ZkCCJ24pwCFBSzn/XX4R16/HBiYgHZ3wXppgXaFr6rc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=efmteeVdQqieZHFZm3Abd0JfoZX9FstsB0N4yVfKsPwQX63uZzFT2lxJToMaRJCv5qPC5EYdMhOl2uEsEnTxPgFwIHzwdzkus7E4jlQh4sjXEPkyQvzF4WPKawDCJ0DPDyp0RgH/FDnwW5XR41x4tzt61CA9K2Dzv6jw++NU2lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSkXxiRX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSkXxiRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3E91F000E9;
	Mon, 24 Aug 2026 02:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787539372;
	bh=sD8DOPhmGdq9TOzzHyx3XSMEdDAdzpX6enxF2TJVICE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mSkXxiRXJHWxLCHhkq1nRN2lLQTJKJosf0hTTBojgg1Q1ts4yhH4Rlg0KrRdRV7NR
	 uTaQkAvREF1qfsfKdA0qXimGrDJPGJ3ghp7xsWM/jAQSqxUEESBzKCxQjFCqY/EoBC
	 vDVbojTIIVQUXN9JVhZPGH/WWnyAwFN3M1Ay6QxTV/kZnMIO0MRf9GWVMwF4CkTD49
	 +2ukbceA0iw/nlHpNZ17GPTwVIptjKW7+x+TdKqEt2O0GWMcheBwf83PytkRzG9qly
	 Mym4B8H3+HYXIy0iDPkPs19Kjg1uPLFtr8JMhc8YB252PiPulXurzi8SjPP4LSDGW0
	 Mbqy3mEi56X8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/17] arm64: dts: fsl: Add DT overlay to build MQS1
 sound cards on i.MX9 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260824022020.2812810-18-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
 <20260824022020.2812810-18-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 02:42:51 +0000
Message-Id: <20260824024252.1A3E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The device tree overlay defines audio DAPM routing referencing non=
-existent source widgets `MQS_L` and `MQS_R`, which will cause the sound ca=
rd probe to fail with `-ENODEV`.
--

--- Patch [17]: [PATCH v3 17/17] arm64: dts: fsl: Add DT overlay to build M=
QS1 sound cards on i.MX9 platforms ---
commit 16b11b202a8f8c0d5f524ed9bbec5f9b49d2926e
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: fsl: Add DT overlay to build MQS1 sound cards on i.MX9 platforms

This commit adds a common DT overlay to support MQS sound cards on i.MX9
platforms. It routes SAI1 to MQS1, disables conflicting devices, and attach=
es
a board amplifier via DAPM routing.

> diff --git a/arch/arm64/boot/dts/freescale/imx9-mqs.dtso b/arch/arm64/boo=
t/dts/freescale/imx9-mqs.dtso
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx9-mqs.dtso
[ ... ]
> +&{/} {
> +	sound-mqs {
> +		compatible =3D "audio-graph-card2";
> +		aux-devs =3D <&amp_mqs1>;
> +		label =3D "mqs-audio";
> +		links =3D <&sai1_port1>;
> +		routing =3D "MQS AMP INL", "MQS_L",
> +			  "MQS AMP INR", "MQS_R";

[Severity: High]
Will this cause the sound card probe to fail with -ENODEV?

Looking at the MQS codec driver (sound/soc/fsl/fsl_mqs.c), it only registers
a playback DAI with .stream_name =3D "Playback" and doesn't appear to define
.dapm_widgets exporting "MQS_L" or "MQS_R".=20

Since the sound-mqs node lacks a widgets property to manually instantiate t=
hem
(e.g., widgets =3D "Line", "MQS_L", ...), won't snd_soc_dapm_add_route() fa=
il
to find these source widgets and abort the initialization of the sound card?

> +	};
> +};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824022020.2812=
810-1-chancel.liu@oss.nxp.com?part=3D17
