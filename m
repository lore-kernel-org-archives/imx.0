Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0403B39CCF9;
	Fri, 17 Jul 2026 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284834; cv=none; b=P0LasKyV9za5AAfXAsysC13BCFXLxbvpEA/az34JnusGdcZFF2z/nsaJ+6Yy6BsXEEo7X3LZlKAKomwfC+d4JrEh+0PEeUl3b4ZlZr8Mq/yW9RJLWYdKpwyPQv7l2vm/11GDn4r3YpeZlYSH0Cd3/foYN3fpo+Qptl+cfR0B7TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284834; c=relaxed/simple;
	bh=vEh8AyqeaR4/6a9EDVW4FLWHpyuzr8hiSJBxaiN+8RA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hrYqPWPUMAIGZs+fzcBzBxv8bkXdd3NAk9OhmFiRuBVpzKVXcb4LO0mTil3NA2V+BklhyboN95jBPWmWmoFZyt/8eisyfzpPEF13C+3KjAiI2JycsLB/lGALtdsFhRgQtUJCHcVObW4Je8TDM9xS4fCXURjczpSe/4yT+0kxJDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q04XtXi/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q04XtXi/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354AC1F000E9;
	Fri, 17 Jul 2026 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784284831;
	bh=kVWn+9PTiJdcHTS+KAn7U3hZ39CunVSAUXk1FcJvjmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q04XtXi/XX9W3K+KbmKcLAEqkbCrWkBuPx1axYvV7dwCGycuCPJgZ3EEkeOnUPxUW
	 v6MVlfxBykMaMoMKZoGD/7Dwy+3F7cup8CojjP6kpRdwflFfGQvXsbTt0nAQBwbe1a
	 hqWqhtwMSAhiWmTCHt8+m0qSjpjkh5oMazFk4EaY4IF4RT0LIKrdFfDEUN6HnknaCS
	 r/Sgr/MaMf/lavcgVxaAbn/xbs1Dt+eyFopnspG+vOGwMICmqan7+anFHqN5pyGIuV
	 w83Uc39jixfHJILPM2KJy2rKfn6HuZ/KM/gHkwIQvk8SkM5+1oqIN1EVTZSmXD5Xaq
	 Gw8xY7ViK4lZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX8 QuadMax
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <ad9656f3a07243b014340615e2be4aaefbe5eed4.1784284092.git.stefano.r@variscite.com>
References: <cover.1784284092.git.stefano.r@variscite.com>
 <ad9656f3a07243b014340615e2be4aaefbe5eed4.1784284092.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 10:40:30 +0000
Message-Id: <20260717104031.354AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing Cortex-A72 cores from the PMIC thermal cooling map.
--

--- Patch [2]: [PATCH v6 2/3] arm64: dts: freescale: Add support for Varisc=
ite VAR-SOM-MX8 QuadMax ---
commit 7c5c452bc5aa9e24a57d1f6d97a7c92202c04f7f
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax

This commit adds device tree support for the Variscite VAR-SOM-MX8 QuadMax
system on module. It defines basic hardware allocations including memory,
regulators, audio, and Ethernet, leaving carrier-specific interfaces disabl=
ed.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quad=
plus/var-som-mx8/

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-var-som.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi

[ ... ]

> +&thermal_zones {
> +	pmic-thermal {
> +		polling-delay-passive =3D <250>;
> +		polling-delay =3D <2000>;
> +		thermal-sensors =3D <&tsens IMX_SC_R_PMIC_0>;
> +		trips {
> +			pmic_alert0: trip0 {
> +				temperature =3D <110000>;
> +				hysteresis =3D <2000>;
> +				type =3D "passive";
> +			};
> +			pmic_crit0: trip1 {
> +				temperature =3D <125000>;
> +				hysteresis =3D <2000>;
> +				type =3D "critical";
> +			};
> +		};
> +		cooling-maps {
> +			map0 {
> +				trip =3D <&pmic_alert0>;
> +				cooling-device =3D <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

[Severity: High]
Are the Cortex-A72 cores intentionally omitted from this cooling map?

The i.MX8 QuadMax contains both Cortex-A53 and higher-power Cortex-A72 core=
s.
If the PMIC temperature reaches the 110=C2=B0C alert threshold, this passiv=
e cooling
map will throttle the A53 cores but leave the A72 cores unaffected.

Could an unprivileged workload heavily stressing the A72 cores cause the PM=
IC
to continue heating up until it hits the 125=C2=B0C critical trip point, re=
sulting
in a hard thermal shutdown? Should &A72_0 and &A72_1 be added to the
cooling-device list?

> +			};
> +		};
> +	};
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784284092.gi=
t.stefano.r@variscite.com?part=3D2
