Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0FF30E85E
	for <imx@lists.linux.dev>; Fri, 20 Jun 2025 15:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750432011; cv=none; b=JF3qtQ5GN14Nv/JCBuIvpIiDeLseL89wdHy0YntRitPLA4A0X9mkrnBoDBq4h1m4uD0rn++GCitfNj8KBOTlOTdgE/zECVZSURDa7K16YwGbeNcIHUEYYJtWr54xv2h+DEkU4/pV/Ve/kCbjGbmHBCtf12ipM1v+G4FbmA/n+Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750432011; c=relaxed/simple;
	bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PErDWeWAQb+p9oEX9UgrjiYyKsXF7wPobE4HZf9MH2qScQUIdDOCCIa8k/wfm2wPNUd+42iZDm1CKsAYahSwRUKUCiU/yVtQ7Dted7EJoUv7iXRTne6m4T439HNWQAR5x3PoczfqtyiZC6dDcdYK3ODMTBvUxD6aRYl3/pbJOjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=PpDvmULv; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="PpDvmULv"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso22572926d6.1
        for <imx@lists.linux.dev>; Fri, 20 Jun 2025 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1750432009; x=1751036809; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
        b=PpDvmULvtxl/92a3jzE+HHsiuOdnLYV5tkeaFmVidJprPvh7ZHSciEQIX8APe0jbDy
         8BD/9KODsUgobxi6HaFyZ817WvBhrVqXPHx256LMb3weopxSNksJdcpx67hVQtHNL6T1
         v1RnVmn1CG2BL2Ujx+dHKuO6gvNcqitTmcvT6PlvKNNYlET3QJtmyDOFrvBGztg8uIqU
         41EKD57epJiv3QxNAtkMkviO1/l/YbRcwZz6wIHkcsDqZD6OVEbJMtysg0XScTuWjCCQ
         veJx/L3WAtOJJ3k870oa52Lx6b+/KTQAFMAwAA6UhR5H5+18d9NJlUiXq8nWfAxkyySM
         iRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750432009; x=1751036809;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSJDkcrrLoGkZMF1EcEy87q2AqYWTZd7Xq9u6uACDbA=;
        b=PNAGTRxtFn9wR+H73QZX4EHBeDTKCT2VYZ3ONedEFFlv7EgYAadC3zKVKQ8MOukAIh
         DqxQoKbkr2a8JNWOEomTSdu2Cz5juvMOS4pLqUbaoIVZ5tXMVhHqkyH3lClggvIAiPKt
         uy6JJEm7pvMxO7WNn0IX9lOc3lLCdbXjC0qA8F60R5uGr8kX0Rz9xffhpm/jTf/iQGwL
         CZ3WfgteC/JAo7exCL3qI7Myjiw4DT/HBrgM7uwj+g7VcWPOyJgkjhdRFSqAfJ2/YIyl
         uBbHtKZ505nHwoNfIwx88r8EVypTIW8w8fg2STLyrwWc91c1j7aDXicirL0qluxCcPT7
         CPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuIQCIUQUbqnLdfp9+XDj7lOudGMbe8bump1uYKEq3/YX+3uOnPgyQvs+TGNW1Jb/BVLQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuVdyq2HaVp0ocXC7yyurTX+LfGS3/jAUH3lGOdwNAm2jZWkNb
	aS1iA6Z3T+Rw3CJIniR+hQEjopChnXdg3s3l3iescWrNuX3FBMOZt86Y6dBmNzUR8vo=
X-Gm-Gg: ASbGncum4asBoHtITYJP+phV9uVKjlc2dhUYN2LYzdCpDWZjvhuA/ecMkbjtvxibPpf
	MaltZCyyD25+3W1XJPo/LVSVmnexj8IOiAgy1CZL2nTqf1rW2O4o7vF6BFCNNSLzvIe1k3MKdQv
	ZePtVAOc9DIHq1No4Ux5GqTvda4145lmv2G5LQnk1I2+X3+MUBwB+Wdba1FNZr9h4CtANgyZTDk
	3I/cYobNP+CBkl5gtDMOnUN92Y/50bJRnu61CMxsv8gnOiHwgWlhspjVFVDoNgaDh3v4LJBqXhB
	KCAmjW9yIraXm29o1fozS2Lo8BKPLLDtvQjC1GJ5MXz9tAlCTPGS/DKpnv7xn1B4/74=
X-Google-Smtp-Source: AGHT+IFSbdWcJq6maD1xUyD31N97nxqkeERkrPfl+oPHZ7odb6VWFZL/FFDSL0pRREpka1+wvb6uPw==
X-Received: by 2002:a05:6214:2463:b0:6f8:8fdf:f460 with SMTP id 6a1803df08f44-6fd0a461262mr40636306d6.9.1750432009010;
        Fri, 20 Jun 2025 08:06:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b699::c41? ([2606:6d00:17:b699::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095a3f94sm12971696d6.111.2025.06.20.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:06:47 -0700 (PDT)
Message-ID: <82d38c0dc93255da3195a919dc650ef8fc07e7f2.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shawn Guo
	 <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	ming.qian@nxp.com
Date: Fri, 20 Jun 2025 11:06:45 -0400
In-Reply-To: <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
	 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
	 <aFORokzx/sImgDtA@dragon>
	 <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
	 <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0MU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT6ImQQTFg
 oAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBO8NUoEVxMPCGgRvEtlBlFEpYHL0BQJ
 oLLLGBQkJZfd1AAoJENlBlFEpYHL0BEkA/3qkWYt99myYFSmTJUF8UB/7OroEm3vr1HRqXeQe9Qp2
 AP0bsoAe6KjEPa/pJfuJ2khrOPPHxvyt/PBNbI5BYcIABLQnTmljb2xhcyBEdWZyZXNuZSA8bmljb
 2xhc0BuZHVmcmVzbmUuY2E+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyy+AUJCWX3dQAKCRDZQZRRKWBy9FJ5AQCNy8SX8DpHbLa
 cy58vgDwyIpB89mok9eWGGejY9mqpRwEAhHzs+/n5xlVlM3bqy1yHnAzJqVwqBE1D0jG0a9V6VQI=
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6BjHJSIIonN27c8RdqsP"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-6BjHJSIIonN27c8RdqsP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 20 juin 2025 =C3=A0 07:54 +0200, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 19/06/2025 19:16, Nicolas Dufresne wrote:
> > Le jeudi 19 juin 2025 =C3=A0 12:27 +0800, Shawn Guo a =C3=A9crit=C2=A0:
> > > On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
> > > > Hi,
> > > >=20
> > > > Le mercredi 21 mai 2025 =C3=A0 13:34 -0400, Frank Li a =C3=A9crit=
=C2=A0:
> > > > > Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc",=
 which
> > > > > are backward compatible with "nxp,imx8qxp-jpgdec" and
> > > > > "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which co=
mbine
> > > > > wrap and all slots together. Reduce minItems of power-domains to =
1 for
> > > > > i.MX95 and keep the same restriction for others.
> > > > >=20
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > >=20
> > > > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > >=20
> > > > Krzysztof, will you take this one once the DTS part is ready ?
> > >=20
> > > dt-bindings is the prerequisite of DTS.=C2=A0 DTS patch looks good to=
 me
> > > and I'm waiting for dt-bindings part to be applied first.
> >=20
> > I was waiting for sign of life on the DTS part, we usually get some ack=
,
> > which is good sign we can take the bindings.
>=20
> Such process never happens. DT bindings are the prerequisite here and
> platform maintainers wait for bindings to be accepted before taking DTS
> or even sometimes reviewing DTS. Why even bother to review DTS if it
> follows entirely incorrect binding?

You are the one requesting DTS with DT bindings for review purpose. You've
done so regularly this year.

As for review process, Ack are a workaround to a black whole in our review
process. Patches without any reply can either be un-reviewed due to lack
of time, or accepted. You do whatever you like, I'm just saying that clarit=
y
can help to coordinate.

regards,
Nicolas

>=20
> Best regards,
> Krzysztof

--=-6BjHJSIIonN27c8RdqsP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaFV5BQAKCRDZQZRRKWBy
9KazAQCZpPC27cOiLrCeirOx9KtegKeVBpOKvNdcjZFKHZg+0AD+OJGvNGaHn+Di
rFaOSJG8M735rmjWeSPrkNAWKU2s4Qc=
=Chy2
-----END PGP SIGNATURE-----

--=-6BjHJSIIonN27c8RdqsP--
