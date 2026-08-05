Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A93E5A18;
	Wed,  5 Aug 2026 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916941; cv=none; b=UgSpL+yJUs7Iv8Phw6LPk23JXOOSAhAeMvKhOeAcVUOoemT5l4lqcEE8oZGZqdilIKd4UVCOJBvu+qoQmWbWAXiCRbJodhyaNQyqCoi85AqOmtoTPWrlRk3aFgXW83LidaBR6Rjlflh24ydSzWUxZQkAOJnTrWSJsQ3MteabVZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916941; c=relaxed/simple;
	bh=C0k8nUNIRw4/3PoE2W0aySyjvDoWX9Yc2MyrvV1sdPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jDm7JbM8Dx/ypYoDxZNgFu0IQxoVlwdy87PCubEE45iLMXRhZwHMK3Ee9AnKMcsP4W+7niD5DRWQ9jIezzgQP2EdPLqZPUXCLGUdmgj2w491fnlcrzu014YDJv6IeyP21w0nJ8uZ2nn3FRJR3EsPsO+R+/CRDmqUrkIB1P6C1I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGLryr5W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGLryr5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518B11F000E9;
	Wed,  5 Aug 2026 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785916940;
	bh=JC65InYj8KbV2CrHmnR4m698DeAn/dF6O3JG3/Acri8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TGLryr5W/Q/JR4AgSJz9/RoQJDiNTVL59NXQqvxvTP1uUmsX/9Tr1CBFTvTrX+/ss
	 gVTobmyCvqJ9zgQHHou1yBsi1fxqZEzhOPzeDRWphlJgnAncW2Zza90uv1xJeW9B51
	 Lr2rleoQ7xrQe2pS6Y76Mqcfp1fUdJRcL3FUDJL8NQ0Q65pc1OznI/iSLwnaYAVBT+
	 jjA6gS0o3OQW04WXN5QuUZF7iDmMpxjbq1Odx2GJSSohF0mgbjhaMFwhEZ43Prb8Vr
	 M53/6uthWpQfV6a/Z/RjaaZqDln6/1aI54tHOQXDPfJqybpJ/rt820L5WddsJYSEq/
	 FLRm1jAmjVUOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v33 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260805-imx-se-if-v33-6-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
 <20260805-imx-se-if-v33-6-212e32ff0295@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:02:18 +0000
Message-Id: <20260805080219.518B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit message instructs boards to include `imx8ulp-firmware=
.dtsi` to provide the `memory-region` and enable the secure enclave, but th=
is file is completely missing from the patch series and source tree.
- [Low] The newly added `hsm0: secure-enclave` node lacks the `memory-regio=
n` property, which will cause `dtbs_check` validation errors for all boards=
 that include this SoC dtsi but do not explicitly provide it.
--

--- Patch [6]: [PATCH v33 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 16318bc9e2bce734d6b1cf3cd835e37f3629b093
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. The node is kept disabled by default to avoid imposing
reserved-memory requirements on all boards.

> Keep the node disabled in the SoC dtsi so it does not impose a
> reserved-memory requirement on every board. Boards enable the enclave and
> provide its memory-region by including imx8ulp-firmware.dtsi.

[Severity: Medium]
The commit message states that boards should include imx8ulp-firmware.dtsi
to provide the memory-region and enable the enclave, but is this file
missing from the patch series and the source tree?

It doesn't seem to be present, which might prevent boards from actually
following this procedure to enable the enclave.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index c6d1bb9edf388..38233dd74ee33 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi

[ ... ]

> @@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells =3D <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			compatible =3D "fsl,imx8ulp-se-ele-hsm";
> +			mbox-names =3D "tx", "rx";
> +			mboxes =3D <&s4muap 0 0>, <&s4muap 1 0>;
> +			sram =3D <&sram0>;
> +			status =3D "disabled";
> +		};
>  	};
> =20
>  	cm33: remoteproc-cm33 {

[Severity: Low]
Will this incomplete hsm0 node trigger dtbs_check validation errors?

The fsl,imx-se.yaml schema strictly requires a memory-region property for
the fsl,imx8ulp-se-ele-hsm compatible.

Since dt-validate evaluates all nodes, including those with
status =3D "disabled", it appears any board including imx8ulp.dtsi that does
not explicitly supply a memory-region for this node will fail schema
validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v33-0-212e32ff0295@nxp.com?part=3D6
