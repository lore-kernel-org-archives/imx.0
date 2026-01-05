Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98BB314B87
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636608; cv=none; b=H28UYKtOWaGNlpiNe3COwr8Nbn3NTu3IodCpxY/McvSVM1elxuNvrdbJ9OvDv0eFZgj/mwfAgn+XP0YcJ0jHZnIRNUlUgF94TZ/VqZ1DVPeWJN5yZH1TgHQPN/oDY7fVmtETO0iwWBPDoqaFuBR3eOypDVCKAz9vK4V/gak+bTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636608; c=relaxed/simple;
	bh=aOnfX3XPhgpVehluEO+HeLrdEIbIUxCCiC8mUuqAjdo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VKd0usrnenwA9XSbdKsAs4P1gjA8DHTKTsVo1dIK1Wh0hYiSeHWQFbP43NijLdhgAfpnqpV0r9v2qqPXGPRdvQqN3BhcPdT0BcBI9mmMz7WXqNuFW/CaSqJnL/ufYJ3tfOIjFEi6Vqc8mns9U3oRZrkFRPyqWypkf4zDO8MSb/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=zFSPKirQ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="zFSPKirQ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b25ed53fcbso22959185a.0
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767636605; x=1768241405; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aOnfX3XPhgpVehluEO+HeLrdEIbIUxCCiC8mUuqAjdo=;
        b=zFSPKirQOsYtPSBz4ZZu1eQmpgs6Hv8wWKGEl+6/5MC4ZlIaOLkfHC/KOCufTXXaJz
         bfdi5KGVQ+YKo80BnFK2f+lsq7dEZ496AOma+SFuJ3D75JGO+eyLd5nDq7cF0ATBV1ge
         thzP3HlQjR8cjEr7sMjlZmCA0HfhE8fg2aBC97k2OKKFoNDkHyXCgNWyha5JBvnsC+rU
         Xk/WzZQaTGtW+lWlc4qavvcb+6mjiPdqwdYv4Xb0d9FzDjF2k6SKkgR7aPD//RJ0YIv0
         Qu8IEVe6uUgc1TjmYq7WA6daV0+aOMNg7bWgWlYEBPNdGpHe7hBLJZWNLam0ihGnULhM
         7Ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767636605; x=1768241405;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOnfX3XPhgpVehluEO+HeLrdEIbIUxCCiC8mUuqAjdo=;
        b=PeRfyhBD5uZPVq5P3+y5ZV3c5kQKMFdlgNoL/kWqJ6BX2VRnwcq+qWRgZP+a8sgZFf
         rB9D7ZpxMUUJjWkNfepFEHL7+xtt3m6tCIoGzRKKkjvF98oHkRoU55VSS7vGCyUAcYi6
         Z8bIKMgKzvGFhwBaMK7HlVwcRvPjrPpbixwg0qib4lJOKRXCZWoek5MXAy491RKBay2M
         4WOy4mX4YE7R0zGU3mTT09oaStTOWUmkBkHcYBXiRuh+onF6BXWlFTgnYeAMCB9PfsgQ
         H+tzZCtFxdhphFHdH/z0BATz7RSyfv1ZfTSMgZ65p0JyyQWqPYTblKfL7USKxM2jCL+j
         PRfA==
X-Forwarded-Encrypted: i=1; AJvYcCXnDajKB7BFPlhZLTwXvFbyZGcZafiaznCfV9XFcQhOZS3/mOf/16zGY/EVbd5eCNz+1b4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIzehoezUBKvgJo4L1amnlRRVq5mW4gkah8ucFfkqxhhLDAS3a
	LfbflxRvH8Tusc+Lb8VTRXDXHoBIbRFDB8dRFs6wp6VnrTUCXYdARaP71ovret/67iU=
X-Gm-Gg: AY/fxX5JUOyWMbkFHsORZBlXiu1OGzFFzyBGEnC3cP8WxhaujFJ4a8ID2QinsnwD4E0
	CfJRVpRJsP/A2U3/BpQDVg4AIXrObgNy+Hly+pZmtHR9IMbAtRrmgBUzkCu5u41tWd+prQvIq/8
	L0wQgcSfrld/LNWbTreXSpW+Pdeq7UvWg5luMjJOYCgjIGgBxB0GiycBkl8KBY5dbE0lVWUD1ls
	klxfsKyCkxWHdNbSYOFlGnRBedQf4WzvuzxBDkaiQvCm4UJKwaSU8MmJrRhpugVMi28TbqqC4aK
	BdauewQlwVb7dPyCGFVuwkaWr/x/t1QHCFbApIVWVapKJIeSNBbFoliS55KnpStTtyGPf1bNO2n
	nco2YlUab8zW2xylYPMMABIvOQuBJDnygYt8vi+mVEsycNx+97IqfeAEYYsBTdmi9GkXsX9H64T
	SMP0Q5fwHjgdIkqaapERP9qC3VvRY=
X-Google-Smtp-Source: AGHT+IFR3DFd9jpe0oN2x6M/8bWNFU8mAiEEjbZ9LTTfuDxwfvW0bq8zMCRJmYOp1ZK5Jd4YL/mM9g==
X-Received: by 2002:a05:620a:46a0:b0:85b:8a42:eff9 with SMTP id af79cd13be357-8c37ebbb452mr64060085a.53.1767636604517;
        Mon, 05 Jan 2026 10:10:04 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a9a19sm3638685a.1.2026.01.05.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 10:10:03 -0800 (PST)
Message-ID: <4d885ca36bef3e8227f8e0ee80bf5bcc3959e9ce.camel@ndufresne.ca>
Subject: Re: [PATCH v4 0/3] Fix concurrency issues between G1 and G2 on
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ulf Hansson <ulf.hansson@linaro.org>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, 	l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 05 Jan 2026 13:10:02 -0500
In-Reply-To: <CAPDyKFpFm9kCSNbALJTqeyzFdg3OoooE2gUOXJcjv=WgQeZ84Q@mail.gmail.com>
References: <20251205015428.643-1-ming.qian@oss.nxp.com>
	 <CAPDyKFpFm9kCSNbALJTqeyzFdg3OoooE2gUOXJcjv=WgQeZ84Q@mail.gmail.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-zvFzPoy3A7lV+wocoxlB"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-zvFzPoy3A7lV+wocoxlB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 30 d=C3=A9cembre 2025 =C3=A0 14:42 +0100, Ulf Hansson a =C3=A9crit=
=C2=A0:
> On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
> >=20
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > On the i.MX8MQ, we encountered some concurrency issues with H264 and HE=
VC
> > decoding.
> >=20
> > There are two main reasons:
> > 1. The vpu blk-ctrl don't have separate reset and clock enable bits.
> > 2. The g1 VPU and g2 VPU cannot decode simultaneously.
> >=20
> > We attempted to make corresponding fix to address these two issues.
> >=20
> > Ming Qian (2):
> > =C2=A0 pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8=
mq vpu
> > =C2=A0 media: verisilicon: Avoid G2 bus error while decoding H.264 and =
HEVC
> >=20
> > Nicolas Dufresne (1):
> > =C2=A0 media: v4l2-mem2mem: Add a kref to the v4l2_m2m_dev structure
> >=20
> > =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=A0 2=
 +
> > =C2=A0.../media/platform/verisilicon/hantro_drv.c=C2=A0=C2=A0 | 42 ++++=
+++++++++++++--
> > =C2=A0.../media/platform/verisilicon/imx8m_vpu_hw.c |=C2=A0 8 ++++
> > =C2=A0drivers/media/v4l2-core/v4l2-mem2mem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 23 ++++++++++
> > =C2=A0drivers/pmdomain/imx/imx8m-blk-ctrl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 11 +++--
> > =C2=A0include/media/v4l2-mem2mem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21 +++=
+++++++
> > =C2=A06 files changed, 100 insertions(+), 7 deletions(-)
> >=20
>=20
> Can I pick the pmdomain patch separately from the others? Or does this
> need to go together?

I believe you did already, and its perfect, we have picked the rest in the =
media
tree now.

regards,
Nicolas

--=-zvFzPoy3A7lV+wocoxlB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVv+egAKCRDZQZRRKWBy
9FfKAPwIfuzu0Oju3HLojCHI9FM9JdnnqW5c8KFbwAK37MdTNgD/erN0pVhummc6
5FGqJ5UvmnrrAGczimw1n6SlMWulQQk=
=CTsW
-----END PGP SIGNATURE-----

--=-zvFzPoy3A7lV+wocoxlB--
