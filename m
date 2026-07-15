Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBE344684E;
	Wed, 15 Jul 2026 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119666; cv=none; b=ZJp2nJHrnJSqXXOTz8lpkIDFt4I6iWtrP+qMCjj2SDfJNgsLrLyFmZCddq1GeUSIoXqRU7OAD75ZURbkGWkNKGteamWYJESsiL7OXlYfRtpzee5AR5WOMHpmdKqka/AjGQVqhek7ATwDrMayfdEZjETp4NNj8LpmWrUlQ2hei6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119666; c=relaxed/simple;
	bh=cQ9mQvh7YP+Wnwjp497SR/Mp93YUZKMOLnuJJaGXmD8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=snIqgsbTfDLTkhASmOQNwqEr7PVIfKFcjdIiI/MX1o/o0CT4QZkafRAtR0Rg5AuuUrQzsG3BtMncfC8sa2R34Cx5SwvOnvSdC9rzrlWOxdwHnW17PgyKNGPyDDlZtph/DTVoajM0K+dlY6GNHkgr6VAvgF+bBiumGK2eLuaNql8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZ2zqxFK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZ2zqxFK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE9A1F00A3A;
	Wed, 15 Jul 2026 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784119657;
	bh=xqJsK72rDewTHZjEJfIIgiujNKx9bI1w9ceKWEDkJ5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZ2zqxFKGGdqzRMMNstI9T+vfQbe+dhoeyVL1Cv0jbvLpEaogXcw7SF+TLdBmIfJg
	 IRRCpxsS5Ybv6wwrQXiKkO69Wm6fZU9d3QdHK8Y2HKdoLLbJQW/RkJjxWg6Egj6ps0
	 ASmXargqqenSFqqw7q2y+pX+mTsBRAi99hjesYDMQhFm501lzXs22HvVYiK2o5PC4/
	 G6IHnnTcpUn6ZAcOGfcG6TZf+GajjNIaZzea5l6+hYz6VOGuxploLXWKadwRvoolCs
	 RSBNZhQ4Xe+vbhrtT+ifhJqHyL5fWXW7C7zwAWAjHri4eM+6AiwWRsrmBK5qLLn4D5
	 kCX2SHDMz+HhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/9] arm64: dts: imx8ulp: Correct SRAM node address and
 size to cover full SSRAM P2
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-imx8ulp-dts-v1-3-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
 <20260715-imx8ulp-dts-v1-3-19651358b599@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:47:36 +0000
Message-Id: <20260715124736.CDE9A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `ranges` property of the `sram` node and the `scmi_buf` chil=
d node were not updated to match the newly expanded SRAM `reg` region.
--

--- Patch [3]: [PATCH 3/9] arm64: dts: imx8ulp: Correct SRAM node address a=
nd size to cover full SSRAM P2 ---
commit e7f90a5991db01135d232289fb75ec4528de4fca
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8ulp: Correct SRAM node address and size to cover full SSRAM=
 P2
   =20
The SSRAM P2 partition starts at 0x22010000 with a size of 64 KB.
The previous node only mapped the last 4 KB (0x2201f000, 0x1000) which
was used for the SCMI shared memory buffer. Update the base address and
size to cover the full P2 region so it can also serve as a general
purpose SRAM pool.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -154,9 +154,9 @@ sosc: clock-sosc {
>  		#clock-cells =3D <0>;
>  	};
> =20
> -	sram@2201f000 {
> +	sram@22010000 {
>  		compatible =3D "mmio-sram";
> -		reg =3D <0x0 0x2201f000 0x0 0x1000>;
> +		reg =3D <0x0 0x22010000 0x0 0x10000>;
> =20
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
>  		ranges =3D <0 0x0 0x2201f000 0x1000>;
> =20
>  		scmi_buf: scmi-sram-section@0 {
>  			compatible =3D "arm,scmi-shmem";
>  			reg =3D <0x0 0x400>;
>  		};

[Severity: Medium]
Since the reg property was expanded to cover the full 64KB region starting
at 0x22010000, should the ranges property and the scmi_buf node also be
updated to match?

Right now, ranges still only maps the last 4KB (0x2201f000). Any new child
nodes attempting to use the lower 60KB (0x22010000 to 0x2201efff) as a
general-purpose pool will fail to resolve their addresses.

Also, if ranges is updated to map from the new 0x22010000 base, wouldn't
the scmi_buf child node offset need to be updated to 0xf000 to maintain
its previous absolute address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx8ulp-dt=
s-v1-0-19651358b599@nxp.com?part=3D3
