Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728204;
	b=tvd93Ocv1RQzI1YqazZVaqi2FwCTbFq/0it3eU3XKbzRKYoxZ9URvpgQHaXwq3bqXqkK
	 6baEzGOUXiahC0iejLa2GjKBA9Qk6c6E5TcySrOq/ciwciUKrNIJVappnlxllJAp8wC9e
	 7vxNWYjY1+WkCp+DWEimgjhXY3eQBy+Bm3kC5Bfx9x1DHt/LWemb+GevZhiUzj6XEUIXY
	 9x2TtXUvucxj9omds9f6BdNlt5yWXsgPeJw1RXo37Mhu/UZwM4UU8saI3GlDN8IK+6kxp
	 Kwahw5nOEiZghkaM904LdYP1ZsMkRbSC8hqKjE9wAsGZY7XboOW4JUGX/jUFWYBPUvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EvBKZYbsyPjC/KbvTWeWl/x1jiG+4Pze5t2xnn/ZrCU=;
	b=1Qe5+Gv0rGAfYvZIld1YrPx1i+xeEgoNtXBxs6XWGvjPS2OGR9pms+8AUsbSVDWqVCnY
	 Jb6m9T0Goii29CJLr/E9pEWt1JFXNSAgoM5gmBGuyaczqYJJpM71uNTQt4/wqNt7auCNv
	 BmeYnZ1cwqc7aaPubQ6b+AX0zynQ1RXGHnJ8ncxzxXDNfLho9IFqLIu8+LASedK0oi4RF
	 TmvuZDGUA3PuNNQMrEcH+IZfGC33TDLi9yE4ujDuK43jZrI7KWG76Q1If0SEvo1sAqrdc
	 rEICko+rewpTvSG+OFxphrPS16lC3xvkr8K/YSCWKjYsA3RfJgcvzKnStK79DvEIkww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="UaX/aZf1";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B05606A32D
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 17:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4B05606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UaX/aZf1
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso41970995e9.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 09:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793728201; x=1794333001; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvBKZYbsyPjC/KbvTWeWl/x1jiG+4Pze5t2xnn/ZrCU=;
        b=UaX/aZf12880GWli59/J0zjmp5UBa2TziSknod4Xz1Bv/xTs6G3+PsKVV1JMNJFv1Z
         gSyF/1Dl17DxrYgEncdhDPfCsj+A2uveR4N1+rnWZu1up6+/X+xUNcSV68VltpOQ/OqH
         tNPjvJQLoATJGrH31StJh+GAAZ2pNpM2KJFQjw6GL/+B1776k4qPBqIEWuu3LhDLMNP9
         /aig10lj7HAjfLHn7jnAr/MPEXt8+arec5BHyuzRtdc6amAdTM4m1P5BcPQLnuQ8rc6Z
         iOVIrZGIhYDu9+kI3qfEIb1mEFYZSsPlmqSPJ6WCOapSqMlecjG/wG85tqLvxswAhDpG
         KDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728201; x=1794333001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvBKZYbsyPjC/KbvTWeWl/x1jiG+4Pze5t2xnn/ZrCU=;
        b=I3/B1ck+Ub46FaCNIkffEty7fg9gZ7Q/BgyHjo7ox1vuz4E43jV9i0k0gJG+XV2wqU
         FxaarjqT/JjgCyPZ/8QCZoMf02TrVYXZUXUlN3z7w5G3pqWiRsGysz1kBXLHghEUCUvx
         2MZvZwMFPCnf4Eilw4RQgCUSb9ehAHpQB1B6sxYRZpKUaytVqXYnQ5cw5AwRvTnku6Gr
         a2tX2fO3+IBRp2rMqwSQ9QIJSb7tP6RLNBMDlWHVg8RxJj6NJjbLyyz36X4UZIMAaPH2
         9/G0p/Ari9/ScenKM/2t/dNnPvY9X6R11aVlvfS1LzIo3z3o4AABFu2T5cq5uGe6xLnZ
         n4nw==
X-Forwarded-Encrypted: i=1; AKwUvBwiAYtv08ZtdxWlUkReJUHbF/2GldMKB6mCH1rSQEn7/c19su+0wcPDL/pvwOvV+Vf+kB0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+gxNRaS/uhd9NvzdbhEdW57Hh1M473X5FpNArdaH4KyC1fY5Dp
	VW7lv9IrxSWtlkarTtXKq5GMVZQzJzmp3n0C/GcDhjxahYiOOlACZkcjQRhkcGwxCj0=
X-Gm-Gg: AYBFou1Q3FAVHsOeK29+DWR4mF2ofKaQdcFA/m40KChIUiOmnrV1NFd0U6R4BP32eyL
	t49MBxS0PEuCOdiqSrJxA74jZgXhS9uzQwnov/wm+TBk5+0ponivx9uM6pkrKuNjPnkfFiElFiK
	UpQ6PaTLSLrqr+JkH1jmM90Hh+yunhxXJK36zB2gebrFaVzwcxoOlJXfaaMZztelud4fKx7rKCM
	XFhdeVQPT4E5f7eG6O/5udDfRpSqxsQUP9d/a4TOhLZZy+FwEkxNeYMoWd8a96kyxUwPwtqbYVe
	4/jd+WZn1TarnHs3gxqMD4oG2295z9IOFJpSL6b7yhlx46w/71odXHaDu/Q8e08++Yw3u2GLhxN
	W+Djt4YIdbdqcpiZtf1bNDJsW1rwZiubr7i4rB4nZQXfYAud5EjkIutnYEnAdXHuhVQVZy9iDw0
	oegDzcRCSUFzFFxFv9+lpWAmR2rnr+B/5CdV1EKcxIn8bbPN0tGcJIW2BF9J6aGD/UBECTft6wb
	Uv71JCZC0/lLBAjsA9p/w3exddtHa1Ax3C3CAgbDLkv4Z8EoTmJxTssRdtKr99ATfQtaHl9Kg5O
	m97vb3j4CoY+JycAho7hEPOKe+QpS1TFBefN4Pk9noVGEVD3Gfu7WEcwDTTCeS1poptFsWEFJFN
	zoRY/hmkLWxVdzg==
X-Received: by 2002:a05:600c:674a:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4ac14ec788emr319488995e9.3.1793728201219;
        Tue, 03 Nov 2026 09:50:01 -0800 (PST)
Received: from localhost (p200300f65f19a9048e0e65dd41210f6d.dip0.t-ipconnect.de. [2003:f6:5f19:a904:8e0e:65dd:4121:f6d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e71b80333sm28497156f8f.32.2026.11.03.09.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:50:00 -0800 (PST)
Date: Tue, 3 Nov 2026 18:49:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auod0uYPow76TEb8@monoceros>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
 <auoAZs66RA5OYjJo@p14s>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqt42yzt45wmalce"
Content-Disposition: inline
In-Reply-To: <auoAZs66RA5OYjJo@p14s>


--tqt42yzt45wmalce
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
MIME-Version: 1.0

Hello Mathieu,

On Tue, Nov 03, 2026 at 09:40:22AM -0600, Mathieu Poirier wrote:
> On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remot=
eproc/remoteproc_elf_loader.c
> > index da3cddbe7d4c..3c749a39e5da 100644
> > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, =
const struct firmware *fw)
> >  			break;
> >  		}
> > =20
> > -		/* grab the kernel address for this device address */
> > -		ptr =3D rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > -		if (!ptr) {
> > -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > -				memsz);
> > -			ret =3D -EINVAL;
> > -			break;
> > -		}
> > +		if (rproc->ops->memcpy_tova) {
> > +			ret =3D rproc->ops->memcpy_tova(rproc, da, elf_data + offset, files=
z, memsz);
> > +			if (ret) {
> > +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: =
%pe\n",
> > +					i, da, ERR_PTR(ret));
> > +				break;
> > +			}
>=20
> I really like your patch, but I'm wondering why you decided to move
> rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both p=
ath,
> i.e with and without ops->memcpy_tova().  Wouldn't it be better to
> unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?

The reason is that on ADI's SC846 the memory for the remote processor
isn't directly accessible by Linux. So there is no virtual address for
the given device address and thus the implementation of .memcpy_tova()
on that machine won't use rproc_da_to_va().=20

Best regards
Uwe

--tqt42yzt45wmalce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrqHsQACgkQj4D7WH0S
/k4sjAf/W9Wh/o2zfPqQyyyOgx0wwKDVNUCFZ3gnMmbmk4VZdCin6ZavZplg6T+x
coNDAgnxOftZnuWR1SpiFa6XCTmAE5ZxvNLbwzw6DF+G4Bq+z2ifELs9uZh/U0eo
HrJFd/MaHMCnZdw7Hr1emJPiegROrwq5psibMrjJItAbtrvyFUFKXQ+YKYY128Pi
8945jUEVVmAFRQ3nCV50qJW8+KPt36ZWnBRt8TjZHMMaHWuhLDuXsqUsCiYDkFnf
MeO9tFp+Aw2Nk78rkgmSg9kOauIt2+3ievOTOCN2haO43CYNx+In6f7GwLzSq2R2
Iffz8Diu7OmLg5+j4A7mG6jW7l/4RQ==
=MoF6
-----END PGP SIGNATURE-----

--tqt42yzt45wmalce--
