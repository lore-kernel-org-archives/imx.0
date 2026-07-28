Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CB72C0298
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247999; cv=pass; b=EfKoyu8wfGuvD7JAg7160+cduNfvg7VeFKw2Jqp8KqIGSZGPU3gepIlKVRlfj7cNqGZTJ0W4P5YZmrLREC2IyziP17z0DufINxBTq089M3GFNDQzhk3zSC+4uFgH4L17YiJS89E5JTRCC5mbLQGlCKrETpvxw9vAgKe3VLhBbYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247999; c=relaxed/simple;
	bh=h8d4kgoPUy936dNy9VMAz9CIjn1Ek+lRxupFJuz3LxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ji10QDWNSvNdhI0qJIVozpzF3lIvxni3LhgG2c48gq+zlpHJ5YxaguXWgQh8VMAKS20FIlGf92nS0DncHYjwnUoKZ2tx/LXTOBe9szoXgiTUjyalxoaQU5c2+IqMZ3cjw9HJYYdano5RngNNfT+0DHklAe3N/A4WR0JJozX6n7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+PRf6Q1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lujhka5a; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+PRf6Q1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lujhka5a"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDOlHb3059611
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=; b=O+PRf6Q18rVeH3gY
	Uqkrus2jVtV3oQufriVv9zWcJYn/SoAR8gAygIFWUsnAykxqY3vVLF1sm0gUjS7o
	AyY2f+mkCOlxeFH4WBC9dJvdTWHIY9gdQelpzzjA8ETR7kOW8ag7/wHOW3RD9brZ
	MnF+p07UPtX9d6TMbcukCuE/ru8WReKLW3rZfo1kJRYJ30xrzy7VrRaeye9XBMcj
	IS1As90XUQoOvLkQ8dv1Rcg79maqZSKrkWP+hDObgIQcjMsnmJ1c/JgtzUSuCo3d
	XTTVOF+y92D03yOh+qD5PSZ9hKTWrVU4Nna9a2kVtHDov80g3W1vTU7f5RKW5hiy
	MvdUVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7k7n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:13:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92efd2ca21aso812261085a.0
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 07:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247996; cv=none;
        d=google.com; s=arc-20260327;
        b=kWwejwLHsEpChMseCJlmDflLQVsWICtud3YN2koK+OBoqa+pBw5utRQvBHQj5Fh3xv
         zgTk9DIRbP2Kb1eDsx4KmtWXpfi4RBiOe4BcxK0zpBjcWNmzbKAjjeq+uLp1LTaYi3jH
         8vdksf6qLTi3pDtZRA0wCVAahQFbnx2kqmzeGZX9rYzGKBi+OMPJQHjtooWn2W2+FPOb
         ySoenOZ4nbWcF7a9IIohOQn3WaLflBRutc3X2uJ6eWpDGscOoSzxNWOgKJ3fCIk7UnJe
         NXAysGcWEygpx0/2zmgYCKmTwN3GGVqjrds9cetfQ/u9wtxP8FmRXaqwhfDzY96XJ2lx
         TzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=;
        fh=fKd5qWRDRD/ucI64FCVyUrJpl3UTId0E4jDDXywlyWk=;
        b=LQeazTjCudHcu3WEzQqwlMQqtDrUYNo4jV1kQWVjrK8rCpPtAGWhr7ub96unnEIBQS
         mCY8x3EUfAhCLXiAX056xj5EMMSTfsXef5gji/Znb3VRDTgINCqL1OoGs1jeQXsApsSO
         R6GOeySxRuN8rf4GKQ6QxFPeeZfnO1IlMXyhfyNaV2mHsgdyrmJSRS1PHTZPRZG747Af
         2yv0TSXRAA4CzcY8gVF7tK8VCV1jv8EOYqhGKFbD5MX1mvW/YSVQTj6J2ZbkWKdWb5es
         tiLnhemNPn/fB0Rk7oczCTRZNTRGBckZ878TyAOc44aaHap4WQ8gwkajO8eevl/6Lg4v
         /5DQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247996; x=1785852796; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=;
        b=Lujhka5abGyCPMvDB0wp9i/06VwDRKElsjOAk55jYXO5B8AcyX2SFFn2/coK/HzP41
         rPhblNWI/MTySMEO10laaH7EpIjTYWkbiJQT97JKady/MMBgajj/L+d3QG7P2hbpESrr
         uTf7PGqe+SViRTBGbrHPFuXAJ+rmsKZCGGlypudRsJj6lMGRzaNN9gqBnD9Tm4mUmeyC
         TYQVjCcbiuA1AW6DehX+GKdKyOrd+CgCRJa9HAdIMxZV82MEQVA5uRxQw5G/phwiL0TJ
         IBVh1fuYJ7/iDP8Gr+PH1H9W2qJub5LQLz/98vloNLe0a6Ytqbo77YjQR5b+jjmjkmtF
         QF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247996; x=1785852796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=;
        b=VkhbPzmZryFpe5+koUkV6hbyfBDWMEKtuRrXvvpSBHFchUaDXepMcKmbh2Dxv5YWzT
         ymEXE1mSh1GZF8wOKgP1bebp2wJII7gWdQNKuS4ZzMZcqlBTW9b1l5zun9rHwp/nHjRU
         0AfIRZ1GI7wDUYLAxfv1nNxKq+8Mb0e5j0hx5DOx0DbBScXDz3qTGJpko21r5FdzitEu
         NROnS4TMYkoQDIK6l/Lq6EQYj8jF9Z5QaCNo+3i8FaFkz/USh13kiWXp4N4plN+BmLZZ
         8S+Ychqhw/wITbNvu5qs4jqPnrZ8XXDWBRYDc6FG7EVAnU5i98degTn9iVTzvLOcsBGg
         jdNg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3YbT3cVmUNBh5vGb9Y021ywAt4EXwrYERLomnuSROffMECQRsQkkVG1k1oiySU9L5jOQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTua67u96AX8jQM+fr87KOHjhRI34QBHgfJ4VSM50zNE0+xOEF
	Ajbfd0AoZieT8GGK2p4pSwVt1s9z4+Rj2U6T55Zfq3/Ho2quA+/3J8+O1tEkdrfhcAdIB0RjWJ4
	07urveccyW4mAzI3d5yiIItDyQ7gKOIiCLwfig+MqH9KrPCXTXC8acme1kfnwovJ9qAxW56jwUq
	glno99HbV+xLzdcj8NdrU+yNENJ4LiQQ==
X-Gm-Gg: AR+sD12oLbD63ybiGkk9ItwWUwF3cGscgfAc3NPGE2WpXykbFkXK9OpC29JcGY8P+4V
	Wxtre6x2uPpk15corxr75dBX/WeQWf0G63Jbdi2ZPgQKkjR9MQdCOhNIGyBFDmEmhfwCCvYrQFb
	Ggg8fQ4sKnysiz9My+aQG+EJqzc+w8dWCltYHlgJwpFAVZxtppaU+zyBxY9RQE0PEAx9eA6dt+p
	b+uKiS6rrnekS0Vk2d/b6AR5/3whzAzyhLGFgcRUmehiTt26AlVFM9Hj+M/xC3DMfxe5/i82x4=
X-Received: by 2002:a05:620a:4154:b0:932:f1ce:9a1f with SMTP id af79cd13be357-93302730834mr223458085a.56.1785247996519;
        Tue, 28 Jul 2026 07:13:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4154:b0:932:f1ce:9a1f with SMTP id
 af79cd13be357-93302730834mr223449685a.56.1785247995855; Tue, 28 Jul 2026
 07:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com> <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:13:04 +0200
X-Gm-Features: AUfX_mxRAoOnuuKFN9kfgl1STgWBnsdv1V9nVK68cViEsTLyUdBDzyYhHSFuho8
Message-ID: <CAFEp6-3MR3v_+3rMhi3wFRCPn70e_=fXp9o4tQ5oE0RuWEHSfQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
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
        Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX2WgM+cgnhKNg
 cAl4WBxoNPG3o6szFWBHLov8v32jY1cnY9ulnM+zBPk0zqy7mznGzwIEZlQJ5HUjzD/zERckz+K
 k5TsVBZZ/Ow5Ky+6WKZyH0EuVzKrlkibSW580md5CJ3EHnVVtOZBzyTkCvHTsERHdQYBTgXy8T0
 bwKTBoQAqSk08V88C3hsruZTx+c8v3vv5PJnth+dqaW0qQpye32rn1oxt/Dg8kV7QkZLCfjpjiO
 TgnKlQeiWps78dYGZdSpMN0wuN+YwB2onNUMdI9+Psjd5XvSJlpwc661t0KCkIlt55Rx8OKcgLY
 9zLH74dVy3NIYCAbll2lJ5ldJ3BRYO/yYDIgbl2QpYJ8acYBlMkib/0pp2VA8CK8HOVZI+wqgT1
 pH7elOIVkMVXZNDVkLe+M9ZPDNnZmSPd3iELDmFWActpI9NpKn+M+PA6fUg+DJ+nS7keqcQ1+UN
 K0vF/d4zQySZKnnEVsw==
X-Proofpoint-ORIG-GUID: JcPqiwex4IfRX1QI93BfECajKXqKNIn1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX5j4jZhqYerix
 QdFD946LMw8BVwNuOLyjS2YQK93qtTRgjtqqWatMzxPw0U2YoZyUQWSzGT37x/CjVhXmqQOLKJV
 KWVb/QpKSeoSyfZ+T0KY2p53gQFqFOw=
X-Proofpoint-GUID: JcPqiwex4IfRX1QI93BfECajKXqKNIn1
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a68b8fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=8AirrxEcAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=TKf_yFmVHvvbg1ESzF0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280126

On Tue, Jul 28, 2026 at 8:55=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.co=
m> wrote:
>
> Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
> BGRX32, RGBX32, ARGB2101010).
>
> Formats with alpha channel (BGRA32, RGBA32) only support capture as
> ISI ignores alpha bits when reading from memory.
>
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> Changes in v3:
> - Drop M2M_OUT for ABGR32/BGRA32/RGBA32 as ISI ignores alpha bits (Lauren=
t)
> - Remove Android requirements from commit message as alpha formats
>   cannot be used as M2M input (Laurent)
> - Add Tested-by tag from Laurent Pinchart
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index a6e044056762..f45c2aae59ce 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -166,6 +166,57 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>                 .color_planes   =3D 1,
>                 .depth          =3D { 32 },
>                 .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_BGRA32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RGBA8888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_RGBA32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_ABGR8888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_BGRX32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_OUT
> +                               | MXC_ISI_VIDEO_M2M_CAP,
> +               .isi_in_format  =3D CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RGBX888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_RGBX32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_OUT
> +                               | MXC_ISI_VIDEO_M2M_CAP,
> +               .isi_in_format  =3D CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_XBGR888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_ARGB2101010,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_OUT
> +                               | MXC_ISI_VIDEO_M2M_CAP,
> +               .isi_in_format  =3D CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_A2RGB10,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
>         },
>         /*
>          * RAW formats
>
> --
> 2.34.1
>
