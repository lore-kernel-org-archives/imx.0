Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308103;
	b=SwVBEUWnh8WKY/wdW8YtedR4oXryfZEywcklQslitmGR2CW0u8HtP3/Mgsoe0zSQbpKj
	 GLfP5f4hoLqArkMMhmtN+XYnwYQzIaENGGBvPt60VTtjs44MOjaAxRs6O2LEY9IUzMw9S
	 KsMGwE2YrIc1ECO51KN0JnHwtaem/4GBK7BAoxqi3t43cQZ4QjGBkBuH98VeYxHpIxx4/
	 7xA1I352nICn7flm7cKgAtsm8p6TCmXOqe9kP/VbRJ4atgRAI758EcXkynh5jmeuKZC4S
	 c+UikBxP76JEYSEdwd5MX15CuN7KxwrLVsOQOmiqCIEGeFMS4n6o/rpVFedNmPTiKtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
	b=JylyK5rUZKCqiUPkUJ0wttTGQTKOtDH88E13VBjoIAb2pqOioEjWrxnEedNxxLXE42Ys
	 pv7Wa7DqFbRbd8LGBa8+iBsCfb9wA8uhH896vh1dQGzLKEcC6bGCkOdXinQ5gzmHpc/3w
	 ZPHT4PGik+zvhpgKAxqNWDc9GWIHCITEDrlm4edjdrgkvhv8etX0cS/GsErKto50Sla6e
	 9pjPp2ULZ0GP7bPgdFojPFU5R2aq1ZcYxIW1+7Y5GCgTrn8xoUryLqUPGEm2bc4Rw63dk
	 u049TMUDDMHT7WVy/JagZ0ABUrPuCRdVM6fbYQDbJaouogIvj9pefqPLXuIi8BGTUsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1ksWaxW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fbmEMxNi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5370606A335
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5370606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1ksWaxW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fbmEMxNi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4Up1155041
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=; b=f1ksWaxWVw8Rz8ld
	MqqA6xAmL1eaI6KdF6ngVxTNfe1rtXeAfa8cXSgx6t1OROxJRizyCT5xXOijzAo+
	t1vFUcTmIUNcDluxD58KWpiMHoHx/ae6W5Ifo1i1L0DXFil5/mwaBy2xBvMQcbh8
	ds+/A7dr60U4fxFL8T+0SgPIj7G2qGMqT8DYQiYO7VvVN/7apninibA6e0dBArk5
	pjbgEMufR8WBkr9hfxmbnqxaYq08dZKJ4bA+PsAQFBomORtfEyNf68lKGIByyrHl
	yNmv2RqOp/XTP9UBHJTFcwse3MP/WEC1d3ThUO6vipuukBkY8buc3KA20SJySRwA
	27wEXQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49rnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:55:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b60129a46eso2698348b3a.1
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 02:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308101; cv=none;
        d=google.com; s=arc-20260327;
        b=i0OcEUt4I0ZMaaurTuPcnst+chl01K8F9GIZnrDdCe5/4LH8DSuEYN3HOqDvTw5lFp
         J6hbjdPHEZIp5lwYeZ49jaetdTXq7hTjYt9GewJ+jV0xSotTkq90c3T8Y2boZvv6IbAr
         /PrGQBGmWabv1oEH2ofVYOzB3UhWr1FxJJNM+CXPfbmfVb/Z/h/s+92OoO6wjbUXptB1
         hMe11CPi0tXByNOotruXMEWq6+A1KN9J7Aj1/PYTJD34P+tlNyRDASNEdIUJ/ifV4szW
         d6IKfLZmdx5PSY1NBRXYaUlNsgVncc3OUYHNNaNQNY8F8LTTLQndbBQB5iSxBQ0mTOl8
         Z81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
        fh=mBcmNvPB+9wugZ0yYnidcLhsMIKZ5H8ivGUFSOC9PyY=;
        b=I7En7uwh946ETUt3T0rmdoxnpUxTs2nc18ycaPwKlhCHZ1vMjKYpsgFr2ehVjTSGCP
         d7ouqjVgEnRtH5IQ/bCaSZ29yBwL/ZCONaPm2U+tnmy7WU2wN859urX6aFUmUenkNnKW
         fY/mmQUmJxCmLJnmSj7H2LvzjvDdOw4dKBJAM3T72/pIzFvX2m7AS5THL/DRMIBt3Zla
         yWtmfriSN4xs6z4FjitikbrlsIlJFIuPEvHJILx+hcoAYSztSOCVv1cMADFZR8FVF3oJ
         vqg++u4BfW5QzfWCA3iUyiMSNzIldhuKUtIXMju6+caMWQ0Hnuo5Jqt6d6wwZeh56Jg9
         WoAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794308101; x=1794912901; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
        b=fbmEMxNiuYd4sUo/nqxiCgj/XAywidV8yxMRGSGxwfMKbUBWx+CxUksxKkbbe/Yfdy
         D5+EcH1ti+w4hGN2f10PNWv9WFdjboyp+g3ont1Y5Mmge13AcGeBuK8JhytSp1avuvnp
         1wMTCXUelWyaaqrxKm5RrTfHbORkp/MLOHZUwUEtddspS0CO1qT3N4VyjmMubOWjudea
         KJSPW1xWKiZcqDQsOeB5t42lTtNbkf7bARwjFvcDK/3Ur73cw9rauq6pVVmh0Q/y6XS4
         RLLTyj5UCuGFb5khZBDZz2gx1ywZb1fjg8kpUFdDQqt/WKfbDSN0KfO2B5YJROXL9RDl
         0OYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308101; x=1794912901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJtLwXE4YbMiscRwIQ+gtJkXK50TzVBvgMUWwQOLd0k=;
        b=RHFysjWFODsZ3xzwcs7m/f0JKl3I3YrsXjVa3uDHaJzTBUds0F4+EQxNKNudqDYCgu
         2GCHWyXaJ3h0ICbfelmk7EWxGu6aw6X63RhE4wfDYQVgTRa9sxFlEgf9MrX0rt0/wLLj
         vDptmtwOzXsHOs4lkSt8aov4zZvEvpftS5N/kEwXknKp4rcCpClAu75rSpnyjVSuvEjV
         z953oLCtAnOpfrANJkIOHyyacS6wUCb1O3pHe7vlp0BM+Lm1tqKjBoruArMntNTEjEVI
         S2TSEEm8kQdQdqgwozzuX1f+N9Aw8P0NGUOmsqpgaw7jdRC39XFqLLx0DpsSaOPhNdmB
         2bMQ==
X-Forwarded-Encrypted: i=1; AL+hErEtCYN1o5YTVvjapcb7ZuesVjnRPmv3sMQFmkjrkX4pw800NVMxm/vXLoUe0krlCvSTHPM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/NjMXMzGspxBIm7TZ+LTo2rr4dvFvMqzqIAGaOmgPrcLzhxLSJ
	JN5+4JDxo1B1RscrRvZG11pAsPMVOG37aMOPaStrLYvtVeit6pzAMb2uZ6gnTgavaQcARq3mvgZ
	+81lPN7fJCGl6Wtl/i/niZxAlBgOV45aECDhWoECUwN66pmWUsmLlhgNaRbVcUvO/u+9Jiz81vy
	Z/0lm+3jbR33nECzRcqmUdJM6Sm4tyOA==
X-Gm-Gg: AYBFou2SeBt+3U90p/vKn2NN6OsIr+FifqiYAZvIEr7wrK8Srgxxdbrun9TUQm1lvV9
	9nTO21Q7FWVWoxMPWsn5u1RpZVbN45tnOqZ1CsINFL34sG54QQys4WGuQ3qQ81JflL/tB7Z6UZy
	uliDQlb5CvWJy7jV0yRmv/Vg4mubsJG1mZyRDYb2oqnzh81ShvZ1NmNXyF6w==
X-Received: by 2002:a05:6a00:13a1:b0:8a0:1435:fda0 with SMTP id d2e1a72fcca58-8ba8aeaabd9mr2606964b3a.51.1794308101038;
        Tue, 10 Nov 2026 02:55:01 -0800 (PST)
X-Received: by 2002:a05:6a00:13a1:b0:8a0:1435:fda0 with SMTP id
 d2e1a72fcca58-8ba8aeaabd9mr2606940b3a.51.1794308100616; Tue, 10 Nov 2026
 02:55:00 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260924142520.1594149-1-lgs201920130244@gmail.com>
In-Reply-To: <20260924142520.1594149-1-lgs201920130244@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:54:49 +0100
X-Gm-Features: AclHuK8rWqeadVtw_i39_uuIhclFTsB4ghO-HIhVp563_1PxcLFRfqznhN0nh6k
Message-ID: <CAPx+jO_EVCeOtSKSekve_w11a=nnpyq2qWAa-R__T-URjNXwbg@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: imx: gpc: remove all initialized power domains
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miaoqian Lin <linmq006@gmail.com>, Wentao Liang <vulab@iscas.ac.cn>,
        Shawn Guo <shawnguo@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX7dDtakXDIZmA
 exrltXzK8mCb/0HXWMPRt0OKX+ihgYb7XAeto/4Fwfo6B7JW+kuGdZvwIHAIrI2c59mYj9dcn2n
 ii+3W5Cn8HnWKMSyZVrljtajZ2568UY=
X-Proofpoint-ORIG-GUID: uy5x9WLE7nWDWiqL0eKVDZCeAz-Hep18
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MyBTYWx0ZWRfX12rMtwu1rfEv
 nV0hzng9UtMAv1Qw5dskAbzt9A/3nr4v9/J1+63RIKcffwuSq1P7pVcLAgD/pIm2gDsl7aSE516
 DycSzpNf8Ut+zd1CPyQ/A+gAmwD88+CEqRBcoo3UTTCWn/RFat7j4XFF7pG51si9Ga6Xmlfq2D0
 JHx4bZ52xbxfdlZk52dN+wW3LN5P0F2F7OwZVI70CUmdmemR5fQvRrk5r5aIVb5zfmNI3y+sV8S
 EyGcDCp2eocuE13nHkom5yBGJGBH1gFlj+fqg8V8NCwllnQsfj3sq0El/SyDtO0p//I9/52UGaJ
 QhjEO0zwaOHHcwltPkuBkWczmSN0IlhuXCUdOTOhUWJ+wmaH+sIKYC0S03Yk7WbfR1Icc/vMH12
 fS9NFPRSBd6bx6YMvVknRo3j6XRt4i0mYqI5skESFRERZE5QsuYpMBNhYiMfNLeignyipSMimIj
 AaovLz16lpb4VeT/aIg==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2f805 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=Dljt1d-j0Gip_uCM0CgA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: uy5x9WLE7nWDWiqL0eKVDZCeAz-Hep18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100043

On Thu, Sep 24, 2026 at 4:25=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> imx_gpc_old_dt_init() initializes all power domains described by
> of_id_data->num_domains, while imx_gpc_remove() only removes the PU and
> ARM domains.
>
> Use the match data to remove all initialized power domains in reverse
> order. Release the PU clocks after the PU domain is removed.
>
> This issue was found by manual code inspection.
>
> Fixes: 5a42d1198901 ("soc: imx: gpc: fix imx6sl gpc power domain regressi=
on")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2:
>   - Check the result of device_get_match_data() before using it.
>   - Use an unsigned num_domains variable and a decrementing while loop,
>     as suggested by Andy Shevchenko.
>
>  drivers/pmdomain/imx/gpc.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a22..d83fb37e2297 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -502,7 +502,9 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>
>  static void imx_gpc_remove(struct platform_device *pdev)
>  {
> +       const struct imx_gpc_dt_data *of_id_data;
>         struct device_node *pgc_node;
> +       unsigned int num_domains;
>         int ret;
>
>         pgc_node =3D of_get_child_by_name(pdev->dev.of_node, "pgc");
> @@ -519,20 +521,23 @@ static void imx_gpc_remove(struct platform_device *=
pdev)
>         if (!pgc_node) {
>                 of_genpd_del_provider(pdev->dev.of_node);
>
> -               ret =3D pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_P=
U].base);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Failed to remove PU power do=
main (%pe)\n",
> -                               ERR_PTR(ret));
> +               of_id_data =3D device_get_match_data(&pdev->dev);
> +               if (!of_id_data)
>                         return;
> -               }
> -               imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
>
> -               ret =3D pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_A=
RM].base);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Failed to remove ARM power d=
omain (%pe)\n",
> -                               ERR_PTR(ret));
> -                       return;
> -               }
> +               num_domains =3D of_id_data->num_domains;
> +               while (num_domains--) {
> +                       ret =3D pm_genpd_remove(&imx_gpc_domains[num_doma=
ins].base);
> +                       if (ret) {
> +                               dev_err(&pdev->dev,
> +                                       "Failed to remove %s power domain=
 (%pe)\n",
> +                                       imx_gpc_domains[num_domains].base=
.name,
> +                                       ERR_PTR(ret));
> +                               return;
> +                       }
> +
> +               if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> +                       imx_pgc_put_clocks(&imx_gpc_domains[num_domains])=
;
>         }
>
>         of_node_put(pgc_node);
> --
> 2.43.0
>
