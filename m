Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207691;
	b=KDRgJ9Sw4UlZcrYfLDe88U3c+oDuzul3LYCN7t6hM99OpEx37B8Qo/4mE5crcwRl1uAm
	 bOy402oKSZGdhXXlWGdNxdIlnGjxO+z1BWBoPoiO+KsqnHo6HsD8LwEGXh1aOcqG+zLjP
	 aJMv1/xBuBSZlfB5sDPIOd1EA2tCYdrO5HqRegB2jfMv4r/Ylh7B6UT5XBKeKd3gOxx4n
	 ZZdLvKECoVbjig6Vfv2yuqVW6pfBmIHgVYx9ZFHOkqDex0fBpoxLPELi5pJWLviNurH1w
	 +j6roepKZ4hFlFBbyCaxpQ11sf7nEie2b15Vyce8pzeHcVfWwXZDMMcaOkL2Rc8DZqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207691;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=;
	b=SllPWiBW3TwXTQbt1ug7kypaqHbMAwejvAxHP+zB3OG4mEIdAmpL8kqkpvOD2gJQg+iU
	 7RFT0/Yw0xCyh0IhCXNEn2GfhVMRwlKa2dqUJRCcPDplNG9SAPvKs7L8bvF6kK2+BsolQ
	 E3tg2tLrdGwGGfJMOW0SZcZ8Eu2QIIRW+cS+V1g8pLmN2IrT2jd6IYJpBPuHk8c61Zry6
	 G/L7HfUQApOqI4ZzReEM6sH4PFmtNgZBegkETn3YXl8uICGXd5w641Z4xc2JRiKzdfvdS
	 4CCkZhxHUXmvXErfI/nYVnJ7/Yroe5o8d7Z6FmqT6dbKfpLEpH8zmECyQg93RR1AS0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RYGmdgia;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErV5K7yJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C550606A324
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 17:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C550606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RYGmdgia;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ErV5K7yJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAEFk2001700
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 17:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=; b=RYGmdgia+3ENWT3K
	8+9fUgyk3+OJ48GqrcLUDuwVBC9OSko/LEE1L/7t9RXLVs4tE1UHXsyw9MBM171X
	soVqa+8kcSxMwLw6aKmHKma7nuVbkr09rYqDakq8oZRPuWIyxKPSGBFu0dxAL0Sp
	Ez+h5JedlHpuq2D4MGclYUBV0DaB780wGy2MgucF9vVEALqYzjQuTDrJYQdAGtwE
	m/LPl1MRV//GkFz1jINnl0hZuJ9wxS0OlpbuxTOfDdXF6bnGn5Qv+mtPWkqsGgtn
	38v4cf5wkYahd2NDWLH2klgFk/XgEEWejb0wMkwRzsZUrhukUndRLnjyoFz0wtA8
	PzrMoQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7t6d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 17:14:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so729749a12.3
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 10:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207683; cv=none;
        d=google.com; s=arc-20260327;
        b=PGWJXA5DBGYk0W6skkV/CvnAPZprPt0YA5rj7fV/FyRJI61SnLNS969c1F9QglQWyY
         iJcR4HDFDRleqNOKyCe3Al7wDGZ9eRWNWr/8W71IycoNdAUPnlaZbzbPulRXaU2SnsWP
         ICxwfdKElNcsBzb8ZCRy0fG2JuCkzqB45I8TqejvFX2RUCDsNH/3riS8Dya8g18UQyGf
         s72zwoXsJFXxqb1KYL8ylp9PZzyBxkg/zHaagWnXAhuueSF9MyOTKceIvsJuMKvoHFK+
         rjBOpA6U/JRGDIvylcQwyb2tiOpdOQsDLLHSpV3RmBiIxjRWFnvvS5GUcLJdWsEgSl5X
         bngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=;
        fh=qitpnIH8tKlYSFMGMcVfSR5LQ1qcJ4ARNEFhprbxXcM=;
        b=aet46nOoF2Mrs692OVu7OrtrG5VnoGmNgPjZHPAl+u2qwpVLFRT5TkLr1p3ab8ZHwo
         XAWei26xQkyPOYddKb1wBhFUIBF+pnWypFvgktzYM5+OC03VkiOeZFJ+ESeclOI7jsQ0
         2fo1qES/VYn1t7Zwqfnqwv+5518SK8MHshoT+1ohpF9Cx3CTT97OXIbLO/qFk/JdTxSH
         hCQLMtSmCAVWUZMSQnQbdJQ3+/ocZPGBob68zKJ8HGhq2SvSRknNpl0w/fAnZcdbEjF5
         PGG5U11vwa6wPoQTzI18lmkXAJCqyP6y6OnOetrvV5SRMJaZnOZxkQ0dcKWGsvxAQOyP
         pjyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207683; x=1793812483; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=;
        b=ErV5K7yJ+KItDtDoKqo9tgN8lJXgC4FoGiPRGl5GlKCKyBLY0Z47cSHtdMfxC0/6bZ
         rgnqympG7bAkfy9LacejQWlzj/o7rAHd0hVsnbQkDldzVo4heeua1cwiflEcZa4nabF1
         vbis7gvugy+f2fqd68AbV8uNKyK8FIbEYPOFjA7LYvFxZklLfJUskGHn0JN8MVnrF7tC
         SLoNCdy1t0k1KNA5Nz/j0aDPYY6kk/mJxP2uDa1CXXyNn47ghmrOFVkI7ZfQA1uC236s
         jbpFONMvjBmW7Ww4ZA9Q7zcWQDa/8ld/DuOfk8OOJpCF1xWi/RFrz4/NbbjUqJbuENnh
         I1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207683; x=1793812483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDp0wgkglTmPmDg1owrhZsr+zbSjJcFONFEn6LtAuCw=;
        b=U5SXFYeBrVD4GMbbwh4ztnWX+8YGWVSUFsCSorHJqRh0UWcTs/036JVmBaDD87FHSJ
         zhEIpDX5BInkrE+jmOiWQgXmMp8/fz1jU7RrmIX1avtmQykDo6PQQGPFqCP5QP/aGk7G
         CooMum60MdSDyh/d/zO/1o93Erb7sSR+KuMqtYJXvqqjdaa9fqCFoKRN/lRhz2C1+XGq
         fMf1vm30gbkuvxEwEZy0+4ZbTCqpd36W1RAGmssPUiOGtG1jmI1n0r8+KZ2QLaatEUjv
         vvOBdFU08yAcVZKLDRSoP6Wowx3D1x5ppvoJKCv0a45Vu+tiMqBU6pHA5DCxEZDds2SA
         6gCA==
X-Forwarded-Encrypted: i=1; AKwUvBzFxLBjRwv4QuLY/mfrZL4pk9rKpMSpc8rxZKeZezGJAKAtZi/Kh1ZhrwP+tuswxaC4+Ec=@lists.linux.dev
X-Gm-Message-State: AFq9FYI+D5jrecyxtJv3qVwqW2unt9dsIoP3u/GSN9AxexfVin7WRNdR
	NKk4fYiuAn0FQ4pFd4w8RSREhnJsfD1LnqFGxjHtyQEJfBFbd3dCDescnoiYFjsEj3O0QM26sSE
	7qgPu6/vp2cQdCYGbxjplKeLHeUlt6N09/fMqC/J330t67tTo2B5aURjkzeedj+vP7USiQpxhyx
	TTB5lXOJny3GkQJmOKjhrQejBYkyI0NA==
X-Gm-Gg: AYBFou2XqeIrA1g/pyn57JFtvp570Z7xLlp+oiJHXdRYfMGgwvg8VFM1nEOdj6/xNAG
	zWTThHsmp6Utebo8YfSoAvo52g3PCbrocIKeRYJdo+qbVU4Q6o7WEV5TFnp7z0UizbnpYyeVTlW
	hE44JoJgy8LnwBgIq2FSv4gMBurCJQqK8v7rscoVYA6o6Tr22GK3tYl/USjg==
X-Received: by 2002:a17:90a:e7c7:b0:3ac:9a03:20bc with SMTP id 98e67ed59e1d1-3ae5824d380mr2248111a91.47.1793207683158;
        Wed, 28 Oct 2026 10:14:43 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c7:b0:3ac:9a03:20bc with SMTP id
 98e67ed59e1d1-3ae5824d380mr2248076a91.47.1793207682688; Wed, 28 Oct 2026
 10:14:42 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261007070313.863-1-ian.ray@gehealthcare.com>
In-Reply-To: <20261007070313.863-1-ian.ray@gehealthcare.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:14:29 +0100
X-Gm-Features: AclHuK8OzKAlNJgB9bkGdb-Xga4FUgj0a3CnfcJYrvb6cJly0UazM3hY7LrTXlM
Message-ID: <CAPx+jO8o3+ca6LE-1DPuiOrxOWVRosuW7rf23SzLAGq4vRHqeg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sdhci-esdhc-imx: map unsupported driver type to
 Type B
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Haibo Chen <haibo.chen@nxp.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>, stable@vger.kernel.org,
        linux-mmc@vger.kernel.org, imx@lists.linux.dev, s32@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae22d84 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=lb8OlhKpAAAA:8 a=QyXUC8HyAAAA:8
 a=NVfV2Rmm9NVekzJLEn8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=7GnFejQYy5TgUzHuXd-m:22
X-Proofpoint-GUID: 5ldKmY6A40n8FzZ6TMBBPvv1MriWEqdJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX5/KJEpEb7hpk
 0vqZot9OcP3BAL1qR4LGEQyH1zSYAlwZmJhJgj2KAepFylMOmoQbIgJAS9e5Z7UBqPW4E1iB/Hq
 DQV/NEdRCkR8vcXdoxhk+RalVFWFOu4=
X-Proofpoint-ORIG-GUID: 5ldKmY6A40n8FzZ6TMBBPvv1MriWEqdJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX9+n0gjfWrj5Z
 B9GLJcNxRpG7rio+broXQ5crdVhZTFMUddqkXjpHmPzBM6WG8D/zx+e7u/1EJYUIyeKp5gQrCvZ
 Eb78wHvco5slKE2sgZZUe+ZGTDUklxPfel1q1j3UpL9fBLwEJruUiiMJJZjCKSZihCvP1z7W7oJ
 uE0TCiGOyB4YMyVjK1pHShyjSdqU8dX9JwnSRIjHpqSb5AJqzhqhg0KLhiIuMJ30TQoKPmJj9Hs
 riYAhVpaFr7iBH+1J/vBxZiPDBkENNrOwiTtOG4FOjOwW+jfLIwRJQ4qleUZR+U5ZpvvcZ1bw2D
 21eF8bYMuQRNAhZsTgdExP7YyjnzYU2xnUdiDi9aJYPX08+CkV389BopRUrgBDFLhkZaRUjlq7X
 guaDZ2evl+Q1lcN24AX2p57mNXa0BN46Xe/n5/PkHt8AwyJ7qs+Y7SgdDcmsMvK1mw+5iZuWYdJ
 wNAp6ui8McxM30lt/zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068

On Wed, Oct 7, 2026 at 9:03=E2=80=AFAM Ian Ray <ian.ray@gehealthcare.com> w=
rote:
>
> Since commit 5a52c5701a67 ("mmc: core: Fix host controller programming
> for fixed driver type"), the eMMC driver strength is passed directly to
> mmc_set_driver_type(), which propagates the value through ios.drv_type
> all the way to sdhci_set_ios().  For value 4, SDHCI correctly warns:
>
>   mmc2: invalid driver type, default to driver type B
>
> The host driver type has no effect on this controller: esdhc_writew_le()
> never programs the driver-type field of SDHCI_HOST_CONTROL2.  Hook
> set_ios() and force drv_type to the always-valid Type B, so that SDHCI
> never sees an unsupported value.
>
> Tested on i.MX8MP (usdhc3, eMMC in HS400) with
> `fixed-emmc-driver-type =3D <4>`: the warning is gone and the HS_TIMING
> register contains 0x43 as expected.
>
> Fixes: 5a52c5701a67 ("mmc: core: Fix host controller programming for fixe=
d driver type")
> Link: https://lore.kernel.org/all/20260926122908.866-1-ian.ray@gehealthca=
re.com/
> Cc: stable@vger.kernel.org
> Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2 -> v3: Force drv_type to Type B unconditionally;
>           hook set_ios() for all esdhc variants, not only usdhc (since
>           the driver-type field is ignored in all variants);
>           reword comments.
>
> v1 -> v2: Move fix from mmc core to sdhci-esdhc-imx driver per review
>           (see "Link:" above); always provide a valid host driver type.
>
>  drivers/mmc/host/sdhci-esdhc-imx.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index 6ab59d3e346f..931e383748a9 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1142,6 +1142,20 @@ static void esdhc_reset_tuning(struct sdhci_host *=
host)
>         }
>  }
>
> +static void sdhci_esdhc_imx_set_ios(struct mmc_host *mmc, struct mmc_ios=
 *ios)
> +{
> +       /*
> +        * This controller has no driver-type control: esdhc_writew_le()
> +        * discards the driver-type field when writing SDHCI_HOST_CONTROL=
2.
> +        * The programmed value is therefore irrelevant, but SDHCI reject=
s
> +        * non-SD values such as 4 (eMMC 40 ohm, from fixed-emmc-driver-t=
ype).
> +        * Force an always-valid Type B.
> +        */
> +       ios->drv_type =3D MMC_SET_DRIVER_TYPE_B;
> +
> +       sdhci_set_ios(mmc, ios);
> +}
> +
>  static void usdhc_init_card(struct mmc_host *mmc, struct mmc_card *card)
>  {
>         struct sdhci_host *host =3D mmc_priv(mmc);
> @@ -1952,6 +1966,9 @@ static int sdhci_esdhc_imx_probe(struct platform_de=
vice *pdev)
>                 host->max_timeout_count =3D 0xF;
>         }
>
> +       /* No SDHCI driver type control */
> +       host->mmc_host_ops.set_ios =3D sdhci_esdhc_imx_set_ios;
> +
>         if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING)
>                 sdhci_esdhc_ops.platform_execute_tuning =3D
>                                         esdhc_executing_tuning;
> --
> 2.47.3
>
