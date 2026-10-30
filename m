Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344639;
	b=BhcQPT/TeQh4NbALjH+XeVzc1lSodIZ6646U7Vz6/0omQOYuK28niRYU/5+wM5bTN+Ru
	 /ILNmrVrG3OahcCKGK7aZQ1JQjPT9yE8z7C3Hko49rvNfSBSsaJsDLV6jhS57JB/hP1Di
	 ZvBacH/g6WKn8k5w+3Gz7LOzTYSm0YOVRDhlE301STxBWzJHpu7tyPvgHZVhF17HsumES
	 hTuq5BGoOqrKZTk9KriXT9TP2AEt4NTlLuBjoGtD00tKrwAcULp6KQY1ZB0TRevNWFFx0
	 WiEeF8SuHiNnGWjpj3Fjphq6AoFtRzdmPvEC28ZLFYInDjCFxF0IQnA1weNGe+4Ya6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vCoikHHY/86OuPFTkoqtDTYDrgrfRPByWjw8bmDpLyQ=;
	b=jdqyOOAgWIBSwhqQDjRzf0ZAtrJWBGKlkW5dBcsTrfXVTpjdDWQFraorrDbb/353TuhZ
	 HcY9oxvPeH5NdfnYnx5QLmSYI8su65Z2pLBjI6yGe+gdS6qP1BesdvEo2i4GBkmj70zX0
	 pIYt4QyMmjYDjfyRkmjXQDaXE/gk5K5ZYMsYl7jTM490sG60OLRPpx6Ofvgh6VwTYp/Rr
	 IGqftjZRBGrVtA1N34spgbPtKtPGQRHpD+q/4Y1iUNoJdOWKFxfFFNna36tJ1dTrUqCj7
	 zePgufirhCrDIpLePcl0o9o2auoUNagsb2jnBBa60djHMiXkNoGWiyz5Tq3KPaqeCIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ILnMu9xd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C07606A31A;
	Fri, 30 Oct 2026 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ILnMu9xd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBE51F000C1;
	Fri, 30 Oct 2026 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793344638;
	bh=vCoikHHY/86OuPFTkoqtDTYDrgrfRPByWjw8bmDpLyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ILnMu9xdflB4kuOQ1K8wJfC8HV6QXQjns0F3rG0yzY1wZTeT+S2q9kmY7PcDKhvuy
	 YDZVm4JbtFh73QY0pT5gPghb/LMHFVV6dlDzhFar3Kd6qWRo2NMXf1Et/mQwjlIcgT
	 U2TW2OOhles422o13GoWa9x/luoYHwFClwLrS8E+bTPFV5bSu3ZYa3sWbX08B7qaSs
	 vWGMXfgd1i/jA/tbI+RrmM21PFay42N7H7zxDMI7KaXTxNNs4Fde4pyisKWqdwmf2+
	 i7s9PkuB2aJsRweG/Aa9oJdNHAlsa52j62jz29wpSdqSoRVTQIs7L38/Y6YTsnlFr1
	 EJ91mxyDxD8pQ==
Message-ID: <sashiko-outbox-190635@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, mfd@lists.linux.dev, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, lee@kernel.org
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 07:17:18 +0000
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
- [High] mfd: wm97xx-core: rodata write and const discard in wm97xx_ac97_pr=
obe()
--

commit d1e87419971e113856988eb45a5e61c55d61ecd6
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

mfd: Constify mfd_cell arrays

This commit marks several struct mfd_cell arrays across drivers/mfd/ as
const so they can reside in read-only memory when passed to
mfd_add_devices().

> diff --git a/drivers/mfd/wm97xx-core.c b/drivers/mfd/wm97xx-core.c
> index 1566a9b04b6a0..c0ddcd5219b57 100644
> --- a/drivers/mfd/wm97xx-core.c
> +++ b/drivers/mfd/wm97xx-core.c
> @@ -104,7 +104,7 @@ static const struct regmap_config wm9705_regmap_confi=
g =3D {
>  	.writeable_reg =3D wm97xx_writeable_reg,
>  };
> =20
> -static struct mfd_cell wm9705_cells[] =3D {
> +static const struct mfd_cell wm9705_cells[] =3D {
>  	{ .name =3D "wm9705-codec", },
>  	{ .name =3D "wm97xx-ts", },
>  };

[Severity: High]
Can wm9705_cells be made const here?

In drivers/mfd/wm97xx-core.c, wm97xx_ac97_probe() declares cells as a
non-const pointer, assigns wm9705_cells to it when probing a
WM9705_VENDOR_ID device, and then mutates the array elements in place:

drivers/mfd/wm97xx-core.c:wm97xx_ac97_probe() {
	...
	struct mfd_cell *cells;
	...
	case WM9705_VENDOR_ID:
		config =3D &wm9705_regmap_config;
		cells =3D wm9705_cells;
		nb_cells =3D ARRAY_SIZE(wm9705_cells);
		break;
	...
	for (i =3D 0; i < nb_cells; i++) {
		cells[i].platform_data =3D codec_pdata;
		cells[i].pdata_size =3D sizeof(*codec_pdata);
	}
}

Won't this discard the const qualifier at build time and fault when writing
to read-only memory during WM9705 device probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030071137.1009=
54-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
