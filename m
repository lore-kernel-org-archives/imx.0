Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65065349CC1
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906761; cv=pass; b=P7pTBUrQpolCFF/DBv9wnSw73238OSRRt0ptoe7kpZWVpM/f+h+UloyCL7Uy/CiVrlc91JEUBT8IhuiVJRgaNhPHE/O6gUGIWyYtNOsYXWMvBknO3WJqQuyP3eQDqLY1+WMZAd1KPAHV5ryMExJN0rSGbu82kWan+FRFwjv0+/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906761; c=relaxed/simple;
	bh=UwjP0NYSg24zOH8TZtLUTQOgPTNa9L+d73VzBNV/l60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=st2ImjjgqtbjzPHJWGkip5LBn4FHD+tDooGDfMJQCYgxgZRryk7VJ0OZShmKrGRfruCiQQckjkYFDmO3urVw9NyYfaoY5ilwCm0+e9WLXt6Zg9lOHc/AlrqjWNohsaJ6xmAe+a4Wzr0rjGLoZkkCFj72bnkiicWyjeRc5KvzJ1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nYWy1J4Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KtMW8mOL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nYWy1J4Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KtMW8mOL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OEHU2v3467953
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 15:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=; b=nYWy1J4YvasGb28T
	P7IuEzgm+jZE9tIL7w9A8gLlWpk4zyR82mseGSDhqeGl4HEaEJYLMWTxPk/RrXKA
	jIom/zLXMzuEfoQ/l/4oCUjQfN1zcI3i+iqxX3eDtx1lqRTYjzdftBKX1wasjo5K
	eZ2sI0PsDcf4NPappk6EErwhbsNVDsbR7zumQfdmdDZiKC8CnUM2AJOb5UNVHTBi
	4xz1saDDYTRniPXaC/2wPn5RuP4Hdz6UsCrB5TzT33r62lQ8HCZyLDwJpvT1ghgH
	7x6BoX1IVouJRZao0qUYSHuCBLKg06q+4VXr1gqjiv9nUxTEFZ2/2tOCLfLObO72
	fE+2ZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm9pd08fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 15:25:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0867a75ecso10970466d6.3
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784906759; cv=none;
        d=google.com; s=arc-20260327;
        b=TbiWs3jAwuUro3uvT0arLVxiakfxwa9URhGGvS4y1muGB4U4tnsXuqK5Mz4vNMUI0h
         OA+pVGf/esn1uqmA/ZiX5hKY5fTrEVkPOuobpLnaZd0v/1WMVXzpLgCckNeGOSma6ExS
         x82NswseFht5lvRimRWP5JrC/fBnRcHp4N1by6RqWYF3AMcrankGShS4sczqr33oeIHI
         9gCbgugdQo5BIHmUIdDqJiFoKUzCQZHuhFysyGJ60ACj3AptrA8DoKE9iPwYgo1UN4Z9
         qvm1ea3v6mBr84Olpg2/IoUCZfTS/GEBF/VmgdIdyAhmfK2H0T7vCUYO+Ioh+ZXHgc/S
         K7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=;
        fh=cq7kQ3pGS1+Qh7fzr30OUfip2pha7kdz/fy2R/UYh0E=;
        b=SumcpSdbO5uGUsyRjACWFRPr5+DbSALFHA4mXZv5J7I5nZQxY1HW/HdCKbW2q4EKZH
         psCnklOifV5mixmoont/ZOxJlGdhhd/MDUmGYUsIwSax6Qt7EaLJ0l1cE5Uj+p4qDlSu
         /SB0v3inPvgbJlh79Te9GbIv7bdTAB0MU9MgnU958NUnRbC1lEld3DgUnMgx3FvXIM4T
         a/uoOHHTgbGYocwkGizv4JJYzUF5/og7fnvxnXYBi91T7G7M9iVkdnYu8/ljljHk+8tb
         e0ChN82VpAS4OLQ1Spt4kuwbXQI7x+IjhvdTv/98WpTc/oz6kEka7+Ow0hW7t2DiM1je
         TwNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906759; x=1785511559; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=;
        b=KtMW8mOLX5c4nt8UUfoDXAkwuBAwVQTCFXzPCVJmQXCX/RBpL+3xsBaQ7quwwxTNjA
         9rIKafv7QaV5IhPf+XekhCoZ36hCkkephm/KoYM6AyXrFf+/WDTfTvQDwEHOGl/jM1iD
         cWIdKAXvyk1Xs2LqHjvnBvfGyBelowoNl9TTwS4wrk4id64t+eh5ZTDxquBLTWx5zQZl
         f43PrBpqiMox58uBc9H9OBMnFCQaLBv98By6kbH8zy/AB3snxnWsdRD6j5UHHXg5Ecpc
         gf5q7luN+mtOYY/0RHnZT1ohpX9Yn3+tFEF2eN2dTnY0lTJV/3pCuG27vFllshBG1c6e
         c/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906759; x=1785511559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=;
        b=c6/7kJEIvJLUUUTxPsXsXpMYjZssqXSGAVXco8jKlCCUmmH/wlMFioS+gCmhCKIy+l
         6Hr09Co3Wbr3S34Lepbp3PWBhq6/vVQIml1bky8VmiIqsQTSTr3JunLTL4pBoC7S/q5n
         D/ZOloQzZbhdGnlv3P/ICF8hRz/25jHTTLCSUksG6NYCrtxhO7TTqUTbZ9RRL1U/j+jm
         HwHDI+SGbvipxIdcj+FHpyXYcsCF6KagEgf6m2iUNCIley3kBKFaSM8NETDghiwku3pn
         yhkNZ3iCOum87hGEL7A4r9awDGntn4IlWTTpwe58k12kirpr9tKGcemyqN64HThW/l82
         GZsw==
X-Forwarded-Encrypted: i=1; AHgh+RooXRRtZkJ69JKDBZFLRoLOLgx8K9TwciLjsCY42vJmBnPlNiGQ2t4aS9pIXyFbBmgggSM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIoSVoUVqj8eM27R7UTJaQAfS0qnJAhu2V1on8qkTkLR5Z8fv9
	6RpPQLWOLOr+1WYEFd6BjUB5JBV8URTIEz1jw7SQJKs+VtB33WqGb6dbtJFjzV+n+cSXWWudw7H
	26JWZ28fhTo4CXSfhC3L9VcTvMqUjnS+8A3DSl5/BsaADhzZkyXKR/uqQbgLULxzP5zk8t5NMbz
	Fft5Pai46zACdCFesD7EB32MprKAEZnQ==
X-Gm-Gg: AR+sD11zrc5YGFfCpkRaYAI3z2T0SeOOHhq/7Tzis2HZARyowRWa1QbbNCLk4JkU9It
	A53x7d1aXHDH5oHWkWvf1kpP2cTRth9gRtn5S0EFkslQ2gG2cE66DVNks9t7GztJKL3ddnYCeqJ
	MHj09/a6Bi8qFVcAgCNKeKsPcywXlBOzy3uSUjHZVLtN3CbFW9MCUYXIrVqQ==
X-Received: by 2002:a05:6214:29ce:b0:8fd:6e22:c7ec with SMTP id 6a1803df08f44-907ca57ac87mr92244486d6.61.1784906758554;
        Fri, 24 Jul 2026 08:25:58 -0700 (PDT)
X-Received: by 2002:a05:6214:29ce:b0:8fd:6e22:c7ec with SMTP id
 6a1803df08f44-907ca57ac87mr92243986d6.61.1784906758119; Fri, 24 Jul 2026
 08:25:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716132603.2327847-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260716132603.2327847-2-u.kleine-koenig@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:25:45 +0200
X-Gm-Features: AUfX_mxxKiB1do-atg-rTre7pVoswHFzTOplPvRF1EBywznaNQKzflz6UIrGwS8
Message-ID: <CAPx+jO_k2fJRvXiNiqztHXDbCvkHrDzbM46egyiF7RQX0rsK0w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx8m{p,}-blk-ctrl: Add MODULE_DESCRIPTION
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        Xu Yang <xu.yang_2@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: lCV0cVHNoki2h7ZGS5aICw4mJ7by3719
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX+zY9cRY+3EEP
 xizdxoG2GrZBISWKhiBQzD4HBiXRTGNAw/woN0lFZwtpzR7/DXks0g/2Zoj2drnA2LrFIGE4TdK
 RotH7lYFekRHewb6gYO4dIxSY23Xwm4Kw91prqSYLSC6t0pDTzvZyp2hW59js0NzidXGZrIoc2U
 gQT6N5FbPbumuEjWyQYIlRSu828CBm/D/XPMQXCgxaim6W4jYfhdH2DNf/B7gN3boYurVP4vor7
 NnQajthF1FSvz9hz2YUVt0TWcy38+3rTymZE60HlQvDkNtBAL0Ykt2PcwzGcQtsBiKXj1h/UzFC
 tyKPKu3KE1dPEtOpkxH0q2rwmGPy7EQkh2Na1EBcRvRfJ/9ELZHk4oZXgvHj5Siw0x2GWfw5IIk
 WUuXJNhvnnMh1TyNv732FRlGlBKRIJ9n2RGenrezsL8ISQdhrutIJEyen54UWMyUCUPhkmY80ks
 TuIFysUwKSG/3tOQutw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX9WEIXSh/uvDu
 1PsTqRxE6KjoP0GaMUPhSOcw9djI3AcptdMGBSUylYvSX2uWwh8Cqi83rrstZ9zyjWwqGYol0pr
 Uioc5t5RQ0RHIYQYP/j0krUwu/pteP8=
X-Authority-Analysis: v=2.4 cv=DLW/JSNb c=1 sm=1 tr=0 ts=6a638407 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=IpJZQVW2AAAA:8 a=GSG5rVEFErVBAG7bqOoA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: lCV0cVHNoki2h7ZGS5aICw4mJ7by3719
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240138

On Thu, Jul 16, 2026 at 3:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Without a module description modpost emits a build warning:
>
>         WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomai=
n/imx/imx8m-blk-ctrl.o
>         WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomai=
n/imx/imx8mp-blk-ctrl.o
>
> So add the required string to these two drivers.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 1 +
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 99d100e1d923..479789009c7f 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -953,4 +953,5 @@ static struct platform_driver imx8m_blk_ctrl_driver =
=3D {
>         },
>  };
>  module_platform_driver(imx8m_blk_ctrl_driver);
> +MODULE_DESCRIPTION("NXP i.MX8M power domain driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/im=
x/imx8mp-blk-ctrl.c
> index 3f5b9499d30a..d255c20f58e2 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -890,4 +890,5 @@ static struct platform_driver imx8mp_blk_ctrl_driver =
=3D {
>         },
>  };
>  module_platform_driver(imx8mp_blk_ctrl_driver);
> +MODULE_DESCRIPTION("NXP i.MX8MP power domain driver");
>  MODULE_LICENSE("GPL");
>
> base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
> --
> 2.55.0.11.g153666a7d9bb
>
