Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C53164AA
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003344; cv=none; b=YeLyM+J3w1mxd/d/FBIwKeqrio8m942M5PuqSUeVm6mtmnAQt/AqP6NGyZsSrlXGSOVOyLgyhdKrL/sAGuTxXxyBha/AEuabALnMfYJ7EcRtkWiIf1z0R8jQIWwhTYQ0VMa53sM9t7pyh7U0M/6NHO+wDTqMBxMkSw1WgSRuX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003344; c=relaxed/simple;
	bh=bxmKGsJTJisCtns+15qvoCzCCx6vK1+GxtJxYfeFUCQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EqCYCj0A3F0f3U2Mob+SjO5pWZ28EeaaL2Z+SnK7H/j8z0XP2pYMvnzHWMvA83wBIoV6RVCPgMsoDJnvca4aDyovQ/lJlD+J4yMe4gDhaog8ukJwwk9GWpaT8wdvl2oyYqJRiN7iWnpypIbJ7RW+u3LJC9/NpzNK23sjCfPnV5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=s2MCLutn; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="s2MCLutn"
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-8823dfa84c5so52137606d6.3
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 08:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764003340; x=1764608140; darn=lists.linux.dev;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nKIC2CnjvpsH+988+n0uBSnBhbCVNIs2cJxnFtBcQ5k=;
        b=s2MCLutnsB87t5KtkrNyNvENSyLG4/UbEtrUog8yQdd4C1S0ucZIlnGiM51qzf/7TR
         TNBI9ZXPRDPskGXTO61339g3EhKF0s7DAeuCyrfzF3iLeX2wH4PXJ2w2/SKcg5uZxKdx
         xqoYvi5xE5YciHggEkkozx4wC/dW1fIDrwmjP/7YrNkAYGrjVu4kh+HbDMp+KliOece/
         O+trr/Q/qZOTo9eSW3tC0psB3UFzcnVoIDPdsubLxlr1dLesSGRooobzdrQZOaJP2Rny
         Uvbe9EI6lFQ6FLSlvVYWHRZFGys5xMI3q5tCBoRLDo2IfZD/RvxRmq4wKinGgIK21qEo
         C29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003340; x=1764608140;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nKIC2CnjvpsH+988+n0uBSnBhbCVNIs2cJxnFtBcQ5k=;
        b=fZ2ErlfcpWpe/eV4/G1083KcRdu6ODwqkcQfxEr23TFac1LpNEuVJIKzlkLK8u+2x9
         4/OFl0vbJ4XDF6B0ZhJTByLE841wfEDmLka1CVXG7edW8QzhoEsJU4wht4/I4KVZiOoF
         ehk2rxfDR6bQF0R0jCA6spScP+LqcCO/5FB9s+aqFFYKuwExeFLuYBKpRGU4KDc/0eEF
         ejhbieFXJqtk+yGDylv6T1eenIpIMR6fHEERo92Iha4xvKt3cOpbSYJkSdpvSDDkJdm7
         EZChiRheAhUz2wud2hfAonywM4ljd9oIdoSaP+5mSDj5s1yoJnwQ72mcbDB8dpWxMjny
         wLWg==
X-Forwarded-Encrypted: i=1; AJvYcCVWa57tmd/IjaGTOvftE/e8GLB/DHuiCoMZq9YNhZvsKMxln75oknJIDYoRF5F5ahx1hcU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yza/QICmEFZ3nO/5r+0ek/NonScGfX0zM3vYPrUiELL6gSXQQ/Q
	sX+05vViX/t0K9um1oW9DkbF52a40yD4+wk1BPyz8aPnFifp0tfd662zzb6khHJjMmM=
X-Gm-Gg: ASbGncs/GzaCgIMjWvc538ofzW/ZpCxkwwrzPWROFVG+GgBoOVYnCRRISISPEkXcvVy
	AUNGjYR7rayY6+yeDue3lPCIJ7noVdtA/EKos+YCRGeRjw5MaaTnYmeyCiY+PMFhjKRL4BBVzdW
	W88ri+IeCvYRvQUZWmk9oh56tYZmEFsuh62kAJhcnTWPDXu9vCsPWDI5kZE3rRuSvn8gmqt6bw1
	leI3tUcOWnP7WDtLwuFlQL0BdzGxGYT3oTof+U5TYGYTRsvil0FE0RGUEqGkPzZbVNng2RSvhyM
	AJRcTR1UQwDBIneH5ZpZsuwAHgn7w7DBs8AQL+WZ9iTYpMtEmSx+CiUVBV62fvzvBTpnacpb5VC
	YpbL+T4xneRt1FYXHRKQOz5YZJXlY0m7fk4oHKScsjaWPnVNW8jRwtgF58B/ej5eYBFJtbfeTOu
	Bkvn65KwS8kR5owXmQ
X-Google-Smtp-Source: AGHT+IGvb6OSfhjD96Tta1mqwKgxzHProLkPjajJethJLmJaGb1/+UkSU3wc6V+DVMtcPYYdbjPJmQ==
X-Received: by 2002:ad4:5b8f:0:b0:882:4be6:9ad2 with SMTP id 6a1803df08f44-8847c511566mr194501866d6.33.1764003339847;
        Mon, 24 Nov 2025 08:55:39 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54c84esm100992886d6.30.2025.11.24.08.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:55:39 -0800 (PST)
Message-ID: <020d1263315b8a5ff3fdfb46d61d0108cdfa5bb3.camel@ndufresne.ca>
Subject: Re: [PATCH 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, 	s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, 	linux-imx@nxp.com,
 l.stach@pengutronix.de, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 24 Nov 2025 11:55:37 -0500
In-Reply-To: <baec095da2b7b84be19b205b18e765f9a2305574.camel@ndufresne.ca>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
		 <20251121081911.1682-2-ming.qian@oss.nxp.com>
		 <aSCOZCJ2rSw7LAvE@lizhi-Precision-Tower-5810>
		 <d282811a-866d-4ca8-b9f6-fc1da3a7565e@oss.nxp.com>
		 <aSR+eaVxBhnahOl7@lizhi-Precision-Tower-5810>
	 <baec095da2b7b84be19b205b18e765f9a2305574.camel@ndufresne.ca>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ljeP6A7MDSCCnSfU19m1"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-ljeP6A7MDSCCnSfU19m1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 24 novembre 2025 =C3=A0 11:39 -0500, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le lundi 24 novembre 2025 =C3=A0 10:49 -0500, Frank Li a =C3=A9crit=C2=A0=
:
> > On Mon, Nov 24, 2025 at 09:38:15AM +0800, Ming Qian(OSS) wrote:
> > > Hi Frank,
> > >=20
> > > On 11/22/2025 12:08 AM, Frank Li wrote:
> > > > On Fri, Nov 21, 2025 at 04:19:09PM +0800, ming.qian@oss.nxp.com=C2=
=A0wrote:
> > > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > > >=20
> > > > > For the i.MX8MQ platform, there is a hardware limitation: the g1 =
VPU and
> > > > > g2 VPU cannot decode simultaneously; otherwise, it will cause bel=
ow bus
> > > > > error and produce corrupted pictures, even led to system hang.
> > > > >=20
> > > > > [=C2=A0 110.527986] hantro-vpu 38310000.video-codec: frame decode=
 timed out.
> > > > > [=C2=A0 110.583517] hantro-vpu 38310000.video-codec: bus error de=
tected.
> > > > >=20
> > > > > Therefore, it is necessary to ensure that g1 and g2 operate alter=
nately.
> > > > > Then this allows for successful multi-instance decoding of H.264 =
and
> > > > > HEVC.
> > > > >=20
> > > > > Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> > > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > > ---
> > > > > =C2=A0 drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=
=C2=A0 1 +
> > > > > =C2=A0 .../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | =
26 +++++++++++++++++++
> > > > > =C2=A0 .../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 4 ++=
+
> > > > > =C2=A0 3 files changed, 31 insertions(+)
> > > > >=20
> > > > ...
> > > > > =C2=A0 #include <linux/workqueue.h>
> > > > > +#include <linux/iopoll.h>
> > > > > =C2=A0 #include <media/v4l2-event.h>
> > > > > =C2=A0 #include <media/v4l2-mem2mem.h>
> > > > > =C2=A0 #include <media/videobuf2-core.h>
> > > > > @@ -93,6 +94,9 @@ static void hantro_job_finish(struct hantro_dev=
 *vpu,
> > > > >=20
> > > > > =C2=A0=C2=A0	clk_bulk_disable(vpu->variant->num_clocks, vpu->cloc=
ks);
> > > > >=20
> > > > > +	if (vpu->variant->shared_resource)
> > > > > +		atomic_cmpxchg(vpu->variant->shared_resource, 0, 1);
> > > > > +
> > > > > =C2=A0=C2=A0	hantro_job_finish_no_pm(vpu, ctx, result);
> > > > > =C2=A0 }
> > > > >=20
> > > > > @@ -166,12 +170,34 @@ void hantro_end_prepare_run(struct hantro_c=
tx
> > > > > *ctx)
> > > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(20=
00));
> > > > > =C2=A0 }
> > > > >=20
> > > > > +static int hantro_wait_shared_resource(struct hantro_dev *vpu)
> > > > > +{
> > > > > +	u32 data;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (!vpu->variant->shared_resource)
> > > > > +		return 0;
> > > > > +
> > > > > +	ret =3D read_poll_timeout(atomic_cmpxchg, data, data, 10, 300 *
> > > > > NSEC_PER_MSEC, false,
> > > > > +				vpu->variant->shared_resource, 1, 0);
> > > > > +	if (ret) {
> > > > > +		dev_err(vpu->dev, "Failed to wait shared resource\n");
> > > > > +		return -EINVAL;
> > > > > +	}
> > > >=20
> > > > why not use a mutex?
> > > >=20
> > > > mutex() lock here, unlock at hantro_job_finish(), if second instanc=
e
> > > > run to here, mutex() will block thread, until previous hantro_job_f=
inish()
> > > > finish.
> > > >=20
> > > > Frank
> > >=20
> > > G1 and G2 are two different devices. If I were to use a mutex, I woul=
d
> > > need to define a global mutex. Therefore, to avoid using a global mut=
ex,
> > > I only define a static atomic variable.
> >=20
> > static atomic varible also is global.=C2=A0 Global mutex is allowed if =
it is
> > really needed.
> >=20
> > >=20
> > > If a static mutex is acceptable, I think I can change it to a mutex.
> >=20
> > ref to
> > https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/base/core.c#L=
43
>=20
> My main concern with either of these approaches is that it kills the abil=
ity to
> rmmod the driver forever. The only working approach would be that both dr=
ivers
> depends on a third driver that provide the synchronization services.

I do realize after the fact that my answer is a little off considering its =
a
drivers against itself (not cross-driver, that would be a huge pain if it w=
as
the case).

Checking further, the ref to the counter (or mutex) should cleanly be gone =
by
the time the driver is removed, so perhaps its fine, though best to test it=
.
Though, in both cases, I'm not happy to see code that will wait for multipl=
e
milliseconds on either home made mutex or a real mutex. Adding another arbi=
trary
timeout is also not very nice either. The current software watchdog already=
 get
in the way when testing simulated IP.

I know its work, but what about a recounted singleton, with a notifier so w=
e can
schedule work when the resource is free ?

Nicolas

>=20
> Nicolas
>=20
> >=20
> > Frank
> > >=20
> > > Regards,
> > > Ming
> > >=20
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > =C2=A0 static void device_run(void *priv)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0	struct hantro_ctx *ctx =3D priv;
> > > > > =C2=A0=C2=A0	struct vb2_v4l2_buffer *src, *dst;
> > > > > =C2=A0=C2=A0	int ret;
> > > > >=20
> > > > > +	ret =3D hantro_wait_shared_resource(ctx->dev);
> > > > > +	if (ret < 0)
> > > > > +		goto err_cancel_job;
> > > > > +
> > > > > =C2=A0=C2=A0	src =3D hantro_get_src_buf(ctx);
> > > > > =C2=A0=C2=A0	dst =3D hantro_get_dst_buf(ctx);
> > > > ...
> > > >=20
> > > > >=20
> > > > > --
> > > > > 2.34.1
> > > > >=20

--=-ljeP6A7MDSCCnSfU19m1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSSOCQAKCRDZQZRRKWBy
9HqhAQCHP5ZntFVjhc+JmmT18XRzd/2qvwhx74x5R7o/qW0ZEAEAvh2YL6yFIWqk
/QfAZZ+Z2oYT9qGwQPIYvYmogZK8tQ8=
=gS+Q
-----END PGP SIGNATURE-----

--=-ljeP6A7MDSCCnSfU19m1--
