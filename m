Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBF116132E
	for <imx@lists.linux.dev>; Wed,  1 May 2024 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714593350; cv=none; b=WMIChzC8SVJa6MwOuI9CsSPVlkHqsDhrLD12gi/7KZzx60lt1vo/b3Jpu8lo83BR53vuEeaL47w2MNygqaLggM+kd5NtSO+/4v+8I3uPFN3LUsi5VIcwUQpLz5RFV+aNLv2C4p7d36LW6ptQRY/nKt5Wz5uF/lFnI4d+IP55TCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714593350; c=relaxed/simple;
	bh=f73jSEAMJKBp15N9UkPWYqMCh4YYPf7JXmaAdRz51NM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y4qD+ww/X/82zn78Rsz3CMgdvhfHz8w8UQ1dMqYTgluJThVCTgL8umYUpbH/ZLDG4TiFDp+Q38stQXDQ0465rXHK9t4YXKY2cp8zesWfa5866+Z9r2M9edOlsM6qY9dFQNmaUDkxKZjrtoWtEBO00LgJ7/DhTupYYqXjGFAud4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Le37GPWX; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Le37GPWX"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4365c1451d4so47979221cf.2
        for <imx@lists.linux.dev>; Wed, 01 May 2024 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1714593348; x=1715198148; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rp2Oeq63C4vnEAayPDNotRfG8unurD54mFT8YeJ0RJ8=;
        b=Le37GPWXiFlTO9VjND0JDW85CFtk7+gQk3MZKS0ONsvLbXI1taingVlqgH7KmLTBFO
         lq2eHzIzoVK1DyBXOtMDugwFyz/YIV7HZLr6U/9e6Ho2po7N176HGxEHJilsZ46VHguA
         QqHGTbcGMbnOtf2Y2ub7qkoG2y24cYYwZr9bqpFBiNQiCnrDhqUBQtuEpYmko2Y7mUxW
         oAhISPY3Bw6jUplmCVGBI3SMQ00hbirahamXZR2wj17fo/OSSw7Lkt6/0YPWe/4N4yof
         2cgLs+43rK/RY3sBKV5P7r7NzxbVfulnVPPdec5unfwpcFxP9sAs9xmOP+IUgdbXaxjO
         O6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714593348; x=1715198148;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rp2Oeq63C4vnEAayPDNotRfG8unurD54mFT8YeJ0RJ8=;
        b=gCKkR2g373XSHU2GByL6b0PoNsjNfMbmsTGyGmVIK3RBYqXQWuCr1L7ZTnxvXzn1xy
         0GcnseJD1jt+SsJ8+rO6pnD4UNSO9vKss5+hWFRtSi5YLbYzFDCG0yZJ3Hzh2nKYPP6R
         MHcPiWjAEpSiZ9T4ST8PTloNVSYIEHTggjeP+NafRl6WZx8rlumxonms1/+FF0sMdkNP
         QiylNg/yYbCevyPjf9LF30SSXWvobtdwsTNxTe0xmSEcmVMcCn4KumT5lo7cJcCm23Uv
         95YrUVSOkXS2E7Ss71fGHSILnIQvANfZn2Nc5QVyHbSdKde7BMUbjsrhwXkYn7g5wkds
         YYmg==
X-Forwarded-Encrypted: i=1; AJvYcCUODKLeVOzN8ouwrvSrcXlWcN1gcnoB3576ZLnHZRKcIW+zRwgkwjTtQ+1p0EP7Jp91D3/z9uxm0nlrZ5M39xs1ls5N
X-Gm-Message-State: AOJu0Yw66VvtEOaolx2P6ps3b6IK9H9q7UPSBycI5KgvhMvXvqH2Qmtq
	RBrYb8uRCxx2gK5Meel1E2/PUh4hqj07xb1rzIt37qVXYXZFsU8M1m+gMJJqsoc=
X-Google-Smtp-Source: AGHT+IE+pwCRMel6AM6QEax/+YdZn8uEc6qt/ryuDm38HckiIWQdWtCTMgcpb+i+ZFA4KAjP/8xZaQ==
X-Received: by 2002:a05:622a:4b18:b0:43a:ea03:31b6 with SMTP id et24-20020a05622a4b1800b0043aea0331b6mr3444178qtb.31.1714593347744;
        Wed, 01 May 2024 12:55:47 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id jv9-20020a05622aa08900b004366d3eef03sm12490361qtb.68.2024.05.01.12.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 12:55:47 -0700 (PDT)
Message-ID: <46ea74867fee6f0dbefb4c2d24a682d15beb41e7.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: v4l2-ctrls: Add average qp control
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ming Qian <ming.qian@nxp.com>, 
	mchehab@kernel.org
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com,  eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 ming.qian@oss.nxp.com,  imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Wed, 01 May 2024 15:55:46 -0400
In-Reply-To: <25a33db9-3bc1-4d90-83d4-0bdbea9bc5d8@xs4all.nl>
References: <20240329092352.2648837-1-ming.qian@nxp.com>
	 <25a33db9-3bc1-4d90-83d4-0bdbea9bc5d8@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le mercredi 24 avril 2024 =C3=A0 12:03 +0200, Hans Verkuil a =C3=A9crit=C2=
=A0:
> On 29/03/2024 10:23, Ming Qian wrote:
> > Add a control V4L2_CID_MPEG_VIDEO_AVERAGE_QP to report the average qp
> > value of current encoded frame.
> >=20
> > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > ---
> >  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 4 ++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 5 +++++
> >  include/uapi/linux/v4l2-controls.h                        | 2 ++
> >  3 files changed, 11 insertions(+)
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index 2a165ae063fb..cef20b3f54ca 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -1653,6 +1653,10 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_ty=
pe -
> >      Quantization parameter for a P frame for FWHT. Valid range: from 1
> >      to 31.
> > =20
> > +``V4L2_CID_MPEG_VIDEO_AVERAGE_QP (integer)``
> > +    This read-only control returns the average qp value of the current=
ly
> > +    encoded frame. Applicable to the H264 and HEVC encoders.
>=20
> qp -> QP
>=20
> Why is this applicable to H264/HEVC only? I think it is fine for any code=
c.

Same question, though we should document the range, which will differ per-
codecs. We should also document to always use the specified range, rather t=
hen a
HW custom range. This way we don't endup with issues we have hit with other=
 ill-
defined controls.

Nicolas

>=20
> This needs to document that the value applies to the last dequeued buffer
> (VIDIOC_DQBUF).
>=20
> > +
> >  .. raw:: latex
> > =20
> >      \normalsize
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/=
v4l2-core/v4l2-ctrls-defs.c
> > index 8696eb1cdd61..88e86e4e539d 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -972,6 +972,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
> >  	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
> >  	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
> > +	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP value";
>=20
> value -> Value
>=20
> Also move it up two lines so that it follows V4L2_CID_MPEG_VIDEO_USE_LTR_=
FRAMES
> rather than FWHT controls.
>=20
> > =20
> >  	/* VPX controls */
> >  	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of P=
artitions";
> > @@ -1507,6 +1508,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, e=
num v4l2_ctrl_type *type,
> >  		*max =3D 0xffffffffffffLL;
> >  		*step =3D 1;
> >  		break;
> > +	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:
> > +		*type =3D V4L2_CTRL_TYPE_INTEGER;
> > +		*flags |=3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY;
>=20
> Drop the volatile flag, this isn't a volatile value.
>=20
> > +		break;
> >  	case V4L2_CID_PIXEL_RATE:
> >  		*type =3D V4L2_CTRL_TYPE_INTEGER64;
> >  		*flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index 99c3f5e99da7..974fd254e573 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -898,6 +898,8 @@ enum v4l2_mpeg_video_av1_level {
> >  	V4L2_MPEG_VIDEO_AV1_LEVEL_7_3 =3D 23
> >  };
> > =20
> > +#define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
> > +
> >  /*  MPEG-class control IDs specific to the CX2341x driver as defined b=
y V4L2 */
> >  #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000=
)
> >  #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_COD=
EC_CX2341X_BASE+0)
>=20
> Regards,
>=20
> 	Hans
>=20

