Received: from mx-relay09-hz2.antispameurope.com (mx-relay09-hz2.antispameurope.com [83.246.65.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C35302745
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661806; cv=pass; b=EXg4OiqVCwYNF3aRj7V2sePhs/MUcFyOdc6Jul6p99BH2bzQzg0ttEvvTf13alqeUm0RBgeefoRkk7bx9rYy/xN404pffmX+TxqmWboihhyhO1oOF2xcNKos70iatGBJeWD58cxzStIpdIrkTWJKKOU3wBydETNTC0/pGhqpdgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661806; c=relaxed/simple;
	bh=PxmqLwTGHCcOlhvRAYqtPMxIQXNBtYQuY9nf7xWR7F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LpsWtK6tLfrPfEICsIK5rQu/Ks33he7jQlT05VSjOZKXD0h81GGgesuMrKk3dd3HNJm2vUeLFNc7eqB6TaKzMdKVXCnLZUg6W4VLmE+9TncvN4ieNtufUMEAwmM+o+nxBuuj6CtpOlNGf8ylcGdJvM3eAsQBNMFQtu6pg+g1DKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ai0PMxsM; arc=pass smtp.client-ip=83.246.65.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ai0PMxsM"
ARC-Authentication-Results: i=1; mx-gate09-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=T7axZz2df+9J33mOBW3vXS7fIUw+GxQw5eU/LsYk4ww=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1764661748;
 b=dOxCPqMAcaiJ6ygGWsEPL13bgjtnVpKTgFoYs184NQ/VNTOnWNwPwe/MQmRKG7DuGIKoK7By
 3oTP09MZPXJxm/dXnySFnvxVOCwW+mrLQGS1z3ioW3YNtgCUtqu7s3pOpE1kB0sPK9CBV0A7YPN
 5wDPSySG1wXE+b7zFZO079W8URTmnN/F4HwtH0qLIRo75zXgO8VhsyllnA+4Mal5MvmFPu3HKGa
 MvW1g/HIsl8NYA49M96gg+wJlOK3UQydtGhzbBmu8hXV31lQhen6KufcDNjSDQdc8wmwIxyVCMm
 IKu8NeeWo86tgAtiC1Hp4rvijKQaoKwk6wQSeQ9WvaiQg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1764661748;
 b=NhadE7OIZD1LK8bIw04T5s5pvpDwtGcJGI6/cgHqJs4xpohXDzj8wcE5rNuOamq9tfCq8xiI
 WIKVI9IVnFe3vyA14ffCkTQ7lHTvBl4nooOPeWiv23uGs/cGW1kWeTQFiX0PQsKquq1DHM6yrG/
 Ng26G12BK0rJWlnRqO3oByRnKmwQpQ0KRqHnF8MIFB43SLBwlr3yHYhQyI/7jZn/cdLMyn7kWgH
 G0B1MRq/oW8720bATxtj2bW0r5nvEI470+BFvcxU8nnyI8ArkskBunfPHaqFxZkd6Ik87pyuumK
 J7mQQToIpw8Eaai2ZOl3mvVj5MA0+YxjUvXVtRwdTszdQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay09-hz2.antispameurope.com;
 Tue, 02 Dec 2025 08:49:08 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0FBFA220D91;
	Tue,  2 Dec 2025 08:49:02 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject:
 Re: [PATCH 3/3] pmdomain: imx93-blk-ctrl: add support for optional subnodes
Date: Tue, 02 Dec 2025 08:49:01 +0100
Message-ID: <5948751.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <20251201-v6-18-topic-imx93-blkctrl-v1-3-b57a72e60105@pengutronix.de>
References:
 <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
 <20251201-v6-18-topic-imx93-blkctrl-v1-3-b57a72e60105@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6220726.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay09-hz2.antispameurope.com with 4dLCZk50ntz20pyl
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:60d645e73f706042f63d5b5154e78e90
X-cloud-security:scantime:1.971
DKIM-Signature: a=rsa-sha256;
 bh=T7axZz2df+9J33mOBW3vXS7fIUw+GxQw5eU/LsYk4ww=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1764661747; v=1;
 b=Ai0PMxsM4p5q5vNoaS4UfCZmqRbxdJnMDrRxYU0B+umz78W/6vQI61peRQh82rqAtEVJ2rHH
 M/aMRCaf9gbvERrZr8Qyqf3sh/g3B2ArsbCyVxYGQIL4WFYyInJBjbWQj7ryisrNzMES80E9Yk1
 gkFzpSYOkxEVGhaKBmfbyRH19gvHl78YYt0+1+CDAlkH7ZxLNwTyJoHoDosbsIGzoxPGC7LKw/j
 ncX02WaE7EMw2bubhbp7vITHamDjTX/0z56EnyJp1+Zu6z2UqjdX24BdymzJKeThxzMw38uP2Z+
 RGRs0u25iNlyuiDvvFRL/JntVy6Uk4g+2Z4thFsNm6C+A==

--nextPart6220726.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
Date: Tue, 02 Dec 2025 08:49:01 +0100
Message-ID: <5948751.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Am Montag, 1. Dezember 2025, 18:12:07 CET schrieb Marco Felsch:
> This particular block can have DT subnodes describing the LVDS LDB, MIPI
> DSI and parallel DPI bridge.
>=20
> Scan for possible sub-devices within the driver, instead of misusing the
> simple-bus to perform the scan.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx=
/imx93-blk-ctrl.c
> index 13b0de6dd689cf944e034f7666a4e97b0118e3bd..8f79cabe07face872cb396bfb=
7329c230c4a97fe 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -7,6 +7,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> @@ -311,6 +312,10 @@ static int imx93_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to add genpd_provider release c=
allback\n");
> =20
> +	ret =3D devm_of_platform_populate(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to populate blk-ctrl sub-device=
s\n");
> +
>  	return 0;
>  }
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart6220726.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmkume0ACgkQaS+g2M0Z
/iX2lggAjXJx/4qelXC+7BDMe922feOOwInko8Lie9ONTE7qj6W7OFZpk+lw3FzN
uckuThVlH8J/DFn1iGpYrVg3QnZAdh5wsgibfcZm67i894UiianaQOlqgtRpA7Oq
E+Kb9+gVB3vr5Nj9eaghmTFfXHFrVvDAsi7SIhq7oXJLO288+LbacOL5SzJVV/Gt
HvcoZwTu+eudlm0Dlu2/99zRaxHhQqpzSko46NY6Zn+UsR+0kx7FsqgQEwOo/Hg9
h4Uvf6VYLdFs/CYu9L5W1o9Ovov/axFFFkDW67miip5KQO9WpcYppaWSHJ9QxqSL
LS/86Nft9wctDFklkTJPdEYpWZc7xA==
=DoZw
-----END PGP SIGNATURE-----

--nextPart6220726.lOV4Wx5bFT--



