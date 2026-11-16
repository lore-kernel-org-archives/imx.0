Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841633;
	b=SwX/bH1GrP1F2d7sL+I7CwH0DZPdIbEwUiheXEoxFyPRX/xQPY8uaJlc8bMihP+2bTBI
	 Jxh/fQJePqMvsG7qdxrtxUduQNh6BGnk8GloooJKUxNHyJOy8EWo1YSFqPcNzsPO46eKj
	 MmrxC+fDeNImVnzat9jT3ZjXiy6Wu1PxsG7NxLmAtglHn5VuVwbpDWhy8p6IYpZBFBu1R
	 futIjNonP5vuZE/RlbKoF534R3p9DWetBu7Jz2LojLCmKeDcRr05ibrd0VQkC5Vu/MNph
	 1o3IMNVy2zUQjSkMITn0Xv/FPp3F3htsV/xncFxb3yx8DNkggYppIOrv+/egq0bD1ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841633;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=B6OrgtY3FqXGsa/CVyV+Da2A6C6jjew6gnRb5d5Xjvw=;
	b=IP/QshAGQqMIBvY2IMNZS4HyWCE26P3GE6KWFrwZcx808HdlahszZMe3Upa1nzaQnN60
	 3a3ChBia/BiUvFANFaRs7/JO2BuaeLsIelydkt0kZveH2o2aL0V3wNb9ifOGZiy+oMtC3
	 0zCAvuBH+8JJxirGVl+huw1gV8vFdBYIn6Cg3Y+1OrfXqzG/pFEqrnuBeiZx1+G7eYrfX
	 R8N3P+9S3vZ2rS2s8heB6yoMFLMdLW2iIk8zND3DiRtUjKPpR+8Jhmpa7Bk/5gpUrWrQD
	 3/ijubB0v0XW9f2O5sLUrQ0J31dGhICaCNsJotRh23dWQuJcLHZsaUDxh3SgBqYc2DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBVsAuRJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3419A606A323;
	Mon, 16 Nov 2026 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBVsAuRJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFA01F000C4;
	Mon, 16 Nov 2026 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794841632;
	bh=B6OrgtY3FqXGsa/CVyV+Da2A6C6jjew6gnRb5d5Xjvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aBVsAuRJ2vGQGnanpFW5LcIvJSPyZ+WiTGyJs6AXs6MP42NSOq/PsrUKYPMNvbEWD
	 9+y+FpCsuzDu/X9T6sw48B+lmBCbGjTiarnczNPc6jxFu8zdKlR637qFGTXYlh3++v
	 EqzI0R1GNgR66oXpRR1a6iVB+k4oDkqXR+q9alP2Zx2+dZ5+WfFfLNLbbWqU2nCXCC
	 ikZT7QBkJnwqzocBPs/ESZl1e5KRLN3MZdH3yU9OIyNVm9jnbgAA9bhMKkdG23Cugr
	 jFBcXHiRl7wIVdTU73WOVnmv2V16wtVWfAt73YS3p4CF9xh0jEcvgaP+lO5LgDwnet
	 7d88n4qZNylwQ==
Message-ID: <sashiko-outbox-217223@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp-skov: fix input supply properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roland Hieber" <rhi@pengutronix.de>, =?utf-8?b?b3BlbiBsaXN0Ok9QRU4g?=
 =?utf-8?b?RklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>,
 =?utf-8?b?b3BlbiBsaXN0OkFSTS9GUkVFU0NBTEUgSU1YIC8gTVhDIC8gTEFZRVJTQ0FQ?=
 =?utf-8?b?RSBBUk0gQVJDSElULi4u?= <imx@lists.linux.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261116145823.3018840-1-rhi@pengutronix.de>
References: <20261116145823.3018840-1-rhi@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:07:12 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: imx8mp-skov: missing Fixes trailer on PMIC supply
  fix
--

commit dab9e66c18c2737f269617a98e59a193266cb200
Author: Roland Hieber <rhi@pengutronix.de>

> arm64: dts: imx8mp-skov: fix input supply properties
>
> The nxp,pca9450c node used the non-standard 'vin-supply' binding until no=
w.
> Upstream commit 4c33cef58965eb655a0a ("regulator: pca9450: link regulator
> inputs to supply groups") added support for 'in*-supply' bindings, so move
> to this standardized binding to fix errors on boot:
>
>   nxp-pca9450 0-0025: Failed to create device link (0x180) with supplier
>     regulator-5v-p for
>     /soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators/LDO1
>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Roland Hieber <rhi@pengutronix.de>

[Severity: Low]
Since this fixes invalid per-regulator vin-supply properties and boot-time
device link errors, should this include a Fixes tag (with 4c33cef58965
("regulator: pca9450: link regulator inputs to supply groups") as a
prerequisite):

  Fixes: 6d382d51d979 ("arm64: dts: freescale: Add SKOV IMX8MP CPU revB boa=
rd")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116145823.3018=
840-1-rhi@pengutronix.de?part=3D1
