Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470785;
	b=ViOBR1AUH22kyK0oRVhTG37CUdjOCpU/kDu0WuyVrlX3dKefprqc2Xpeqw2K6tfwS/vb
	 w2HEmq6uZggSeV5ONiFSBwgHpgwy6vjaSce2VVxwNnTkmAxH1AdSrw9+XOk2tt8NVISZK
	 gxr5v+dKbYTK17VuVOjbzqCfy5U9ScxILGm38vc6bb35r4jPNdP+MjUOz+qQkRSyQXzp7
	 SgEwQMgh9XpPqTri33cCHVWS84hcUA2UmhVLxOD0SQoCsyonLuZMM1PF1dAUSAffg77u+
	 XIxL3DhGSo22FAq7oIZRprkC9kwkDKJPY0ON/b6eteZKpZ3KYsJt/Jld5B0Rm2ODCXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
	b=OB36+v13BbFxwcfyyqe1PbflFuVPsdhdVGmHG3VamMAZseWqQ1CzODz501xqIUwl2cL6
	 hc0yRkIWq4NzaXb35Ky8yV1kOTwFEdQ1EcywPo/Zq3ayaMV9o2rD8to+svPJK9yDLqsLu
	 pz+uPdPD7+3+1VZwI8xO+9+0j/OEJSatKgN351M7ZPdRCaibx8RiTUOdptlhtl87wSjD5
	 7dtoR54ONTTfMizFBzcjsPh6oYAC62+SQ/JawabAmfP3IqS3Xh2/prNxT8vqpqs+kg8ox
	 arIBk5Mln2+fzZt5CjjRgwfxYSlfnFSuk5YQoL/VJdjNPcsxlQLRtT2HFKix+kwsALA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCMGHbPB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYeQDyW8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C0B606A323
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 08:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C0B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GCMGHbPB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYeQDyW8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4m0Ho3893195
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 08:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=; b=GCMGHbPBHiZjGm45
	eihsbjjHclEvPKwF0SXIHt/hk+pqn5tdeALQ5qh+MCit3sAPOuZ4STlimn9hCr1y
	9qBW984mW2+DAbuu5V8aqW5b0NLDQpKF5g6WZbf2KVnaVPMDQvSEP+KObioQpjZP
	ErNVr24Jj0IHJT8vLn1X2Ghh3w77iwaWO6lr2SzDh/CCBVFPzj1GIOuOTGcwBnXK
	4c4dzoiEWBrDa9oUqJLUbvwhqtNbGB/hdkD+Rk0u2CpDiiTiOrWeFRf+//wnQ5h3
	0CXfLJDT9M92fgXuvBh78Vs/QT7Q2BBTxNjJIENM9FvUQJ/V7V0eeZ1S8ijWsaCI
	6z3hJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re0mkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 08:06:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso628849485a.2
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 00:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794470784; cv=none;
        d=google.com; s=arc-20260327;
        b=NdZBI+srSxAKQQCczx48iikyPvQyqKYAbx6RQ1MnkyiSfifdAvUDZMFJNI9da5Sgih
         +/dj1ANIny3HiVktPxwBa3dzJTHonIiyKNnXkmPzqDj8EGNAlchKV9P9KuxpjxdHujOe
         5Px5hfZTPQdL6v9fiaNzOPCCCuLCktYWtQkUjiZ3A8Ae93SuHmaV1QqKYQ8wm21uNki7
         5hiR7bADvYd7niJD9+Qukzw8L1zwEHXl4sYTs7B89oq+ivYC8oPLdvh8RhUCkHfsbEy9
         eDWmUQBYHPg2ecEEBuKw8V1l1s1hKV7KGWn7sxznhvCJiZE3Qwkj6cJK/NuHzde9Y2cw
         fWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        fh=gw/uNMJHamNPhWrCU6jemdvK3NGvuSbnf/MEO+ewyoM=;
        b=krqGcUaBrXeanebyGEvVvgQZQVXV3Zsc49Oz4WYMpkrLfxEaPE47edmFPRNiijXCEw
         qZNwWWhOXf6fhq9nk2QJRMvjpvfQntK3WvoERDszu2USIvXe1mfi0NChJyaiNe0Wz7E4
         tMYtuae5zlQBBdjvF09XWhdQmdLvY2qNJKOwJrwgW3EHzURZUHHDsGbFp6aAZadKYTLO
         2As22/e48iEm/16pv1tB3q8PEJVO8gqgztR+jowwz8EqkMNWKbgGfaiLxw3YWRUKS7KU
         QdgURuVQ5C3CcqwoVTjuWcLGPCu7bsU1X+7Ggy6r4hLk+2mGNRVhCcgKKJQiX9iNC65z
         1T+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470784; x=1795075584; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=OYeQDyW8foI3Bl/B6vRZnO7yvs1/zNznLi2cKjDsjHeaPJybya2wk3rm1B5loRPtPo
         TaxbZTuJQiNiB/GgyWC6gyL4JlSkO47HjFtNaBcAzv8IrU2pwajf+GRfubFiY75NKUd4
         IQmr6AR5ODCOjmyLWurxL1FK50EC69CVXgEbQhSzz1fz32/n+Sh+Zpp9D8KvCVelgEhH
         nWpOgospb7NbTVUMCmpgpgz1SW1dTYHqBe5NG+PNQciWu++/2a065Q7+D1Sk85S7hJ0C
         EOl81c5ZX0i/lCPjlU840g17dGgd2ADG8iYUZnefUhf+F5KLjqY/HNH6d+PQsB8SXQPO
         tj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470784; x=1795075584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RIOHoCyWuGPbxrJ2CLQjhWe8dBosfN1NzshqtjwUnRc=;
        b=pP6rAgyBHgHEzRli2lAqf+S5WfUrpTS1ZdG2QWIVZ7TS37sR8eHObN/wJb3V1eS5S2
         /SN6clalBcs3wLF8w3/jIPy491ZOSjCiDJFSWg5abm0hPljxj0//xjzmP9WSO//quAsT
         urjUAgmKDERC+ha9Xl84nlXDDoYSw03rdXiO17WU7JOiTG2Tpk17KYM6o+wABDcwMzUx
         Xiy3h/fCBpOQaketon+vnZXqnUZnrokTCIbUKNBjfuWo0HYLHevr8wWxVsBvdGIECOzv
         t5j6Sa2qVTtsu93jdOt7Qfkb/DSC5mMcMqjq9OoghkQb3jqisawOsmDoY8ZNnSS6rZpz
         Xp6w==
X-Forwarded-Encrypted: i=1; AL+hErFaqTXz1tcsXLF4dF2/GGqiCkKyrApM9YU1rEB9p3QGHCNhIFW3/pzCnSoSGdPpblS0tXQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+c5Wq5s1oHOG64yofF9nLj3c8wYzqYhTo8lST6uAg9yex+R659
	YE2YQi2pD4rS9vkN/nL2T3QZwHt4kZrYXNsUYuow1/KNyYnNMzbGkr0QnudRjELHDf9C5ApHMe0
	5nkzBcbvO6tzhPXOvUAffRjCLeO05wiZLNPe1DzvxS1OKI27DqIoZAT2923lNj61yZEq45xo+T8
	zDF7BXad3Y0Sgvv6T71M8fBlwxTKyzXA==
X-Gm-Gg: AYBFou3FssDzZYOc8vMM1Azm0aStczzHsC3GlWMmQZS5hzAzlPpqfnhCD+SlSaLIEuy
	8FTdZpnkqkmWo7d6zgeYhg3hl89GA4rRWL/pNVH1kjynmoGT3O8VPgEstor8fUgDbU8rDUIgh+1
	lPPZ/5NC0cPZFyANce7wv/QjvTIFW5ydCwBHL48DOmkeVqzrd5cMbFshmwWZXnGlJJy3Zb11ELr
	y1O2/VKTBNx3oIJ5VVqbNWFOXy/i0XaJDe7vkwcrzJ0b+EP+8BWm6ml03bvOPkOdMlY1LGs/zY=
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id af79cd13be357-947aff88abemr902866685a.37.1794470783679;
        Thu, 12 Nov 2026 00:06:23 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:93e:7939:acd0 with SMTP id
 af79cd13be357-947aff88abemr902862685a.37.1794470783206; Thu, 12 Nov 2026
 00:06:23 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com> <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
In-Reply-To: <20260929-isi_imx952-v4-2-e69f89c7c651@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:06:12 +0100
X-Gm-Features: AclHuK9LrNxyKqjXo9lhssRniwpPC4kGf-DKVNvzPuscWH2E16tSx8OTAwPwjUg
Message-ID: <CAFEp6-0EXr=rWY5M=L__KU9eL3UDA06q_vmPWdd+CKxR4iEYdA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] media: imx8-isi: Extend output format mask to 7 bits
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Frank Li <Frank.Li@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: vWuAuaX79fSiuCTcydWOT2CvExFnIuAX
X-Proofpoint-GUID: vWuAuaX79fSiuCTcydWOT2CvExFnIuAX
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af57380 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=zoG6pt3vYd9LuZ-_mncA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX0phAa2NeVOro
 n3G0Zw8r35Lc5eEKcizhPvDENlfuuvIzbIM3VGMlRyCpXoPD//OLrhYZwGEF6elIxOgk80YluPV
 jGQYLvyAplPA4s80AoNWCT0Z+b/sD68=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMiBTYWx0ZWRfX5EjqHMsLQeHF
 ZB1zn9+hWjzZyvf+Y5qg/cGlK+AblKv672uo7wqmboXu6dyZYXNA8TptH8Np+Do9FX2ZLAkR7GH
 41Bva1ZVsZUZyoaF2lL8flmYRirRXEUeP2XjhI3Jd8V1lm4YCxcGf6qn78hii+HXqv+cl1YQ3j+
 eTRm0WiEdYeyCy4ezL+mVkvlUdnMahgt4vsUkX7Dc6+jFEHFIXr3JLeD8uIaTXEwk5v8SnZCfFo
 o/4AMY1AMylPiWxcT2gQSQKE1yrCL7AFeeLGZv/B5ccWM6V+T148LLcVTyGkS6Znpzvz4GB/L7r
 tzUpnNH9CTZwKdtW8Tx87YgJgtN+vbbvs5cAaQXJaVyfLFnas01EcrRbs44YnuA20PoTeCD1jM/
 AQxeTP2yBXY49GynDWh9bDVtS4CUcCOlKUuNlvyFap0GXKQU7zm6xr7/bmbgOiC03o1Da+VvKb0
 YJ2jzWPDMd0DUrJuM3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120032

On Tue, Sep 29, 2026 at 10:48=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.c=
om> wrote:
>
> The ISI output format field width differs across SoC generations:
> i.MX8 series (MN/MP/QM/QXP) use a 6-bit field (bits 29:24), while
> from i.MX8ULP onwards (including i.MX91/93/95/952) the field is
> extended to 7 bits (bits 30:24) to support RAW32 and RAW14 formats.
>
> Extend CHNL_IMG_CTRL_FORMAT_MASK to 7 bits unconditionally since
> bit 30 is unused on older platforms.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v3:
> - Use unconditional 7-bit mask instead of per-platform approach (Laurent)
> - Drop Reviewed-by from Frank Li due to significant change
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> index e795f4daf3ff..c704be882705 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
> @@ -39,7 +39,7 @@
>  /* Channel Image Control Register */
>  #define CHNL_IMG_CTRL                                          0x0004
>  #define CHNL_IMG_CTRL_FORMAT(n)                                        (=
(n) << 24)
> -#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(2=
9, 24)
> +#define CHNL_IMG_CTRL_FORMAT_MASK                              GENMASK(3=
0, 24)
>  #define CHNL_IMG_CTRL_FORMAT_RGBA8888                          0x00
>  #define CHNL_IMG_CTRL_FORMAT_ABGR8888                          0x01
>  #define CHNL_IMG_CTRL_FORMAT_ARGB8888                          0x02
>
> --
> 2.34.1
>
