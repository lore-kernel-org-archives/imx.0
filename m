Received: from mx-relay93-hz2.antispameurope.com (mx-relay93-hz2.antispameurope.com [94.100.136.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D167E23ABAA
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661807; cv=pass; b=Ujh+XIkR9YBDuVzQ7/CI1tm6+N30O/2x8lBHqv6bK7QamlqHDlNCW3aGwQmAEMLlJZQzm4R5HReof5/OngnLwF16Ur5WsnoVPNUQl75e2V04I3R1NfVNiNB/MWszks0ErZm2HdJN5hn+qseqOzklAo/guLssOw2BnbcGczsDZak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661807; c=relaxed/simple;
	bh=5E8tONvGDYNXqEcU4jADlGAWcbtLghmGBN2qCeMt8X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6S8dVNRg193jLcsadvY+YM5D7L2hlGPE1JwtrEPvQ5AiogwdGiEkZdQJ5/7tHW7mNVIOOmGYFv3ZS8QEkpN0JbJeJE2j/XNQZwbwKV8SLILnGaoAMpxlus8ol2qHuXI5Y0RcXRSoPTaiwdjNbmh2Ni3jAs6U0LAa4qeAvoDi3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NXD77VQb; arc=pass smtp.client-ip=94.100.136.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NXD77VQb"
ARC-Authentication-Results: i=1; mx-gate93-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ZuuiLfEXz8Diy3RFrr3LRL4zmPRzauswvFKI19W6Rz8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764661742;
 b=h94bnrDaw15NEa3BA0L+/6iB3Z8S3qcYu+zMLlw6Tir1qMi6MfgpY0y4K87geVzKUyPdEgd9
 ew9qp8mkZhnqtVamEgAm+R9rbe8TdHD8auudMBz5xTYQpQUsDEoLuJJo6edsR2Gzu8U188waAYR
 TB7SBprsWOZIBEponCvxc/5NjI3JJVXy0TGHgjapysuWSXZuvEjhUiZ3Bhg+3Q0ijOX1hxlfQzu
 5coJF+pUf0kRHvXqm09rs7xGGSleWY2Tmvv+7mbaQ51OApiOfskqw5Mxxmi2yyVIkdbtanFfDU1
 ogHXZ75pbUKLC3pOKWMyGGPjs5nJvgq20/plPonrE8Dpg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764661742;
 b=eQFg1cIjncZcAjTeChNJ3kpIkih0tatGkjJpPZT3J7CdQqvQn7aD5nrgidXo91cwVvyovEHy
 +wP/1mFwLuX7tTXhKV0WKPKhlv1y3AJz6t8lHhPDxUljnjMq/oaeblnc1PH1dumYn1yNEPDI52d
 /aqkZWOZViFh1lq9mygWGziJiWyrBqVY9zgWFyvbYU/lgN5XGbABMSub1EqsQZi+Q9ERcXix8uH
 avBT801Cq689QKx+OcmxrTl2cNMZIcdAPMKuWJVuXak/dZd73xsOboe59AkRX2BTuKeNYv58qon
 mlEX+whBZGQOH+yY+Ra2SOu5r1ni+PDf7ygjfRx23VG7w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay93-hz2.antispameurope.com;
 Tue, 02 Dec 2025 08:49:01 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5F6F9CC0E91;
	Tue,  2 Dec 2025 08:48:55 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/3] pmdomain: imx93-blk-ctrl: cleanup error path
Date: Tue, 02 Dec 2025 08:48:54 +0100
Message-ID: <2812632.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20251201-v6-18-topic-imx93-blkctrl-v1-1-b57a72e60105@pengutronix.de>
References:
 <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
 <20251201-v6-18-topic-imx93-blkctrl-v1-1-b57a72e60105@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-body-digest:8acd2ce67e20b48317200392c5473c1b
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay93-hz2.antispameurope.com with 4dLCZc0Cw6z4Qbbv
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:49e900fe4f7bb522495f22f55c5fbd5b
X-cloud-security:scantime:2.076
DKIM-Signature: a=rsa-sha256;
 bh=ZuuiLfEXz8Diy3RFrr3LRL4zmPRzauswvFKI19W6Rz8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764661741; v=1;
 b=NXD77VQbgKlmx1e/ofNuuNsvjDDd6su0N3WvF889wbsebdsw8VaSe46gOUMMnK05H9TdQ/hd
 ib51MkEWfk9pgPwkXOZW4OtisgQvSOaWx3BqRPDt/iz+4/5RN7fGsWw/OVaKFTalq4Tkmt9TcHD
 n3LpdNfkI29Ci2dKz//fGJCvM8hYPrb4nAbCC+vRUZOJ9uYkq3gafaLv9Lkj5OlmvKbNntxGvEw
 zyRxoUqStHXf+tvqcZLpDmzaOcekUlJcmIPDQbWe5JnL6PeBLe7qoImdwLdT/M0JCQBzbEmyXr6
 zU4yEhUmH3LbTvqsE0JYFWutPfPJbTrT0HeeYJZhlcj8g==

Am Montag, 1. Dezember 2025, 18:12:05 CET schrieb Marco Felsch:
> Call dev_err_probe() directly during return to make the code more
> compact.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx=
/imx93-blk-ctrl.c
> index e094fe5a42bf646c712f3eca4e66a313fa5a914c..2aa163aef8de4ee901b9cde76=
ce2aad246c8c08a 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -240,10 +240,8 @@ static int imx93_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>  	bc->num_clks =3D bc_data->num_clks;
> =20
>  	ret =3D devm_clk_bulk_get(dev, bc->num_clks, bc->clks);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "failed to get bus clock\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get bus clock\n");
> =20
>  	for (i =3D 0; i < bc_data->num_domains; i++) {
>  		const struct imx93_blk_ctrl_domain_data *data =3D &bc_data->domains[i];
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


