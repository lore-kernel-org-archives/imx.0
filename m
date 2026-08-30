Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31C83B4EA9;
	Sun, 30 Aug 2026 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106243; cv=none; b=ePnbkHo4xpHUTcal7vVzGjtPnmBjigQB8MRbW8XKnZA9J7EKAEgGJjDM3K5uK7tSIaIC6zB12tzvIfr4LSlZeb3SdCqF9rMkTupik2PNKZD5rQErfzW0iC76QU0hyguy/2Qwz71mz7k+u1eNO8B8nlB5maoTAEYotCD+xgErsbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106243; c=relaxed/simple;
	bh=AOCSfDHFJkwwio65699bwbWLdJL9wpy3q6s4S2lvi80=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JwmhPHLyTHXCn3w/BbEyYm9UTHhb1ElDU/gDh2+uT0d7dwjr3+4I+Psm3KhyuWmYBRMBsgU58Hvfclvrx/ogHWtfm4N9QUbB62bckhXevDh1sclMGpYSLnGK5UmkBD878RU1kDqYtsN2zM3c+dgFhtZLKOb5bwJX39xzbU/gqbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlBQc+85; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlBQc+85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1481F000E9;
	Sun, 30 Aug 2026 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788106239;
	bh=DnUSZ4ZdPTC6GHR1xfHCrFF6jHtSoai1BHNry0GJREM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OlBQc+85cKqLfHELsQU8XEgBepQ2/YyL9D80e1pAGhEwTX3ULfyiGFP3IHRpyRI/L
	 GnKiouiP9IJOdJwUxnqLw5n4Kv9W4zXrtVMBiX30jLoqtQIlEigWgfXL8hKcuHUd6c
	 YyFnn5SziUwcI/aWvHmY2mbyUCiHDUEIIpPJiRabqaP7fTDtMZLsguu76wBg+YIB7W
	 IXUTGz2Ckxd0XqONdOyiDoD5VbVCIbuq9An6n90uZQ+H+5+EYM1hLyef3l7CFg5jW3
	 +RlQe+NTFxHIwtLdNPQhYt3S3sO1CQU6W+ozr3irLaNBCIH6uyVrbj12hpg9DfFaV2
	 +CH8cHSctP2yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: imx8mq-librem5: Correct link
 frequency list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260830160025.211384-6-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
 <20260830160025.211384-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 16:10:39 +0000
Message-Id: <20260830161039.7C1481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] DT ABI Breakage: Removing existing link frequencies from the D=
T breaks backwards compatibility with older kernel drivers.
--

commit e1f0f3ee9bb107c23572fda8db68e68a5ce30d59
Author: Pengyu Luo <mitltlatltl@gmail.com>

arm64: dts: imx8mq-librem5: Correct link frequency list

This commit corrects the link frequency list for the hi846 camera in the
imx8mq-librem5 device tree to match calculations from the datasheet.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mq-librem5.dtsi
> index f5d529c5baf3e..cc5604172192c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -1122,7 +1122,7 @@ port {
>  			camera1_ep: endpoint {
>  				data-lanes =3D <1 2>;
>  				link-frequencies =3D /bits/ 64
> -					<80000000 200000000 300000000>;
> +					<187500000 375000000>;

[Severity: Critical]
Does removing the existing link frequencies here break backwards compatibil=
ity
with older kernels?

When an older kernel boots with this updated device tree, the hi846 driver
invokes hi846_parse_dt() and hi846_check_link_freqs(), which iterates throu=
gh
its array of expected hardcoded frequencies (80000000 and 200000000) and
ensures each one is present in the DT.

Because this removes those legacy frequencies entirely instead of appending=
 to
them, it appears the loop will fail to find a match and return -EINVAL, cau=
sing
the camera initialization to fail on older kernels (DT ABI breakage).

>  				remote-endpoint =3D <&mipi1_sensor_ep>;
>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830160025.2113=
84-1-mitltlatltl@gmail.com?part=3D5
