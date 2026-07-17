Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902F3C9ED8
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276345; cv=pass; b=uOV3+SwdFm6sr2hL1lZ+kprjWp2Kab7BV1w0+8tkCxel7kcJho0ktVlmuohed7pPa18WT+VnUFkBe0Jzq6n5UKJxwVqcUduFySGkFLJwp3pjR4vukqh7JTlbQLfYSh1UH1wIi7sFm5EMY3VyGgwlMVL044ZQiEAGNsMoBB4/05U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276345; c=relaxed/simple;
	bh=H+ZsHHZUU4CizaXodrSAiT73hPPLHlP2GDJLLNtwvso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fM3+43kyOi7cyJsOf3e/RsSrXdP12+B5J7ZN0eNuux25Ukp+ukhyaDCiAyIKAKEbmDERqLYNSuo4PtWyJ3yGdIK5WimNH84vS8s5F6jyB0XqpSMibbKtkGHdfqOXxGwG/InrDcCRWalfBB97RJEOJo5K89LPO41Vaq/rXX2WG3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUdef2au; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaASjuSr; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUdef2au";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaASjuSr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cEgJ1065304
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 08:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ez57i07g2jJqNbEGWn9Mgjyk8iL/mMwWD4Cetst8nIA=; b=dUdef2auOSeAP9CW
	ayV3n6/tQB0zV/IayRL4zxLto+N7/I+OPilNl6vGhuQzJfDEuWbF8C9WEc9vIS4N
	37MgBUb7QQLbVI7b7BaH+e2r3wjh3BicBdwhmMDW/Z2UGcP51JomhIT8QrpKEO98
	lqGDQ7ycMHabErtpOI7Ah3Pecc4PivAoIZG9u1JgXSNxTMDBl2+Vqt2mKMwZB6u2
	1oA1B1+miaMpflFYrfIYuYV/ITwe9zpjb1A2po8iDWzlLVeL3oZNwpTJbkTt83jA
	iL01qdkQKkQNuuEVVQArERdANK7iVVIKRt7/snG4Alltavl6CpI68oZXbIS8lYXL
	bUeAmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquh4wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 08:18:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5939so1180587985a.0
        for <imx@lists.linux.dev>; Fri, 17 Jul 2026 01:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784276336; cv=none;
        d=google.com; s=arc-20260327;
        b=jHGYCndwU483yDGKnkBTRTWgLpL9LcN8t/s0lHeEnRcwg9/3DI1clDtcvNM9QzrhtM
         adG1VjAzliSAJ/BRGN7LTjQ+xp1LLhu6dDAI+mFAf3SkX7vMK41Oy+ho2fSQ0OfODX10
         fOSe0UCl7dYx1fH1bwE7KqwbWURC9h+On5OjewtgT8ydIfhtxoi5mvSzDN0/rqMl4FZ/
         T5OlRYB3KYqaG02mE02tig+dR6Gg04IEN7Il0QjR+C+Vzre9LIIjtCsitiDM4gj7xPea
         BZ9Hl4uO+LDep4YY4Nmo1N8aoMeqUH+vRPZwVTn0DN120sb3KR4U41M75dmzrGjiuPvP
         LNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ez57i07g2jJqNbEGWn9Mgjyk8iL/mMwWD4Cetst8nIA=;
        fh=3PBkXFtMfqOo2wdW/xVyKHXvuaNvMuRaw3M1emy3wXU=;
        b=si4OjrBROmMHpyUkrM0TKm57/LKckpu2gF3ORaw0rkuox+PfWJGgp6e0eZZAVO7g2P
         5TjCcM6ElvyHKq7xeKP/YPIQwBCMLRhRBinkhrZuxVMx+zrE0ma2YFEBrPR1FWJ3nD/w
         nZGR8srjzJEZlnwy6YBbgb3JZT0CFCkkOm9aOHOBYUJ7JHXXefkp6OXFR1z45L9dxGZB
         H2Ra+WnjPLdjwzdla5PGkxJlLnSG4WfOesBWidpkc8omc47fjdkvAFqMqTeo+I7O6U/2
         5ygMeeZBfx/vooVHoZ6HCTv1G6ZpmSQlvzMoD1uqAFQHCtI4XRYOiIsPuw/VKuAauJeQ
         hwtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784276336; x=1784881136; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ez57i07g2jJqNbEGWn9Mgjyk8iL/mMwWD4Cetst8nIA=;
        b=OaASjuSrtiV/5I6h6Pw0IieN9uqHYARxUByIIxOejGpV2L5agLdUo41dsekhSqh++O
         pEPsbZKGztX60aFjR4c3cs3cgEzbZmWnzvTMSQ0FFBgpiu+KOBBzkmUUpIQYveDDWf+j
         UEa5dk3uYJLnM0fN9T92KxzDFVDl+4Hctc4gpczd7YDfgqfVpRYYqgRlTqFLAOInz1li
         VBYkzb6ub8+P8+ifP5SEbXhyZZygGpHloi/gsEmOJAshDZStx3RAk/xtaoKivztCtxEZ
         rZuLBs0Ls4KlT63+ia7A8EwaBVOv2b79/DrOCYrJcq8WLVs4kScXn+0XIXOLfApSi3nm
         2EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784276336; x=1784881136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ez57i07g2jJqNbEGWn9Mgjyk8iL/mMwWD4Cetst8nIA=;
        b=QX5/am/VNo1DlTCvXuG3wtZOa2N45H2AB4oLn8D7Nrh9e0UcXA+CmhQ5rNpFjKqlrr
         kOPa0edFpfs9Hw0boAU/UeYBwj4MRhxQvoY7NhhFUqojYmt7m87nvaUovA7mBx54ZNf8
         1GC5Gbjdo6KU11X3m3PAM/nGa8wEzRcEnGfDfikJxaY72viq/RWYgpuMjb7NoHQLJvzN
         AyoF0L0af7iCYNUWS+6X9cPQSrR64qqZF6J2I4vBWab9Oth9Kh350lyqZoY4DMz7skSM
         DnTOLilJkkWBDgy7invZzrIT7PS522ydgxsbFUi88uRe3HOoy3KrYMQSSmKpBnE67G/Q
         /Jow==
X-Forwarded-Encrypted: i=1; AHgh+RopGdcohz9IS010nM86BYzsCF4FJw1RwSNu7V216kR3JzDAMexOmPdNDiCKHxDO5s1dFS8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsz72V5FhS1DkmDB+hk051vEWC5vrW7spekfsKto3MTFzdWWcT
	aVWhP2LE+e0VKeMc7DbL/pBsN9pxKIOYg38XCuvkWHrsuXvumLzAalouZW72NwkpUfJScRvN3nc
	1mnW6T79bswfg6JmgE2qUX7WCFf7tr/iAhNaEsWYK8PvVF50BfVKCspG+tVueuYh4crC6QA2BBV
	YdXwuRbw3qjTFpvx31fi/zBJHYBN93+Q==
X-Gm-Gg: AfdE7ckShbFgNfzawIuTutyTdyo2d4iE3Kkx7TW07pvLXi/IFvXqYwpUP8jfFGrmbT9
	4SaDvgy06x7JNPz//OtgHCO5e6bkweakUMTrIba+ZlXFcX48MAcKAGj68SEQ/8vzc3WXSMFhbMo
	SlgP9zWPUgK8nj88KzwV9uar3TGiyJj/1p+1CAlAXnqZq3FkKlf1UrFgPXtAzEbnnUuykDftdzx
	oayHLKB9R32Jp1LCItmBHyjVXJL+RPqOiBo6AwtV0Usylmc9cSgkfa+84Nhtsa1R0DzEw5bG5BL
X-Received: by 2002:a05:620a:1a0b:b0:922:e670:9e83 with SMTP id af79cd13be357-930b3f0be8dmr148833285a.42.1784276336322;
        Fri, 17 Jul 2026 01:18:56 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0b:b0:922:e670:9e83 with SMTP id
 af79cd13be357-930b3f0be8dmr148831385a.42.1784276335774; Fri, 17 Jul 2026
 01:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716-csi_formatter-v12-0-2601d17fc4af@oss.nxp.com> <20260716-csi_formatter-v12-3-2601d17fc4af@oss.nxp.com>
In-Reply-To: <20260716-csi_formatter-v12-3-2601d17fc4af@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:18:44 +0200
X-Gm-Features: AUfX_mxwIzaXoZ8_ApwuiJQQJn46d_A5Siy-jZcW0FHjCa_KebdKIG2Adol9xDk
Message-ID: <CAFEp6-3sxn8pPBLC4uNnyD5YSZ+Fn8Zg8Bcm52ituCH4y9QcWA@mail.gmail.com>
Subject: Re: [PATCH v12 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: X-x0arCrbnzOeAARueA3XoAh_uuFcJcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4MiBTYWx0ZWRfX/L5u/LmHD01m
 h06TEL4OzLpYZYBxW5YYeLgDiAkFlQ3ckYLpr6oM6kGwKL/sO9gdVlFogxoFaQFbwDlWf9MaQl5
 yq73Voh+C+CDtsKpxeLvo2bEjx5X2+CyudDrds6OX6UF1sTDJDCft8uBmHade3kBbseudX02sx2
 l8I0/Em34v/Kteu6r5wqvwop12NFy3KWgQuH/dGzXhjBK8r1CVz1hagKdvt6qHRyNMQ5AgrEkW2
 Exveu96W1JJ6Hd3xKgBfeaKbOisYpQ7Q2POD1B6ZAjfQG67weRL6CQh4ajUzfVqQGkM1/FS/rgC
 lVfuvTV0wt8fv6u2huIEuEUypkJw9nr1ZEgBJDR2YiAjttw3wwSb+TbXNBtQ2fV4Ogc3MFH0eDR
 9J1Tw97Ievan3oh7UGMYmjqTaUcRdAaE2FI3mVWcQvAGBqOVJucNkO5xYuxVi+yeWcm/ZviUeJa
 qeAE+SBJyvWfjss1vjA==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59e571 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=UJRJXqoc3iRmL-dUjgAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: X-x0arCrbnzOeAARueA3XoAh_uuFcJcy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4MiBTYWx0ZWRfXwmDCAMN6SBsJ
 n0nEL9k0eLQC6CeWQhp4vXMcfS/TbqrHVQiXNSYvnTE8E107sy4pgDffJsihK7/XPmwsLEelmAj
 WBtg2o9TvZ7+8URX7Qt0Oiolb+U1Cd4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170082

Hi Guoniu,

On Thu, Jul 16, 2026 at 9:11=E2=80=AFAM <guoniu.zhou@oss.nxp.com> wrote:
>
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI pixel formatter is a module found on i.MX95 used to reformat
> packet info, pixel and non-pixel data from CSI-2 host controller to
> match Pixel Link(PL) definition.
>
> Add data formatting support.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v12:
> - Fix stream ID handling: iterate routing table instead of assuming
>   stream ID equals loop index (0-7)
> - Remove stream_to_vc[] array: derive VC from routing table and frame
>   descriptor on each start/stop operation
> - Remove V4L2_SUBDEV_FL_HAS_EVENTS flag since driver does not generate ev=
ents
> - Support stream IDs 0-63 by using BIT_ULL() for stream masks
> - Add get_frame_desc call in stop_stream with proper error handling
> - Add csi_formatter_read() helper function for register reads
> - Use read-modify-write for CSI_VC_PIXEL_DATA_TYPE register to support
>   multiplexed streams sharing the same virtual channel
> - Use route->sink_pad instead of hardcoded CSI_FORMATTER_PAD_SINK
> - Write back coerced format in set_fmt before propagating to source strea=
m
> - Drop Frank's Reviewed-by tag due to significant changes, requesting re-=
review
>
> Changes in v10:
> - Use u8 for vc in csi_formatter_get_vc() and drop vc < 0 check
> - Add MFD_SYSCON dependency to Kconfig
> - Fix stream/VC mapping potential mismatch in start/stop_stream functions
>
> Changes in v8:
> - Remove fmt field and look up format from subdev state instead
> - Unify function and structure naming to use csi_formatter_ prefix
> - Remove misleading alignment comment from set_fmt function
> - Optimize get_frame_desc to call once per start_stream
> - Replace V4L2_FRAME_DESC_ENTRY_MAX with CSI_FORMATTER_VC_NUM in loops
> - Remove redundant debug message in enable_streams
> - Use MEDIA_PAD_FL_MUST_CONNECT flag instead of manual link check
> - Fix typo: Formater -> Formatter in Kconfig help text
> - Improve grammar in data type index mapping comment
>
> Changes in v7:
> - Update references from imx9 to imx95 for consistency with dt-bindings
> - Enable PM runtime before async registration
>
> Changes in v6:
> - Remove unused header includes
> - Unify macro naming: VCx/VCX -> VC and parameter x -> vc
> - Remove unused format field from csi_formatter struct
> - Use compact initialization for formats array
> - Make find_csi_format() return NULL instead of default format
> - Use unsigned int for array index in find_csi_format()
> - Add err_ prefix to error handling labels
> - Add v4l2_subdev_cleanup() and reorder cleanup sequence
> - Update enable_streams debug output format
> - Rename VC_MAX to VC_NUM and fix boundary check
> - Update CSI formatter Kconfig description
> - Use v4l2_subdev_get_frame_desc_passthrough() helper
> - Fix error paths in async registration and probe
> - Add mutex to protect enabled_streams
> - Switch to devm_pm_runtime_enable()
> - Remove redundant num_routes check in set_routing
> - Optimize get_index_by_dt() and add warning for unsupported type
> - csi_formatter_start/stop_stream: Process all streams in mask
> ---
>  MAINTAINERS                                      |   8 +
>  drivers/media/platform/nxp/Kconfig               |  15 +
>  drivers/media/platform/nxp/Makefile              |   1 +
>  drivers/media/platform/nxp/imx95-csi-formatter.c | 808 +++++++++++++++++=
++++++
>  4 files changed, 832 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e5..05009228b162 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19275,6 +19275,14 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:     drivers/media/platform/nxp/imx-jpeg
>
> +NXP i.MX 95 CSI PIXEL FORMATTER V4L2 DRIVER
> +M:     Guoniu Zhou <guoniu.zhou@nxp.com>
> +L:     imx@lists.linux.dev
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.y=
aml
> +F:     drivers/media/platform/nxp/imx95-csi-formatter.c
> +
>  NXP i.MX CLOCK DRIVERS
>  M:     Abel Vesa <abelvesa@kernel.org>
>  R:     Peng Fan <peng.fan@nxp.com>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/=
nxp/Kconfig
> index 40e3436669e2..8f49908b0022 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -28,6 +28,21 @@ config VIDEO_IMX8MQ_MIPI_CSI2
>           Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.=
MX8MQ
>           SoC.
>
> +config VIDEO_IMX95_CSI_FORMATTER
> +       tristate "NXP i.MX95 CSI Pixel Formatter driver"
> +       depends on ARCH_MXC || COMPILE_TEST
> +       depends on MFD_SYSCON
> +       depends on VIDEO_DEV
> +       select MEDIA_CONTROLLER
> +       select V4L2_FWNODE
> +       select VIDEO_V4L2_SUBDEV_API
> +       help
> +         This driver provides support for the CSI Pixel Formatter found =
on
> +         i.MX95 series SoCs. This module unpacks the pixels received fro=
m the
> +         CSI-2 interface and reformats them to meet pixel link requireme=
nts.
> +
> +         Say Y here to enable CSI Pixel Formatter module for i.MX95 SoC.
> +
>  config VIDEO_IMX_MIPI_CSIS
>         tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 m=
odels"
>         depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform=
/nxp/Makefile
> index 4d90eb713652..6410115d870e 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -6,6 +6,7 @@ obj-y +=3D imx8-isi/
>
>  obj-$(CONFIG_VIDEO_IMX7_CSI) +=3D imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) +=3D imx8mq-mipi-csi2.o
> +obj-$(CONFIG_VIDEO_IMX95_CSI_FORMATTER) +=3D imx95-csi-formatter.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) +=3D imx-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) +=3D imx-pxp.o
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) +=3D mx2_emmaprp.o
> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/m=
edia/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 000000000000..cea60327c972
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
> @@ -0,0 +1,808 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +/* CSI Pixel Formatter registers map */
> +
> +#define CSI_VC_INTERLACED_LINE_CNT(vc)         (0x00 + (vc) * 0x04)
> +#define INTERLACED_ODD_LINE_CNT_SET(x)         FIELD_PREP(GENMASK(13, 0)=
, (x))
> +#define INTERLACED_EVEN_LINE_CNT_SET(x)                FIELD_PREP(GENMAS=
K(29, 16), (x))
> +
> +#define CSI_VC_INTERLACED_CTRL                 0x20
> +
> +#define CSI_VC_INTERLACED_ERR                  0x24
> +#define CSI_VC_ERR_MASK                                GENMASK(7, 0)
> +#define CSI_VC_ERR(vc)                         BIT((vc))
> +
> +#define CSI_VC_YUV420_FIRST_LINE_EVEN          0x28
> +#define YUV420_FIRST_LINE_EVEN(vc)             BIT((vc))
> +
> +#define CSI_RAW32_CTRL                         0x30
> +#define CSI_VC_RAW32_MODE(vc)                  BIT((vc))
> +#define CSI_VC_RAW32_SWAP_MODE(vc)             BIT((vc) + 8)
> +
> +#define CSI_STREAM_FENCING_CTRL                        0x34
> +#define CSI_VC_STREAM_FENCING(vc)              BIT((vc))
> +#define CSI_VC_STREAM_FENCING_RST(vc)          BIT((vc) + 8)
> +
> +#define CSI_STREAM_FENCING_STS                 0x38
> +#define CSI_STREAM_FENCING_STS_MASK            GENMASK(7, 0)
> +
> +#define CSI_VC_NON_PIXEL_DATA_TYPE(vc)         (0x40 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_CTRL(vc)             (0x60 + (vc) * 0x04)
> +#define NEW_VC(vc)                             FIELD_PREP(GENMASK(3, 1),=
 vc)
> +#define REROUTE_VC_ENABLE                      BIT(0)
> +
> +#define CSI_VC_ROUTE_PIXEL_DATA_TYPE(vc)       (0x80 + (vc) * 0x04)
> +
> +#define CSI_VC_NON_PIXEL_DATA_CTRL(vc)         (0xa0 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_TYPE(vc)             (0xc0 + (vc) * 0x04)
> +
> +#define CSI_VC_PIXEL_DATA_TYPE_ERR(vc)         (0xe0 + (vc) * 0x04)
> +
> +#define CSI_FORMATTER_PAD_SINK                 0
> +#define CSI_FORMATTER_PAD_SOURCE               1
> +#define CSI_FORMATTER_PAD_NUM                  2
> +
> +#define CSI_FORMATTER_VC_NUM                   8 /* Number of virtual ch=
annels */
> +
> +struct csi_formatter_pix_format {
> +       u32 code;
> +       u32 data_type;
> +};
> +
> +struct csi_formatter {
> +       struct device *dev;
> +       struct regmap *regs;
> +       struct clk *clk;
> +
> +       struct v4l2_subdev sd;
> +       struct v4l2_subdev *csi_sd;
> +       struct v4l2_async_notifier notifier;
> +       struct media_pad pads[CSI_FORMATTER_PAD_NUM];
> +
> +       u32 remote_pad;
> +       u32 reg_offset;
> +
> +       /* Protects enabled_streams */
> +       struct mutex lock;
> +       u64 enabled_streams;
> +};
> +
> +struct csi_formatter_dt_index {
> +       u8 dtype;
> +       u8 index;
> +};
> +
> +/*
> + * The index corresponds to the bit index in the register that enables
> + * the data type of pixel data transported by the Formatter.
> + */
> +static const struct csi_formatter_dt_index formatter_dt_to_index_map[] =
=3D {
> +       { .dtype =3D MIPI_CSI2_DT_YUV420_8B,        .index =3D 0 },
> +       { .dtype =3D MIPI_CSI2_DT_YUV420_8B_LEGACY, .index =3D 2 },
> +       { .dtype =3D MIPI_CSI2_DT_YUV422_8B,        .index =3D 6 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB444,           .index =3D 8 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB555,           .index =3D 9 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB565,           .index =3D 10 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB666,           .index =3D 11 },
> +       { .dtype =3D MIPI_CSI2_DT_RGB888,           .index =3D 12 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW6,             .index =3D 16 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW7,             .index =3D 17 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW8,             .index =3D 18 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW10,            .index =3D 19 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW12,            .index =3D 20 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW14,            .index =3D 21 },
> +       { .dtype =3D MIPI_CSI2_DT_RAW16,            .index =3D 22 },
> +};
> +
> +static const struct csi_formatter_pix_format formats[] =3D {
> +       /* YUV formats */
> +       { MEDIA_BUS_FMT_UYVY8_1X16,     MIPI_CSI2_DT_YUV422_8B },
> +       /* RGB formats */
> +       { MEDIA_BUS_FMT_RGB565_1X16,    MIPI_CSI2_DT_RGB565 },
> +       { MEDIA_BUS_FMT_RGB888_1X24,    MIPI_CSI2_DT_RGB888 },
> +       /* RAW (Bayer and greyscale) formats */
> +       { MEDIA_BUS_FMT_SBGGR8_1X8,     MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_SGBRG8_1X8,     MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_SGRBG8_1X8,     MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_SRGGB8_1X8,     MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_Y8_1X8,         MIPI_CSI2_DT_RAW8 },
> +       { MEDIA_BUS_FMT_SBGGR10_1X10,   MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_SGBRG10_1X10,   MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_SGRBG10_1X10,   MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_SRGGB10_1X10,   MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_Y10_1X10,       MIPI_CSI2_DT_RAW10 },
> +       { MEDIA_BUS_FMT_SBGGR12_1X12,   MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_SGBRG12_1X12,   MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_SGRBG12_1X12,   MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_SRGGB12_1X12,   MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_Y12_1X12,       MIPI_CSI2_DT_RAW12 },
> +       { MEDIA_BUS_FMT_SBGGR14_1X14,   MIPI_CSI2_DT_RAW14 },
> +       { MEDIA_BUS_FMT_SGBRG14_1X14,   MIPI_CSI2_DT_RAW14 },
> +       { MEDIA_BUS_FMT_SGRBG14_1X14,   MIPI_CSI2_DT_RAW14 },
> +       { MEDIA_BUS_FMT_SRGGB14_1X14,   MIPI_CSI2_DT_RAW14 },
> +       { MEDIA_BUS_FMT_SBGGR16_1X16,   MIPI_CSI2_DT_RAW16 },
> +       { MEDIA_BUS_FMT_SGBRG16_1X16,   MIPI_CSI2_DT_RAW16 },
> +       { MEDIA_BUS_FMT_SGRBG16_1X16,   MIPI_CSI2_DT_RAW16 },
> +       { MEDIA_BUS_FMT_SRGGB16_1X16,   MIPI_CSI2_DT_RAW16 },
> +};
> +
> +static const struct v4l2_mbus_framefmt formatter_default_fmt =3D {
> +       .code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> +       .width =3D 1920U,
> +       .height =3D 1080U,
> +       .field =3D V4L2_FIELD_NONE,
> +       .colorspace =3D V4L2_COLORSPACE_SMPTE170M,
> +       .xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE17=
0M),
> +       .ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE17=
0M),
> +       .quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> +};
> +
> +static const struct csi_formatter_pix_format *csi_formatter_find_format(=
u32 code)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(formats); i++)
> +               if (code =3D=3D formats[i].code)
> +                       return &formats[i];
> +
> +       return NULL;
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * V4L2 subdev operations
> + */
> +
> +static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *=
sdev)
> +{
> +       return container_of(sdev, struct csi_formatter, sd);
> +}
> +
> +static int __csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +                                             struct v4l2_subdev_state *s=
tate,
> +                                             struct v4l2_subdev_krouting=
 *routing)
> +{
> +       int ret;
> +
> +       ret =3D v4l2_subdev_routing_validate(sd, routing,
> +                                          V4L2_SUBDEV_ROUTING_ONLY_1_TO_=
1);
> +       if (ret)
> +               return ret;
> +
> +       return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
> +                                               &formatter_default_fmt);
> +}
> +
> +static int csi_formatter_subdev_init_state(struct v4l2_subdev *sd,
> +                                          struct v4l2_subdev_state *sd_s=
tate)
> +{
> +       struct v4l2_subdev_route routes[] =3D {
> +               {
> +                       .sink_pad =3D CSI_FORMATTER_PAD_SINK,
> +                       .sink_stream =3D 0,
> +                       .source_pad =3D CSI_FORMATTER_PAD_SOURCE,
> +                       .source_stream =3D 0,
> +                       .flags =3D V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +               },
> +       };
> +
> +       struct v4l2_subdev_krouting routing =3D {
> +               .num_routes =3D ARRAY_SIZE(routes),
> +               .routes =3D routes,
> +       };
> +
> +       return __csi_formatter_subdev_set_routing(sd, sd_state, &routing)=
;
> +}
> +
> +static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> +                                              struct v4l2_subdev_state *=
sd_state,
> +                                              struct v4l2_subdev_mbus_co=
de_enum *code)
> +{
> +       if (code->pad =3D=3D CSI_FORMATTER_PAD_SOURCE) {
> +               struct v4l2_mbus_framefmt *fmt;
> +
> +               if (code->index > 0)
> +                       return -EINVAL;
> +
> +               fmt =3D v4l2_subdev_state_get_format(sd_state, code->pad,
> +                                                  code->stream);
> +               code->code =3D fmt->code;
> +               return 0;
> +       }
> +
> +       if (code->index >=3D ARRAY_SIZE(formats))
> +               return -EINVAL;
> +
> +       code->code =3D formats[code->index].code;
> +
> +       return 0;
> +}
> +
> +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> +                                       struct v4l2_subdev_state *sd_stat=
e,
> +                                       struct v4l2_subdev_format *sdform=
at)
> +{
> +       struct csi_formatter_pix_format const *format;
> +       struct v4l2_mbus_framefmt *fmt;
> +
> +       if (sdformat->pad =3D=3D CSI_FORMATTER_PAD_SOURCE)
> +               return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
> +
> +       format =3D csi_formatter_find_format(sdformat->format.code);
> +       if (!format)
> +               format =3D &formats[0];
> +
> +       v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> +                             &sdformat->format.height, 1, 0xffff, 0, 0);
> +
> +       fmt =3D v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> +                                          sdformat->stream);
> +       *fmt =3D sdformat->format;
> +
> +       /* Set default code if user set an invalid value */
> +       fmt->code =3D format->code;
> +       sdformat->format =3D *fmt;
> +
> +       /* Propagate the format from sink stream to source stream */
> +       fmt =3D v4l2_subdev_state_get_opposite_stream_format(sd_state, sd=
format->pad,
> +                                                          sdformat->stre=
am);
> +       if (!fmt)
> +               return -EINVAL;
> +
> +       *fmt =3D sdformat->format;
> +
> +       return 0;
> +}
> +
> +static int csi_formatter_subdev_set_routing(struct v4l2_subdev *sd,
> +                                           struct v4l2_subdev_state *sta=
te,
> +                                           enum v4l2_subdev_format_whenc=
e which,
> +                                           struct v4l2_subdev_krouting *=
routing)
> +{
> +       if (which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> +           media_entity_is_streaming(&sd->entity))
> +               return -EBUSY;
> +
> +       return __csi_formatter_subdev_set_routing(sd, state, routing);
> +}
> +
> +static inline void csi_formatter_write(struct csi_formatter *formatter,
> +                                      unsigned int reg, unsigned int val=
ue)
> +{
> +       u32 offset =3D formatter->reg_offset;
> +
> +       regmap_write(formatter->regs, reg + offset, value);
> +}
> +
> +static inline void csi_formatter_read(struct csi_formatter *formatter,
> +                                     unsigned int reg, unsigned int *val=
ue)
> +{
> +       u32 offset =3D formatter->reg_offset;
> +
> +       regmap_read(formatter->regs, reg + offset, value);
> +}
> +
> +static u8 csi_formatter_get_index_by_dt(u8 data_type)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i) {
> +               const struct csi_formatter_dt_index *entry =3D
> +                       &formatter_dt_to_index_map[i];
> +
> +               if (data_type =3D=3D entry->dtype)
> +                       return entry->index;
> +       }
> +
> +       pr_warn_once("Unsupported data type 0x%x, using default\n", data_=
type);

Why use the _once variant here? This doesn't look like a hot path, nor
does it seem like a condition we should silently ignore after the
first occurrence.
Also, if dev_warn_.. is not used here, pr_warn_once() should at least
give some context.

> +
> +       return formatter_dt_to_index_map[0].index;
> +}
> +
> +static int csi_formatter_get_vc(struct csi_formatter *formatter,
> +                               struct v4l2_mbus_frame_desc *fd,
> +                               unsigned int stream)
> +{
> +       struct v4l2_mbus_frame_desc_entry *entry =3D NULL;
> +       unsigned int i;
> +       u8 vc;
> +
> +       for (i =3D 0; i < fd->num_entries; ++i) {
> +               if (fd->entry[i].stream =3D=3D stream) {
> +                       entry =3D &fd->entry[i];
> +                       break;
> +               }
> +       }
> +
> +       if (!entry) {
> +               dev_err(formatter->dev,
> +                       "No frame desc entry for stream %u\n", stream);
> +               return -EPIPE;
> +       }
> +
> +       vc =3D entry->bus.csi2.vc;
> +
> +       if (vc >=3D CSI_FORMATTER_VC_NUM) {
> +               dev_err(formatter->dev, "Invalid virtual channel %u\n", v=
c);
> +               return -EINVAL;
> +       }
> +
> +       return vc;
> +}
> +
> +static void csi_formatter_stop_stream(struct csi_formatter *formatter,
> +                                     struct v4l2_subdev_state *state,
> +                                     u64 stream_mask)
> +{
> +       const struct csi_formatter_pix_format *pix_fmt;
> +       struct v4l2_mbus_frame_desc fd =3D {};
> +       struct v4l2_subdev_route *route;
> +       struct v4l2_mbus_framefmt *fmt;
> +       u32 val;
> +       int vc;
> +       int ret;
> +
> +       ret =3D v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +                              formatter->remote_pad, &fd);
> +       if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> +               dev_err(formatter->dev, "Failed to get frame desc: %d\n",=
 ret);
> +               return;
> +       }
> +
> +       for_each_active_route(&state->routing, route) {
> +               if (route->source_pad !=3D CSI_FORMATTER_PAD_SOURCE)
> +                       continue;
> +
> +               if (!(stream_mask & BIT_ULL(route->source_stream)))
> +                       continue;
> +
> +               if (ret =3D=3D -ENOIOCTLCMD) {
> +                       /*
> +                        * Source doesn't implement get_frame_desc, use
> +                        * default VC 0
> +                        */
> +                       vc =3D 0;
> +               } else {
> +                       vc =3D csi_formatter_get_vc(formatter, &fd, route=
->sink_stream);
> +                       if (vc < 0)
> +                               continue;
> +               }
> +
> +               fmt =3D v4l2_subdev_state_get_format(state, route->sink_p=
ad,
> +                                                  route->sink_stream);
> +
> +               pix_fmt =3D csi_formatter_find_format(fmt->code);

Do I understand correctly that csi_formatter_find_format() can't
return NULL at this point? If that's guaranteed by the surrounding
logic, it might be worth making that assumption explicit with a
WARN_ON or BUG_ON, to help catch future changes that could violate it.

> +
> +               /* Clear only this stream's data type bit */
> +               csi_formatter_read(formatter, CSI_VC_PIXEL_DATA_TYPE(vc),=
 &val);
> +               val &=3D ~BIT(csi_formatter_get_index_by_dt(pix_fmt->data=
_type));
> +               csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc)=
, val);

This read/modify/write pattern appears in several places. It might be
worth introducing a small helper around regmap_update_bits().

I haven't looked too deeply at the multi-stream handling, but could
you confirm that this doesn't break the case where two streams use the
same data type? As I understand it, when one stream is stopped, the
corresponding DT bit is cleared unconditionally, which could disable
the data type even though it is still required by another active
stream?

Regards,
Loic

> +       }
> +}
> +
> +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> +                                     struct v4l2_subdev_state *state,
> +                                     u64 stream_mask)
> +{
> +       const struct csi_formatter_pix_format *pix_fmt;
> +       struct v4l2_subdev_route *route;
> +       struct v4l2_mbus_framefmt *fmt;
> +       struct v4l2_mbus_frame_desc fd =3D {};
> +       u64 configured_streams =3D 0;
> +       u32 val;
> +       int vc;
> +       int ret;
> +
> +       ret =3D v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
> +                              formatter->remote_pad, &fd);
> +       if (ret < 0 && ret !=3D -ENOIOCTLCMD) {
> +               dev_err(formatter->dev, "Failed to get frame desc: %d\n",=
 ret);
> +               return ret;
> +       }
> +
> +       for_each_active_route(&state->routing, route) {
> +               if (route->source_pad !=3D CSI_FORMATTER_PAD_SOURCE)
> +                       continue;
> +
> +               if (!(stream_mask & BIT_ULL(route->source_stream)))
> +                       continue;
> +
> +               if (ret =3D=3D -ENOIOCTLCMD) {
> +                       /*
> +                        * Source doesn't implement get_frame_desc, use
> +                        * default VC 0
> +                        */
> +                       vc =3D 0;
> +               } else {
> +                       vc =3D csi_formatter_get_vc(formatter, &fd, route=
->sink_stream);
> +                       if (vc < 0) {
> +                               ret =3D vc;
> +                               goto err_cleanup;
> +                       }
> +               }
> +
> +               fmt =3D v4l2_subdev_state_get_format(state, route->sink_p=
ad,
> +                                                  route->sink_stream);
> +
> +               pix_fmt =3D csi_formatter_find_format(fmt->code);
> +
> +               /* Update VC configuration */
> +               csi_formatter_read(formatter, CSI_VC_PIXEL_DATA_TYPE(vc),=
 &val);
> +               val |=3D BIT(csi_formatter_get_index_by_dt(pix_fmt->data_=
type));
> +               csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc)=
, val);
> +
> +               configured_streams |=3D BIT_ULL(route->source_stream);
> +       }
> +
> +       return 0;
> +
> +err_cleanup:
> +       csi_formatter_stop_stream(formatter, state, configured_streams);
> +       return ret;
> +}
> +
> +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> +                                              struct v4l2_subdev_state *=
state,
> +                                              u32 pad, u64 streams_mask)
> +{
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +       struct device *dev =3D formatter->dev;
> +       u64 sink_streams;
> +       int ret;
> +
> +       sink_streams =3D v4l2_subdev_state_xlate_streams(state,
> +                                                      CSI_FORMATTER_PAD_=
SOURCE,
> +                                                      CSI_FORMATTER_PAD_=
SINK,
> +                                                      &streams_mask);
> +       if (!sink_streams || !streams_mask)
> +               return -EINVAL;
> +
> +       guard(mutex)(&formatter->lock);
> +
> +       if (!formatter->enabled_streams) {
> +               ret =3D pm_runtime_resume_and_get(formatter->dev);
> +               if (ret < 0) {
> +                       dev_err(dev, "Failed to resume runtime PM: %d\n",=
 ret);
> +                       return ret;
> +               }
> +       }
> +
> +       ret =3D csi_formatter_start_stream(formatter, state, streams_mask=
);
> +       if (ret)
> +               goto err_runtime_put;
> +
> +       ret =3D v4l2_subdev_enable_streams(formatter->csi_sd,
> +                                        formatter->remote_pad,
> +                                        sink_streams);
> +       if (ret)
> +               goto err_stop_stream;
> +
> +       formatter->enabled_streams |=3D streams_mask;
> +
> +       return 0;
> +
> +err_stop_stream:
> +       csi_formatter_stop_stream(formatter, state, streams_mask);
> +err_runtime_put:
> +       if (!formatter->enabled_streams)
> +               pm_runtime_put(formatter->dev);
> +       return ret;
> +}
> +
> +static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> +                                               struct v4l2_subdev_state =
*state,
> +                                               u32 pad, u64 streams_mask=
)
> +{
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +       u64 sink_streams;
> +       int ret;
> +
> +       sink_streams =3D v4l2_subdev_state_xlate_streams(state,
> +                                                      CSI_FORMATTER_PAD_=
SOURCE,
> +                                                      CSI_FORMATTER_PAD_=
SINK,
> +                                                      &streams_mask);
> +       if (!sink_streams || !streams_mask)
> +               return -EINVAL;
> +
> +       guard(mutex)(&formatter->lock);
> +
> +       ret =3D v4l2_subdev_disable_streams(formatter->csi_sd, formatter-=
>remote_pad,
> +                                         sink_streams);
> +       if (ret)
> +               dev_err(formatter->dev, "Failed to disable streams: %d\n"=
, ret);
> +
> +       csi_formatter_stop_stream(formatter, state, streams_mask);
> +
> +       formatter->enabled_streams &=3D ~streams_mask;
> +
> +       if (!formatter->enabled_streams)
> +               pm_runtime_put(formatter->dev);
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops =3D {
> +       .enum_mbus_code         =3D csi_formatter_subdev_enum_mbus_code,
> +       .get_fmt                =3D v4l2_subdev_get_fmt,
> +       .set_fmt                =3D csi_formatter_subdev_set_fmt,
> +       .get_frame_desc         =3D v4l2_subdev_get_frame_desc_passthroug=
h,
> +       .set_routing            =3D csi_formatter_subdev_set_routing,
> +       .enable_streams         =3D csi_formatter_subdev_enable_streams,
> +       .disable_streams        =3D csi_formatter_subdev_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops formatter_subdev_ops =3D {
> +       .pad =3D &formatter_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops formatter_internal_ops =3D =
{
> +       .init_state =3D csi_formatter_subdev_init_state,
> +};
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Media entity operations
> + */
> +
> +static const struct media_entity_operations formatter_entity_ops =3D {
> +       .link_validate  =3D v4l2_subdev_link_validate,
> +       .get_fwnode_pad =3D v4l2_subdev_get_fwnode_pad_1_to_1,
> +};
> +
> +static int csi_formatter_subdev_init(struct csi_formatter *formatter)
> +{
> +       struct v4l2_subdev *sd =3D &formatter->sd;
> +       int ret;
> +
> +       v4l2_subdev_init(sd, &formatter_subdev_ops);
> +
> +       snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->de=
v));
> +       sd->internal_ops =3D &formatter_internal_ops;
> +
> +       sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                    V4L2_SUBDEV_FL_STREAMS;
> +       sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
> +       sd->entity.ops =3D &formatter_entity_ops;
> +       sd->dev =3D formatter->dev;
> +
> +       formatter->pads[CSI_FORMATTER_PAD_SINK].flags =3D MEDIA_PAD_FL_SI=
NK
> +                                                     | MEDIA_PAD_FL_MUST=
_CONNECT;
> +       formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags =3D MEDIA_PAD_FL_=
SOURCE;
> +
> +       ret =3D media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM=
,
> +                                    formatter->pads);
> +       if (ret) {
> +               dev_err(formatter->dev, "Failed to init pads\n");
> +               return ret;
> +       }
> +
> +       ret =3D v4l2_subdev_init_finalize(sd);
> +       if (ret)
> +               media_entity_cleanup(&sd->entity);
> +
> +       return ret;
> +}
> +
> +static inline struct csi_formatter *
> +notifier_to_csi_formatter(struct v4l2_async_notifier *n)
> +{
> +       return container_of(n, struct csi_formatter, notifier);
> +}
> +
> +static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifi=
er,
> +                                     struct v4l2_subdev *sd,
> +                                     struct v4l2_async_connection *asc)
> +{
> +       const unsigned int link_flags =3D MEDIA_LNK_FL_IMMUTABLE
> +                                     | MEDIA_LNK_FL_ENABLED;
> +       struct csi_formatter *formatter =3D notifier_to_csi_formatter(not=
ifier);
> +       struct v4l2_subdev *sdev =3D &formatter->sd;
> +       struct media_pad *sink =3D &sdev->entity.pads[CSI_FORMATTER_PAD_S=
INK];
> +       struct media_pad *remote_pad;
> +       int ret;
> +
> +       formatter->csi_sd =3D sd;
> +
> +       dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
> +
> +       ret =3D v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
> +       if (ret < 0)
> +               return ret;
> +
> +       remote_pad =3D media_pad_remote_pad_first(sink);
> +       if (!remote_pad) {
> +               dev_err(formatter->dev, "Pipe not setup correctly\n");
> +               return -EPIPE;
> +       }
> +       formatter->remote_pad =3D remote_pad->index;
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_async_notifier_operations formatter_notify_ops =
=3D {
> +       .bound =3D csi_formatter_notify_bound,
> +};
> +
> +static int csi_formatter_async_register(struct csi_formatter *formatter)
> +{
> +       struct device *dev =3D formatter->dev;
> +       struct v4l2_async_connection *asc;
> +       int ret;
> +
> +       struct fwnode_handle *ep __free(fwnode_handle) =3D
> +               fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +                                               FWNODE_GRAPH_ENDPOINT_NEX=
T);
> +       if (!ep)
> +               return -ENOTCONN;
> +
> +       v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
> +
> +       asc =3D v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
> +                                             struct v4l2_async_connectio=
n);
> +       if (IS_ERR(asc)) {
> +               ret =3D PTR_ERR(asc);
> +               goto err_cleanup_notifier;
> +       }
> +
> +       formatter->notifier.ops =3D &formatter_notify_ops;
> +
> +       ret =3D v4l2_async_nf_register(&formatter->notifier);
> +       if (ret)
> +               goto err_cleanup_notifier;
> +
> +       ret =3D v4l2_async_register_subdev(&formatter->sd);
> +       if (ret)
> +               goto err_unregister_notifier;
> +
> +       return 0;
> +
> +err_unregister_notifier:
> +       v4l2_async_nf_unregister(&formatter->notifier);
> +err_cleanup_notifier:
> +       v4l2_async_nf_cleanup(&formatter->notifier);
> +       return ret;
> +}
> +
> +static void csi_formatter_async_unregister(struct csi_formatter *formatt=
er)
> +{
> +       v4l2_async_unregister_subdev(&formatter->sd);
> +       v4l2_async_nf_unregister(&formatter->notifier);
> +       v4l2_async_nf_cleanup(&formatter->notifier);
> +}
> +
> +/* ---------------------------------------------------------------------=
--------
> + * Suspend/resume
> + */
> +
> +static int csi_formatter_runtime_suspend(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +
> +       clk_disable_unprepare(formatter->clk);
> +
> +       return 0;
> +}
> +
> +static int csi_formatter_runtime_resume(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +
> +       return clk_prepare_enable(formatter->clk);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(csi_formatter_pm_ops,
> +                                csi_formatter_runtime_suspend,
> +                                csi_formatter_runtime_resume, NULL);
> +
> +static int csi_formatter_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct csi_formatter *formatter;
> +       u32 val;
> +       int ret;
> +
> +       formatter =3D devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
> +       if (!formatter)
> +               return -ENOMEM;
> +
> +       formatter->dev =3D dev;
> +
> +       ret =3D devm_mutex_init(dev, &formatter->lock);
> +       if (ret)
> +               return ret;
> +
> +       formatter->regs =3D syscon_node_to_regmap(dev->parent->of_node);
> +       if (IS_ERR(formatter->regs))
> +               return dev_err_probe(dev, PTR_ERR(formatter->regs),
> +                                    "Failed to get csi formatter regmap\=
n");
> +
> +       ret =3D of_property_read_u32(dev->of_node, "reg", &val);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to get csi formatter reg pro=
perty\n");
> +
> +       formatter->reg_offset =3D val;
> +
> +       formatter->clk =3D devm_clk_get(dev, NULL);
> +       if (IS_ERR(formatter->clk))
> +               return dev_err_probe(dev, PTR_ERR(formatter->clk),
> +                                    "Failed to get pixel clock\n");
> +
> +       ret =3D csi_formatter_subdev_init(formatter);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to initialize form=
atter subdev\n");
> +
> +       platform_set_drvdata(pdev, &formatter->sd);
> +
> +       /* Enable runtime PM. */
> +       ret =3D devm_pm_runtime_enable(dev);
> +       if (ret)
> +               goto err_cleanup_subdev;
> +
> +       ret =3D csi_formatter_async_register(formatter);
> +       if (ret < 0) {
> +               dev_err_probe(dev, ret, "Failed to register async subdevi=
ce\n");
> +               goto err_cleanup_subdev;
> +       }
> +
> +       return 0;
> +
> +err_cleanup_subdev:
> +       v4l2_subdev_cleanup(&formatter->sd);
> +       media_entity_cleanup(&formatter->sd.entity);
> +       return ret;
> +}
> +
> +static void csi_formatter_remove(struct platform_device *pdev)
> +{
> +       struct v4l2_subdev *sd =3D platform_get_drvdata(pdev);
> +       struct csi_formatter *formatter =3D sd_to_formatter(sd);
> +
> +       csi_formatter_async_unregister(formatter);
> +
> +       v4l2_subdev_cleanup(&formatter->sd);
> +       media_entity_cleanup(&formatter->sd.entity);
> +}
> +
> +static const struct of_device_id csi_formatter_of_match[] =3D {
> +       { .compatible =3D "fsl,imx95-csi-formatter" },
> +       { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
> +
> +static struct platform_driver csi_formatter_device_driver =3D {
> +       .driver =3D {
> +               .name           =3D "csi-pixel-formatter",
> +               .of_match_table =3D csi_formatter_of_match,
> +               .pm             =3D pm_ptr(&csi_formatter_pm_ops),
> +       },
> +       .probe  =3D csi_formatter_probe,
> +       .remove =3D csi_formatter_remove,
> +};
> +
> +module_platform_driver(csi_formatter_device_driver);
> +
> +MODULE_AUTHOR("NXP Semiconductor, Inc.");
> +MODULE_DESCRIPTION("NXP i.MX95 CSI Pixel Formatter driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>
