Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD1157E9F
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729148654; cv=none; b=CK80oBZbOEcg0pZ2MhasT6+R4rO84RS86DrAezRYCcqluTJbkuXFrHBDzBWJKZ+RrsY/X03jDTYvg/4v/TFwGQ/IvQhZFHwZH3vBaM8Xw6M4/vK/d2ulOg/xhGkuc+K3Lf2vQ+zArqPDaMiy84qKKJKRRftHJjYQwYCI7jgS3Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729148654; c=relaxed/simple;
	bh=G5OPTcEC82Tosbes+9MlIjTJfQQKAPa9SGVIU4e7AuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip9As90svd8hPlcclhzi6A6nxwkDCeOPHkt44hhIGyBE2KEue4Cjcnd/33BgDtvxEGNFTT2/MQEr2vYCXdTGgbF9epTRvviq+6dbqVjfXHaUrGx68DlKEB76fsj21t+b5ZrXqJWJrbAlhv5BPanDyTj/v5LzahtyRAyo5pVAhik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t1KYG-0000k9-9p; Thu, 17 Oct 2024 09:04:04 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1t1KYF-002UDD-Pe; Thu, 17 Oct 2024 09:04:03 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 75FAD354D9A;
	Thu, 17 Oct 2024 07:04:03 +0000 (UTC)
Date: Thu, 17 Oct 2024 09:04:03 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Frank Li <Frank.li@nxp.com>
Cc: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, imx@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH net-next 10/13] net: fec: fec_enet_rx_queue(): replace
 open coded cast by skb_vlan_eth_hdr()
Message-ID: <20241017-tasteful-frog-of-persistence-ad1223-mkl@pengutronix.de>
References: <20241016-fec-cleanups-v1-0-de783bd15e6a@pengutronix.de>
 <20241016-fec-cleanups-v1-10-de783bd15e6a@pengutronix.de>
 <ZxB6AuGnoXekCEtp@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bbxuw7yumi54jgxm"
Content-Disposition: inline
In-Reply-To: <ZxB6AuGnoXekCEtp@lizhi-Precision-Tower-5810>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--bbxuw7yumi54jgxm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16.10.2024 22:44:18, Frank Li wrote:
> On Wed, Oct 16, 2024 at 11:51:58PM +0200, Marc Kleine-Budde wrote:
> > In order to clean up the VLAN handling, replace an open coded cast
> > from skb->data to the vlan header with skb_vlan_eth_hdr().
>=20
> Replace manual VLAN header calculation with skb_vlan_eth_hdr()
>=20
> Use the provided helper function skb_vlan_eth_hdr() to replace manual VLAN
> header calculation for better readability and maintainability.

Fixed,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--bbxuw7yumi54jgxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcQtuAACgkQKDiiPnot
vG/SSwf/RLC1G+yUlyNcaq0ekJTCbBgjaw+gpMeEaIwC3POspzUWlJ0PFEDUvWi2
NlDWzrkrSMWllWt96vin0rzmRhBSGmZTHiYtccXIyNRUTp56kfGIULu66LDbJJot
gjQ/mW3W5d0lI6MA7kZ0BHix+Ly6WuUKpUeJfveA4lkLTmSGvIVVocYbJ88G2nbe
JUPXU9K97TOzKx+7XITqXRN3Y7Ql1uKhJQ5QhrhvBjaf7nIRCZuy6NsTYxDssOPZ
b4bbpUTxPIIv+xuBGKfSdBM+sSx14hDPzaQ2Hm3RUnNpQsXGvlOEZJdngyJumqMo
PIrcq5O4veD8gzGxkIhcuKSTdQ8CzQ==
=tK4s
-----END PGP SIGNATURE-----

--bbxuw7yumi54jgxm--
