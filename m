Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ADC3ED10A
	for <imx@lists.linux.dev>; Thu, 28 May 2026 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971120; cv=pass; b=cY2/cxLVqeg85DE9y8GkGKhQnUMh8YWvzt5pV22siBFEW4dBsgqm+8dOcIrULztClB2+xg2M7agF2CkbFIrcIvToj1E58XC7iv2gS1nPYkMam+xv4cS5vjWKU6OPd1sffmdnuzQHPJnwU9ZZHmjtCIB8DDfkgvphAebI+sEuL7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971120; c=relaxed/simple;
	bh=rjGKcaiPzzE9XfowjPUEZRn6zT+jUKQFamebPp3qZ4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoBdEUVvyIFIOhj+sQo1kBMgmoVdsybaGMcDAA+MgHIjntaawABzMap7orCPKLwJ8209LcXCRdzO7IBlEi4pueKMtAvHx8p3huwWGF9RMbC7RPQcWlE63tSrTwaD/6Vphw4HadbTuMc7zZE4458cCUI7c5bPvxi46+NtbJ/LDgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prEfC2i4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUxZRN+4; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prEfC2i4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUxZRN+4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vbNK566544
	for <imx@lists.linux.dev>; Thu, 28 May 2026 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=; b=prEfC2i4IyXES7BC
	cmHulPI14uPbrVtMetN2T5yu4ICQO00WgaK+A6eXmgJI1v7hE9fii++rwodl+CgJ
	mST0ZvEIHGyhietuMO6fYzSAJNAzRD8ppMDX5EdMynHhNRkTmvNeu5bXYvzPcKdB
	rA6oIBqgnEmljP1Z0rxr7yVDRlNHKXT0pivyyFO5kR7FlVfxbwaHpqz5Ta0WTbp9
	6BnOI1vOHCLXZDz//RqETpdeYe9/zaf6TLaJHqlz7Bdkrx1h3kD3pMG95XEDk2MC
	DvpNyX4lbx3Im5Mx5bc6unNLyEB6lrMTHPd+XBXSQFjT+C1Wg9a7joPe0d9r3EBz
	WzGJmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjntf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 28 May 2026 12:25:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9112b2755abso2841397885a.1
        for <imx@lists.linux.dev>; Thu, 28 May 2026 05:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779971117; cv=none;
        d=google.com; s=arc-20240605;
        b=W/zzhUM/FeEoEj0gJLy2qXPa0UtLZBSOB9P5tot4FmgbRQXTGH4G5aRb9eGqsu84Qq
         ZlP3G/Lzowym18YOLsorGNljMIyf2JheIL5kO6RYhaqDsJ/9WHldTnlTw06zOpXxSc/a
         BdM7aBNHFPr6PvnlpeftHvtiaQUlH5LALqNXQDEex/Lq+344AKaT7afnOa/xjRNsk63u
         q6fQxKQL8CMZILio1Y+zRSlXi5/lzfs/UP3K19NObWKDpQn6QeMgXHCRCqaumOgAjRif
         iSJiCpwEjFaXGT6pAoc8ItjFduOQzJ+JsLbwJ526pnTiVGsi76Nglpu3UmPyRKiWUwV7
         hEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        fh=ulrsLcOtPqmYvXxAia01i+AxbitIbxswxAWX9UsETic=;
        b=cuonBc25L3nFiAcuELbsN+mST6xJQ1Gnb90UaH3gTOVH0bNLIBosrHsgkDiqonf3P2
         np5jOrv6SvsishMkNSzXh279vPoEUJA9xe/iRjqm5xLrB/AHqfjiNI0cGIAjgVCUUi11
         62XD3kmCZC+A65KtGnf8R6/UJYCi/RsbPg/3q+vA9f56wjyHmco4+8ZZJh4Au1aESdhr
         pcuTgVrGRjGwb7T/CRsfCYBf2W3lf0KKPI7jb3uc7+e7ZB8Xh4RmE+9K/iZppDRCu5gB
         /vTdvep0eCLenPWv1ApMLT72CZ/SCw9ZlKQT2SqqbzmVhITKjPWhFim/N4UTwl2WPeq2
         WaWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779971117; x=1780575917; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        b=gUxZRN+4nT6tFGqNyP4rqXHtygH3apLq0hgicwECfUsSw8s1SSz/lSjcbKJODH594l
         nwXlCS5nWcKhRDr4f7GjPFj0iBRe/ZxwSnsTBysYcOkD6uVP3k1NFbBhiPQIrPO5wdMv
         1iiyH6UU2Kcb9O4KlOilrNHUyUUoj1kBJJ7Ky7Rh3o5lWcDTHYqJ6q9StwchNbAiG3Qe
         LAzfZyzAEdzcs5EhVgeEbM6qp8eCzeqalFSzI6XMD2h/llFCYmwlxqq8wDuhvIKxKQym
         3gS8QRhPs4EXOisjkIQV9EK/2v0IWeagT7XhQO6u0sBpjQTSX8TWaMLJZ3uWT7/GxeHj
         Mw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779971117; x=1780575917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        b=PdoDsOBQR6v11wC0wRfrPXFGIlvp+kR4HQ6eCZtnYkdqyLKRiKkg0lwk8oARtvpUG+
         2mS+XRkRn+Dgnbwi0jkLYNVlRGJqzSGPXf27gnpcyYXTBpvcnrY/NiI9Br2+rXjbtktN
         vW3eivizhmpIPZxb7POTsMGEAs4R30zZ1kBjxkuif134sDSmoweqTzBE4/XP3RgN9RsJ
         L/1DyI0mhtfOZ60vJXYv876hXpRTNjBuP7vOgG2NNDoSApeczn1NGXZSCl8sSIgOfkVk
         IlNghUQnHOfbdeLtEONFRs3/aVuL5eV6WTP93xtP1uQ4Of9zSdvO41+fNodKlZKAI+6A
         Y9Aw==
X-Forwarded-Encrypted: i=1; AFNElJ9IIf9g3xei3gg5f3uyJq+x4VyH4qEruFuXhbrnPM5o2fPPwn99ndpX03u8ZlBhGLJNiMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZjsQZ7rCfzeISf9tUVHLwtWvQ5Xpi5arHKqNx5HLfmEzPckqE
	VOjfPxAwuMCxWeeCObJECmfozlvaQfhyuf4WCWvMso9z5voyl4nTHw5WzDL0oAwqoVfQw9PntF/
	UlXsNq85BlOW9KHFqRJP5b4Jv283VGZRQ4yTq2zCmQWlpWUqqiPOtPrcNO2f89bKHHpw0drCBZ5
	SZ1TI56ASbTRnnqh5sJC5pIjCZGe7E8Q==
X-Gm-Gg: Acq92OHT+W+TQ1cCDTirsmKqiQLnE5Ic+r8EzNyLthELgvZ0omg4SOE5mZJ9wptmwPj
	BdxKyrqtiGAnNQ9mP3VrrNFvNExOTKI19BazbcfdXXVUPIFEWEXkGC9LzlqcEdt6LZCu4bUFpEp
	SbKWEu9ig7xXLq9gLsoFG2/Fju7GcLLvm+eJ9N09NGIxJiQ3fniG378jdW3bTCKn/mzs+0S68Yb
	iqQWCLEQUSBn1o+iAVCzGXrur0HrbnYnaBpMjB4evzk3vkR
X-Received: by 2002:a05:620a:84c4:b0:914:c0bc:a7cd with SMTP id af79cd13be357-914c0bcaf11mr3886829985a.48.1779971117099;
        Thu, 28 May 2026 05:25:17 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:914:c0bc:a7cd with SMTP id
 af79cd13be357-914c0bcaf11mr3886823885a.48.1779971116654; Thu, 28 May 2026
 05:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com> <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 28 May 2026 14:25:04 +0200
X-Gm-Features: AVHnY4JO8P8GLceB0VuUyA9tvcNmn11LuhgjLHguxnzI4BEUk6ZkF0V4tx2XITE
Message-ID: <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: h1zIrJLFakXHYKIg1PgsMFaYcD8VY3-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyNSBTYWx0ZWRfX0bOqrdi2z0ZB
 fG0Q0uRM3KkeD+R4Vwz8dK2TROQGBdyFxJJ1K6CpycMUee5lh7ez2DD3bxNCRNius6MQzpE8SFD
 aPsPL4uyIJQjsUjuPznhdG3gxuh82Xb7UlAwoCFcp2SQxxnXDzIdT1i/++jY4nBxjqp81+YMCjF
 JIcCWCMfzagup2Lv8aGxN9MBSmkigPpS5tkMl6U8NGVPuwydzH0rWLkkEbY/CHL7NDzjirsXeTP
 eTPFJcPdyRf9QHGZF9QVsb67eHwFf0QNDBp3iKlnf9IUyxOLn06OJOqgldo2m1WbaAZ7M3WLbSX
 lh8S5P2CIVEujVPTkzVMsWSIck0XWj7SM/73nDCZCa1GMhS5ICqevQneu9R6ihU3LuZewY9DQk4
 PRULN3DCFoQ1lMEM8DsstKndkHAo1P/f5h6bfs7aGUmSWMzJM0DDrAEz/y3aTh+0cDqhSxbPVvQ
 OnxyweMAybVzvNQ277Q==
X-Proofpoint-ORIG-GUID: h1zIrJLFakXHYKIg1PgsMFaYcD8VY3-4
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a18342e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=8qkcLw8Gk86Nxc3JiHYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280125

On Tue, May 26, 2026 at 7:13=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>
> Add CAMSS driver support for Shikra SoC. Add high level
> resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
> with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.
>
> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
>  drivers/media/platform/qcom/camss/camss.c                | 13 ++++++++++=
+++
>  drivers/media/platform/qcom/camss/camss.h                |  1 +
>  4 files changed, 17 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613=
649920e6ee1a1f2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
>
>         switch (version) {
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>         case CAMSS_6350:
>         case CAMSS_7280:
> @@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy=
)
>                 regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);
>                 break;
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>                 regs->lane_regs =3D &lane_regs_qcm2290[0];
>                 regs->lane_array_size =3D ARRAY_SIZE(lane_regs_qcm2290);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad=
57419b25cdec087 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u3=
2 sink_code,
>                 break;
>         case CAMSS_660:
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>         case CAMSS_6350:
>         case CAMSS_7280:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4=
e5fe880007d1ee7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resour=
ces =3D {
>         .vfe_num =3D ARRAY_SIZE(vfe_res_2290),
>  };
>
> +static const struct camss_resources qcm2390_resources =3D {
> +       .version =3D CAMSS_2390,
> +       .csiphy_res =3D csiphy_res_2290,
> +       .csid_res =3D csid_res_2290,
> +       .vfe_res =3D vfe_res_2290,
> +       .icc_res =3D icc_res_2290,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_2290),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_2290),
> +       .csid_num =3D ARRAY_SIZE(csid_res_2290),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_2290),

So isn't it exactly the same as 2290? wouldn't it be easier to have
the shikra simply fallback to qcm220 (via compatible string)?


> +};
> +
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> @@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sdm660-camss", .data =3D &sdm660_resource=
s },
>         { .compatible =3D "qcom,sdm670-camss", .data =3D &sdm670_resource=
s },
>         { .compatible =3D "qcom,sdm845-camss", .data =3D &sdm845_resource=
s },
> +       { .compatible =3D "qcom,shikra-camss", .data =3D &qcm2390_resourc=
es },
>         { .compatible =3D "qcom,sm6150-camss", .data =3D &sm6150_resource=
s },
>         { .compatible =3D "qcom,sm6350-camss", .data =3D &sm6350_resource=
s },
>         { .compatible =3D "qcom,sm8250-camss", .data =3D &sm8250_resource=
s },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d0=
5b2c3853f3a7714 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -82,6 +82,7 @@ enum pm_domain {
>  enum camss_version {
>         CAMSS_660,
>         CAMSS_2290,
> +       CAMSS_2390,
>         CAMSS_6150,
>         CAMSS_6350,
>         CAMSS_7280,
>
> --
> 2.34.1
>
