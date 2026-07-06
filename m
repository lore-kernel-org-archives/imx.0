Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D875414A18
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352809; cv=pass; b=oSJNO/8hF81OCOWhpGdNG+ka/Z7ZgIjlIglpguQD4WvLIsL5hbImOoV4zfBtjYOPLniQ4Fabh1e0euqxtEVXCXAndCQ7zhlxX9f2tDMZyZonGchGc0lspfol5mTfNCPHAF4Ml0w7/52gkfkJlYWQSkOeXYiGHUfUzsQjd/7rPu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352809; c=relaxed/simple;
	bh=OT763+765AL37S5BJLMMQbirCxNjzAlqlQVzlwCI4Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyS3t5UGdVoKSJG7nfrIphI9Ko4RmGKmFJ9TC/wLT6AZaglftzff8O95XGC0r8F21OwRat9TRLswp5u99tAqGsdH928VtPRn7SUg8zUbsbqGUgnBoU/VQHdYpnOHqeOJiVFSHzH64Lac2Hk0SD2M2J8fiRT8PH+GpF6HS99VxBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOlsPwHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYqriaHt; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOlsPwHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYqriaHt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFDmR990337
	for <imx@lists.linux.dev>; Mon, 6 Jul 2026 15:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1tL7ezKmgwPKPnJpdHXHHXoZTxCOuZrev6KT6hfwTk=; b=ZOlsPwHzz3/nLKmD
	mSazt2nRu9GtZ0+YjI7Krw93S8LOBlHU4p3rkx/C2yIXPJIgBIRFTlox35JOlumq
	ltVC9qqV2Nkf0VAvnssny5+1VQXgVZo0yAtbFxWwxyJ0ztuyo5bmRLPlcgKNTPi7
	RuFInMYyg3oAoXgywhKVuuF9IZJJHpv+5m4JLyaG8AyhOP+2+Bnxhy5fBoNHHt59
	XlzxeDfgZ3b0/h/9/LqVm+fcQsfZH+MRJpOlS/QdAUGjlsxbKmIMzDannw7pW6cL
	Ao5y2uvUQDeowET76q2qeK8zaXxcs3ON1S0y9FnWgr0Lf7RkvxRUbpzXNnR5I6jI
	6M8kfw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsk9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Jul 2026 15:46:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f871so37683826d6.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 08:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352804; cv=none;
        d=google.com; s=arc-20260327;
        b=s2oKs0blLwI+P5rTC5mE53UGr5NweOfkbW8B7UNcSjtwxCZzv7PrIIQ2XhJEepnpAI
         sCTfvkVT80OmulsLJNn3S+33YcM/Jm+9wjr+rEJ8Rq+lMDApFZjKNhpqLIges/og09Zs
         pJAIXaUiiBALJO8dRg+Ty3jw1ltxmcZlMyBZubGJPjWmVzf0sLCod/HPWmse9wXTZKKZ
         rOd7NDGBL2klzD0dg7LFxoyi+C6hkp08jsp9kQSi5Yjmao7zbqjeCcxuAtJtYa0nslvK
         lucdt807nIGolG0lRNQa5tSdVV+ckTtmzMqfZi5k/gTcwJdU+FWv0nn0DafFX50DhluT
         F8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F1tL7ezKmgwPKPnJpdHXHHXoZTxCOuZrev6KT6hfwTk=;
        fh=xzpUpGMuwpo72/KuFlpULb6wgkTeQtBgwKaiVzwgH5M=;
        b=Dcl36G7HmFSswXaqtu7/agLQOzxOSqbAmIl2rfwOANs7a/A17TSXULX2s6dlH0scO0
         BwqE1emPzguFpz6lIO1vSuKChnaWjTnUua6F0pgKJExKMiklKsI/ZEJLL96QJ0F8aoiG
         RFxUXMzyh0rcfUXLUlBZB/iFLk3pACfMlcxFrhkpsJcHL0dfq/nfDA2qfHR4+I3yzlwl
         FaPIGm5eYzyF5Qx2OqOkb+E3UYuJgPMBVP81jw2dEZDl7Eezp+F8NlJ2TqQKSNfDFgnp
         iZvjFF+u43jiS6aEnYCzcKLx7ijxute3qwC21mQIZPKHCS3Vf2FoE506/IPRK2JJE5Yw
         Hx0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352804; x=1783957604; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1tL7ezKmgwPKPnJpdHXHHXoZTxCOuZrev6KT6hfwTk=;
        b=iYqriaHtpdiJN+GOS4J2lBOvCRSHktxnoFI8U02BqmaAzgodxkw+cFkqx1SiDXN4AP
         l5/26Ufki+Q8opxRxJUmbCnYIu9lGooyzpjKRaC/+ayPmF4M4JiZiWPjzPIhcoITZYsg
         1TtVGfaYRsguIa41AI+6XjjlGWDddItb/FPp30PH4Zv9X5QJNQTIrgUarbrlh/Wi2bcn
         ccjkFZeecL01ZXrxStt9/efeizSPfySTF+Il5WguCAM1ryBp+ZORpwPuWtxGB6K1TFgP
         S/BTSWAny2pBeDR5/8KGmMHi44En5g3wpR/XK0/KuCvfSNaK6e46aF47kDk+YIMS+XtV
         lHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352804; x=1783957604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F1tL7ezKmgwPKPnJpdHXHHXoZTxCOuZrev6KT6hfwTk=;
        b=oMhJADOohRkjByV4xnjRX+RQCTZ3hhPCg+rlNvd7mBGtsRe0dT4SZEAaKLGpXsD8gV
         mNCC1usOZuwwVciUytg2qwEaMZWE+H0Z2CDMkE6ZaFHbMcKqJ8aD9iTANTXJIuJMAowR
         yaWG7Twh+XaSnAv7PSpoSEWs57nXlq3w7BaGZfGKDnDdX0WumW2xhoxKKwgrQ+DoXgT0
         caexEy4WHqDUiC78hpmJkd0M2t3bLr4+TuA2RHLwofrphfbv7R9S0+3jVLpkcDS+xMkr
         UE4MzFRWSKb9KzCLSiqq5lwVhiNT3ysG633tSZdOuz0jCIhUUGpf9S7VCCFbHwYfaSnQ
         zaSw==
X-Forwarded-Encrypted: i=1; AHgh+RqWlAhVWqsyVOm5GXfuujuBLoMMENf5q1azazkEfWF7BEXAKwtepNgaI0W2SH0ZvZoQ1sY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1X/GNLLTk7Jpv97gu5rzA1gEs/hrX+9dFO0TVLJPqgXY51VuK
	IIF+7fqubcKk4OnjQLqSx/svZvY4hTTyMBKZyZQ5FRT4aZvhrhVf985GndtiDuFhryp2UOIoBWJ
	zlYOgYV/1xEb2iPtSQbkkmpKuZMXLKJwl7YSpXL4HT+c2LxC6RL0/X4rWwZF1c/m4/T7NC2O+Jb
	a21r9DzVhm6NHwso0raWvys50IiZ/frA==
X-Gm-Gg: AfdE7cmHpIkb4KKDHnWQshN1hxYR5yK4AHFXEAzhEUy29yf0OxDiUpT5ZiblSX46ke/
	ltcTkHc3ZvxvxKYuA4cH+Yhxz20RVY0tWjrSHLFJZ0IFhRyNtK0voCQK28a+9bFBK0w6ewLKRkr
	hZn3bDVCUrYnTSl7Y6kl61+KFQSKV7oTLEvQBK+KWmSSnHfvxvaeYRrd5A+1O2oT1zqZkv
X-Received: by 2002:ad4:4eac:0:b0:8ec:235c:7a66 with SMTP id 6a1803df08f44-8fcb4c00ee9mr13393826d6.27.1783352803849;
        Mon, 06 Jul 2026 08:46:43 -0700 (PDT)
X-Received: by 2002:ad4:4eac:0:b0:8ec:235c:7a66 with SMTP id
 6a1803df08f44-8fcb4c00ee9mr13393296d6.27.1783352803240; Mon, 06 Jul 2026
 08:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609142139.1563360-1-gerg@linux-m68k.org> <20260609142139.1563360-5-gerg@linux-m68k.org>
In-Reply-To: <20260609142139.1563360-5-gerg@linux-m68k.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:46:31 +0200
X-Gm-Features: AVVi8Cfdl1DNUQnUfsfYJ-HKaMqWUP8hicUf_E8fyBBfHMErHTWhOeyxDX2mfns
Message-ID: <CAPx+jO8YPs-B1AJA6ShZTNMapFhmQgS79h7EHL7ZWQ3rc4g+qA@mail.gmail.com>
Subject: Re: [PATCHv2 3/4] mmc: sdhci-esdhc-mcf: do not use readl()/writel()
 on ColdFire
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com,
        shenwei.wang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
        nico@fluxnic.net, adureghello@baylibre.com, ulfh@kernel.org,
        linux-mmc@vger.kernel.org, linux-can@vger.kernel.org,
        linux-spi@vger.kernel.org, olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bGfBlKYx2Ea7Hmi9y6q38yIZiMz9WSsv
X-Proofpoint-ORIG-GUID: bGfBlKYx2Ea7Hmi9y6q38yIZiMz9WSsv
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bcde5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=tBb2bbeoAAAA:8 a=IpJZQVW2AAAA:8
 a=GOXD6VkAu_hHpBIGSSQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=Oj-tNtZlA1e06AYgeCfH:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfXzLJ455y1wRCf
 vTpVQveKF2xvFP3o6FBQK+7t+OfEIg8TzEM8vE0zeX83LH/xUqgtZYsZmYw9Vi8ZEWROLm7vp2Z
 quBW6rBAYtM98XIrx2aUtLBjGECOaj4jcltXDLmnV/FCLpvC3SCQaHPS1GOmQE8nSSqiHhK+qSo
 +xucOZAmk/vsK7zUaCsn0u61JqPAO7Ljy0t3gpLbKrZ/9DEPSCqB48GyRGfTpsE5ZN23rRbqwJ0
 3VKc5JjcjtVZY8T3EYPpWFvw1HiuY+S2RKFNKPeKUFVO/ld++jWrC44pxSUwWo56Y8zz16OEWKe
 tEfqKXuv5dARKnH+yjf3chHV6QfU5IisiXQk4raQzrDjvdnF40KC0BxJtZ+K6L7GHkktGsO3Loe
 f/uU7fK10lbsNkWB52a5dSbROWlWI22giAhSi2YatYCUEjZMg4N9Z4y0DpNCNfR/bE2I/KNAoTg
 WTIjxxqwJvvtCh8/UrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX3fQav/yNaVEK
 vBOUN/Givx+OHr++jW/z6R1lvwgm4HNfrxRoCyfX103mc46f0LBsEz6/dGgT7qbIG+7NFNpC4Vf
 yCrQr5Q1cINW1f3dY+yOsIJ63ozm4gs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060160

On Tue, Jun 9, 2026 at 4:27=E2=80=AFPM Greg Ungerer <gerg@linux-m68k.org> w=
rote:
>
> The implementation of the readX() and writeX() family of IO access
> functions is non-standard on ColdFire platforms. They check the supplied
> IO address and will return either big or little endian results based on
> that check. This is non-standard, they are expected to always return
> little-endian byte ordered data. Unfortunately this behavior also means
> that ioreadX()/iowroteX() and their big-endian counter parts
> ioreadXbe()/iowriteXbe() are wrong. This is now in the process of being
> cleaned up and fixed.
>
> Change the use of the readX() and writeX() access functions in this drive=
r
> to use the recently defined specific ColdFire internal SoC hardware IO
> access functions mcf_read8()/mcf_read16()/mcf_read32() and
> mcf_write8()/mcf_write16()/mcf_write32().
>
> There is no functional change to the driver. Though it does have the
> effect of making the IO access slightly more efficient, since there is
> no longer a need to do the address check at every register access.
>
> Acked-by: Angelo Dureghello <adureghello@baylibre.com>
> Tested-by: Angelo Dureghello <adureghello@baylibre.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2: moved from RFC to PATCH
>
>  drivers/mmc/host/sdhci-esdhc-mcf.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-=
esdhc-mcf.c
> index 375fce5639d7..6853521e8b2c 100644
> --- a/drivers/mmc/host/sdhci-esdhc-mcf.c
> +++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
> @@ -55,7 +55,7 @@ static inline void esdhc_clrset_be(struct sdhci_host *h=
ost,
>         if (reg =3D=3D SDHCI_HOST_CONTROL)
>                 val |=3D ESDHC_PROCTL_D3CD;
>
> -       writel((readl(base) & ~mask) | val, base);
> +       mcf_write32((mcf_read32(base) & ~mask) | val, base);
>  }
>
>  /*
> @@ -71,7 +71,7 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *host=
, u8 val, int reg)
>         if (reg =3D=3D SDHCI_HOST_CONTROL) {
>                 u32 host_ctrl =3D ESDHC_DEFAULT_HOST_CONTROL;
>                 u8 dma_bits =3D (val & SDHCI_CTRL_DMA_MASK) >> 3;
> -               u8 tmp =3D readb(host->ioaddr + SDHCI_HOST_CONTROL + 1);
> +               u8 tmp =3D mcf_read8(host->ioaddr + SDHCI_HOST_CONTROL + =
1);
>
>                 tmp &=3D ~0x03;
>                 tmp |=3D dma_bits;
> @@ -82,12 +82,12 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *ho=
st, u8 val, int reg)
>                  */
>                 host_ctrl |=3D val;
>                 host_ctrl |=3D (dma_bits << 8);
> -               writel(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL);
> +               mcf_write32(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL)=
;
>
>                 return;
>         }
>
> -       writel((readl(base) & mask) | (val << shift), base);
> +       mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writew_be(struct sdhci_host *host, u16 val, int re=
g)
> @@ -110,24 +110,24 @@ static void esdhc_mcf_writew_be(struct sdhci_host *=
host, u16 val, int reg)
>                  * As for the fsl driver,
>                  * we have to set the mode in a single write here.
>                  */
> -               writel(val << 16 | mcf_data->aside,
> +               mcf_write32(val << 16 | mcf_data->aside,
>                        host->ioaddr + SDHCI_TRANSFER_MODE);
>                 return;
>         }
>
> -       writel((readl(base) & mask) | (val << shift), base);
> +       mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writel_be(struct sdhci_host *host, u32 val, int re=
g)
>  {
> -       writel(val, host->ioaddr + reg);
> +       mcf_write32(val, host->ioaddr + reg);
>  }
>
>  static u8 esdhc_mcf_readb_be(struct sdhci_host *host, int reg)
>  {
>         if (reg =3D=3D SDHCI_HOST_CONTROL) {
>                 u8 __iomem *base =3D host->ioaddr + (reg & ~3);
> -               u16 val =3D readw(base + 2);
> +               u16 val =3D mcf_read16(base + 2);
>                 u8 dma_bits =3D (val >> 5) & SDHCI_CTRL_DMA_MASK;
>                 u8 host_ctrl =3D val & 0xff;
>
> @@ -137,7 +137,7 @@ static u8 esdhc_mcf_readb_be(struct sdhci_host *host,=
 int reg)
>                 return host_ctrl;
>         }
>
> -       return readb(host->ioaddr + (reg ^ 0x3));
> +       return mcf_read8(host->ioaddr + (reg ^ 0x3));
>  }
>
>  static u16 esdhc_mcf_readw_be(struct sdhci_host *host, int reg)
> @@ -149,14 +149,14 @@ static u16 esdhc_mcf_readw_be(struct sdhci_host *ho=
st, int reg)
>         if (reg =3D=3D SDHCI_HOST_VERSION)
>                 reg -=3D 2;
>
> -       return readw(host->ioaddr + (reg ^ 0x2));
> +       return mcf_read16(host->ioaddr + (reg ^ 0x2));
>  }
>
>  static u32 esdhc_mcf_readl_be(struct sdhci_host *host, int reg)
>  {
>         u32 val;
>
> -       val =3D readl(host->ioaddr + reg);
> +       val =3D mcf_read32(host->ioaddr + reg);
>
>         /*
>          * RM (25.3.9) sd pin clock must never exceed 25Mhz.
> @@ -245,7 +245,7 @@ static void esdhc_mcf_pltfm_set_clock(struct sdhci_ho=
st *host,
>          * fvco =3D fsys * outdvi1 + 1
>          * fshdc =3D fvco / outdiv3 + 1
>          */
> -       temp =3D readl(pll_dr);
> +       temp =3D mcf_read32(pll_dr);
>         fsys =3D pltfm_host->clock;
>         fvco =3D fsys * ((temp & 0x1f) + 1);
>         fesdhc =3D fvco / (((temp >> 10) & 0x1f) + 1);
> --
> 2.54.0
>
