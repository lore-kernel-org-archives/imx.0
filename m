Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB498448B82
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247880; cv=pass; b=ScyRJvjF2ZqwqfVutery6eGoR4xtgNZNJ5fXGyxm4Ckp+aK71aqLydlsRaSNbEXMnbWFgLZCovQD0ivO5icPhNpH1ZW1YnvToGeNwfkXLPYNeaOZFzUWLPziCLcX+uVjL6Xi5+d2NyBsyXKyvQjaNJEcmUGGqK2bpwxgNH6iV3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247880; c=relaxed/simple;
	bh=gitP+7fBgHg1QSb30V4MdG7ID1IrvJ/KqrgsFUY69xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guUVq5cvSqn+/5Z2ofvwFzSyVXkSlCQ5Cwm8VRVRuW9Ars9VuGQAtYpLiLH/D0jenxyj3FZmBp0Nx6H1AtgPE95VfiSPwAHVoAbsbClVpVsB/mcX8QUO/npEnmKyUMP/YEKqOndreX23QKgWldV/WB+QKjxJkpSANmycLcQgK2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyoTOcl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcKG5A3k; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyoTOcl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcKG5A3k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDOmkP3059617
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=; b=LyoTOcl4+5hL+KLq
	xoha+jRqy2J2DdVQkvKYJ1DhmF+DlrXPJYqBs6coJdxrj/Ls+DwYS4UoIVtj4Wpb
	kFZakPjJW9CUkjPM6lJNgomLjFo5+RX3wF7x5JdPW+0BKq/wePrvIOyIP880SUGy
	3JBrSONKh4JIMtHgABwnyg7Gxilf3Yf0/oLCINXDHGff4nbCBI3ow432r7L5BIt8
	XXya7NI8uCCme9vSPcvqWYhL/13KjhCYQP1snWCln/nOSufHL08BKXGWXJUwXnKn
	KPLxda8Qvlg81geufLWXqTvWXT2R6DdEqR2XyBe95ZrqYyiCtiX/pQmIVMQDR2Bm
	90jNXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7k7b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:11:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93106d8af18so361282285a.0
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 07:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247874; cv=none;
        d=google.com; s=arc-20260327;
        b=XiCzEwj7xCWOMjzg7bVzyPgN5F7X/F5ISqGorLUyEhPMS8Lq9QLv+d6XrFY7bssNbW
         XJwLFxqO7gK22qJ5RWvCu2Oml5BvyPDxVHKx+QzbwjKjxFAdeeqaLLBjtzY5Fg66pKG+
         wE9QM5AYEjP1DC8IIvUzn8KgDzqJFOKQ8l9KD54HjijLhGTr9vtoZH17Nfuh4xKW5XFl
         b5gs9MtGJEpkDfu9W4dIlm7RY57970XVm3k8K9kE1Ez9OwGfPyu+0cX7p006M4NmGDDh
         WO31EfPIKFX+jjToqcbt+fv2axtmBrfcQtwrwuGEyB/xmpoT8sc/37oAy0wCZDWTiCsL
         4euw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=;
        fh=yUwIP6MQFGUJnj94/FipSXGfrtru5lgfIRTxAGKbzPw=;
        b=owlYYlNy5td0YIqR3dKyjhwc3zVcrt3sIpghGY2DDk6jZsdPO9I28aovZiOuSMEbtL
         SSmlPy0icecXk97/kfc9m3RwdndIlCCi8cv83IR9vd4tXL7oc+qaObKEIOHhglknNxHk
         X4TjjoWkT1U5+dMWNzio2s/sRMtuXu4eeYk7oBqocmPl7mPfOUsZJgbto1kZYG9v/ckd
         xwcfXis6RchcC0XasX7XzSV/7B+qNNCPG9hI+mGF67RTxI1uOJmgvJkaWPiet3lKz7or
         aroMjS2OD3zcG0O62GJfd06eJmNCDQL0p4Fj5xpxLtjqlek0++KAxSCc1ITLTx3Iu/4O
         fecw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247874; x=1785852674; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=;
        b=RcKG5A3kEtdCQPpVsg/AMi41va0HiynHpyAheHCIAcIJwmHjMAyC9kVwnlWrVdz2XK
         ILR9QdnDgHU2sxdZcd3MrRC/HWyM01szWQBMVmqkB6WWbxoCbRNODldh+L3otBJ0giXp
         88NcuiefK65VrACuT2leTJpW3yeBeR3CPDKR4Z0gy+LoDj4U+90SwflAFgCseNbzMmtR
         x/hqjToAN8D1F4PDG31xUSy+97cFFBxwjBdoPTbek7WMz4vVoy+W7XGghIGzKVktEDjO
         zwjhx9J0hjpFrkG9b65jI9Z5m7U5XcBKWtg9C1Z5NaNBFEnoohbFIHffy6XUP3FHHHlW
         QxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247874; x=1785852674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=;
        b=It5npcdLzWQE1Sl1WGvhbdL58VGTdudSeUGF8LhvnPlRqARgvbG7TkU8TZUGQD7w6l
         eG1e08VFsNCWFk0Ma2dZnyO94rNVyHZLD3QngfwuOvm3p55wGivAJdJkyc+iAhQ5Tq1y
         axczvND/YthhbjxzUts34kfJoc9NAibndyA5guEjUnKTVGf/pyf7i0CrJdZWwRCy9sKn
         b73i5TYl13tL+qEO1cD9512MebSH0y0TjxzPD+W8yTrsa8R7U79peGUMW//gBw6TMe+N
         MYbXp5IrfjXdoFJoVECpCGE6Mnfl8/bvXTd2oiK3MN6zPUuDG88P2GnwOU6zEbxKGeh2
         GPNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpd2jK4sS+l8I6w4yYW/Y2iH14Y8TCD6wUTw8AwOyCzsiqxkfNg3EUC5FSSwxiYZ5btFKY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkLcd5G7+BOId1no88FxgsWHydJxm83JjY+Q+txgwHzRGilUg2
	csiaqb3RbE2dKs7MZFoRVVYmYcoiH5/T6LsmX2/nAbYFS8gRzG9+Bo66uGGPL+nYDhFGYQ4zFXP
	xC4piIPR8qG3hcFPGKvrmKLXwnWSzHj5fDjcsT57BQ/KYVk04a5OCy1d2khXOnbODeGBRc1CSK0
	xoJBNtQu54qz42gkIwHehGYVKxWuXmTQ==
X-Gm-Gg: AR+sD11sGoeER6pB1xCvKcZBYltL/c9IjjAxJEK413Go5izow9hx3Dwqc/hNBT1XA1V
	v59q/Q2QPqBKkIk6TLEPzqM5Rk+qamHwJFCvrQcg0vSWICPZGQIVxXH69lwerNHJh5zMig3VgQh
	gUz5GovukWp4UwmfaYNqopqR5BaCKaoN+w4w4/u1baK5QX+De7yqMpTZzETeABNkjtjXljZii61
	00xUoJPXpHVAcfKg04gC+6NipgwD5gBp5iUALMzRXUWzc3/0u6tv1sWFQgEawck8VL/mWgLk8Q=
X-Received: by 2002:a05:620a:4155:b0:92e:c117:5ed9 with SMTP id af79cd13be357-933027b2503mr237087985a.89.1785247874228;
        Tue, 28 Jul 2026 07:11:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4155:b0:92e:c117:5ed9 with SMTP id
 af79cd13be357-933027b2503mr237081385a.89.1785247873683; Tue, 28 Jul 2026
 07:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com> <20260728-isi-v5-3-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-3-1d22ab91602a@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:11:01 +0200
X-Gm-Features: AUfX_my42PvyrS3FcaDcQHI7hGXphBJTiNAhLBmqhh3UWN-wDUMcyOhj5-Qtq_8
Message-ID: <CAFEp6-33my_MgEJBmwpaAmACzpx-HoF2bXesGr5e6ojRhq9yew@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] media: nxp: imx8-isi: Add 16-bit raw Bayer format support
To: guoniu.zhou@oss.nxp.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Jacopo Mondi <jacopo@jmondi.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX57qm58HCX878
 BK4fpsGf5gVxVEY7C7TGwwrZ7VAiFOjzLUuirgVVTld+sQNmy1SR5C02uED7z8Y77pw3Di97ef5
 Mw0y/qaFB7ZtYfepS9D1oP/+b/KO5GPqwb+OT8fGXXeFoYNrZ3jis3juT53sJ4EGYXEm1djmxzs
 yYv4FduNGAEscyrqid611ipY1VwdnmU3X7Zz5sPuiJ2KhcmzvXgK47T6dWTpgHqUupwnvEbH9/T
 MoZigZlnjOv59u8pzV+cHShAAipvZ65U1hsa45mPqAUITJSofcwA8eUJkS5lCprM6iolZ6OPq2K
 VIWOMZTVQDuhVMrQdTAZ8GI9Hm5dpCvcCXF1ArbaAGmQ2L7iiXRJaHfzTu8F1bHN/ngrJUkDMpZ
 lLegGH2D43lzkZRxEvwqpT/zOh2ptqXyCtLjd4rDICdsRqjzvP7S0DomM08k1TsgUE9UDS1hlqv
 nDr55ZuJzev0tCYe8rA==
X-Proofpoint-ORIG-GUID: QrmOPeHx5c0zctIyS800VTKI8gnCrU71
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX4Y/+/4UIuhck
 4VtvmQ+SxSZ9LW6SWJCcFC7HtOwi+YzIqMDKJNVWDUDclV+XhJgc+CMXuPJ7B/AbMbyYfmfUBzG
 rtvW81p628g27dvqljGD4wtEtbFM1kc=
X-Proofpoint-GUID: QrmOPeHx5c0zctIyS800VTKI8gnCrU71
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a68b883 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=8AirrxEcAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=6g14dlwTP8NX5ZwT2TAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=ST-jHhOKWsTCqRlWije3:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280125

On Tue, Jul 28, 2026 at 8:55=E2=80=AFAM <guoniu.zhou@oss.nxp.com> wrote:
>
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>
> Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
> SRGGB16) to both the pipeline subdev and video capture interface.
>
> These formats are used by image sensors that output 16-bit raw data,
> enabling the ISI to capture full dynamic range from such sensors.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v3:
> - Remove "high-end" from description as RAW16 is common now (Laurent)
> - Add Y16 (16-bit monochrome) format support (Laurent)
> - Add Reviewed-by tag from Laurent
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 30 +++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 45 ++++++++++++++++=
++++++
>  2 files changed, 75 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index c0ec59856374..934f7b356258 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -83,6 +83,12 @@ static const struct mxc_isi_bus_format_info mxc_isi_bu=
s_formats[] =3D {
>                 .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
>                                 | BIT(MXC_ISI_PIPE_PAD_SOURCE),
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_Y16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_Y16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         }, {
>                 .mbus_code      =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>                 .output         =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> @@ -179,6 +185,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_=
bus_formats[] =3D {
>                 .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
>                                 | BIT(MXC_ISI_PIPE_PAD_SOURCE),
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         },
>         /* JPEG */
>         {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 056603055c81..a6e044056762 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -212,6 +212,15 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>                 .color_planes   =3D 1,
>                 .depth          =3D { 16 },
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_Y16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_Y16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         }, {
>                 .mbus_code      =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>                 .fourcc         =3D V4L2_PIX_FMT_SBGGR8,
> @@ -356,6 +365,42 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>                 .color_planes   =3D 1,
>                 .depth          =3D { 16 },
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SBGGR16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SGBRG16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SGRBG16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SRGGB16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         },
>         /* JPEG */
>         {
>
> --
> 2.34.1
>
