Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633950;
	b=ZVWuphSv6DAx2IbVvQQt9a4/QQWIhuh/01u/7CuN5COTnUc4bKR2IFQbqYH4R4OoAFOK
	 9NzxeFFnIbGRZgkL5oDTRefBqK3k9z4X6uiDCd7vfdxCf7/77c7VG5LiHJ8j1EpVm6kzp
	 KUeBqu1YBZthPFf7mQaKuVJjRpkr+AyygPaJZS6sNjBpr1oVfmetdF7v6PM6PX1AD1EuD
	 /pq8i4UhWvBXAV0c6RAP2wICk/CRlP56X8jq+bVS43G0bOcIljFwkXXH0/w2zPc3hXMZh
	 TCI7Fu4j8Y85CxBSrGtlmlX70vX2Ioa18t14kX1AbDpMyMWXj9xpVT1uX4QzX+X7KGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633950;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oEcX+xyBg4GgjpTEgn1K1AuPa9iDoTD61o0p3gixXks=;
	b=ov42wDamPu71JNDoWznk+fbunvsGFemmrKDo3Vk73V57CZDDxBJ94ijZ5T7nUKoirqF9
	 ijU0t4lk42tDFGI8+KQcidgR5NQg7yRvBRB3vwASbleemrUfWuuFdRSXU8aDZJmkMwI/1
	 KfjVRVpnqENmNJmVhX9Lh6wuC1dws08XYct1csBL28A7vM9mpqEzlUX9RDbXQTfdCFuIv
	 phhPRFGF5zE4NqbcBAeKHjReKw3tV7E7KaNkq0ptCHbM/XyGjMEOmviXpXF21bAzQp6RR
	 kI0rvsv+Bh0ZqtzjszcqHx+ul5LfegNkppNjiR56xnAC0q2QNEIC19XmyFwmVzfpBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMjWC6BW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC2D606A319;
	Thu, 22 Oct 2026 01:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMjWC6BW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4A21F000C1;
	Thu, 22 Oct 2026 01:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792633949;
	bh=oEcX+xyBg4GgjpTEgn1K1AuPa9iDoTD61o0p3gixXks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMjWC6BWuSytCeicB/WU3s9f01UzKTKuS66IjwVEsAMCVOg/F9JSp7DVS5jlyGOTx
	 ffojMVW6BOqaJISDCKy/oQd8e11BNYjQoDbAzEhYbWCxH5V2mbkBVFgnqiD/PkyVL3
	 xndSl3aUadJ2I6uzEHFfn6KguAvXRrtQPSAAnTfkgn5105kGpW5zP/CsS3Lm58Yp78
	 Fl35AicX6/iH3ZjBy0Ziue7iXbYO7r9KG8hMC97ssLOkJuOoI4muKNGmMZHJKD9Zeo
	 SYuYXp/fa1ekVrOyVkbPLv1Y2SZdxJTCn2W8EbAG+dH0SX1ICmdCwzHh0RCxWnA63l
	 sCEqV3heoL+tg==
Message-ID: <sashiko-outbox-180849@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm-tqma8qm: Re-enable A72 cluster
 after ERR050104 workaround
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261022-8qm-v1-2-2a597cb3debd@nxp.com>
References: <20261022-8qm-v1-0-2a597cb3debd@nxp.com>
 <20261022-8qm-v1-2-2a597cb3debd@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 01:52:28 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: imx8qm-tqma8qm: missing cpu1-thermal restore for A72 c=
luster
--

commit 187cd9d157965a8b6ed40b9b4b40d998a0f0385a
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8qm-tqma8qm: Re-enable A72 cluster after ERR050104 workaround

This commit removes the /delete-node/ directives for cpu-map, cpu@100, and
cpu@101 in imx8qm-tqma8qm.dtsi to re-enable the Cortex-A72 cluster now that
the ERR050104 workaround has been merged.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> index f0e398eb2aad7..8cd6e75eb87a9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
> @@ -15,13 +15,6 @@ / {
>  	model =3D "TQ-Systems i.MX8QM TQMa8QM";
>  	compatible =3D "tq,imx8qm-tqma8qm", "fsl,imx8qm";
> =20
> -	/* Due to missing workaround for ERR050104 */
> -	cpus {
> -		/delete-node/ cpu-map;
> -		/delete-node/ cpu@100;
> -		/delete-node/ cpu@101;
> -	};
> -

[Severity: High]
When commit 5d20f1ccb3393a ("arm64: dts: imx8qm-tqma8qm-mba8x: Disable
Cortex-A72 cluster") disabled cpu@100 and cpu@101 due to the missing
ERR050104 workaround, it also removed the thermal management configuration
for the Cortex-A72 cluster.

In arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi, thermal_zones still
deletes cpu1-thermal and omits A72_0 and A72_1 from the pmic0-thermal
cooling-maps:

&thermal_zones {
	/delete-node/ cpu1-thermal;

	pmic0-thermal {
		...
		cooling-maps {
			map0 {
				trip =3D <&pmic_alert0>;
				cooling-device =3D
					<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
					<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
					<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
					<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
			};
		};
	};
};

Deleting cpu1-thermal also leaves the cpu_alert1 and cpu_crit1 trip point
overrides in arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi unused:

&cpu_alert1 {
	temperature =3D <95000>;
};

&cpu_crit1 {
	temperature =3D <100000>;
};

In addition, commit 5d20f1ccb3393a removed the cpu1-thermal active trip
points and fan0 cooling-maps from thermal-zones in
arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts.

Unlike companion commit 72b6162dd6e2 ("arm64: dts: imx8qm-mek: Re-enable A72
cluster after ERR050104 workaround"), which removed /delete-node/
cpu1-thermal alongside the /cpus deletions, booting a board using
imx8qm-tqma8qm.dtsi (such as imx8qm-tqma8qm-mba8x.dts) with this change
brings cpu@100 and cpu@101 online without cpu1-thermal (monitoring
IMX_SC_R_A72), leaving the A72 cluster without passive cpufreq throttling at
95 C, thermal shutdown at 100 C, pmic0-thermal alert throttling, or active
fan cooling under sustained load.

Should commit 5d20f1ccb3393a be reverted completely so that cpu1-thermal and
the A72 cooling maps are restored together with the Cortex-A72 CPU nodes?

>  	memory@80000000 {
>  		device_type =3D "memory";
>  		/*

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-8qm-v1-0-2=
a597cb3debd@nxp.com?part=3D2
