Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB69A2BDC0A
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 20:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767730398; cv=none; b=eNAFbbuMF/sWNrF4vAiF1KyvoowrXwN2HdpMmlFQVxNMjkR2huXPuiRl5PZfh/FKdqTrGp9CtavA1Z0CqKrfElARes3IhFMkMPljupvn84Cg73FiLB0f4wvsgBXKz7pRF7Mq2Ex776E//nRgqL0IOodZYP7DjVHXSJYRanB913g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767730398; c=relaxed/simple;
	bh=jPVdqhWs2TPwcHlMq0L0CE1YYe4u5iPs7FdsFKOVGs8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PrXtsRK4XPCbs2L3HsNh+P3l9ITlnQB2LUXe98KEbw7cwuowufqFu+QW69mo2GnKQThL59XODQ3g1ExGHioQNG6KOE8WC3y1autfsE/vj4ALOztx3qEHtv0+x9zNBlqud+UgHhWJTGrvShXwDV8mZHu3o3jyzBJybMLAqnKQMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ncugG3HD; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ncugG3HD"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b2f2c5ec36so144042485a.1
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 12:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767730395; x=1768335195; darn=lists.linux.dev;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zGgADW9nZD17Da1M/Fe+ypFmIKBVR0gBMWrtY6svF8g=;
        b=ncugG3HDJXroGaWywkimRIHXcXM7fL8PmhhO+J5/ispTn8UYrYxusIYM15oGxAv2+I
         GWcVkdVAN6nhzh+w5qdpUaiyO2XoqcFm3SIazsNmqmnyBur2HGuqPoX4yVO9B+N7MGcz
         KYscMFpy9cRKGdxKlBj2o1jiVdB1q3/U+yGIPD/2Yi4iuJFfUptX8ZocyrMZsacoZrfy
         jn3zKhyEKTmqavBhMJMnZsFMLtxN5DAR3fa+sUbwGdX6i2snejYnBXrYB7VsvUotzzWs
         Xw9NRpWBQgTgYJchfUhhkzuibhSeOY4WOMry+TFvEbvwEzHUi276E/tt0RztoCo7vKgh
         5Tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767730395; x=1768335195;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGgADW9nZD17Da1M/Fe+ypFmIKBVR0gBMWrtY6svF8g=;
        b=cZCU20764O+S43HMelrDUDRl3eMsl/rZ6pAIYF1wIgJMlEwca1WYPj5oR40AlcMyTZ
         G0lPWLwcntmOdiamDpTtZE0t1G+HpznNz5H5pY2JZx1iqD02C4d3sPi0FjVm7/vRBl94
         YBYheSotlTtMJeWhdAzTRNUcNWpjX/LR8GMu1XztluNwTANJd8bVNbZ6M/6azIbty1OH
         fjmjSVJZwUeANMAkYvL1rLSulUFKmF0t6OFob6l+ijbpfKzIxHw+l2pe5sZomBkqRf9O
         uPk7M1libTkNzNIOBeqPVpQLCrF8mfzD/Ct8HT8osILk/P9mCiZHhdszo81GwMbNfj/I
         0u3g==
X-Forwarded-Encrypted: i=1; AJvYcCXYky/YP8OLFLrjzRQd1/KtW3gzqOL7FSRzEkqyOi3/c2Rc1DuwiScmA0Ahe3DC81sa6bw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzB4ILYf0vwVRxgp6GvKhqSOz9LYtfeuAFkSyXRcYTp59IITjk4
	ZxLgPur07+kIRyW2VjerczhKsP5z8P0gPLwhY5Vi0KW1Pv3KAPf+13enk1dMwl0p3DQ=
X-Gm-Gg: AY/fxX5GaLGwjapkxCs0LsPenoBMqA2yneesOV17nNv/2O4XP1h99PFSJu5ntyDs1I8
	Z5O8dnAjuyu0R0clgooLE10VARhWAkmaZWgTn/3lt7E5s+FGG+Zkm+NzNakk932dXRn9e6I3rc4
	sq9/b4G5ZEyRLzC2go23lIj+ukVimZZ4yK3PYk421rl1kWZ+eLeuP0xB2jgh3x2rVB22gO8bdpd
	htb9qdCS1ffyh4b1k+pixvAtWGO2aPMkfCQmvYq+LbgsyB+8+a4MgQ6xXG+R5h4OWWlwECfDjo0
	/GrRyBJ+y0UjgtBYFccxYe5Dw6oSpQ91hMw/2rxzyBQrFkWdxaMNVoZlQiIOQgq88RPz+4KKMg0
	l6JO3y76kdC5E9Vl9nglN8QBhOkPO/jqFppJiWaROWSfl+lVTNHUvKiAkZ/HEup6EsE8uBsqYeC
	MbBXHO1JbYooabnNfb
X-Google-Smtp-Source: AGHT+IH/wLE7DdiFM+Bb8jYRFbO6Or+cMF7NwB8CGndt9QUJmgsJUJfLZ+U7BiCGgvq+Cm5fvn3UeQ==
X-Received: by 2002:a05:620a:29cc:b0:8b2:e1bc:f2a2 with SMTP id af79cd13be357-8c3893eb72bmr8510985a.54.1767730394771;
        Tue, 06 Jan 2026 12:13:14 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm232070985a.33.2026.01.06.12.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:13:13 -0800 (PST)
Message-ID: <5ae7ea006e78377c22181b7455aea280214b8471.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Use kmalloc instead of vmalloc
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 06 Jan 2026 15:13:12 -0500
In-Reply-To: <20251222084912.747-1-ming.qian@oss.nxp.com>
References: <20251222084912.747-1-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-FYyUlJPAcllBQWTM48ij"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-FYyUlJPAcllBQWTM48ij
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le lundi 22 d=C3=A9cembre 2025 =C3=A0 16:49 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Replace vmalloc/vfree with kmalloc/kfree for allocating small
> driver structures (vpu_inst, vdec_t, venc_t, vpu_cmd_t, and
> frame objects).
>=20
> vmalloc() is designed for large memory allocations and incurs
> unnecessary overhead for small objects due to virtual memory
> mapping. kmalloc() is more appropriate as it allocates physically
> contiguous memory with lower overhead.
>=20
> ftrace measurements of vpu_alloc_cmd() show significant improvement:
>=20
> =C2=A0 Before (vmalloc):=C2=A0 35-72 us=C2=A0=C2=A0 (avg ~45.7 us)
> =C2=A0 After (kmalloc):=C2=A0=C2=A0 11-26 us=C2=A0=C2=A0 (avg ~16.8 us)
>=20
> This reduces allocation time by approximately 63%.
>=20
> No functional changes are intended.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Looks good to me.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0 | 16 =
+++++++---------
> =C2=A0drivers/media/platform/amphion/venc.c=C2=A0=C2=A0=C2=A0=C2=A0 | 20 =
+++++++++-----------
> =C2=A0drivers/media/platform/amphion/vpu_cmds.c | 15 +++++++--------
> =C2=A0drivers/media/platform/amphion/vpu_core.c | 11 ++++-------
> =C2=A04 files changed, 27 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c
> b/drivers/media/platform/amphion/vdec.c
> index c0d2aabb9e0e..7a1c58cac02d 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -9,7 +9,6 @@
> =C2=A0#include <linux/list.h>
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/module.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include <linux/videodev2.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-event.h>
> @@ -17,7 +16,6 @@
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0#include <media/videobuf2-dma-contig.h>
> -#include <media/videobuf2-vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_core.h"
> @@ -1642,9 +1640,9 @@ static void vdec_cleanup(struct vpu_inst *inst)
> =C2=A0		vdec->slots =3D NULL;
> =C2=A0		vdec->slot_count =3D 0;
> =C2=A0	}
> -	vfree(vdec);
> +	kfree(vdec);
> =C2=A0	inst->priv =3D NULL;
> -	vfree(inst);
> +	kfree(inst);
> =C2=A0}
> =C2=A0
> =C2=A0static void vdec_init_params(struct vdec_t *vdec)
> @@ -1909,13 +1907,13 @@ static int vdec_open(struct file *file)
> =C2=A0	struct vdec_t *vdec;
> =C2=A0	int ret;
> =C2=A0
> -	inst =3D vzalloc(sizeof(*inst));
> +	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> =C2=A0	if (!inst)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	vdec =3D vzalloc(sizeof(*vdec));
> +	vdec =3D kzalloc(sizeof(*vdec), GFP_KERNEL);
> =C2=A0	if (!vdec) {
> -		vfree(inst);
> +		kfree(inst);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> @@ -1923,8 +1921,8 @@ static int vdec_open(struct file *file)
> =C2=A0				=C2=A0=C2=A0=C2=A0 sizeof(*vdec->slots),
> =C2=A0				=C2=A0=C2=A0=C2=A0 GFP_KERNEL | __GFP_ZERO);
> =C2=A0	if (!vdec->slots) {
> -		vfree(vdec);
> -		vfree(inst);
> +		kfree(vdec);
> +		kfree(inst);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0	vdec->slot_count =3D VDEC_SLOT_CNT_DFT;
> diff --git a/drivers/media/platform/amphion/venc.c
> b/drivers/media/platform/amphion/venc.c
> index aced76401b69..9e5cbc2b0d3f 100644
> --- a/drivers/media/platform/amphion/venc.c
> +++ b/drivers/media/platform/amphion/venc.c
> @@ -13,14 +13,12 @@
> =C2=A0#include <linux/videodev2.h>
> =C2=A0#include <linux/ktime.h>
> =C2=A0#include <linux/rational.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-event.h>
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0#include <media/videobuf2-dma-contig.h>
> -#include <media/videobuf2-vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_core.h"
> @@ -844,7 +842,7 @@ static int venc_get_encoded_frames(struct vpu_inst *i=
nst)
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_dst_buf_remove(i=
nst-
> >fh.m2m_ctx)))
> =C2=A0			break;
> =C2=A0		list_del_init(&frame->list);
> -		vfree(frame);
> +		kfree(frame);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -860,7 +858,7 @@ static int venc_frame_encoded(struct vpu_inst *inst, =
void
> *arg)
> =C2=A0	if (!info)
> =C2=A0		return -EINVAL;
> =C2=A0	venc =3D inst->priv;
> -	frame =3D vzalloc(sizeof(*frame));
> +	frame =3D kzalloc(sizeof(*frame), GFP_KERNEL);
> =C2=A0	if (!frame)
> =C2=A0		return -ENOMEM;
> =C2=A0
> @@ -912,9 +910,9 @@ static void venc_cleanup(struct vpu_inst *inst)
> =C2=A0		return;
> =C2=A0
> =C2=A0	venc =3D inst->priv;
> -	vfree(venc);
> +	kfree(venc);
> =C2=A0	inst->priv =3D NULL;
> -	vfree(inst);
> +	kfree(inst);
> =C2=A0}
> =C2=A0
> =C2=A0static int venc_start_session(struct vpu_inst *inst, u32 type)
> @@ -1067,7 +1065,7 @@ static void venc_cleanup_frames(struct venc_t *venc=
)
> =C2=A0
> =C2=A0	list_for_each_entry_safe(frame, tmp, &venc->frames, list) {
> =C2=A0		list_del_init(&frame->list);
> -		vfree(frame);
> +		kfree(frame);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -1151,7 +1149,7 @@ static int venc_process_capture(struct vpu_inst *in=
st,
> struct vb2_buffer *vb)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	list_del_init(&frame->list);
> -	vfree(frame);
> +	kfree(frame);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -1309,13 +1307,13 @@ static int venc_open(struct file *file)
> =C2=A0	struct venc_t *venc;
> =C2=A0	int ret;
> =C2=A0
> -	inst =3D vzalloc(sizeof(*inst));
> +	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> =C2=A0	if (!inst)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	venc =3D vzalloc(sizeof(*venc));
> +	venc =3D kzalloc(sizeof(*venc), GFP_KERNEL);
> =C2=A0	if (!venc) {
> -		vfree(inst);
> +		kfree(inst);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/media/platform/amphion/vpu_cmds.c
> b/drivers/media/platform/amphion/vpu_cmds.c
> index 5695f5c1cb3e..ab69412e0aa7 100644
> --- a/drivers/media/platform/amphion/vpu_cmds.c
> +++ b/drivers/media/platform/amphion/vpu_cmds.c
> @@ -13,7 +13,6 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/delay.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_cmds.h"
> @@ -84,13 +83,13 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_ins=
t
> *inst, u32 id, void *data
> =C2=A0	int i;
> =C2=A0	int ret;
> =C2=A0
> -	cmd =3D vzalloc(sizeof(*cmd));
> +	cmd =3D kzalloc(sizeof(*cmd), GFP_KERNEL);
> =C2=A0	if (!cmd)
> =C2=A0		return NULL;
> =C2=A0
> -	cmd->pkt =3D vzalloc(sizeof(*cmd->pkt));
> +	cmd->pkt =3D kzalloc(sizeof(*cmd->pkt), GFP_KERNEL);
> =C2=A0	if (!cmd->pkt) {
> -		vfree(cmd);
> +		kfree(cmd);
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0
> @@ -98,8 +97,8 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst
> *inst, u32 id, void *data
> =C2=A0	ret =3D vpu_iface_pack_cmd(inst->core, cmd->pkt, inst->id, id, dat=
a);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(inst->dev, "iface pack cmd %s fail\n",
> vpu_id_name(id));
> -		vfree(cmd->pkt);
> -		vfree(cmd);
> +		kfree(cmd->pkt);
> +		kfree(cmd);
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0	for (i =3D 0; i < ARRAY_SIZE(vpu_cmd_requests); i++) {
> @@ -118,8 +117,8 @@ static void vpu_free_cmd(struct vpu_cmd_t *cmd)
> =C2=A0		return;
> =C2=A0	if (cmd->last_response_cmd)
> =C2=A0		atomic_long_set(cmd->last_response_cmd, cmd->key);
> -	vfree(cmd->pkt);
> -	vfree(cmd);
> +	kfree(cmd->pkt);
> +	kfree(cmd);
> =C2=A0}
> =C2=A0
> =C2=A0static int vpu_session_process_cmd(struct vpu_inst *inst, struct vp=
u_cmd_t
> *cmd)
> diff --git a/drivers/media/platform/amphion/vpu_core.c
> b/drivers/media/platform/amphion/vpu_core.c
> index 168f0514851e..85cc4a14f8ed 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -17,7 +17,6 @@
> =C2=A0#include <linux/pm_runtime.h>
> =C2=A0#include <linux/pm_domain.h>
> =C2=A0#include <linux/firmware.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_core.h"
> @@ -265,7 +264,7 @@ static int vpu_core_register(struct device *dev, stru=
ct
> vpu_core *core)
> =C2=A0	INIT_WORK(&core->msg_work, vpu_msg_run_work);
> =C2=A0	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
> =C2=A0	buffer_size =3D roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
> -	core->msg_buffer =3D vzalloc(buffer_size);
> +	core->msg_buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> =C2=A0	if (!core->msg_buffer) {
> =C2=A0		dev_err(core->dev, "failed allocate buffer for fifo\n");
> =C2=A0		ret =3D -ENOMEM;
> @@ -282,10 +281,8 @@ static int vpu_core_register(struct device *dev, str=
uct
> vpu_core *core)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0error:
> -	if (core->msg_buffer) {
> -		vfree(core->msg_buffer);
> -		core->msg_buffer =3D NULL;
> -	}
> +	kfree(core->msg_buffer);
> +	core->msg_buffer =3D NULL;
> =C2=A0	if (core->workqueue) {
> =C2=A0		destroy_workqueue(core->workqueue);
> =C2=A0		core->workqueue =3D NULL;
> @@ -308,7 +305,7 @@ static int vpu_core_unregister(struct device *dev, st=
ruct
> vpu_core *core)
> =C2=A0
> =C2=A0	vpu_core_put_vpu(core);
> =C2=A0	core->vpu =3D NULL;
> -	vfree(core->msg_buffer);
> +	kfree(core->msg_buffer);
> =C2=A0	core->msg_buffer =3D NULL;
> =C2=A0
> =C2=A0	if (core->workqueue) {
>=20
> base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce

--=-FYyUlJPAcllBQWTM48ij
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV1s2AAKCRDZQZRRKWBy
9MQyAQDxpxzr9kihozUH+t2YsCS8uiqoV1YKptAS4KpREXxtcAEAiT1yqKfjFLoF
EuHuBeiiTmRL6/5CkzLEg5xRbhEOxAE=
=1XYq
-----END PGP SIGNATURE-----

--=-FYyUlJPAcllBQWTM48ij--
