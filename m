Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993852;
	b=jkSOCqolAr+9CLt5QmHfQdOO2mWm+5J/SD7TElt3RS6u715kYtY1dfiWwzRUloIL9Qc6
	 mUTAMOlydNIi7dKdiE88MSFY6nUTbfX0WpKjx8cLAa8JzhYw0cqpS2CpdnniPlCm00HI3
	 VVbNrAIiR2ZbTocw8GOKKtPa/c3LN1N3oQ2aiieZUSggxkUYvlnEyre2hV1hO4/xJRHxG
	 vYhTSQBzvqvztHwyV7NhFEgwCOlnWY6iDMuZ+OhHbV0cWE1gMJygsNgB5OTaxPBi+nnyM
	 HdoyUQXuocIsaoGw7MXC4cLLrpeppXjbx5Oq+j2lTM7/DdNBfT1SfcrjHHWbf+xF+BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993852;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eiSAmxoY+0yCXI1tj3V4CagndGnn2ZclLqZ3nXlza9Y=;
	b=T3ZrLzYNBW+nqZ6Ae8IkAOUFmJo1DvfVHKXhgWhFhafv1IEdtgCyxU1WvlUXUMdhC5k1
	 BMrMmZGUGX6VITPgLUxvYdc+n40/yII1GFzEW1FZNkGgq6bMt64JCyQHMRn8wfq5YklN6
	 42trYM45iFdA4PztlUwwqxh7NRu8uTMGuqJzMHY0Ic2xh2jjoJAw17jKrB5QeuVFNSNNh
	 N4iDxo2RRTZQ/kciNDeOAQztfl5N3zahP83Y7J4rOZlxvBb3yviXa5lLOu2kv7DxMB6ju
	 ABfLlBVhQUR8VPqO/25vaojfJkC4krfFDEy6G06DjVgPkkr8ieTOojNI96wN/BhTd9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZM6a7oN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E46606A320;
	Wed, 18 Nov 2026 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZM6a7oN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535991F000C4;
	Wed, 18 Nov 2026 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993852;
	bh=eiSAmxoY+0yCXI1tj3V4CagndGnn2ZclLqZ3nXlza9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WZM6a7oNeU2yL2csC0WaK07tTLjNyRcxxQ7F6K+XkklQ054zIn+UBci6Xyv/HLhBy
	 SVl1MrFzEG82gDoS9x5VpmI/3a6ZV12tkKOk36PUYLjKnmSFiTogOhhec3rZiYVTTo
	 LWMyEHRYvO5Y0cEQoPfRQC4rD4fFTkGiQFBc4lGNxgJZZ2JPsSyKPZSf3N2CHbYuSX
	 NmoVR+RhMXDJDYjsHHY4YOs9FdNX5eauES41VynUMnU1+ygtlVAEpbHCNo/vHRWU7V
	 ZJgbHua7uw0vXeR8b2zTlU2yTULOkTkCQo4xUHJBk2TjkAJuKanZvIUoLQGUnYTA/1
	 VDoUcj+m7xfGA==
Message-ID: <sashiko-outbox-220551@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261118090914.38082-3-petko.manolov@konsulko.com>
References: <20261118090914.38082-1-petko.manolov@konsulko.com>
 <20261118090914.38082-3-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:24:11 +0000
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
- [Low] ARM: dts: imx: undocumented draeger vendor prefix in M48 board
  compatibles
--

commit 4a3279abe9868d1f357238a507cb14a2a1c89b59
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: nxp: imx: Add devicetree files for M48

This commit adds devicetree files for the i.MX6 DualLite and i.MX6 Quad
variants of the Draeger M48 board.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6dl-draeger-m48.dts
> new file mode 100644
> index 0000000000000..b0bc9a67f5b34
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
> @@ -0,0 +1,16 @@
[ ... ]
> +/ {
> +	model =3D "Draeger M48 i.MX6 DualLite";
> +	compatible =3D "draeger,imx6dl-m48", "fsl,imx6dl";
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts b/arch/arm/b=
oot/dts/nxp/imx/imx6q-draeger-m48.dts
> new file mode 100644
> index 0000000000000..ff9c337e93fbf
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
> @@ -0,0 +1,16 @@
[ ... ]
> +/ {
> +	model =3D "Draeger M48 i.MX6 Quad";
> +	compatible =3D "draeger,imx6q-m48", "fsl,imx6q";
> +};

[Severity: Low]
Should the "draeger" vendor prefix be documented in
Documentation/devicetree/bindings/vendor-prefixes.yaml?  Without an entry
for "^draeger,.*", scripts/checkpatch.pl and devicetree schema validation
report an undocumented vendor prefix warning for "draeger,imx6dl-m48" and
"draeger,imx6q-m48".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118090914.3808=
2-1-petko.manolov@konsulko.com?part=3D2
