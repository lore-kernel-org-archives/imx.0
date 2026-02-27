Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23A436BCFA;
	Fri, 27 Feb 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183048; cv=none; b=s+dDKQTp1ROnTVbzuLbLLsD9DHHLcLAA5+vqLNZSqLX9YBJM4eCLNZYCjJqxPPrtLzMLzxu3Im4VXAns4h7GchCf0uWUNR+X37vnLl6SSUcumXpMGxuV+efJHqepIMn8JpEcgfqV9sOsg+4P0GpAazhVS9kox/F1J45NFqO3ic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183048; c=relaxed/simple;
	bh=ULqmscrmRYbb7GaDQ1iw2PdzZRP98XQa3VtXm4mRQjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLXXTwA957pysy1sju1fMG9S7fvUojYwfp/4+xECByVMQWKjrpgPsFWOqv7U/smdaQDwEe09m3lzS0b0Ym/rSrgCOC0QM9TZ38mMqy4lly7OUj0H1p7KXkCzdi+Qm3Ra+piBBnqzobK/CTtE8e7UyYPmWcwvFqnJfFfluG/Y/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bV3DNDdY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bV3DNDdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6E0C116C6;
	Fri, 27 Feb 2026 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772183048;
	bh=ULqmscrmRYbb7GaDQ1iw2PdzZRP98XQa3VtXm4mRQjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bV3DNDdY9xhWKrvNO/Wuy+ina1DeOPshRfqwbuTvmPjwRx4yGWjfQVOgUGjL9uVMz
	 jn9nl5F9K8IhoNQLMCgFUH+GwmMQjIB5QuGp7Bt2NGg+KO+KkooOYyQUKMC14i5Hbn
	 U+rwxMtwtNNVF6xJ8KqiYPYB8xqqE5zPgytc64riiVotu95z9lGEZbQtVqXrVuOewd
	 XNCpS2TWddFXJVBwHUJe+rl3evQjIJlQSeutsmpSHggaEe8uGS62b8/FNSMNSKTmTH
	 lmoxE/xzS2yUe7U3f8TvMsax/mz/zTfFJ6W0NylHRtRMeUr05tjwISn8pY1SmERF+f
	 D83rEBW+zmhKA==
Date: Fri, 27 Feb 2026 09:04:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi <xuelin.shi@nxp.com>,
	Alexandru Taran <alexandru.taran@nxp.com>
Subject: Re: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
Message-ID: <20260227-shakable-mummified-ba7bb54e0e05@spud>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
 <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>
 <20260226-unthread-reformat-92b855c4acf9@spud>
 <16172163-8aef-4d94-be62-70e159aae182@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HGUIQTmEq3BO0PCt"
Content-Disposition: inline
In-Reply-To: <16172163-8aef-4d94-be62-70e159aae182@oss.nxp.com>


--HGUIQTmEq3BO0PCt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 08:45:29AM +0200, Daniel Baluta wrote:
> On 2/26/26 20:20, Conor Dooley wrote:
> [..]
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +    bus {
> >> +      #address-cells =3D <2>;
> >> +      #size-cells =3D <2>;
> >> +
> >> +      neutron@4ab00000 {
> > "neutron" is not a generic node name. This should be something like
> > "accelerator" or similar.
> >
> The only dts nodes I could find using accel subsystem are from rockhip. A=
nd they use npu@
>=20
> e.g:
>=20
> =BB=A0 =A0 =A0 =A0rknn_core_0: npu@fdab0000 {
> =BB=A0 =A0 =A0 =A0=BB=A0 =A0 =A0 =A0compatible =3D "rockchip,rk3588-rknn-=
core";
>=20
> Also, Ethos-U64 introduced by Rob with [1] is using npu@.
>=20
> So, I think we should go wit that. I haven't seen any document to standar=
dize the naming.

accelerator, npu, makes no difference to me, so sure.

--HGUIQTmEq3BO0PCt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaFeAQAKCRB4tDGHoIJi
0jXWAQDkJ0uqFe0zBBD97N8Nc9W1uspEgrsZpTqEwgxIVIlnKwD/SKBKuEJxP5os
9i6n1nocp64AivMzqCek95MinbTDIgQ=
=lAaA
-----END PGP SIGNATURE-----

--HGUIQTmEq3BO0PCt--
