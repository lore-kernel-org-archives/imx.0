Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D081F4717
	for <imx@lists.linux.dev>; Wed, 26 Mar 2025 20:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743022529; cv=none; b=sLzQQJCfNhlo8d7bACY8iStACYt6rN6xh2BmjlMXXd25WeIGjd2B5bcYoJvY1istq+uOmjVo7BURiiPHsbVkhsR03U8KrAx1lFv2nKMjxVj8J9nDTX6GQa+K/jSxNP3wOjPV+wfCW7ArZPHwuFcJPAvuvOM2NK6roAMOixuKZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743022529; c=relaxed/simple;
	bh=Xl9hEEBlJ9dSh85SPF5rDHvTpb212NQOd6rM5MloDQM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HWO3pFVz6n+6QKozatPN7WwxC5vA3dGlxreLBvTvLz5HrSUf2GFMAgY1idVg+yHnoSS1FpKBmczaEKgsXNfeAtiAtta8uSA2GX/cm348Zm9/utwf2uxKhVQ1H2cIfIFIMNMdz8JIyawk2+I6qHGGonP0/MLORFsmYvbK05fjMXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=3ZTfnoBi; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="3ZTfnoBi"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f254b875so1878816d6.1
        for <imx@lists.linux.dev>; Wed, 26 Mar 2025 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743022527; x=1743627327; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5W7eit3LvJ+Cj4I9mmTKcAopJ4/V9ebVZTl7mNDE+uo=;
        b=3ZTfnoBiJAznbr/4sfcrZw1t9NIAD569s547OiVqsDrjutXNKK/E2iTa2NZ66Q19w2
         jR1HYiVlLPLgeUo+APWG/ZaR8qc/97X2o0VHY8u1LjTwj9x3Gjm85TxAQInFhHM/Th0b
         3ilX5i78R9uVvHuIrpbKrkxpcF6MYkTRQ1auoe7zci9W38wglqjCLhU8SdNiz8XRtEgB
         VHPSH4WtKzgCuAMnrax88PSaxeaWgp4USGR8f7LxiN8J2RMoU0hmSTtQBswM54+KrWCN
         IhTlhZF8mh6NAbz56vrytQ8zR6DCc4mtgRw2mLZgZEd8+Omaml9qoa0SROdxxA9haVcq
         ucKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743022527; x=1743627327;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5W7eit3LvJ+Cj4I9mmTKcAopJ4/V9ebVZTl7mNDE+uo=;
        b=wL0pf+buuqwRAiEfoY0734ki/Md0/ZJQtbvIHDpPk0iQtFeu4GXjhfQZVjvJmH3wN6
         8Ag/TbcskBffO5UcSvSSKN0yZ4f0cQGeBFl2jWl9EwL1okwmsiKLqxA9TYFFhPbENWYu
         CeJajrOun+nN0qYIajnfhL28az2W9aH2NImRdrDaOA0mLSDyTX4CcjgzuzZV21JeBbOT
         B9OlLNwYOMrUnlRtFXmoVk43AV96L6u7nMkDjNqcxNr0DPUUvNtUq6Dw5KrDVcDJUmLs
         1H18VprMs/jXQmPG6OvcGAApkOJs0b6A0k8Ou85a9KtbP1ZjXMwQtG1HEkzMa/HHFtb+
         EGZw==
X-Forwarded-Encrypted: i=1; AJvYcCU1xlnd3b+3NpV2ar9JW7rHlgKeNApsweEjtephJjvnmXMM0mGIEvH9Cc78fD2sBxyfa4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5+IzeViYB4xt3WcGLGolSnRRRDER+LczNid+2Y22vYgFRFnUT
	m8WsadHbkhuaJ66mUdo47cBg4P+vK9LSOPg7CXNXMK1a04fyGvXJbkQr2kCn1tg=
X-Gm-Gg: ASbGncsc13DmwLFGtVWJNc9x1rpZax1jEarVS/MTFOlXA0xRvAO/EQ1foV/CeAPnG3V
	v9Hr8Scyqey33gh399U1ZB1oPxyJS7ZJDPoSVxYY0XKGzqzBdK534C2Xhz6MTfNHoGdv+uml9ZD
	Ftppx0ZeZQdhpB3JhKbneuuxSkn9RhU5g78yJQgJeZYXPpxt/EUwvgZ5SzJVLBJoNtTQzA3QTm3
	mnYtrqmcxcBRNaTaxxWdxQMg+27ToFCmojKaIWjhvLeXvYb3Man12Vr5kPdd/kT4eA/pZ8aB3fr
	HPo9uRJ+a4W/Yx+WnhCwcSi6+QeVt4pBuiYmnMdthD4+KIIyRQ==
X-Google-Smtp-Source: AGHT+IHbfejsmynMze516eRewXRtjx57eaFY2IsodhkGJRNoTFNQq3NQr/NHsm2iVzU1A+1ZgZFRqw==
X-Received: by 2002:a05:6214:cc1:b0:6eb:2fd4:30a7 with SMTP id 6a1803df08f44-6ed23934b0dmr10501496d6.33.1743022526776;
        Wed, 26 Mar 2025 13:55:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efda74esm70987466d6.102.2025.03.26.13.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:55:26 -0700 (PDT)
Message-ID: <927a67500f3e4495e7efe03f3d3c8250a393192d.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/2] media: amphion: Add a frame flush mode for
 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 26 Mar 2025 16:55:25 -0400
In-Reply-To: <20250305062630.2329032-2-ming.qian@oss.nxp.com>
References: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
	 <20250305062630.2329032-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Le mercredi 05 mars 2025 =C3=A0 14:26 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> By default the amphion decoder will pre-parse 3 frames before starting
> to decode the first frame. Alternatively, a block of flush padding data
> can be appended to the frame, which will ensure that the decoder can
> start decoding immediately after parsing the flush padding data, thus
> potentially reducing decoding latency.
>=20
> This mode was previously only enabled, when the display delay was set to
> 0. Allow the user to manually toggle the use of that mode via a module
> parameter called frame_flush_mode, which enables the mode without
> changing the display order.

Ok, so in short the DISPLAY_DELAY breaks the reodering like intended,
while this module parameter only reduce the delay. Perhaps I'll ask
again, is is compliant or does it break some test vectors ?=20

>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v3
> - Improve commit message as recommended
> - Add some comments to avoid code looks cryptic
>=20
> =C2=A0drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
> =C2=A01 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index 1d9e10d9bec1..4ef9810d8142 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -25,6 +25,10 @@
> =C2=A0#include "vpu_imx8q.h"
> =C2=A0#include "vpu_malone.h"
> =C2=A0
> +static bool frame_flush_mode;
> +module_param(frame_flush_mode, bool, 0644);
> +MODULE_PARM_DESC(frame_flush_mode, "Set low latency flush mode: 0 (disab=
le) or 1 (enable)");

Depending on the explanation, I may come back and suggest a different
name for it. Meanwhile, have you consider simply "low_latency" ?

> +
> =C2=A0#define CMD_SIZE			25600
> =C2=A0#define MSG_SIZE			25600
> =C2=A0#define CODEC_SIZE			0x1000
> @@ -1579,7 +1583,15 @@ static int vpu_malone_input_frame_data(struct vpu_=
malone_str_buffer __iomem *str
> =C2=A0
> =C2=A0	vpu_malone_update_wptr(str_buf, wptr);
> =C2=A0
> -	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
> +	/*
> +	 * Enable the low latency flush mode if display delay is set to 0
> +	 * or parameter frame_flush_mode is set to 1.
> +	 * The low latency flush mode requires some padding data to be appended=
 after each frame,
> +	 * but don't put it in between the sequence header and frame.
> +	 * Only H264 and HEVC decoder support this module yet,
> +	 * for other formats, vpu_malone_add_scode() will return 0.
> +	 */
> +	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {
> =C2=A0		ret =3D vpu_malone_add_scode(inst->core->iface,
> =C2=A0					=C2=A0=C2=A0 inst->id,
> =C2=A0					=C2=A0=C2=A0 &inst->stream_buffer,

In principle I'm fine with adding a module parameters, I just want to
know more about it, perhaps we should add small hints in the
description (or a comment in the code).

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

