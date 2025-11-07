Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CEA32ABCA
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762527035; cv=none; b=P31IgLEzX02YIhgDC7xho1NidrE0sHdzb0ZLIsyM6HHjQot+drfabyh+vQcWhp890OIKFq9iZWpRaJlN0MjDsrC69cWCRz2xqP67SdkwX5Y3SKBlzCV5dVUkW45Evd6fnoiKpoVooajWKpxzo0FEArTp1rPwYfh9Er384uPxafw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762527035; c=relaxed/simple;
	bh=rCNkb9pzNrqDFTfYtkOxauKhObKtplXkIA7x1oxsXi4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L86qD2TxmjzWyeOztx15g8qb+emsCZ/YcIu1/0Gi+E0GUBOiQgMc3nSIn8h3AYb557sDEFEm/DB5AIfcTk2Rur17VII4QkwH3clLp9ZB7Zp3Qawgli9DYWHOKUEPwVe4Ug4q0ZlWCGhhREza+PymFeHEnn/LCH38MpdfOcd27C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=a0nt9nv2; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="a0nt9nv2"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b22efd44d8so94118285a.3
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762527030; x=1763131830; darn=lists.linux.dev;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rCNkb9pzNrqDFTfYtkOxauKhObKtplXkIA7x1oxsXi4=;
        b=a0nt9nv27TZ4QJyzMSX3lwtd+NLnE9AhBlRgRO3idTupy8lftcgiwjFpGFmPDTlO0X
         qfb4hYoFof2T4j5C16P25WWUKcGN9IuvB4AMSLSY31VXnK9/My+usmjBvT6bfWfQ6NP3
         s+U+wSRSX79GMiRBI7JSpxlCKyPFRph/pWp814h/52THlx8Bep8VkgBtc62d4tnTUkfV
         czYbQ/+9i5Ax5AggAwOUVY7kF9vxMT35JoQlXKOtYyrL1nNjiISXc7RQYfqt1/YYRuLn
         Tc3MK5eS9oJTZBXIJwcH4dzlaKkTiMk2ngi57oIoAFKlg1ozuQb+MMfUIxbRPSfqfVPc
         o6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762527030; x=1763131830;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rCNkb9pzNrqDFTfYtkOxauKhObKtplXkIA7x1oxsXi4=;
        b=VoJKQbVqRy8VQ3cm/XsDbqYv/8jtz4F/bxGSMxDIapN15V4xWQsaBKBLyCljbcMnjt
         gzBeaBmTod1Vsp+dn2/T2IPShDLIfQWMutBJPpK57odgsUtB1EYs+owLe1ck3wM0N7z6
         tTqzbc+wrq5r3xIG/qrwlRquII2aKiQO8IbvDGz/8AR556mb5DBkq8v6BNG87D9rtAi1
         LRwArKqA5YPg4qW4e+Y7ywkuukxI49JEOFKcV8hGhug0I3hmbe2brCnECzG5o6WxXnyH
         nhjLlaRdzgzROe5vz/QSA712/SpUAOO4KCr5J+ja25hTwux41eikKv2BrD1HXyQklyUK
         BOUA==
X-Forwarded-Encrypted: i=1; AJvYcCXx5zFS3+GnvGaZVwkOTccJlB3DHM3fAFeU8rffu6rw+IUSFRRqnVMD5lyg6SNhdITDfZ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOBVLKaYe7TR+0TJMG+shiIvh5iEk7QPld8sUHoWPN5e/4LAQO
	2yTme7vAOJLIbkg6hOUY4Khyg7mhp5qRZURFhLYUvOxqBDwFKJQ9IYWmc88L5E9U1IY=
X-Gm-Gg: ASbGncvWdVkb6zbJ/Egn4NznVKI6Pm9ZJ7TNpyC+lvMxicYfWaYH5AbF+5HOybG8cjy
	KGSjkPdPKIBRf/a4cufkoAecMywDtBFlE3XATkGOGevq0/xQphPGI41YeHuiSFD0A79JNbBg+A1
	+yxqE5w0koNIqNWbAAdYv1MaqjccL8CtPNFFwlw6wz3v+PpP84PsC6TJmmqHixRgFGCkIN+z6kF
	PGYD8rS4z6i51cSaVKyzs/zj5mAOq7WMJAT/jo45zqmr+JypS6xulSRsp5lAqL+sFYbsuuTOcVK
	d0U3hT/4MGopWnFEvZDirmtXv/Euy1eCsXAZs5ms/nQ/ffH8MGenq8b2GXyl2XJGS9T27hQt5B6
	w5mXueFMB+M9txTKyKRRN3uCurdOGbXTxJciUayJbnzfrl73WIolgvWF9o9gik7yMtfBwpRigWZ
	d6MR4AYaWkRHtE+ra0
X-Google-Smtp-Source: AGHT+IF19jZG8V4gtAHEGC5v+53YAOJOwKlSf5LHBbsF7OEIQOjrxRqEdEvXBBLd4UJL6qEVJkgbDQ==
X-Received: by 2002:a05:620a:2697:b0:891:6891:5668 with SMTP id af79cd13be357-8b245351ec4mr451627785a.63.1762527029440;
        Fri, 07 Nov 2025 06:50:29 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:ef24::c41? ([2606:6d00:11:ef24::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed8131b371sm40453501cf.8.2025.11.07.06.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:50:28 -0800 (PST)
Message-ID: <141a14f366abe431be65e3977c27d2b39180f38e.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/4] media: docs: dev-decoder: Trigger dynamic source
 change for colorspace
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, 	imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Fri, 07 Nov 2025 09:50:27 -0500
In-Reply-To: <0c68a2c0-7e30-46da-abf1-759a7dbb7ecf@oss.nxp.com>
References: <20250418085422.193-1-ming.qian@oss.nxp.com>
	 <20250418085422.193-2-ming.qian@oss.nxp.com>
	 <4d1260be46be22d7b40fab9788763af796d118dc.camel@ndufresne.ca>
	 <0c68a2c0-7e30-46da-abf1-759a7dbb7ecf@oss.nxp.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Le2x+CLghYjLb8UyRe2r"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-Le2x+CLghYjLb8UyRe2r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm reviewing my backlog and this one has been stalled.

Le lundi 03 novembre 2025 =C3=A0 09:45 +0800, Ming Qian(OSS) a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On 8/1/2025 11:23 PM, Nicolas Dufresne wrote:
> > Hi Ming,
> >=20
> > Le vendredi 18 avril 2025 =C3=A0 16:54 +0800, ming.qian@oss.nxp.com=C2=
=A0a =C3=A9crit :
> > > From: Ming Qian <ming.qian@oss.nxp.com>
> > >=20
> > > If colorspace changes, the client needs to renegotiate the pipeline,
> > > otherwise the decoded frame may not be displayed correctly.
> > >=20
> > > When a colorspace change in the stream, the decoder sends a
> > > V4L2_EVENT_SOURCE_CHANGE event with changes set to
> > > V4L2_EVENT_SRC_CH_COLORSPACE. After client receive this source change
> > > event, then client can switch to the correct stream setting. And each
> > > frame can be displayed properly.
> >=20
> > sorry for the long delay. While reading this, in any case userspace hav=
e to read
> > the new format. Why can't userspace compare the old and new v4l2_format=
 and
> > decide to avoid re-allocation that way ?
> >=20
> > There is also backward compatbility issues for driver that was sending
> > V4L2_EVENT_SRC_CH_RESOLUTION for colorspace change before. Despite the =
costly
> > re-allocation, userspace only watching for V4L2_EVENT_SRC_CH_RESOLUTION=
 would
> > endup not updating the colorspace anymore.
> >=20
> > Combining both would be an option, but then V4L2_EVENT_SRC_CH_RESOLUTIO=
N means
> > any v4l2_format changes, which is awkward. What do you think of leaving=
 to
> > userspace the task of comparing the old and new v4l2_format ?
> >=20
> > Nicolas
> >=20
>=20
> Sorry for the delay response (I don't understand why I received this
> email several months late.)
>=20
> I agree that comparing the old and new v4l2_format is feasible. And
> there are currently four conditions that can trigger source change.
> - coded resolution (OUTPUT width and height),
> - visible resolution (selection rectangles),
> - the minimum number of buffers needed for decoding,
> - bit-depth of the bitstream has been changed.
>=20
> Therefore, comparing only v4l2_format is insufficient. This is much more
> complicated than checking a flag. I'm not sure if existing applications
> have already done this.
>=20
> I also think it's OK for driver to send V4L2_EVENT_SRC_CH_RESOLUTION for
> colorspace change, This will only incur additional allocation overhead,
> without causing any functional issues.
>=20
> Therefore, from a driver perspective:
> - V4L2_EVENT_SRC_CH_RESOLUTION for format change=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 OK
> - V4L2_EVENT_SRC_CH_RESOLUTION for colorspace chagne=C2=A0 OK, but=20
> re-allocation cost
> - V4L2_EVENT_SOURCE_CHANGE for colorspace change=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 OK
>=20
> from a client perspective:
> - V4L2_EVENT_SRC_CH_RESOLUTION without compareing format=C2=A0=C2=A0=C2=
=A0 OK,=20
> re-allocation
> - V4L2_EVENT_SRC_CH_RESOLUTION with comparing format=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 OK,=20
> additional support required
> - V4L2_EVENT_SOURCE_CHANGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 OK,=20
> additional support required
>=20
>=20
> I believe that adding a V4L2_EVENT_SOURCE_CHANGE flag will help simplify
> the process and will not cause too many backward compatibility issues.

So stepping back a little, the point is the V4L2_EVENT_SRC_CH_RESOLUTION is=
 not
clear enough. For backward compatibility reason we have to keep it though. =
So
that gives two choices:

1. We don't add new API, and its up to clients to check what actually chang=
es.
Documentation to help this would be nice.

This is easy driver side, you just emit more SOURCE_CHANGE event, and get a
performance hit on client that have not been updated and just naively re-
allocate.

2. We keep V4L2_EVENT_SRC_CH_RESOLUTION, but introduce SRC_CH_REALLOC,
SRC_CH_COLORSPACE, ...

We still endup seding more events. If the flags are exactly=20
V4L2_EVENT_SRC_CH_RESOLUTION, we have a legacy driver and can't assume anyt=
hing.
Just realloc or check in the format details. Then if one or more flags of t=
he
other are present, use this in order to minimize the work.

In all cases, a drain operation must happen, otherwise you would not know a=
t
which boundary this change takes place. I will mark this as "Change Request=
ed"
so it is removed from my queue. If you want to continue this work, I think =
this
is best plan I can think of with consideration for backward compatibility. =
If
you go for 1, no new API is needed, but perhaps some better doc would help.

Nicolas


>=20
> Regards,
> Ming
>=20
> > >=20
> > > So add colorspace as a trigger parameter for dynamic resolution chang=
e.
> > >=20
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > > v2
> > > - Add V4L2_EVENT_SRC_CH_COLORSPACE for colorspace source change event
> > >=20
> > > =C2=A0 .../userspace-api/media/v4l/dev-decoder.rst=C2=A0=C2=A0=C2=A0=
=C2=A0 | 17 +++++++++++++----
> > > =C2=A0 1 file changed, 13 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > index ef8e8cf31f90..51d6da3eea4a 100644
> > > --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
> > > @@ -784,8 +784,8 @@ before the sequence started. Last of the buffers =
will have
> > > the
> > > =C2=A0 must check if there is any pending event and:
> > > =C2=A0=20
> > > =C2=A0 * if a ``V4L2_EVENT_SOURCE_CHANGE`` event with ``changes`` set=
 to
> > > -=C2=A0 ``V4L2_EVENT_SRC_CH_RESOLUTION`` is pending, the `Dynamic Res=
olution
> > > -=C2=A0 Change` sequence needs to be followed,
> > > +=C2=A0 ``V4L2_EVENT_SRC_CH_RESOLUTION`` or ``V4L2_EVENT_SRC_CH_COLOR=
SPACE`` is
> > > pending,
> > > +=C2=A0 the `Dynamic Resolution Change` sequence needs to be followed=
,
> > > =C2=A0=20
> > > =C2=A0 * if a ``V4L2_EVENT_EOS`` event is pending, the `End of Stream=
` sequence
> > > needs
> > > =C2=A0=C2=A0=C2=A0 to be followed.
> > > @@ -932,13 +932,17 @@ reflected by corresponding queries):
> > > =C2=A0=20
> > > =C2=A0 * the minimum number of buffers needed for decoding,
> > > =C2=A0=20
> > > -* bit-depth of the bitstream has been changed.
> > > +* bit-depth of the bitstream has been changed,
> > > +
> > > +* colorspace of the bitstream has been changed.
> > > =C2=A0=20
> > > =C2=A0 Whenever that happens, the decoder must proceed as follows:
> > > =C2=A0=20
> > > =C2=A0 1.=C2=A0 After encountering a resolution change in the stream,=
 the decoder sends a
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SOURCE_CHANGE`` event wit=
h ``changes`` set to
> > > -=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_RESOLUTION``.
> > > +=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_RESOLUTION``, or a colorspace=
 change in the stream,
> > > the
> > > +=C2=A0=C2=A0=C2=A0 decoder sends a ``V4L2_EVENT_SOURCE_CHANGE`` even=
t with ``changes`` set
> > > to
> > > +=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_COLORSPACE``.
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .. important::
> > > =C2=A0=20
> > > @@ -946,6 +950,11 @@ Whenever that happens, the decoder must proceed =
as
> > > follows:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 values applying to t=
he stream after the resolution change, including
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 queue formats, selec=
tion rectangles and controls.
> > > =C2=A0=20
> > > +.. note::
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 A ``V4L2_EVENT_SOURCE_CHA=
NGE`` event with ``changes`` set to
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_RESOL=
UTION`` will affect the allocation, but
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``V4L2_EVENT_SRC_CH_COLOR=
SPACE`` won't.
> > > +
> > > =C2=A0 2.=C2=A0 The decoder will then process and decode all remainin=
g buffers from
> > > before
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the resolution change point.
> > > =C2=A0=20

--=-Le2x+CLghYjLb8UyRe2r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQ4HMwAKCRDZQZRRKWBy
9JrTAQCnHoz3uQ+b82l+MHWqw45LRz6HHqCT33Bycw5sK/dn6wEA1285fSHb2aiT
bolkIwcN+a+h2cQkhPjERHn9TQ1fxAs=
=eV8/
-----END PGP SIGNATURE-----

--=-Le2x+CLghYjLb8UyRe2r--
