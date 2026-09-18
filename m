Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52495517BBF
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751142; cv=none; b=IUTbuC9EuxwsJu+KEVieRb6TN353cRiPVxtKc9D2SIFG3GD0TpEAyLbCNkqZzKEjSDScTdmVOrVtTZ3Zb+pMdu2hdiDumPTghswdcT6Ft0/WnYt8CxNWhJZCK58bE4IdFw1m7Ni4zsfS3XfPgj6OwpL6lpON8Y4a8QA/ZQFzekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751142; c=relaxed/simple;
	bh=UugoPu7L/mnXVW0/GIPJWP6Egr3wTKgKMYjHvRDh0l4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=svEd/mNPrUwl09el7rQW3jd5Of23uABGNk4+rOvjfn9BWxxzd2SXZJKPOl1dVHgjniyWFQlkI7t8Vyn6eGTqNtx49bLQS1bHAXNvSjx/FQh7Q/vOFMCJqZyzAp0QEGDavv8+E4bdEX2R9zKYr3K2w0C0YIpBAak5v5zeZ2wJk3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMMuEWXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTbEx1lx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMMuEWXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTbEx1lx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IGopf51102251
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 17:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=; b=WMMuEWXHWJBv/taD
	f9QZUlE46GdUzuTjYYf/C3doWA0kR+Y5MgruXgzoDKrnaUUWblDlcnoq62X0pGZb
	/qbl9/Nh08g2JIywKdvQgqoIFODG95dmBYMwKhKE8pfH/9GV1s9uiIZ/ny0o1Ct9
	AxCx/8lN1sOSKnfJuvaS1JUg9GiNW/atd+A2FpRM9LBALe3ZTIKYfBJ7XUzkVsAm
	/0Sfv53h7nA91Txh3LNTG0XJ02vyxwLdjN4jnrj+2hSOYEPJdtabTGR3PdaWxCxi
	qwYwhp2WIMT4a5wkgjtCyWIgf1y9m/+GKe3lh+g7l4PT8AQ6cRmW8HyvIVAcaiX9
	oOwVlA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2btv2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 17:05:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dc7337e2a7so12882585ad.0
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789751139; x=1790355939; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=;
        b=TTbEx1lxYAkTwjDsSfyjMiPBwL5tN3KHbOBtEQ+BKs29GEsmydxAHKAK8kr1l6iPMr
         Gzpsq6sIEB7yXc5Cv+hZqL0+5qnntdAru0KdGkWi7wLIQBZBLQ8T4gAyKbWhWtQCxmnc
         4HyuQO12R2gR8JdyzpY4mC6MWNCv6xnxfw9ygGl39wbyqJd3NcGNucaEna+oJgDm7v5K
         N5X10L2l29wBH+9WLQIq8TlaGhCncgCZaWA4isvrMCknhHSWdP55fDqXJ72RfUoV6Xtb
         9XHkB5WEev9dtW+NM0IohLnIPohHUsc010J5W0vzcpkpu1CuixRHD0z40LNNaD+gFtVR
         SM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789751139; x=1790355939;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMjXKTddFP/KRl7r6fg9f8x2YOcB9udmZHxfTy35BWA=;
        b=xVZajd49Q69p2TLRYc7GP81MJvY9vcwrqwSW463ngDJ00IkhynukucFuiVGDGwp66a
         lEeO2imeG8Cn9mNUZfqEnfhAmk8k9fWrYXXTmJJqJBrlBbPFAEinVD7QBsB3Wd5V5YuS
         c2NA0z4Wh6f17ldL4NwF9Fd6YEuLFQEA/nJh2YqwoSuTWI+kA/zyLy9JYnpevqXl081u
         xCs6lofNGImgT+5IHCki3bH5u7DOs12LXNHkhGibfOQcgAMWg0SrYo9jJqVmj+v0fN+a
         vDv+rXrRgar5z18PPUppWcedMFWeRGtx6WTj9qaPtFcaFK/M/Kh5416R2fnHxfofL+KE
         k8fw==
X-Forwarded-Encrypted: i=1; AKwUvBxZeFj8t1qrvi5qOktmEb282XxMm/anrKUkochw62gEKk72FrmMWE2Inso66PTfEn20w98=@lists.linux.dev
X-Gm-Message-State: AFuF++mytxVkZ/O5FugAGqpX+wSHCEE9CnSp2ErTUt0PZqHf1hFX85Ub
	My+ZVeipTIo5uhHi4iWXBw2vmi5wbe76Ab1/M9RoVZvC1EoOt1yTzdtLm10XcG3SLF99LjlfnDM
	ZBQ75Q//UG10JAEiwL7kymyNtLi2tUbfjyOjpz2Dh5/TjU60/8WIuIxc=
X-Gm-Gg: AYBFou0EEGoeMfI0Dro1cLBoLoZ89i/X1rNcroeC8HTy78dEMhbDDJr8o4oAuou/vD3
	2n3rX+x4KGOa8N6zQBytFaGLwTb7lu7gB/B9aVOLaiQIWeRG+H7LVeLRHhVVcE41Q7PvE1k0Sg7
	xG6AgSKzYLmYiIXEBgcullgmZ/MoMHUrI8HCmRwM/5ny4jlQpNxCUSEa9ZIK5xGBMfiqRn/T3m2
	OYTTvVUIzNyLV+ruyvXf56C/yI6Aym2YtkyLJ4QPGWthp6PxP1+QbcqDetKdo2+PVmcSAHQ/DJV
	07fMo0qSSnpapaeDcPRofiOgNH5Er1SN24JjsLlPYWswTPU8MWDao2W9w2gdf1J0n4Ys0mBVOJY
	tqF332A==
X-Received: by 2002:a17:902:fc50:b0:2dd:c053:e0f6 with SMTP id d9443c01a7336-2ddc053e13emr7876715ad.37.1789751138507;
        Fri, 18 Sep 2026 10:05:38 -0700 (PDT)
X-Received: by 2002:a17:902:fc50:b0:2dd:c053:e0f6 with SMTP id d9443c01a7336-2ddc053e13emr7876085ad.37.1789751137947;
        Fri, 18 Sep 2026 10:05:37 -0700 (PDT)
Received: from localhost ([143.246.51.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75ae73csm11519845ad.57.2026.09.18.10.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 10:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 01:05:13 +0800
Message-Id: <DLILTJ12IX36.15ABZZEUMTL59@oss.qualcomm.com>
Cc: "Ze Huang" <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin"
 <abrodkin@synopsys.com>,
        "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew
 Jeffery" <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Maxime Ripard" <mripard@kernel.org>,
        "Thomas Zimmermann"
 <tzimmermann@suse.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com> <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de> <aqpJKSSKunElnQ3o@houat>
In-Reply-To: <aqpJKSSKunElnQ3o@houat>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI0NSBTYWx0ZWRfXy3J1k0dzhwFG
 L476uGJinUkGA6PbFlRUOeaXLUA0ve17nLNL2Vucip/kGuBSM7E2J28OmCUSVezZxqcqdwNa0/n
 L+LN8lvzBjmheI+V/t3upPCHVa9UQGuFj6aeB9A+i0YNV75lr6XS4xOdW7SH/K+MOhxQjJeHVOT
 VwndTPZBkRHgts9XZaMkEKWLdPTi0sGl6up9k1+CnD2tYOyIIbxifr2A6cvuHOGp6dpxU221082
 h3Voaeb1TWzUJ932aig8ggFaZ/yx6PtxMW8J3LPCnVzCBXL+prX6gbNr/LHKMyX968mnt9aSTPM
 Z89vepfg4wGY4p09hoRpz5TbcVylqaij7T+ae5FNBW86I4+TXxEwvPnNqhf4P0LJfwdsZTMwnME
 4v9sueOchoygpOBthWvs12E5OTayrYrkd9+mNQGjg7GIFqfigkPRV43EmzSWn8bvQLjifTcAmzL
 lMm60I3KY9+R4ge5EzQ==
X-Proofpoint-GUID: OdxND-dEx4bWbtYCCu791QgR2_0T_Sp-
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad6f63 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=IqZAcGRvIuv5jEvzszIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDI0NSBTYWx0ZWRfX0woZipi/n6m+
 1CHFwyey0cxIc6PCQOuapfu6oFd3pYCoG3Wuah0RVybVH/AmwMdHxP24LyjHFWzN2ivFwAd1HCx
 NrgMvJmMXAvoLH4/bivxaLY/U7AQVyM=
X-Proofpoint-ORIG-GUID: OdxND-dEx4bWbtYCCu791QgR2_0T_Sp-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180245

On Wed Sep 16, 2026 at 3:46 PM CST, Maxime Ripard wrote:
> On Wed, Sep 16, 2026 at 08:50:21AM +0200, Thomas Zimmermann wrote:
>> > +static const struct drm_plane_funcs imx_lcdc_plane_funcs =3D {
>> > +	.update_plane		=3D drm_atomic_helper_update_plane,
>> > +	.disable_plane		=3D drm_atomic_helper_disable_plane,
>> > +	.destroy		=3D drm_plane_cleanup,
>> > +	.reset			=3D drm_atomic_helper_plane_reset,
>
> Also, this needs to be drm_atomic_helper_plane_create_state
>
>> > +static const struct drm_crtc_funcs imx_lcdc_crtc_funcs =3D {
>> > +	.reset			=3D drm_atomic_helper_crtc_reset,
>
>  and drm_atomic_helper_crtc_create_state
>
> Maxime

Thanks for the reminder. Will do.

Ze
