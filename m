Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37651448B81
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247717; cv=pass; b=qBIl5mS9DvOvlatYaZBEyfSPcfMNnT9y7+Fsw769FsVHkr9znpj8FxeyqGke4YQGzKosvimjQYcLjfccVtU9W77yZHy/Bo+o9x1gENo8c/AsrYZmAlgamZmgaNUA7M4Gfq6Aki/Nsd85U78zEL3NUXNZOlya4l4SyJH4IMKAsBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247717; c=relaxed/simple;
	bh=ADsl6Oh6BO5X1ATAFohCJeEUaOkmKU8XJWSMqfZeHIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dz0oxvC8QsWewM0Y5dENLhOYnz605TBq29/YU1Maxa0eSVPSmedlHbp9Q9meZGDfGlJksq+94Xf92NvQFU7L2rKTeHvU42PZgQ49dVQBsUUtYrYdcQP7bEh5Nczbije+1qtBTgvkcxRxADMBOcuwdHL0+BF+7MuH1d3o3GeDk3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSoDKo1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNb9ai/m; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSoDKo1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNb9ai/m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDP9bw3030429
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=; b=NSoDKo1DRTM+d2OR
	xcEg1CPv1i2miZnJHhIKmXpRMqLAujW6GhWOPhBY0uv9AQR7A4P6Pvi/QaRi4Gfb
	GuKIhxcWvRXsyyaRla2PP+uge6SSh/SIHcel/gxQ9OXho2SFBiNfbssTEaAIvi8G
	22n0s8kUpjiGc2dqB7pqH7lw3WKyau8wCQDa0Zgah7No9Y86wLfxm+cTpwKPkTNG
	khkMlFaAND0JHSVlf+6tr1cYUZCqvgOrQ0rkDmRpcPNS4RlBj5ccNdOJOuSNqvwV
	f087lQhsUae6dRhITDfop6Zeauz66/K8sHlHuqpKQEAWm4or6M54rPRGs06G6dka
	zfO49g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvtv8bfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:08:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso111055585a.0
        for <imx@lists.linux.dev>; Tue, 28 Jul 2026 07:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247713; cv=none;
        d=google.com; s=arc-20260327;
        b=nS/AghRfv8V2jrgwUmi/sZlVoIpDIQLPu4pXQzlhtrzTj89kdYF65N80Z0TH9tBkT3
         bjLUX68PjukbIg8jlTwJGJJjkrCuh5GBKoy+qUiAqPaXyssLfqceo9x1SdUKbpFIFEMt
         GAwjrZTfpCIrbfmEZGgKnMLp410WRt1J5uOqmslz9gk/AkfbE5LR7cus+3BKHe3Eee8p
         07NJ4UQ1CeugdKsTYwxOduiaFQ9YB8jumiUK5Q8mkCrZHDMbQon6i78XPvPI8T8pQ17c
         AGRdHXx/qBfx7TnUkH6KGzvdRvgrzaskCYqS2tvz+O9Fl93X1FJrZqs35EAOdh6JOYj2
         r1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=;
        fh=UerxRrXtKpAIhaZVJ3mCG4gtWkESEO/A4nsqoAAF35M=;
        b=s4UUzC7C6854McPILGcrgV4V1qORQxcAlRVpFZEwUysiIdJ/KaUp6f4YUDxvHd+iLT
         lwJR9xK+LV1G2lFssaXWscpDmTH+aL0dJH5cu0LdUaAhWKlYxO2Ruy0jfB9xC39syo6h
         MeDQBbrEkOuHj83MSHGjPY7i0bRin4iOPQcmDAsEcyrA47eqtdFrDF99TAEaH4bNCMEY
         s7hJ3j2Q/0NeWZXfSOp1RrZjqG25Zoztdqf1nCb2iQfB+7EHlwVTUxuu77PBHZ88nZPF
         uhBmU5TM0oZNfTl5wlbLvxZxQFrb4oXWYeF/zmS25FrQj7wLLHC8nlyQaWi9rYldK0zN
         Ygyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247713; x=1785852513; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=;
        b=GNb9ai/mr6E8JtfH2HeejuwM6XYAV1sLp+2PHRwP/H5dMc26Kk79JFl2/Fi/rwTjn9
         tYXFtERo4uB9Qt7nCim2lwc1YvSpOuVaIR5Gba80v54GFoXMC3EUtFYb7+Li/WsTuChx
         eIE9nd7few2k9hBXsHvGI/O5E/ptD71GBdtIkUiAYMQ/uj+VCV5vR1cGmBC9RBya5uG3
         QLxmGCYQwAt4adfAqj9ngyTEK39B2Z4Vw7vrpC3ifBFpptgDrp57QHDSu2wUTA8gwP7c
         foMLmbg1W0cqBwcElqDYb0fp2+NJMuKgO0sIb6L28Uwf2Zi3n7eGEv+4O/WxOXCLV5he
         qJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247713; x=1785852513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=;
        b=qfzKfVO48d59JbiVsLWZhkSO1qa38eGUricSzuUNqtd+3nX4J8FCx//y7zBSy0dEzW
         jbEIqF2NJxuavs5VB3jw655modnG0LRahZcVvGhioj6XefvHjHrAGI92HKgZe3vPcHdA
         aUGFnuMJDR22G/rbmo0PbStRv6qZAPeQv6ajP2k8VoPirAHExtPSzbAcYDR1w3tO2gwJ
         wK4hxCAXdDog8o8h3oouXgD6age6pP1AdqKE8UooHLwaw8yFL8tihczQjgEGvPl0BFQw
         Nm9LiixY0MQiwh0qXoY2MFfe3TPUUnpdtEp6CEs33O9bHRaEb+Ie8pB0gGDwl8CwXAnA
         5XqA==
X-Forwarded-Encrypted: i=1; AHgh+RpeeRitRjKLdeOETqujg5Syr/XAiEY17sdt5oWEASw7XpFgKQgp/HZQVUQ+fKXWOvWUChI=@lists.linux.dev
X-Gm-Message-State: AOJu0YypvxiwFxcmwGJdkUg2/ePvQ/Xh1soB1GrR+mEDu+KLkv4fNeSB
	KQ5oG87KNK7FO6j6J2IhlEL7ZD0eedcMTK6qVM1J1dJeW1Bi5w11uG4iOLq+wsCPxRUjVX5H0Yi
	7/p0yDJjspQYoZypwZoLd6OkiyLcEPeG7WVz73ULXqgcQ0cTz8JXtAXCOOtIut3DUfBvgkRdCaE
	INXgejxhzsn85xalb0gIpH7Oi6FzxBOA==
X-Gm-Gg: AR+sD10Wo/W+coEnR1jowbm24oRMgy2b/ITCR+W5/eVcv+b1V9DLpnpn8Gh3O26dSqE
	Go/iH1Rt+b1CTJw3mNpx863VnwK7O0ghTYwfEMUeZ03d/PY/mY5EgrmkhOs+ASsGIb5VFAxMspT
	UI7v9Ahr6y7dS9urRooSnmLdn/x1tbv+k2QH6f7rW7NTc8VRoPNYhRfiYvWZrKmT0AW1ypxAoYu
	g5aJMVWRVvXvbuuheLKpuN9saXyat4pc2AFsmRBVZ46P3icJjGcYl3BYfpMl5h+l8JXnzVhPsU=
X-Received: by 2002:a05:620a:25d3:b0:929:f78f:6bf9 with SMTP id af79cd13be357-9330263c462mr233336885a.16.1785247713121;
        Tue, 28 Jul 2026 07:08:33 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:929:f78f:6bf9 with SMTP id
 af79cd13be357-9330263c462mr233331485a.16.1785247712676; Tue, 28 Jul 2026
 07:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com> <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:08:21 +0200
X-Gm-Features: AUfX_mw5JcxlCW6NeAN0Cy8X5f4_Rk6VWvnTqzYs1-6WgLhGTre_063E34AGeNA
Message-ID: <CAFEp6-3jntC6xQLDLjQdMps5Lq-sOCGEtMnkFTtrCDZpngBwRQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] media: nxp: imx8-isi: Use BIT_ULL() for 64-bit
 stream masks
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
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: KMG52IxA0tCpallTbTgj6EiW87omrEQ6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfXyYIqW6M3fhw6
 wwu6GmUWQ/Crs2cURxe1Fv/q4R/jh9nY4CW0WKgGQ+VWni/KJTgDBIZjCvThBMNsHmHZad2S1uw
 umNxrIpSVNM/uUOm6SE4zXkXpPblFNY=
X-Proofpoint-ORIG-GUID: KMG52IxA0tCpallTbTgj6EiW87omrEQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX6wJyVmuyl4bD
 1AFpamnK2IfliJhuHhUTa0kBFv3/YvmTh2a0bxCusv+LH5XjbGNjkqFzOpxGDNuwl9YdrOGZtI+
 mdT4xOMPCMS0u+0NVgv08efsDglJ3/BFy5ae3133oI9HL3Pvh0bCntieT/hRZU+7ij7rxMIAIJI
 D1zPSSwPRqoOSSM7Tet2CIHKttpDwcpID4c6BVW+L5Mm8JqPpwCJVlxPUnKADO1Wwcz1nGkAFnl
 gBb3mn9fYA/kddQMYiRki8p2l/VmKwW+xM/T1ku5l1iX+KEwd5pKxr1rTAusLdqM8s1IR+HlPlB
 8OqoegEoO4uy1kw2vDUrgUwLKRrmtYfgq0C0GTCd659xfLp+23GzaZ35oGNrJseliObtN2qR/YO
 5Yt/DWolciANyWhB2W+0xKTdm9RP+gmlgqFIT3J7TtCMOk5EBpaw52ix8V/twPPiN0G8bkrf/Jf
 +noyOba2ddH5hFohktg==
X-Authority-Analysis: v=2.4 cv=dOiWXuZb c=1 sm=1 tr=0 ts=6a68b7e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LElf2VvS5UWv9C91Qe8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280125

On Tue, Jul 28, 2026 at 8:55=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.co=
m> wrote:
>
> Use BIT_ULL() instead of BIT() for u64 stream masks to avoid incorrect
> results on 32-bit architectures when stream IDs are 32 or greater.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 9f0231ca47a3..9db9c6e55c2c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -157,10 +157,10 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_cross=
bar *xbar,
>          */
>         for_each_active_route(&state->routing, route) {
>                 if (route->source_pad !=3D source_pad ||
> -                   !(source_streams & BIT(route->source_stream)))
> +                   !(source_streams & BIT_ULL(route->source_stream)))
>                         continue;
>
> -               sink_streams |=3D BIT(route->sink_stream);
> +               sink_streams |=3D BIT_ULL(route->sink_stream);
>                 sink_pad =3D route->sink_pad;
>         }
>
>
> --
> 2.34.1
>
