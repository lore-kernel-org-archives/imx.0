Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD0D30FC03
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986767; cv=none; b=OA4A39aP+Rzu3lMFeeJZUQ69bXMpbaFKibxziRqhbQX3W8Ln9CvIIFu3QpAEPZfJZLHQ3rQQ6CtIfdVuBchVDEIUNj0BpABDYQIU7OqcCv92zjA4lWuQ9B6sI5dBaPLPdhjVT+IGo9oP8wa7x3aMA8zVkHkxsH3yv1DQdOhVGhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986767; c=relaxed/simple;
	bh=+GMMjn3hsj62z5+uUfsSCvzCjK33Mm9GHRETRXWgMEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkUOewbTsKuYioe9plX5dTDcUqijT/H61TkZJBP14VYTrKxgEOoD5UWmhakEMIvzTb8Ih2197iz1LUuJF5t6Raet4wRxai7e2qrnjF81ouBuRPFij6M1LvMJDN4DdoR19++fJwlV8cR2nJX8qM6DvJ1b7eOnW2Yx7Dixmnark20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncPU3+e0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2/10WkY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncPU3+e0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2/10WkY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593we4o1498238
	for <imx@lists.linux.dev>; Tue, 9 Jun 2026 06:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fw8rVWdcZwRCeJaEN+LtFUGm
	AVSjdUhQcaecKC5y4SA=; b=ncPU3+e0tUCPM/NMH4qm9+CedFI9ZgnPy1kORLSO
	9OkXVASCDeAoERun2GTlrVeMTp4xZNAjsxFRc6H2wNHzkkNgiT+RS/ShMNBKmozr
	uGA1IIUZtXEek3wadmkEwupr8BJMc7Hrb8W09Ri37QKizorX0K+QTWQq8LkM7Hd4
	ceXVpMtC1YXNbDLwAUyjuEnzBhy1mou4IXxx3BV+PFfflhEaDUTfBCAXlOSYTvQJ
	vSUsZnecQSFj05N0guIj/mCXJ8zH7sIQjjZeeVC7P2uIKpatCi4tSDSTv/Zo6Rhe
	00DZiMz3ZJNJE7UvegEf/ebio/ZPH0/fRVHO6UscRGkJ+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8mt2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 09 Jun 2026 06:32:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178fc89b2aso87012951cf.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 23:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780986764; x=1781591564; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw8rVWdcZwRCeJaEN+LtFUGmAVSjdUhQcaecKC5y4SA=;
        b=N2/10WkY1JMdNZSlVkKysPg1mUnelhUnS7EgBhi5x+DQDX8sD7EdMXMBALAI3OP6mB
         yREolGcxJ/SZmdZBW4xixBk45WuTYHyEiieEB4elQgQKP/efr7uPJ9I0efUG44euqD39
         Z90lxHQfeBNLFB93MwdTjaZ9KZqbARqzpQQytLkiLbNCuuj13QSMKlwEcW8VuCCckgZT
         xAT46XBZ6JY5hE+b0doZdsL06umwTnjQZlmK1jjtUcE1xuMczZ9FGZxr6FCm5eqddvQ+
         W207CpJJhmxOpvCSnKE3r3Bfp57HiNBwdv+eCzAq4WsBWPGHe3LWyogOP+lTQlLjMdJ0
         3kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780986764; x=1781591564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fw8rVWdcZwRCeJaEN+LtFUGmAVSjdUhQcaecKC5y4SA=;
        b=QXzLDKk5XWjK/1jz/9NFaC2BINn4w0HHM0gqtNpU21/gU0s9D2P8Js5bVnaQgr30Vv
         9PlJXyunNfEWcTz1p6b0U9ZCmZyLgc5JwZtG1eijK77UfVOFAgicndVQ+1X7YUJhLASA
         8EIUBFZ40/V/OF/OkBGPXtHZW409Jv/qGZYPfHQ6JMcWYd5wDoHZff4emdeCYKxe+D4k
         iBvo9BZVrUqeDsX+HJ1Yuh+wAjQEoRiExFeuvztmsJA/0dOnlSes46w3Rm0K0uFSVNDH
         pJpLU7zHs6teQ2/ZkqZ2V5Gm6hSQnfbHR5Zi5GAd6HRPcwrh8CAzFrrCi/FfzqAwtzvy
         5dbw==
X-Forwarded-Encrypted: i=1; AFNElJ+WrjOLH07mCsMangbhNPNUQa5sv8Qf81n7oOSb3YyOwhJ+GqGrn2vmH2XHtCMiNoOSmf4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWYLwI4NWtvBlS93Lx+i1OEQ+lEdL+BOrIMHXgPGH2aZ5rBgXx
	ZOygCljqbjqCqHw/dTPfcfcM3nWS/mbD3MtwVpBv1hDCI4W55m7jsUThpyy+kxGgw1UjW2fF2O+
	f4WT/TANlziQhbKTpv3P/Z0UuuD2EPK5gGskCNE4qSqJ2OzxHF4KD8CY=
X-Gm-Gg: Acq92OGmH9P/Qtszl7ahT4ZF13eUTVUj62MAoj9mrCnStxi2ujLRbSuchBLQ/M4LKjV
	mGn0ezdxnqoBxSokFzNW/Wa8Vqyi7hwLzj00gv7zU78/Cib5cWqYkFRHj8WMfWoVcZfh3ET8U47
	t/wIOOJtztsXgy8ZDNCe5QJKUhINX8iPEsD9yECfhhWQ6VxF2K8N+6vda2ST8RD6seC6pmqROS4
	yHrUaOONvfC4Drcjp8RL5NAFlAwPXlMsa+xpthjS0fVtbPRqltGSduqyeu4vs7QJ+Dkgp4Qfpco
	CaCL/yPl8BLmnTIzeIH4vFExOIjBtJJmYDT0BJX6yjZ5caQMt8CusdSSfeJrbZD1T/tsibqSSxj
	RCWVkcKh+girMLBwOSTgTo1StRVxxeenqcqvDbblx5hk=
X-Received: by 2002:a05:622a:142:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-51795c8e010mr271247801cf.40.1780986763681;
        Mon, 08 Jun 2026 23:32:43 -0700 (PDT)
X-Received: by 2002:a05:622a:142:b0:50e:a1ab:67ea with SMTP id d75a77b69052e-51795c8e010mr271247451cf.40.1780986763119;
        Mon, 08 Jun 2026 23:32:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2cbb4cbsm251161395e9.0.2026.06.08.23.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:32:41 -0700 (PDT)
Date: Tue, 9 Jun 2026 09:32:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/15] clk: imx: scu: use clk_determine_rate_noop()
Message-ID: <3bx5w3q3d6jts4bvf27sclmnvytfdft2pocnspnk2ptwipzvec@edjcz5llvfli>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-clk-determine-rate-noop-v3-4-f3f829fbacdf@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1OSBTYWx0ZWRfXx2AQL0pPGRlf
 XemvBB2SgZQhWuADj1xybXhE2EqvfSV2uQxfxUGihgRhylGxKPNE/hviSMBYiwWayiMa4e/b9m/
 d8rThsim620Ty1SUUy9km2d8QkAfqIvvjpI9Ufej1X1mGeL3INfMle3YoQ9iSI7kpzya2bt/1bO
 C0oUuu1r6DTc3qky+FAaL9DymY5Z2Qm9f0lDlkp4cfQ2EAODjqwRzoUEsXIwG7QzN9gMsBJIxNS
 cQ+7v07LQa9ZRL7Gzdaul/BXTkUVkz868oTq+f204xs+UcmRAThyza8cbpunKUgrh2KeaDR9C5k
 Tf7btSByHF4MIANG+rdYvGLPdCzSUSOo/BClKPeqQ0hbmk6DKiaMUHkrEguq9mYx5fI40Lnztv8
 aIGfy2o01uRk4kfB3XZVzKUHk8xlHRr+FW/Dy1wORZ6an6lY3byDzvf1j9R1XjdUPGVrBZiTF7r
 1RnbGjtMr8av9bGMimQ==
X-Proofpoint-ORIG-GUID: WFopghU95hNwueUy8cnobxXG_EM1gKJl
X-Proofpoint-GUID: WFopghU95hNwueUy8cnobxXG_EM1gKJl
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a27b38c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=yiv6Am5jRSTGblAyIcUA:9 a=CjuIK1q_8ugA:10
 a=tYq66TkwoL4A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090059

On 26-05-05 20:49:00, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
