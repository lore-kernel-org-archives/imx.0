Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19443264E6;
	Fri, 24 Apr 2026 17:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050265; cv=none; b=UNlaRgwHy3njBe+myjUAz4wkeZuU3pK9F0ecW6x8pexXuAhUE3XNwziG8o0mMaKb2BQHPTdDuao0Xl4qvubfJI4LZaPOpPQ/LKWy/9YmP8B82DM4W4t5SoOizxVuKqd/aoPCUtMazMnVzx63eUWMgnIiN9mhF/h2Ut34fXjvprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050265; c=relaxed/simple;
	bh=fgDUC+a18hY1qJbTl0Ow07f99fugS8GWyc5w2OTuH6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jdz4JE9Lw9bKxaWNncVbk+Q4UtYrmX9ZrrI/6K5rcKb0spVwrRvEUGdk0N7nSIHKabXRgWXLAiGBAOupaT+tqcbxNdu1f1e8sWlRbS8ioV+uFN2kAKmvxI7kUWH1t0huCKBfJt/hY2CMbjwYbwqUY06meD8bZijZRwmxvHBr3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3ttbWSV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3ttbWSV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5A1C19425;
	Fri, 24 Apr 2026 17:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050265;
	bh=fgDUC+a18hY1qJbTl0Ow07f99fugS8GWyc5w2OTuH6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3ttbWSVSBRruP5aod7T5/0aJTlIipUtHXg8nH86dDFW8AvCzG3Pa9nWqQUCInyl1
	 6aUKNmK4DmauNS+7pyGdQehssKKnx1mvHinLp6M6Wx8dxD1JlA5inbls25jFaHxYSZ
	 KJUzotqWzJPxPShlaE2DBVFKNqW0ZwBM16xJUKbK0PDc0g7sGV62gZx26E6v9pdwlQ
	 A22WXlah2xkEx9FUWNsQVqSV5buynp5lsrKcCi1XG+1IWjoBEq5ZqPvpu0tj1MxIHW
	 ZTF/UL3mSYbHyHfqccfAvzrDiVJtUftfrXs/geNdANgIbCFu24KcQjj6jL7XkUlJud
	 NJ4ZNtmG+Cd4w==
Date: Fri, 24 Apr 2026 18:04:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v12 1/2] media: dt-bindings: nxp,imx8-isi: Drop
 fsl,blk-ctrl requirement for i.MX8ULP
Message-ID: <20260424-crushing-synthesis-46c5c423fa9d@spud>
References: <20260424-csi2_imx8ulp-v12-0-da148eabc035@oss.nxp.com>
 <20260424-csi2_imx8ulp-v12-1-da148eabc035@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cz7yp52ESwv+fNtV"
Content-Disposition: inline
In-Reply-To: <20260424-csi2_imx8ulp-v12-1-da148eabc035@oss.nxp.com>


--Cz7yp52ESwv+fNtV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 02:49:50PM +0800, Guoniu Zhou wrote:
> The i.MX8ULP variant does not require the fsl,blk-ctrl property. Add
> fsl,imx8ulp-isi to the exception list alongside fsl,imx91-isi.
>=20
> Fixes: 288517a3c6c9 ("dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI =
compatible string")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Cz7yp52ESwv+fNtV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeuikwAKCRB4tDGHoIJi
0ls9AQC6Gvq6+BRlx+Okq2Qt/M1Gp1lBdnB7GKqtHiJVu6E5sgD+NW0d7/6n4ySn
ApgOHeb+OcQPSagNXpd6UIKjKXMuQAo=
=GRqU
-----END PGP SIGNATURE-----

--Cz7yp52ESwv+fNtV--
