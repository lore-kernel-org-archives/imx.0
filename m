Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28563B2FDB
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 14:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001198; cv=pass; b=la852LybuYs1rNgsuMJVPdV9T8iY+191ZWwRvveip9Igo44c9Y4gcRMLKvYd/eJuK2cjNdUzultIOz4Y8Xkc9neVnOVvf4tYaLKzHGqvxDcdkT6aXZ+H9PheZ6NAD+jxlry/ipL3qJT20cta2c/YR/AbPbGsCLZZZtsSej3fRS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001198; c=relaxed/simple;
	bh=V3VrbB6jf588eglCgxMX73QpjqOXaCmky/I8c9HrzKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAx8M30Zcm31dMhR7uaOjCq90axmAJ/z9yk6rl242wF1AcofG4PNdELNofmIAjeIFlsuQjQBo7oHMgfCaahD7Q8wwXd1tMz6Jt6ve/wJewzsUzhjosoQbKsLC5TFN+GuH7eiZdbSKMZjNBHh6dbXMw7QeN6CbOSmiFL4BFxiYCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+QKy3Uh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzCitnuv; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+QKy3Uh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzCitnuv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGWIP2042077
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 14:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=; b=H+QKy3UhNAihHc5Y
	1pf07KnUI2Kp20ZvSqQ4OhyXB06gEN9hy1AUzLFUli1/snEjvDvCcJKL6PLz44AT
	IjqSdg32U77FHY3S+FGW8l29866cCIdfYINWiJWPq3G2sAC0fnyMUCvb1OjTjxpz
	ebiEIT7vtkUgfyJH0cacmxXDsK39H7QZgOfjfziBN2b1eZRrNucJjTXR+LNzsv42
	p5geUTyOnTTXZkT+P0j2NWSn5SJmkEPcGKm2AXzVkLrO0xPxTUKiRQqoowi3AAmh
	UAocMShAMwK/m+X6M4/rxko1Gu1WCdreYQkJQUxhcME9cIuXIWA79NFxAoq1YXcc
	9q3yrQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw1s2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 14:33:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6fb956002so42190505ad.1
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 07:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001195; cv=none;
        d=google.com; s=arc-20260327;
        b=mdZi5zk2HtkJamK/WK+zmXwRKaa2DKaxvP49nC6EKz5qSSR7FtxsU8awOXoSuWC6lF
         lxmLqyhP+fuvdbVyKNZ8AyMcp4NkSQdrR0Gziab65o7RBY30LjzJifUnZIMdH8C5OCUf
         9ZDkaAtj/1WtBR3ppzB7NoCvnZhMQ5ifvOFeqq9VopuFRA8Y6UjANPwcAh3aKm8SAVCQ
         ootZJwKP+MQZwmzUfsqyut34GOCcY9v0poWiegXKXUM4HLCCYarDf+v8v1d5qV0k5dwt
         9mYShoh0nh7y+9ml4FjhuTihpIXlylcLrpazWws9frSwJEjN+Hhb5MuRqRsubuNRCjWN
         1OmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=;
        fh=ZfCcAPemUACXyFGzNxhBQn9uj9qBO3A44Ig+P9w+uvs=;
        b=m2SBNHW0Sc+PDD3pqMiIJ4oCJcoXtAvo4j0BiyHa+CKlOOplTUm+e6VtyXZKm16S+O
         jo0MV1ICsXQuRp6piNJ6NkX0N1zECNUf20QA1Lt9Sfly5O5Yn8HRH8bwcoOZLY46HUD7
         nLt5GgNS+themNqEGPMTwmyxTeSMZ6T0a9EpRpW2DhGIHYsMPyTzIYb32rUr/Hz2Nb/N
         RwRcoJY93qkaPr29NYcO+i+HTrVIdhhsa5R+QeJujZMDtQc6t1cFUWg/IMLCQMsY84DA
         AxtxHv5yW5v7+9AuWAtKIt/O63QSXdss/CtFAw9N5XXyagn/Z4DGuthEDXYcBgO5dp+o
         rqdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001195; x=1790605995; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=;
        b=ZzCitnuvJMGHFEZCk1A3qf5uLtxAImzhOqg1JRBHyyQd5HCzj6gXVSKue52sB/S99P
         ASVZ9NHEWnlGyLBvIaLRnYEqwgS1NhGgeoGN7IY/N9lxUujJ8hvHuVcGoVhvNh9BQYM5
         ppAWQ1tEjG/0cC+oI1b3CosewVLE5x4eTqWANKbPcPhDU8TJpgqwB+c3HHaNZvAQM/2Y
         JSQzwMYsTMR7frBYMn8meB9xVTvh63z/RXZfysrZvyS8mwTLrB9U6bQ8zXOhffHMZyCG
         EYlJ8ENhxtkF2p6kWDih8dIFbQNuRTM7fAi9X2SCWSFoNE4naNa2q9CFY0J4y+5Z2Ktu
         WAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001195; x=1790605995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWFmv2D8/n3cqAMWWL5EdMJGzYRCNgACARfCCr83z2U=;
        b=YqmTmwbBSGnx7fib3zEk9+QMo5QW3KqQfh/Sdsk0PjYLdA1e3yYqXf8qdWD8kUOzqe
         7KoqiySapY/2sIy63ORgiu2Og7KwCLarWMbsBfiMUvj3Zpa0rhqkqK16yKaeOxVBoj6C
         5x8CLjcgu6ex7HkgBTjXVuUpRyd0Fbpi3izeNfyDTra04FMcJKtBqtDQkg4YKBid2RIg
         LRKKmro6IZg964XWdK6AdiXhYdOWTPJI7ojfpq6+FUhNxIUC2a2R851sqAEHjyo7UZUM
         5kFuE6uexKyjR1FR58ANR+zgTiMpoL3p2B2PmbSseU89N2+d28Kv8S9BybHtH61tqvgG
         bN/w==
X-Forwarded-Encrypted: i=1; AKwUvBxUI4oz73SKlczFb7c7+eZ0BOMJ9tPqYrBhzKyQK1ahv2FNxPyWxPtGINMULNQEG70A3+A=@lists.linux.dev
X-Gm-Message-State: AFuF++lZBfKv9CkjojJXwXMQ1684B/Q8VHKss3hc1YqUFyqX2MfFvS9G
	aOTMiVKXSRDMwQqr+1Bdx2ON2itFIK8HyjXHCX80TSiDv5e5/auMF6UFnNU39vVbKZWPev78gwD
	/eX2yxh8XdAym7t+9z+Vs/QBEDIm3T78mtCAvrgjPwV5A2LNsc2ewAjzXGLa5W8dDRYbuQ/2mSp
	yuMKmyXo1t0Jm9oJAA+aEk+XxyFJARmg==
X-Gm-Gg: AYBFou03wrPSVPCWMn2WI+nB7HhFGsylURSOyI66mQVznzgoItbZKy1KNDzbscZrYmt
	7hdPFlr4Gfa3oYKeTUTd/ZtMgbhJowbXUctePUSyRfJQEPyQ34w0NDZUpwOpMunqVB7NCtJANgI
	sBMe8rUu9YGxWOP9mbq0FKNB9AfEJS1sjAIF81IBItSvk+zXwzb/uyAq9i/w==
X-Received: by 2002:a17:902:db0f:b0:2d9:6db:9fcb with SMTP id d9443c01a7336-2ddb1ad911bmr168889545ad.11.1790001194747;
        Mon, 21 Sep 2026 07:33:14 -0700 (PDT)
X-Received: by 2002:a17:902:db0f:b0:2d9:6db:9fcb with SMTP id
 d9443c01a7336-2ddb1ad911bmr168889115ad.11.1790001194225; Mon, 21 Sep 2026
 07:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906033806.84671-1-hppiscas@163.com>
In-Reply-To: <20260906033806.84671-1-hppiscas@163.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:33:02 +0200
X-Gm-Features: AcwNN1URykOcgSM5mzAR_6Hv1HbdZSOKSvNjzwgzfex8XAPfx0E_X-1XkjOVQ2o
Message-ID: <CAPx+jO_-ZD2We5Ap95YZG9rinGj40YXxCbf=fZ-g4MKexbYK8w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: Propagate SCU provider registration failures
To: Pengpeng Hou <hppiscas@163.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        "A.s. Dong" <aisheng.dong@nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfXy+AKChHsHvPx
 aRnIb+wkozPN5p9nhQRHhNRv6EDi5YmpgZUij7zAt2rDwwvgi9cnkDbV5fg9VHACKq1a8VeODPn
 XB+XZ2ofeUIvhXPb8LOf9UCEwSVRwTEprwVWqPDr+2ABFPWviY4vt1U8D2TklTp5LqCpOozNtxe
 D8lv8RFixTK80FcfuZBR/wWec+jsTP9X+eJmIQqlwRLSG/3WqyJrObQ/1AXHEDihHNiu5/ujmkA
 WgUPO5ZUmHzuuiAPgF6Yt9w3jwnfgoZhRglcvcMg5xzTCzCE+SPrxu4n8MJEs7ypC8PTkPRFKZ3
 B+fX+GRScnPDX01804w9zKx6Q3wAc992qkf3nm+TNKLPeEEqeOCCOe8cDxjwgxnvObfH2fmI4tB
 NYgPf5XqQHXqKve4vMO0jnazt/TO5cIS1UZUtXXy7mIiPVCUAIBaA/pvnyzNQn/7LdPEWOrXhdX
 3exA3Gx5vxsNGavJlzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX2pmLVjUevDgF
 2aSNkHzIJkn4HBKGmlTk7GTYHihGAhmvDURmMowpsZ+l3YLEMl8KtRRvinzxycxArJecmV2a01D
 cAlxFdrtODQsT5k/Mp5uleeES9hUrPg=
X-Proofpoint-ORIG-GUID: 7zR4g6-hgx-v5dzYhhahu9Z3_9fD2fH8
X-Proofpoint-GUID: 7zR4g6-hgx-v5dzYhhahu9Z3_9fD2fH8
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab1402b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=Byx-y9mGAAAA:8 a=YTAltBPf13rpVPKIVk8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210211

On Sun, Sep 6, 2026 at 5:38=E2=80=AFAM Pengpeng Hou <hppiscas@163.com> wrot=
e:
>
> imx_scu_init_pm_domains() ignores of_genpd_add_provider_onecell() and
> returns success even when none of the initialized domains are published t=
o
> DT consumers.
>
> Return the provider error and remove the initialized domains in reverse
> order before devm releases their backing storage on probe failure.
>
> The issue was found by our static-analysis tool and manually reviewed.
>
> Fixes: c800cd7824bd ("firmware: imx: add SCU power domain driver")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/scu-pd.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.=
c
> index e3f9e741daf7..05d4364f34be 100644
> --- a/drivers/pmdomain/imx/scu-pd.c
> +++ b/drivers/pmdomain/imx/scu-pd.c
> @@ -474,7 +474,7 @@ static int imx_scu_init_pm_domains(struct device *dev=
,
>         struct genpd_onecell_data *pd_data;
>         struct imx_sc_pm_domain *sc_pd;
>         u32 count =3D 0;
> -       int i, j;
> +       int i, j, ret;
>
>         for (i =3D 0; i < pd_soc->num_ranges; i++)
>                 count +=3D pd_ranges[i].num;
> @@ -503,7 +503,13 @@ static int imx_scu_init_pm_domains(struct device *de=
v,
>         pd_data->num_domains =3D count;
>         pd_data->xlate =3D imx_scu_pd_xlate;
>
> -       of_genpd_add_provider_onecell(dev->of_node, pd_data);
> +       ret =3D of_genpd_add_provider_onecell(dev->of_node, pd_data);
> +       if (ret) {
> +               while (count)
> +                       pm_genpd_remove(domains[--count]);
> +
> +               return ret;
> +       }
>
>         return 0;
>  }
> --
> 2.50.1 (Apple Git-155)
>
