Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951761;
	b=miTteFh50dkOS0u19A7saGmyc7ox6YD0dgIsqVHd+hdlTupSnBzSm0FHTvl13LYyGpCC
	 uRCMXcy8zwoBbIiXrYnfcV2dXmkUEtbKOaSTqpS2iRAWEma5U+a20Pb/CHSpWdpmsAaeF
	 folWzLEjc8c1Stqd6JWLN+QcVJZqCe6myvkUVEmT+v94wl4r2HCtpQdqfQUlbj/JYuGXp
	 vU4REtUUVvwoosVz7jyMwYzVE+ybXvMHj/WDe8zWYJZY05qpeJOw6YKAB1icvx0GgNt4Z
	 91MhLOfI1uX6BmFrQG7e+ibgK92kQ5TVBoHQyiyTZuzhst16kW3Q70TDAXbnoEKt81A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951761;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=6IozNtdf6HbKzKGMEo6l7v3ccDJ192jbBuLKZ0N87Pg=;
	b=ic0EoVhZZXgPSV5JIvljEDccsEQUqAuSwVXSfQUUxPSLesSIbX2pHw1Rgk7oqJObuT0k
	 uWBEk9xOCSY8TvezaA7fknzfMd4x8xzlHxOwpYA6Oy9KOehR0+mu2iu4A6FNEKNSUs40e
	 aU7kMnP5l8PIGP8TMgBcJw6fBaIIGw3hWQXc2bu5QBz3GKMgDOY0D6KVCQ5aQGgFHwlZJ
	 1VaRZ3oy6rmtlELPNRdNymwJIwDXrVuDiOwvqzwwLjNHm7voiT8TDGgpJ1b1RF3KC2yYA
	 IikVfwIdjh7astc2DdkblDazPiXzQILapvrJZXym5dotCEsW1httP5WRumuk9qQQKRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DK60HOsv;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069B606A32A
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 21:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F069B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DK60HOsv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794951759;
	bh=DAWQCPgIzEXdD/gx6UFSHeVExfzcx4VAtZ2MtqyfUWw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DK60HOsvAA0/+ZyRO3J5fy8osZDPA14ty+SokRJI3jsLyf/Sj9cb4EzYHWw9kJRzW
	 XzjIdg9OFznj+GKZJKXceaJacr/x6t8LMeHcxZ4RqIoh+HewI9ofPoEohHQmNOZIG9
	 5Vzlf3UWf0rIrNofsKfu3pvkgeHHMHd2GYkQ70BpFttX9gahHlFLt3kh3SimzCOriH
	 B3ay2SOyIF6koiwI3muBRXvZ2ha5SK/glTuzwooFjz5pRHxheA4+wsxHPLoVS317v7
	 Zh9o5qwQtbcQ7LfRuq+JkbUTBjWh+OumaUEaLOj9+pdnnTQX9+orCRHDG7SAtHCA2a
	 RizjA9w4pVsKw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1336717E0406;
	Tue, 17 Nov 2026 22:42:36 +0100 (CET)
Message-ID: <980bbf45de0983f6b38a6b1f8dbf5a20310fc66c.camel@collabora.com>
Subject: Re: [PATCH 09/14] media: verisilicon: Cancel job with runtime pm
 put/clk disable on failure
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Tue, 17 Nov 2026 16:42:35 -0500
In-Reply-To: <20260522101653.2565125-10-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-10-paulk@sys-base.io>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-nCR6jsSSCS1asrKum/3e"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

--=-nCR6jsSSCS1asrKum/3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> The no-pm variant of hantro_job_finish is only good to use directly if
> runtime pm get failed. In other cases, we need to do a runtime pm put
> and bulk clk disable to correctly undo what was set up.
>=20
> Fixes: 892bb6ecead9 ("media: hantro: do a PM resume earlier")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Seems already fixed by 556ab0b2741d6 ("media: hantro: release runtime resou=
rces
when device_run fails".

> ---
>  .../media/platform/verisilicon/hantro_drv.c   | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index e0c11fe8b55c..e21306f2bf2e 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -169,29 +169,34 @@ void hantro_end_prepare_run(struct hantro_ctx *ctx)
>  static void device_run(void *priv)
>  {
>  =09struct hantro_ctx *ctx =3D priv;
> +=09struct hantro_dev *vpu =3D ctx->dev;
>  =09struct vb2_v4l2_buffer *src, *dst;
>  =09int ret;
> =20
>  =09src =3D hantro_get_src_buf(ctx);
>  =09dst =3D hantro_get_dst_buf(ctx);
> =20
> -=09ret =3D pm_runtime_resume_and_get(ctx->dev->dev);
> +=09ret =3D pm_runtime_resume_and_get(vpu->dev);
>  =09if (ret < 0)
> -=09=09goto err_cancel_job;
> +=09=09goto err_cancel_job_no_pm;
> =20
> -=09ret =3D clk_bulk_enable(ctx->dev->variant->num_clocks, ctx->dev->cloc=
ks);
> +=09ret =3D clk_bulk_enable(vpu->variant->num_clocks, vpu->clocks);
>  =09if (ret)
> -=09=09goto err_cancel_job;
> +=09=09goto err_cancel_job_pm;
> =20
>  =09v4l2_m2m_buf_copy_metadata(src, dst, true);
> =20
>  =09if (ctx->codec_ops->run(ctx))
> -=09=09goto err_cancel_job;
> +=09=09goto err_cancel_job_clk;
> =20
>  =09return;
> =20
> -err_cancel_job:
> -=09hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> +err_cancel_job_clk:
> +=09clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
> +err_cancel_job_pm:
> +=09pm_runtime_put_autosuspend(vpu->dev);
> +err_cancel_job_no_pm:
> +=09hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
>  }
> =20
>  static const struct v4l2_m2m_ops vpu_m2m_ops =3D {

--=-nCR6jsSSCS1asrKum/3e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzKSwAKCRDZQZRRKWBy
9L+6AQDMKLPrZhSUG++b0MtI5ik0wMRxfL/1mxitEeqZmMEMPQD6A0XQSzZQJRLC
7KBSAin35Q9wXNZx0/Tkx7GU4aMYcwk=
=tZTf
-----END PGP SIGNATURE-----

--=-nCR6jsSSCS1asrKum/3e--
