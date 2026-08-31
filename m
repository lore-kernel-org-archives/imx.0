Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516A38237F;
	Mon, 31 Aug 2026 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159528; cv=none; b=Te5h/4VhgvkXdHt0PT1AChuGyuQl+LynxAsddixMsSPm/Gq+be+oUzrvlGeRwl2Eb59x8Dnpy9n4eQhb0TiKlcbep6IhSGqAlWt41+NxuoFPTa6GiN+N/vB+jtkj6CKE5QbSGzwNa8xwwnb5vIIfaKCxgk0UJqI+MQJdwfjAvzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159528; c=relaxed/simple;
	bh=TBl7K/x4TmN0WSkPrXtf6AimQMJ9B74KBA9WgqPxQNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mdSZpxsZClGngto8EzqXTs4PLHB0+gcSYq3F5Yi3wtgU6WleH4whYo+kFnzAYCqzgDTB5z9gN6Du9a+Ai5IjItKzxE+B+MYQFw3/BsH2Qpm8kYTZH8nQVCti4nN7+p6Vt3rlhwWM8xUp1rJk6Pffb39n96vEfNZcKKIV8CE1bio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+H0uTFc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+H0uTFc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5671F00A3D;
	Mon, 31 Aug 2026 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159525;
	bh=D4FtGUBov+4eeSgzI/7VXGiMXZsU2r9hbzQKr9Uevh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m+H0uTFc0vxI6jw+2XTA26KciWX4ucIykXwypQPSgOE/IqcyKXLRj4ckzI7+Wlk45
	 JVSnaNun6sRmZtUd3nTQMRlcikO9v0fAfyxW6F6RbSVaRY/qN/E1fSRlZ3mt7WD6i3
	 6wTHTiKlujHYUOxwOQHby+94nmsvlHNSYcCckp117m1c8YFBwOhHNLzc6laxODZoRx
	 7a5Nj4KooJXu0GE7xoj80YXNDBM2S5haq02Xt/IOp4mdGJlqKOkXinh9eCyyj9zvdH
	 E4u4bJLptdf4Xvrrwgfi2ySqzljJSFMjcy0UvwpZQYlxq8js0rSFSTGWAZw9+oL8YM
	 9QhIBO1yu8mBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v43 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260831-imx-se-if-v43-6-a3deadbda4ef@nxp.com>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
 <20260831-imx-se-if-v43-6-a3deadbda4ef@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 06:58:44 +0000
Message-Id: <20260831065844.9D5671F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing required 'memory-region' property causes dtbs_check warning=
s for boards not enabling the secure enclave.
--

commit 2106f9e7211e704a2695d4d64ea8d1fd6500e104
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. It defaults to disabled so that boards must explicitly
opt-in to provide the required memory-region.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index 777b89ed68490..ac8293f81c6b2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi

[ ... ]

> @@ -186,6 +186,14 @@ scmi_sensor: protocol@15 {
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

[Severity: Low]
Will adding the hsm0 node here without a memory-region property trigger a
dtbs_check warning for boards that do not enable it?

The commit message notes this is kept disabled to avoid imposing a
reserved-memory requirement on every board. However, the fsl,imx-se.yaml
dt-binding schema strictly requires the memory-region property unconditiona=
lly,
regardless of the node's status.=20

Because of this, any board including imx8ulp.dtsi that does not include
imx8ulp-firmware.dtsi (or otherwise define the memory-region) might fail
validation during dtbs_check.=20

Does the schema need to be relaxed to only require memory-region when
status is "okay", or is there a dummy region we should provide by default?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-imx-se-if-=
v43-0-a3deadbda4ef@nxp.com?part=3D6
