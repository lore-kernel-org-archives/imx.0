Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542371;
	b=H15Np8/qAR96QFRcgEhpUZdGSeWZdwcHDSWj1rnB6+uCRbSDou5AvEuf+dIRzavrUgBj
	 oUeV2qkvh0ijNE41BCsO4bHA6Zqwu2ptHkJITHg2xE/Xp2mtngKSS1fAzsR+HJ0uzpW8q
	 N9HBjrQsPSMIWRAU/6DFUpM5m4I+BIcvkDOC3RhnKYxj6WfjoJ31jXY+REmz02QQrgV1z
	 sCNsE6iBDhJYbkqAnCQrwFYVI9hpFCYA6Qdyc/xPYJ50D1NwxLw2OO30Fw73duZXyrbnO
	 KAL9lhTNb/2qTdZCHBSnoCnW167F2lWJDrgYGa/VBXKStrx6sS5jj6YEOp95oUkd/tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542371;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=fIf2xE0G6RJC+KjMdQDd5uURjWfAdnrxVBZi50T61Wg=;
	b=JXboe8jNI4CousHw9dP36Q4GXl3jcISqpsDClKkXrilQ54j0v4ntaWU9Uo/scsz68s1f
	 2zsXbTFIddXyFsS87CmmxMz6fT/2UEadZdiFJ9thqhDGgG4yAGrXfgtxl7jUy3FBYKB6X
	 9wnQ6dQKYR17dY6f6qVwI619o4RM+qS16DhJKrtGdvl1gO+HuYxt6rtSEXPbSUAVBhKhW
	 uK/7r58H5dw4nLi/sGfhn+yP0KQDtspHxveItyKL/FN07HUjP3AMkrJgpkwUgcOudLuzR
	 wXO3Cijka45iWN1oRQyGo06Z+3ceGuCl8pdJH8+ciqjm/XPf79WbJLKhtiT6DDItSCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=eaVgWC6B;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC197606A31E
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 17:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC197606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=eaVgWC6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795542368;
	bh=2vLDKHeR9lc9GUWK07uNhE/Yhexx0rV2NuuZG2KZ9/I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eaVgWC6B//DD4cGJKhfbsx18rYHr/87i9c87YOiyJAC71sI3+pWaFp4GdElsa8VrD
	 RtmQWqvKpPIv7kZx0S6ksxLe3mSHi3R67HbMk1Va3ktUKZPXI2MRUEI1Kt6Qu7Yyba
	 gEv3zFZTvkq7ia3N3BNuq+w2xQcthZrlk1NqJ5oJhSlZG1eUsjWAitw/rV+OpXemth
	 ohuP+/DTgAN34UvrOuZvrSQZEC6Xhr12LUxRodnvEvfjHVkE6Jpea2DSH17qCc/2A4
	 tCzG4MruEX0C91p9dwa1hWZdkihNUxHHrpYuii9ugJgTrkxEMHvYDuHJ5qV9v+hVJs
	 biyTaDtkxmYoA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 662AF17E0192;
	Tue, 24 Nov 2026 18:46:07 +0100 (CET)
Message-ID: <067d32d46788603e18f24040e2a8aabb1b749774.camel@collabora.com>
Subject: Re: [PATCH] media: amphion: Enable non-coherent allocation for raw
 frame buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, Frank Li <Frank.li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Zhou Peng <eagle.zhou@nxp.com>, Frank Li
 <Frank.Li@nxp.com>, 	linux-imx@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 12:46:06 -0500
In-Reply-To: <awUiZWa4ZTMhFeVL@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
References: <20261119-amphion-non-coherent-v1-1-c3154395e448@oss.nxp.com>
	 <awSn9NyulPPPIIT8@lizhi-Precision-Tower-5810>
	 <awUiZWa4ZTMhFeVL@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-YgqiAaeSiZb24V1NgmpQ"
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

--=-YgqiAaeSiZb24V1NgmpQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 novembre 2026 =C3=A0 14:42 +0900, Ming Qian(OSS) a =C3=A9crit=
=C2=A0:
> Hi Frank,
>=20
> On Mon, Nov 23, 2026 at 03:54:12PM -0500, Frank Li wrote:
> > On Thu, Nov 19, 2026 at 04:27:14PM +0900, Ming Qian wrote:
> > > Allow applications to allocate raw frame buffers with
> > > V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access. The required
> > > cache synchronization is handled by videobuf2 in its prepare() and
> > > finish() methods.
> > >=20
> > > Set allow_cache_hints only for the encoder OUTPUT and decoder CAPTURE
> > > queues. Leave it disabled for compressed bitstream queues, as the
> > > driver may access their payloads through the CPU.
> >=20
> > "V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access", but here
> > "Leave it disabled for compressed bitstream queues, as the
> >  driver may access their payloads through the CPU"
> >=20
> > Look like description is contradiction
> >=20
> > Frank
> >=20
>=20
> Sorry for the confusion. By "efficient CPU access", I meant userspace
> access to linear frame buffers.
>=20
> For linear frame buffers, V4L2_MEMORY_FLAG_NON_COHERENT enables cached
> mmap access from userspace, while videobuf2 maintains coherency through
> prepare()/finish() during QBUF/DQBUF processing.
>=20
> For compressed buffers, the amphion driver copies data into the
> internal ring stream buffer when decoding, and out of it when encoding.
> Enabling non-coherent allocation for these buffers would require
> additional synchronization around those CPU copies.
>=20
> This patch therefore enables the option only for linear frame buffers
> and leaves compressed bitstream queues unchanged.

Maybe just state that other queues are using vmalloc which is already cacha=
ble
memory. What this feature does is allow not getting write combined mapping =
for
CPU access, which is terribly slow by letting application manage their own
coherency (or by using DMABuf sync I believe, can't remember if that was fi=
xed,
there was a lot of issue in this API btw, so check its states and make sure=
 it
working for you).

Nicolas

>=20
> Regards,
> Ming
>=20
> > >=20
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > >  drivers/media/platform/amphion/vpu_v4l2.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/medi=
a/platform/amphion/vpu_v4l2.c
> > > index 7cccc994fc50..c8d52f0af879 100644
> > > --- a/drivers/media/platform/amphion/vpu_v4l2.c
> > > +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> > > @@ -664,6 +664,8 @@ static int vpu_m2m_queue_init(void *priv, struct =
vb2_queue *src_vq, struct vb2_q
> > >  =09src_vq->mem_ops =3D &vb2_dma_contig_memops;
> > >  =09if (inst->type =3D=3D VPU_CORE_TYPE_DEC && inst->use_stream_buffe=
r)
> > >  =09=09src_vq->mem_ops =3D &vb2_vmalloc_memops;
> > > +=09if (inst->type =3D=3D VPU_CORE_TYPE_ENC)
> > > +=09=09src_vq->allow_cache_hints =3D 1;
> > >  =09src_vq->drv_priv =3D inst;
> > >  =09src_vq->buf_struct_size =3D sizeof(struct vpu_vb2_buffer);
> > >  =09src_vq->dev =3D inst->vpu->dev;
> > > @@ -680,6 +682,8 @@ static int vpu_m2m_queue_init(void *priv, struct =
vb2_queue *src_vq, struct vb2_q
> > >  =09dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> > >  =09if (inst->type =3D=3D VPU_CORE_TYPE_ENC && inst->use_stream_buffe=
r)
> > >  =09=09dst_vq->mem_ops =3D &vb2_vmalloc_memops;
> > > +=09if (inst->type =3D=3D VPU_CORE_TYPE_DEC)
> > > +=09=09dst_vq->allow_cache_hints =3D 1;
> > >  =09dst_vq->drv_priv =3D inst;
> > >  =09dst_vq->buf_struct_size =3D sizeof(struct vpu_vb2_buffer);
> > >  =09dst_vq->dev =3D inst->vpu->dev;
> > >=20
> > > ---
> > > base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
> > > change-id: 20261119-amphion-non-coherent-f61009334dff
> > >=20

--=-YgqiAaeSiZb24V1NgmpQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawXNXgAKCRDZQZRRKWBy
9GkwAPwNJIet0gUqj0ydjwWVNgkYu8wT8/u4PFCvg++Ui/l0KQEA6eoU6SiYf/UX
F82EobmwaRaUijkbtDkl6BqNdlVYoAs=
=1W/J
-----END PGP SIGNATURE-----

--=-YgqiAaeSiZb24V1NgmpQ--
