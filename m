Received: from mx-relay121-hz1.antispameurope.com (mx-relay121-hz1.antispameurope.com [94.100.132.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6095326FD9A
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635625; cv=pass; b=W8EvWG+nFgVu2oZrQU91nLoGjWUqULNig+U96bEH0mm9Qi/SwMglNfFLLdNLPy6FONWYF5AqIzOUcjemJXDroLj8SjkTK4e+R+VqALLAqo4WDiTmLYaTE7VwmIuF5NlgiMkTyW8MieMzlZ2V4GjlfIPXWK0XTx6wq3G/EjZ1Piw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635625; c=relaxed/simple;
	bh=XsFqPKZB3MumH3xAma4AYjJJ8bSYUmLIS3qnu5Evvw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IS3+u2WQ/nLR0rkdlthPe9B/udSrnNQZJk2TCLLpYHXdNrpUppeUhBCdnO7RX4LWTm+VLksjlcoiWHIds3zjqmeIA7OvZfE2SrrQ2f8SsY0cJAk8fFYXl5ivITK9Wx4ejP5iKcpCtAjwcVRN/eK5e543jyH+SByrCdJfBTpskf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RDLRbe+1; arc=pass smtp.client-ip=94.100.132.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RDLRbe+1"
ARC-Authentication-Results: i=1; mx-gate121-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=q2VBUYFHvKUwbpiDw59AkAsjoCGHM0bbS+Eh+okP3Dc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772635608;
 b=Gj/kRR1ltGNtjBVyoQfQSphxEyEZn8fhUg6U9dV1h/y3tnnWSd6BVCAPpkdmG0WvEdj/hkEZ
 jURTpaEIww4ztPkoA7rARRBaMRsKFTDTd/Aogh4dEjvexayFpB33sWdRLUOigVcvaeSaz6Sg4Ej
 W5KPit6wJ3Go0oOPNPc7X12A3F9ZFHd5oz2TmMBuagNIGT7bCZ1HEoPvzbxRNlQfWBVl7P+BO5H
 q1oyPD0I4qD6LBCm3089lTKbxWF84ATFUC+XwNVH4cW+XQ9RsXyu6JzhEjQJJj5J+uYG+G7ABCG
 hIhemh0npYqbmvk4G9B1Q5B2ToXBE4Rpjc4CyB3faypFg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772635608;
 b=a64TH8JNq16umwTl15eQpgiY9J0l7rux7u/RCGx26bEdXvYsVyBY93utyTUMWGQfvPSx1k0P
 AV/gyqkAk+J+2DjmzKBSK/FqPdgKWd5dF8vofS+OpFlbiRSLNEpzMR+K2cg1LEl+Scvrivce8nc
 H/SY+qw7B49+2MRhURfhXAxwlKJROTDqOcYbVBpq3N2V1gcXDy8WvFpl/4hvhXzdBs7YYIDyjpk
 tojDHmYFWEcKJLOTIYOaLSQi5nKhOAS0qUdWtrPqUK4ZsdnNPKxoJ0Q3wDNCEeWAHNYQf6RQxI/
 bXzXdD+wlrZWHSyYayCxz8itjz4k0MaOkWxXsPmV1EIoA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay121-hz1.antispameurope.com;
 Wed, 04 Mar 2026 15:46:48 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5089C220EC7;
	Wed,  4 Mar 2026 15:46:40 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject:
 Re: [PATCH v2 1/1] MAINTAINERS: Add i.MX team to all arm NXP platforms
Date: Wed, 04 Mar 2026 15:46:40 +0100
Message-ID: <3726230.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260304144423.1511858-1-alexander.stein@ew.tq-group.com>
References: <20260304144423.1511858-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay121-hz1.antispameurope.com with 4fQwV84GQLz1HBlf
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:749a3262f8666aae209a7ea25bd95e54
X-cloud-security:scantime:2.331
DKIM-Signature: a=rsa-sha256;
 bh=q2VBUYFHvKUwbpiDw59AkAsjoCGHM0bbS+Eh+okP3Dc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772635607; v=1;
 b=RDLRbe+1p2dHLLX8IE9GptvoqoFKKHQ3yQpoYq13d3IRtrTOD9XB3CSI9fImT8XxizUYYGLU
 qDJbEWmSf11AD8CVaL8wofsXPGEwSMaTqystQa5M3eC66Hs1yWa7oj1hC7kr50jjv48DX0ap4+B
 EYRjgbfka1jdnJqReDyPAmDVTBA88V4/H02LZuzKmLfJHM++JUDFVyb9sDNioIw7g+Khi97nQPN
 zBKIiOdEhv5l0WdZNgH0+wHC7jetR6O/7Ootza6afbN2b2OB34bOZAurJWNhRACND1tUMkPAR4a
 3pNDbplVDvuek0w/IGM7rxFMrxEDLSy22QW4LGh2UxU4Q==

Am Mittwoch, 4. M=E4rz 2026, 15:44:22 CET schrieb Alexander Stein:
> i.MX team maintains layerscape as well, so add the whole
> arch/arm/boot/dts/nxp directory as requested in [1].
>=20
> [1] https://lore.kernel.org/all/Z+Vs+pHZs2fMP%2Fp3@lizhi-Precision-Tower-=
5810/
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> * Rebased to next-20260303

=46orgot to mention:
* Collected Frank's R-b

Thanks
Alexander

>=20
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 467fc9dab9801..315ca1e1821a9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2815,8 +2815,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
>  F:	Documentation/devicetree/bindings/firmware/fsl*
>  F:	Documentation/devicetree/bindings/firmware/nxp*
> -F:	arch/arm/boot/dts/nxp/imx/
> -F:	arch/arm/boot/dts/nxp/mxs/
> +F:	arch/arm/boot/dts/nxp/
>  F:	arch/arm64/boot/dts/freescale/
>  X:	Documentation/devicetree/bindings/media/i2c/
>  X:	arch/arm64/boot/dts/freescale/fsl-*
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


