Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68FD3EC2E0
	for <imx@lists.linux.dev>; Thu,  7 May 2026 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151482; cv=none; b=fRB0tywgwTywLF3HRHxjy7TkTyzexic2S8zECVhfd2J0mWW4TLUv3FdKUEBE+pL5IE5lhWj10YMo7ishF0E/ggiTp0mXgKSmddev/gnAm5l9w8KpWDse5my3PlXXVx0GOEPqt1NiBHWlgm7ABhX3gwOqJ5U+YhaeerAbzbpGUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151482; c=relaxed/simple;
	bh=6zED7wLJxbCqB+NzJWse7+pMVFcpbva1NJdJbRes3SA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l0Rx+XSEIM255DqNclkyqsdjm/G8ap3s/dm4TyF02t73AWckhMpTuAYR3oMNahZlpp23Gwk58I6IHz6xoPo8llYFed+cp+gnfzLxSVxHQ3tNSd8zD38EBCUEHmCFw6+ElUskT2VHqVy7NdBtzFbuBu9lacuMFq99q1/zORspGpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wKwQI-00030s-PY; Thu, 07 May 2026 12:57:42 +0200
Message-ID: <344d09f96081e785f1e70e75db3c5242c5eb315c.camel@pengutronix.de>
Subject: Re: [PATCH] soc: imx8m: Fix match data lookup for soc device
From: Lucas Stach <l.stach@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rob Herring (Arm)"
 <robh@kernel.org>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 07 May 2026 12:57:40 +0200
In-Reply-To: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
References: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Am Montag, dem 27.04.2026 um 09:01 +0800 schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> The i.MX8M soc device is registered via platform_device_register_simple()=
,
> so it is not associated with a Device Tree node and the imx8m_soc_driver
> has no of_match_table.
>=20
> As a result, device_get_match_data() always returns NULL when probing
> the soc device.
>=20
> Retrieve the match data directly from the machine compatible using
> of_machine_get_match_data(imx8_soc_match), which provides the correct SoC
> data.
>=20
> Fixes: 2524b293a59e5 ("soc: imx8m: don't access of_root directly")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Frank, please apply this fix for the 7.1-rc release series to get rid
of the regression.

Regards,
Lucas
> ---
>  drivers/soc/imx/soc-imx8m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 77763a107edbd11302017e3f61ecb4369fda1ab0..fc080e56f50d423b88a673181=
a6bc986eb4c1691 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -247,7 +247,7 @@ static int imx8m_soc_probe(struct platform_device *pd=
ev)
>  	if (ret)
>  		return ret;
> =20
> -	data =3D device_get_match_data(dev);
> +	data =3D of_machine_get_match_data(imx8_soc_match);
>  	if (data) {
>  		soc_dev_attr->soc_id =3D data->name;
>  		ret =3D imx8m_soc_prepare(pdev, data->ocotp_compatible);
>=20
> ---
> base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
> change-id: 20260424-soc-imx8m-fix-90d7ce2397f5
>=20
> Best regards,

