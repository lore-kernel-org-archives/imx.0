Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4436B4E1C9B;
	Tue, 13 Oct 2026 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890909; cv=none; b=GhLsZ5x0bb7j4DeBOsi/G8MRqr7kB1Zqa0o1rZ+YBiCnpo3mADgPzkhypLMrO4V6QabAudhq4cYtZduTkeLsHhuR7NtT7tUhm4Ia5bqHVrRNOoHWn1ZE+aOqts5ASBDVd3PWgKzBKOrMUi+hIdsBtC8xPc3s9PPxX1PkWMxlcFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890909; c=relaxed/simple;
	bh=YT2j3rMXfQKRzu0C/I1mhCfWHyyNnPBHAco/MA0D+gM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uZgPj9ZY24Fz3q4ASqyoz0ggU0kpG5X1TuPLOo/jlk0EHGxZGg7t8UgsFDbH9kGd8DliBdPgaGDeF49mKeBIjqGFgcc6jRHc9nMsDHMiS1zv5bJeh3GkGHJkQ2lWgxUSFeGiN+SRbzLi9XbK4Bj2KVsnyGy2pAgTHLfoyD9mJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CauCLRgU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CauCLRgU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AFF1F00893;
	Tue, 13 Oct 2026 11:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890907;
	bh=3ybyYvl0F0S32wJXobCO0Z3XITf0NOKl10Y+40XKg5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CauCLRgUb1xP+F6NRxTTNykahS+QEKV47yZCVc20g7cQ92GGXZpaqxzLgN/KaNKLS
	 VRQ4u97dY7zoeTz4Oisst5DMlWEQTM3O9/CJ8VLO9fmiIImQKJcLPuFpbKKFYDlmeK
	 mT54VJQki6NCCPEg9tLAK9mjSdUeqj6GJJcnz5UjAdMIV4znAfK3pOY6qDUgCvKeKl
	 dtQ580HNQAKnky91BITIxMWunU6FDY5d389bPTqxsWk3/RAzL3osbqYdgTINlmG6Jd
	 UjTC24ODg152hQsF/w3uORzfRoOedGHn8y6DBhHxgkzMjukYTeghCKn5Bpk2z3CRI/
	 P+BKnw5OwPByg==
Message-ID: <sashiko-outbox-169626@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: freescale: Add LVDS overlays for
 TQMa8Xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261013111737.998282-5-alexander.stein@ew.tq-group.com>
References: <20261013111737.998282-1-alexander.stein@ew.tq-group.com>
 <20261013111737.998282-5-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:28:27 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: unit address mismatch in dc0_pc channel@1 breaks LVDS1 hardwa=
re mapping
--

commit 9e71d1e0ae4bcdbdae19947de71699d2eb47af70
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

arm64: dts: freescale: Add LVDS overlays for TQMa8Xx

Add overlays for the supported LVDS display tianma tm070jvhg33 on both
LVDS0 and LVDS1 channels on connector X14 (+ control on X22).
The corresponding display controller PLL is configured with 10x the
pixelclock.

> diff --git a/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso =
b/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso
> new file mode 100644
> index 0000000000000..4a8ba61962725
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/mba8xx-lvds1-tm070jvhg33.dtso

[ ... ]

> +&dc0_pc {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	channel@1 {
> +		reg =3D <0>;

[Severity: High]
Does this reg value incorrectly map channel@1 to hardware index 0 instead o=
f 1?

It appears this overrides the channel@1 child node of &dc0_pc but explicitly
sets reg =3D <0>. This will incorrectly update hardware channel 0, overridi=
ng the
base device tree which expects channel 1, and will also trigger a DTC unit
address mismatch warning.

This can cause the LVDS1 display output to not function correctly because i=
ts
pixel combiner channel configuration is applied to channel 0 instead of
channel 1.

> +		status =3D "okay";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013111737.9982=
82-1-alexander.stein@ew.tq-group.com?part=3D4
