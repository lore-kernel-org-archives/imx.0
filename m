Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB58631F9B9
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035535; cv=pass; b=HKmKaYzjV1zsmjz0K2s6mZNGIyTUqHJcrh68NQ1WO8G1it0CgIGfbTHLet1rmC43a3/JpfJGN/o4Xi26BjWBvd73AbFFNEr5CMX3l+4Y5h2Ozvi+JQ4+A+b8OpuQGTZN4g8dwzXuunQlQ60mhv6DGlwR7Ggmcryo1oh+Asjax00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035535; c=relaxed/simple;
	bh=U+IHAhlau1+FQ/9SnNbSqU3dkHQE3mjTxVianlAUiZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A56UnHhoS42P/6d5IVPrvXJ+uFfTd6LZZNi+mvY6lx3kMAfv6rVRlC9cgu25cFRjU+A7+aagf1ureJydMcjpSJ6gKq2aobpo2J+MhW6+yFAYEhJeG+HK4VnOC4uQn0xbU6aMe4C4HqTUON9zIw1gsMKlVx1GpTpCxinLOPX+Ang=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRyaAp7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OcKe/TVJ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRyaAp7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OcKe/TVJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO2ud377645
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 13:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	717QVw0yJNdagVep2nzauZkl9EHE4Pz9tV4rojKV45c=; b=aRyaAp7aH5SEoQOK
	km6Jmp/T234j31falyyM4QXkeHCbrZbFztEpbZvnNNmXArVNt3FbJjN1WhbJwh5T
	2v8xcpJlodbeCawsXGGH/mEmKVsmcYyYcQ4ejfl9DQaiGcizak3TkjUdBJ0Mj3Te
	Tli4AjYc8O2MtQtAhDgf8bAfjdn9oWY/GLlXMDEI4+njXIhhnqeI7Ll4jPJ3cCH8
	oBxhFdUJhQi9o98L0UMDFRYUOnCBbT9Njm3AsTENO/q95S46WyLt7a5H7yv7Q2Ic
	9idLhuTPPQ+miS7GRBhHle4zuMkm2bpsfojeVsmu++KmOWCLriII27sExOkUQnoC
	omPPZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4ag00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 13:25:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so96155941cf.3
        for <imx@lists.linux.dev>; Tue, 14 Jul 2026 06:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035532; cv=none;
        d=google.com; s=arc-20260327;
        b=fKn/1HT3UBPv/2EEJ2IzwWA+c5Mmctc9F7tIt+NHYI+uhNokfN+Vm3p+45FXWwXKVH
         zbKAI5xjjjRgmk5UP5QZqpiHuXUCjRqlzqM6XOvcdlkLmNGNGp99ZUO/ZhVXM6IJFSl5
         +dVRVEn5aOKU40Lu+L6IFxOJIRj7zQaunDTtmj5laVsJig7J60xv1WRmQ/3VN4l0JynK
         4iKx/xIEIwKrHGVziYGghj/Xhensinkdfh1CYjOkL+aHRIXELiPrnF4B0hSu8e3HxlnK
         l1VcWJpKNYS4beM7Aa20sVx7xqUcMmRiS8F/LUxb5PBxL+cjycD5mfVTAFOZhX7yWoDZ
         pm7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=717QVw0yJNdagVep2nzauZkl9EHE4Pz9tV4rojKV45c=;
        fh=tbf9b8/EfEUMuZ5qKH/jDyjjOypfsavpKxZUoRHDTPA=;
        b=CF9HA2jU+FVohuB6wGnE0LMIPB5Sj98K4auAuhYUMoyG1yRTStCeWVWJSfplaoe9fY
         2krZGYTfFwZq5tPD9l/8k80lBwkGTveo7HDRqIe+7S+CYytHT2WAgDVrLggyc9+cwqLp
         CGJFnuUit9YZoe01aaivFt53z2LpkY4LL+H4fbIWbNEPS3DedL1axUd9nBFSSEeS80Od
         0jIP212YPCdhCzGquaSS1w/UR0Ike3lw+LURpXXdOixvE6dCQBOdl+dB9BZkrKYoyjZB
         L8yG40xjatxD1ERJ90Lbtn5ciCXZp9/KfD5cG9PeNyKEZ6EGTopkpdj35kqOY+EE7ZEA
         t5RQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784035532; x=1784640332; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=717QVw0yJNdagVep2nzauZkl9EHE4Pz9tV4rojKV45c=;
        b=OcKe/TVJrW9m6oINlDWcoQvgq7WH71mhauWVTzx7Q0vb207j9Qf87TfkWjHT4BujIe
         xsdF85pX8nwmJyWhw9LRPgmice0yajLMWvYhhWBRHZ/YMj/M1vCtIAwEvMgAwaBqefTE
         5kMlg9C70CKUM/bf+rTSOvhSRYyyZW4Tx8WnfuTWkmO+D6q4u2XNlvbeI6t82HaesakG
         IbOkmPQNwmV7VOMC27xoybdEzqybKMPkiiKB21Tsk76O/KMMW8ag7f5PfqkYoDtCvT7g
         KsbAt1K5TNO5ZbGyFarqHIGEbtTGavh5k4sJMosxEnq1wYVayrWK/iN027VadgA6YZ1m
         0Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035532; x=1784640332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=717QVw0yJNdagVep2nzauZkl9EHE4Pz9tV4rojKV45c=;
        b=Tr2Yy9Md0oj0PyH5MKLf7mE7Brr4DTqluKvrlqOX4RCGywo+coKHRm9p7JMkye1iQ5
         CmjALqUyqX14iyl5tdEpKuACvCYLNs7go7PpB5aTUGbxDK7ho50p3S01YJW+o6wQkHFv
         hluvQ9ImX7Ly5avmZXCFzHHLSw41tsTFY+0zt84TJ2/b0XykPgYktI8KNaj6aq0x9njI
         2CTIUTPvbjl4M0CrflmI1Iv3lHf68/OKxa0uVkCdG9MognOjeRm1zLYbWQDCFYmOYMog
         9FstLba5UcJYAmMGBnRPtuT/LXO8C5vtxaTXFZCjr2MD4BYvomvuRD2s0Pme8YatuySr
         FWuA==
X-Forwarded-Encrypted: i=1; AHgh+Rr20fXMutD3yNrE7IyBZmyySc0tC6JhEyIysSjWsfE4QyiUoU/oyrBJjitZH0hhLCB6TbA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJTHEOJkfupn5+rSuF0HoK3EDAgOduUhEPQpfpzprnAP276BAW
	fE/w4DX7E5K4vnTUaSeLbnmp6uOdQVWMYzwi5k4vKWOqNdr06WIiikRpTEod276RXEXni5M4PEf
	T4ukBnJDFEb7jyW9Os8p8sbjlNyUEQZbNkv8a5IUBF11CvOkJrkUI5WtsESPYSOQeQUBtHkiKNz
	vzdzvt85eP68DjWjDCatpwhGjHh100MQ==
X-Gm-Gg: AfdE7clCwZYL9Jb1IpH/VNwmLVHJs7mQXqhTzglLJN4QlUD/NrMy4ZZKhYqzm5wmpkj
	J43tLF78lnlbst4Ggo1yygSiOFSWRrHLanVv34nvzIOd4dpMcdtyNeGrEDHqQNhNZeokhW5snwp
	d72LZH8yh+LdCuHs7WB7qECI+lzKOuTay0OiCV6t/sEV2OxGUQchOdq5ya6XMpqWstjo5I
X-Received: by 2002:a05:622a:4885:b0:51b:f0ab:2b1b with SMTP id d75a77b69052e-51cbf26daddmr133077611cf.49.1784035531792;
        Tue, 14 Jul 2026 06:25:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4885:b0:51b:f0ab:2b1b with SMTP id
 d75a77b69052e-51cbf26daddmr133077151cf.49.1784035531296; Tue, 14 Jul 2026
 06:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420022254.302740-1-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260420022254.302740-1-zhipeng.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:25:20 +0200
X-Gm-Features: AUfX_myUc1dBICALtzRuHVKIlbb7qfNnmRBTvv_VDYs9K5Gif0zPw5ow6tXTGB4
Message-ID: <CAPx+jO8WidzjwnGspSTLa6urva3w3qrigJ46CDnqOTLAh06XBg@mail.gmail.com>
Subject: Re: [PATCH v4] pmdomain: imx: Make IMX8M/IMX9 BLK_CTRL tristate
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: ulfh@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, xuegang.liu@nxp.com, jindong.yue@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: x4MYZ7-CpVZXtJbW1ilrFLHry2VG3Fx4
X-Proofpoint-ORIG-GUID: x4MYZ7-CpVZXtJbW1ilrFLHry2VG3Fx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX33mmEzzna6Tx
 NdDsXYfQIFDZyzAVL6yBBvNdr7X2ZZlzRwm0NzB8tKc59dA8nK7kEbyFkdZhff9v6eM0/r0ZiJU
 g4X/pejr17KryIIvQjupsA1zhOXdjfJ8V85DMQDVLU7qwcSkKAXI0KqFoqQsl7U15pUnbCBKKAZ
 /t2xWmjRh4Ik0eAKTgPnHVqoGPs7yrfejCVPlz+JiNyw8CjL40qsnl/Qeh7MNti3Gbt475V1ia1
 Zxpiqkj6tasZjDn1ELgbSiUhO7nQ1w2dXqF2/tEB5OpqoHkW6C51XmBj1iFSQnHOKUXMxLQ85A+
 JOk//8ChdiVMkJ0RJBhSu50kgo0rYrh5JnXdWYQKFNZLyYcLfSBZ9jwe3+y5mT6RSruRvi/ZS7O
 6Sz7O5HP3148QyCZKE+pzxN2nyAE7VVGz5KpylrOqswYfC055AlpWdaSJUC9pB7B03a209SyKIL
 DOakPUbsxyqTeetCl8A==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a5638cc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8 a=TQfnek6nW7prAsdi_scA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfXwX8zTqKP7xHB
 1faZRpizf5YuGWbGCrbhZrX28BrTqW1XArYXF3wDIbCEjGrafoFeRhh4zIVWgj/n9pZadWLuVuz
 Oa4Gm5jgNftAFD4RhbvVfmKHLgDt4x4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140139

On Mon, Apr 20, 2026 at 4:22=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.co=
m> wrote:
>
> Convert IMX8M_BLK_CTRL and IMX9_BLK_CTRL from bool to tristate
> to allow building as loadable modules.
>
> This change is required to support Android devices using Generic Kernel
> Image (GKI) kernels, where SoC-specific drivers must be built as loadable
> modules rather than built into the core kernel image.
>
> For i.MX8M and i.MX9 devices running Android with GKI kernels, the
> BLK_CTRL drivers therefore need to be loadable. Without tristate
> support, power domains cannot be initialized correctly, making these
> systems non-functional under GKI.
>
> Add prompt strings to make these options visible and configurable
> in menuconfig, keeping them enabled by default on appropriate platforms.
>
> Also remove the IMX_GPCV2_PM_DOMAINS dependency from IMX9_BLK_CTRL.
> This dependency was incorrect from the beginning because i.MX93 uses a
> different power domain architecture compared to i.MX8M series:
>
> - i.MX8M uses GPCv2 (General Power Controller v2) for power domain
>   management, hence IMX8M_BLK_CTRL correctly depends on it.
>
> - i.MX93 uses BLK_CTRL directly without GPCv2. The hardware doesn't
>   have GPCv2 at all.
>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Apologize for the delay, I have simply missed this one.

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v4:
> - No functional changes
> - Added detailed explanation about GKI (Generic Kernel Image) requirement
>   in the commit message to clarify why tristate support is needed for
>   Android devices
>
> Changes in v3:
> - No functional changes
> - Fixed typo reported by Frank
> - Added Reviewed-by tag from Frank Li
>
> Changes in v2:
> - No functional changes
> - Expanded commit message to explain the architectural differences betwee=
n
>   i.MX8M and i.MX93 power domain management
> - Clarified why IMX_GPCV2_PM_DOMAINS dependency removal is correct for
>   i.MX93
> ---
>  drivers/pmdomain/imx/Kconfig | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/Kconfig b/drivers/pmdomain/imx/Kconfig
> index 00203615c65e..9168d183b0c5 100644
> --- a/drivers/pmdomain/imx/Kconfig
> +++ b/drivers/pmdomain/imx/Kconfig
> @@ -10,15 +10,18 @@ config IMX_GPCV2_PM_DOMAINS
>         default y if SOC_IMX7D
>
>  config IMX8M_BLK_CTRL
> -       bool
> -       default SOC_IMX8M && IMX_GPCV2_PM_DOMAINS
> +       tristate "i.MX8M BLK CTRL driver"
> +       depends on SOC_IMX8M
> +       depends on IMX_GPCV2_PM_DOMAINS
>         depends on PM_GENERIC_DOMAINS
>         depends on COMMON_CLK
> +       default y
>
>  config IMX9_BLK_CTRL
> -       bool
> -       default SOC_IMX9 && IMX_GPCV2_PM_DOMAINS
> +       tristate "i.MX93 BLK CTRL driver"
> +       depends on SOC_IMX9
>         depends on PM_GENERIC_DOMAINS
> +       default y
>
>  config IMX_SCU_PD
>         bool "IMX SCU Power Domain driver"
> --
> 2.34.1
