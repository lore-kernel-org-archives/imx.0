Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651BD18035
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984015; cv=none; b=RBSrLNDPtJYlwLZBZCy58/6Vvyw+YO8qXPHLrYsJb/Sv6HkC57CgJ3tasJfNmvbqbkcabWeBPtmpS0ybdCMcrdRY1OsWuutAZClwF5StUm4NE38/7iNuLdylFkkBfH9bBm63/OpTNsNArUMuHMy2T7G10MeE/Ks/O85orYfUSMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984015; c=relaxed/simple;
	bh=pMjpsA33HKljwcG406thhN+AjE/RSrGVbJXSs2Kgu0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=swVRnVH0UKdNKpa+0hvoJkSumKABWLymTdbRXE7n7j2uvzaGoONwwo1mxpzftYDbMX85AHpK1MsO59tsSsXoCuYV3qhnmA3626JuBzFVvvmHQXZ25AWd4vy9r/Z0cE9zGUD54yo2zBeJJnNhhqgicyqU4irgI/9hRM9vly6+bPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=aqTde5sn; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QVGlDmuR reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aqTde5sn";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QVGlDmuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1728984012; x=1760520012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yRWYvJoTuHbugjBlZOZ8pdv+QEbZ7LjBnWhw7r4zZd0=;
  b=aqTde5snBmShhfMh2CSGzho0jV4OF04p/0m0GzCIcjiQH7y92JTbnXQb
   H1qtTp6SnayBhY3uFvsd1oNnlYoVMIFjwZoJGFJSVOsuNWHnhWSXUBqoL
   X2TCOtGpieb3198clEFzp5OTsLM8mVa+6v42aU1o+HIS7Dpvu01ETDcJt
   F3X6nKx9g0odskhAMw+7DMw4ZjzVZyDFFNZCajrD0ylaY39tpl+yLSBdZ
   qlhUWp77JWh6gvITyRm236fFQev79zTaNQOzr5LQfdkKLjDkHnTApnHJ7
   6rYEl8ROMhvFD9je58mF4tjmRAvM9P/maAcYzHehPHUPLl2Q8OVeJeodj
   w==;
X-CSE-ConnectionGUID: b4pHya66RRqdT7XiPKu01A==
X-CSE-MsgGUID: WQu91uJQS+iq46hq620OLQ==
X-IronPort-AV: E=Sophos;i="6.11,204,1725314400"; 
   d="scan'208";a="39461348"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Oct 2024 11:19:00 +0200
X-CheckPoint: {670E3384-23-236878CD-F32272AF}
X-MAIL-CPID: D13B26775A64319511C59C8BFC121309_2
X-Control-Analysis: str=0001.0A682F1A.670E3383.0099,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8655E165B6F;
	Tue, 15 Oct 2024 11:18:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1728983936;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yRWYvJoTuHbugjBlZOZ8pdv+QEbZ7LjBnWhw7r4zZd0=;
	b=QVGlDmuR7nAcIpCE5UuGHjm53l7s3RSkZhcuEz/tI6WeMn4T/fbOTDyXRhBgofEW7W1cg6
	pk2Mql3wcyPqhdyVa1UHcSP15rC8fuJ2UVB6mF7DQmVbbsk+JqNijlzOCQq1lc1Fd4ILjv
	R1nbFQRlvKRKoFZ5p6M7cLhbGZjfQvL9Cbu4z9eZuUR9arMKxPZnSU7MGtBzRjASIgxiAQ
	xjXwBeCZeX/uauQWYQQMZgd75ZE1NhjMzbf5dClY+mNgk/sbn3akBpOYolx8icTC0rZS9+
	8CwJtCIfpzuFpwHs75AJ4tgBOPxW66P5ROFNg3x3HavDUn8Ua8QZg9rjYjU94g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, Richard Zhu <hongxing.zhu@nxp.com>
Cc: hongxing.zhu@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH v5 2/2] clk: imx95-blk-ctl: Add one clock gate for HSIO block
Date: Tue, 15 Oct 2024 11:18:53 +0200
Message-ID: <4963051.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <1728977644-8207-3-git-send-email-hongxing.zhu@nxp.com>
References: <1728977644-8207-1-git-send-email-hongxing.zhu@nxp.com> <1728977644-8207-3-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Richard,

Am Dienstag, 15. Oktober 2024, 09:34:04 CEST schrieb Richard Zhu:
> CREF_EN (Bit6) of LFAST_IO_REG control i.MX95 PCIe REF clock out
> enable/disable.
>=20
> Add compatible string "nxp,imx95-hsio-blk-ctl" to support PCIe REF clock
> out gate.
>=20
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx95-blk-ctl.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-im=
x95-blk-ctl.c
> index 19a62da74be4..25974947ad0c 100644
> --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> @@ -277,6 +277,25 @@ static const struct imx95_blk_ctl_dev_data netcmix_d=
ev_data =3D {
>  	.clk_reg_offset =3D 0,
>  };
> =20
> +static const struct imx95_blk_ctl_clk_dev_data hsio_blk_ctl_clk_dev_data=
[] =3D {
> +	[0] =3D {
> +		.name =3D "hsio_blk_ctl_clk",
> +		.parent_names =3D (const char *[]){ "hsio_pll", },
> +		.num_parents =3D 1,
> +		.reg =3D 0,

According to RM the register LFAST_IO_REG has offset 0xc0. How does the DT =
node look like?
If this is the HSIO block control I would have expected this to control the=
 whole block.

Best regards,
Alexander

> +		.bit_idx =3D 6,
> +		.bit_width =3D 1,
> +		.type =3D CLK_GATE,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +	}
> +};
> +
> +static const struct imx95_blk_ctl_dev_data hsio_blk_ctl_dev_data =3D {
> +	.num_clks =3D 1,
> +	.clk_dev_data =3D hsio_blk_ctl_clk_dev_data,
> +	.clk_reg_offset =3D 0,
> +};
> +
>  static int imx95_bc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -447,6 +466,7 @@ static const struct of_device_id imx95_bc_of_match[] =
=3D {
>  	{ .compatible =3D "nxp,imx95-display-master-csr", },
>  	{ .compatible =3D "nxp,imx95-lvds-csr", .data =3D &lvds_csr_dev_data },
>  	{ .compatible =3D "nxp,imx95-display-csr", .data =3D &dispmix_csr_dev_d=
ata },
> +	{ .compatible =3D "nxp,imx95-hsio-blk-ctl", .data =3D &hsio_blk_ctl_dev=
_data },
>  	{ .compatible =3D "nxp,imx95-vpu-csr", .data =3D &vpublk_dev_data },
>  	{ .compatible =3D "nxp,imx95-netcmix-blk-ctrl", .data =3D &netcmix_dev_=
data},
>  	{ /* Sentinel */ },
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


