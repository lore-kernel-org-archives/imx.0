Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB5138490;
	Tue, 28 Apr 2026 08:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366107; cv=none; b=U3W2lc0BZZ3zmHWXAgDUOf0wWk71IZcGWNknYnfB95faJZUznhBqU/wyJnvD5GrhPiiRmeVAlepEmeg7WslqNWXF9ec4zMO6Vdmxipocg6zyZrjighs4XEhnc0aURoUgYen4fU2Mbl9axM45GpXfpY353/IqF1W6b+jamDwU6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366107; c=relaxed/simple;
	bh=mYuU6MXaswUtoHhacsBHyqLEb3RQrKd2tVDX/wlE3eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ysm3z4a8O6p6/vDyUlbuvaJ4lVdDGWBAHVC7CU1c8I3suzgHIWGeuEhkZyLDafbO48GRwUB88+u1aq6WXRLzFzpi1jM5y6VpsDXvBb0bauFQMWBxf5hZDSBspxl28rWTgcTkRdzwCjaS8omp3kxBifBxr+7XSELDYO7lUL6Gp7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1UvRjJE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1UvRjJE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A22AC2BCAF;
	Tue, 28 Apr 2026 08:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777366107;
	bh=mYuU6MXaswUtoHhacsBHyqLEb3RQrKd2tVDX/wlE3eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1UvRjJE6dflfyQhl8JY3L4hVKRTdb2yQn2oMGAXOIbVRq0ZE7yZrHlCJiQWzyqOO
	 Ayl4xpG2K9JvWcjNz6M84OnOonhmyhzMHQSWPUKF70T+ZedmFx4i6rIq8l1oGhDjJH
	 /p4D/qUIvM2cdbG/6+bIUxDPrDJSn+Dl6gwmVi0oh6fY9PCddZGxaVzSLwgaA7sSzQ
	 j/F8H1o4gReMWS3wfLhSk+uW2mBiTSAYnrRi/6PWHd+4xq4UuHFidugqYKbhaopTOD
	 ndEHGwLH3UfYPox7uUHMjZullYmSdqb+weGzUd5oNgqJovNthw4Vr8OTgr38Myi8q9
	 NFTyzHQvLk4Yg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EB9C01AC5841; Tue, 28 Apr 2026 09:48:24 +0100 (BST)
Date: Tue, 28 Apr 2026 17:48:24 +0900
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, shumingf@realtek.com,
	rander.wang@linux.intel.com, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] ASoC: fsl: imx-rpmsg: Switch to core
 ignore-suspend-widgets support
Message-ID: <afB0WHueZ5AGF3Vi@sirena.co.uk>
References: <20260415081942.4183108-1-chancel.liu@nxp.com>
 <20260415081942.4183108-4-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9UPrFDxvpRfQw9KX"
Content-Disposition: inline
In-Reply-To: <20260415081942.4183108-4-chancel.liu@nxp.com>
X-Cookie: Victory uber allies!


--9UPrFDxvpRfQw9KX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 05:19:42PM +0900, Chancel Liu wrote:

> @@ -274,6 +257,15 @@ static int imx_rpmsg_probe(struct platform_device *p=
dev)
>  		}
>  	}
> =20
> +	if (data->lpa && of_property_present(np, "ignore-suspend-widgets")) {
> +		ret =3D snd_soc_of_parse_ignore_suspend_widgets(&data->card,
> +							      "ignore-suspend-widgets");
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to parse ignore-suspend-widgets: %d\n", r=
et);
> +			return ret;
> +		}
> +	}
> +

The other error handling paths here have a goto fail to do cleanup of
the of_node in the platform device.

--9UPrFDxvpRfQw9KX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwdFgACgkQJNaLcl1U
h9A7RQf/QUn+qnt2gIgZyXelbB3F/TVFy2HzRTJNgNigI/pP+0D9evGIAfFSilHe
bY/DChXlgzVcbleDy0tYinjOEJCFWMFbM5geexzQDCeLBVttOFJBxGFg+6miD3ny
XBfA3eBsgWML7fjtuVl8L9VvSoY/VqAxOlVd0ezQQhdPv1/+OTZ6tKMC2sfijJQi
OEo5m8hZpyStL9ez+64ZtCGJp8YjUa4yCqjEnqqCRvVAiJZCySLZHY3qQx19x4F/
biWimRE9KOg4o7MaSjodS1el8vIllMT13FpJMud9r3TnHhIgG9IRNrUdtdgBtriI
lVH1KxPbEDVL6hP8ny9Ick5+7MOiaQ==
=7KNo
-----END PGP SIGNATURE-----

--9UPrFDxvpRfQw9KX--
