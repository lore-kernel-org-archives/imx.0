Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7B29B8DD
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002389; cv=none; b=t79oPUJ90P1zVIWtxYlFclpcSMqyHe5TreFv8Pc41auvfK1G5i8d+udGvtxB2oXM+EVrTfoXiDYBrEfybJRrpz8ODg9KPj9gNDKrwR0Gj6GNQ6Bg8TfeiMr9gkb6NIc83WNwiUckl4gKCeDn7Vy1M8qjCp/mgurc+Jz0Kz5ocVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002389; c=relaxed/simple;
	bh=5l6CRo/azRe1VajN8G2idPGnbGPFBO48LaAcHce2FcQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KqXAW1EAA+asSfOWatKrnDFWk/64KASL0mmbPY1bg6/ojXx/z+xCkBfFwK0mSIWQV34ntMVVW28Hv47JGcTrYS2zJmcYjOjLYwMKiZqiCq/DnszgDg3z/bvpfhwfxmEQxGazBaCyU/OP6Jiz80nT5LjJzk69YEZvVvHJcHzMVvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=swkv55di; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="swkv55di"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8b2dec4d115so452373385a.0
        for <imx@lists.linux.dev>; Mon, 24 Nov 2025 08:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764002386; x=1764607186; darn=lists.linux.dev;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9iavF5wgAHC4K4vBJKSRHkahZUTo4v4P/ufyYmBWGak=;
        b=swkv55diZ+DRHWRYKH85Jmk7FiEdb0H0fvqsA1Ft/6oq7Bbc9KguYTCJqogUTPFOkC
         pRGkpaWUz5oRVetyTjUKah628D3w2qeIIylj/7vBsiEep8GlXZE4v+krbgNFGqP9RN0L
         VJnPRBppIZHJ8LOqJmZboqx3HHCK6K4f4JgQws2DDfAXL/RCsCoKQXHWcYo/HoEl2v60
         +lqYemjim7Uq/2UzXwpGz94exiYwXuXjM+CokYwwldoC9oEb0qghXe0eVXmv4SwW/fwU
         FNSFsSii5hQcs+SRzOR7pJTGGieZEotoLQF1VlXNNkHzDCflAF5RCbz2QXqUxjx6FcSZ
         ybuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764002386; x=1764607186;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9iavF5wgAHC4K4vBJKSRHkahZUTo4v4P/ufyYmBWGak=;
        b=v06MhKakc9j7jig8ChRiMEOo8Hu5ByPm0mz8QtbVY5eWeWlBceh7gWZN4bSJF3oiFA
         oR3nbaGQRF91tXj1VnqeGQVu3nz27XrTKWaMdA5Nk3loCOr/SRbG95zbNdJNmzD4g+Z/
         eD+EZd/R6RVUhLVoAQfwDa4GBbL+l/qEEizqZH6vsOOaDLwlX0i7bm+UHQnqo3CQ142s
         f45s115nzFchccalSUY5pryOapwB58XkKul/tsxod3uAolc+Qydxzntd+ZnAulLAE6rH
         ajDk+CaFVb5ptjgUiSr0taHHpx8B2nQnxU0k8iIDRZqi1eOdf+FunJDIB0/4Htc9kFlD
         iRuA==
X-Forwarded-Encrypted: i=1; AJvYcCXYbjaQyYqwsjA0aMtmyPwtEDj9GVqjIqfj9g1T7xD5+h6Ak0bXS3JtKsFKBFgh2UEq0m8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMktrnqj7oVG4muXwdsRL16axHIsMtcAFG1q+Dy4Q3eHa61Li5
	s3bZRaYRHaZUQGFtcCNdK/f1y62Qs9XVUI+qCi8eFiBBVnTL8mtBoKpSGi/LY4ixPJo=
X-Gm-Gg: ASbGncvK6asm8hzHgCtzjb60Myhco7OgxfYBugJDLiEe4o7fZqOESvlg2lu8u31Ww/l
	81+aiK6M08CwOj04LIUwvi+ySG16iBwDUvAf6sPfei1Mnih8T/lzUMBR/T7t3lxsB8q1nM9RI16
	p7vf8dDrqZwQwIS4Dv9tRz77jGMTQV9QJbRKFle4zWeYV31fqMEsEFDH0Y6z+T3uaIMmTzcWUH8
	x+mqxqK1w+cpzzAhDx+AOZEJovUylp6/vuPq6DdTTIONVSIHx5+2SRPrmQ2d1rC2V/TInxyLGuA
	dUNtckn7LjbOa4fNpPHOC0T1GqJCFqUYAi4+yH15Chn0vMw19AIOH0T6bWel3fBf5+cIsYmAT3o
	VAT1n4cu0ZnBP8a66xLVHL7xt3Ql04NUB0+O/8KCoH/aD5/es9AnMP//QPXhRxkLF3CV6RF2jJ3
	zaB+I7LoBLVT6WfqnL
X-Google-Smtp-Source: AGHT+IEhf7zBXg2obuM0Wvyx3W1baR9UChFOPX2BoB/TIpveKMriV0p5s5SimoGLInp8YO2+ZvsNlQ==
X-Received: by 2002:a05:620a:701a:b0:8b2:1568:82ce with SMTP id af79cd13be357-8b33d4680b0mr1458433285a.37.1764002385770;
        Mon, 24 Nov 2025 08:39:45 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295db58fsm979338885a.37.2025.11.24.08.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:39:45 -0800 (PST)
Message-ID: <baec095da2b7b84be19b205b18e765f9a2305574.camel@ndufresne.ca>
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
Date: Mon, 24 Nov 2025 11:39:43 -0500
In-Reply-To: <aSR+eaVxBhnahOl7@lizhi-Precision-Tower-5810>
References: <20251121081911.1682-1-ming.qian@oss.nxp.com>
	 <20251121081911.1682-2-ming.qian@oss.nxp.com>
	 <aSCOZCJ2rSw7LAvE@lizhi-Precision-Tower-5810>
	 <d282811a-866d-4ca8-b9f6-fc1da3a7565e@oss.nxp.com>
	 <aSR+eaVxBhnahOl7@lizhi-Precision-Tower-5810>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9MfzEt4m6odi0eUBy2qY"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-9MfzEt4m6odi0eUBy2qY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 24 novembre 2025 =C3=A0 10:49 -0500, Frank Li a =C3=A9crit=C2=A0:
> On Mon, Nov 24, 2025 at 09:38:15AM +0800, Ming Qian(OSS) wrote:
> > Hi Frank,
> >=20
> > On 11/22/2025 12:08 AM, Frank Li wrote:
> > > On Fri, Nov 21, 2025 at 04:19:09PM +0800, ming.qian@oss.nxp.com=C2=A0=
wrote:
> > > > From: Ming Qian <ming.qian@oss.nxp.com>
> > > >=20
> > > > For the i.MX8MQ platform, there is a hardware limitation: the g1 VP=
U and
> > > > g2 VPU cannot decode simultaneously; otherwise, it will cause below=
 bus
> > > > error and produce corrupted pictures, even led to system hang.
> > > >=20
> > > > [=C2=A0 110.527986] hantro-vpu 38310000.video-codec: frame decode t=
imed out.
> > > > [=C2=A0 110.583517] hantro-vpu 38310000.video-codec: bus error dete=
cted.
> > > >=20
> > > > Therefore, it is necessary to ensure that g1 and g2 operate alterna=
tely.
> > > > Then this allows for successful multi-instance decoding of H.264 an=
d
> > > > HEVC.
> > > >=20
> > > > Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
> > > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > > ---
> > > > =C2=A0 drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=
=A0 1 +
> > > > =C2=A0 .../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | 26=
 +++++++++++++++++++
> > > > =C2=A0 .../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 4 +++
> > > > =C2=A0 3 files changed, 31 insertions(+)
> > > >=20
> > > ...
> > > > =C2=A0 #include <linux/workqueue.h>
> > > > +#include <linux/iopoll.h>
> > > > =C2=A0 #include <media/v4l2-event.h>
> > > > =C2=A0 #include <media/v4l2-mem2mem.h>
> > > > =C2=A0 #include <media/videobuf2-core.h>
> > > > @@ -93,6 +94,9 @@ static void hantro_job_finish(struct hantro_dev *=
vpu,
> > > >=20
> > > > =C2=A0=C2=A0	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks=
);
> > > >=20
> > > > +	if (vpu->variant->shared_resource)
> > > > +		atomic_cmpxchg(vpu->variant->shared_resource, 0, 1);
> > > > +
> > > > =C2=A0=C2=A0	hantro_job_finish_no_pm(vpu, ctx, result);
> > > > =C2=A0 }
> > > >=20
> > > > @@ -166,12 +170,34 @@ void hantro_end_prepare_run(struct hantro_ctx
> > > > *ctx)
> > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(2000=
));
> > > > =C2=A0 }
> > > >=20
> > > > +static int hantro_wait_shared_resource(struct hantro_dev *vpu)
> > > > +{
> > > > +	u32 data;
> > > > +	int ret;
> > > > +
> > > > +	if (!vpu->variant->shared_resource)
> > > > +		return 0;
> > > > +
> > > > +	ret =3D read_poll_timeout(atomic_cmpxchg, data, data, 10, 300 *
> > > > NSEC_PER_MSEC, false,
> > > > +				vpu->variant->shared_resource, 1, 0);
> > > > +	if (ret) {
> > > > +		dev_err(vpu->dev, "Failed to wait shared resource\n");
> > > > +		return -EINVAL;
> > > > +	}
> > >=20
> > > why not use a mutex?
> > >=20
> > > mutex() lock here, unlock at hantro_job_finish(), if second instance
> > > run to here, mutex() will block thread, until previous hantro_job_fin=
ish()
> > > finish.
> > >=20
> > > Frank
> >=20
> > G1 and G2 are two different devices. If I were to use a mutex, I would
> > need to define a global mutex. Therefore, to avoid using a global mutex=
,
> > I only define a static atomic variable.
>=20
> static atomic varible also is global.=C2=A0 Global mutex is allowed if it=
 is
> really needed.
>=20
> >=20
> > If a static mutex is acceptable, I think I can change it to a mutex.
>=20
> ref to
> https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/base/core.c#L43

My main concern with either of these approaches is that it kills the abilit=
y to
rmmod the driver forever. The only working approach would be that both driv=
ers
depends on a third driver that provide the synchronization services.

Nicolas

>=20
> Frank
> >=20
> > Regards,
> > Ming
> >=20
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > =C2=A0 static void device_run(void *priv)
> > > > =C2=A0 {
> > > > =C2=A0=C2=A0	struct hantro_ctx *ctx =3D priv;
> > > > =C2=A0=C2=A0	struct vb2_v4l2_buffer *src, *dst;
> > > > =C2=A0=C2=A0	int ret;
> > > >=20
> > > > +	ret =3D hantro_wait_shared_resource(ctx->dev);
> > > > +	if (ret < 0)
> > > > +		goto err_cancel_job;
> > > > +
> > > > =C2=A0=C2=A0	src =3D hantro_get_src_buf(ctx);
> > > > =C2=A0=C2=A0	dst =3D hantro_get_dst_buf(ctx);
> > > ...
> > >=20
> > > >=20
> > > > --
> > > > 2.34.1
> > > >=20

--=-9MfzEt4m6odi0eUBy2qY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSSKTwAKCRDZQZRRKWBy
9I6lAQChTt9rXsTyp+alYyrA7Oe8CReteB0yVGS6rHYuqIhe1wEAiasfKosen86t
jj/9bnBTj+RVfWUI5e4CEn7uH8QRMQM=
=aSTR
-----END PGP SIGNATURE-----

--=-9MfzEt4m6odi0eUBy2qY--
