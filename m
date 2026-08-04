Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F0439F7B
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 13:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850985; cv=pass; b=mkww2Rm0Q3ls/awneehRyNJQ8jP4ZYvfRRJkKuRAMBufqIFlZBhH/ZEkUyOgbRZr9TTzrLwLwMbVp8i6lEqTKyYEIEtwEHYq5TKwKg9Tn5jrBNQRJ5dYBusLLwyxz9SdBWkH+yHKRg6FqpV1mWX6i/ItxHfbUzzkdlM/QncMXbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850985; c=relaxed/simple;
	bh=Ap50wJNS6rGhW5kOX2jJWrelaNRHw/n8EXoTFaWVrbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iV4NFjOQ61ZPtGEGAJPsfv4h9y46vLOhSI/iiMT3YTW7D940Teev9XxqSHfcOxHfoYzUizTmTzzirwu65vXZB1ySMMoV7iL8UCiDQ4rkmvZgvYodZO3vy2rVUlkGof/FMA24i8YKnefhy5da2kOJpEax5ElYf+2opwpbxUqhcFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWITTC8o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNIr4W/v; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWITTC8o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNIr4W/v"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674D34qA3693441
	for <imx@lists.linux.dev>; Tue, 4 Aug 2026 13:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVvvAVztjSa7UDj58naCmzw8jLM39lU68nCOnQc7GUA=; b=bWITTC8orBglSf0i
	QYmbNZwOtSEgtwXBOfOgypiNpx/R/CB3WJRKcKBsb2nt5SL/K3GDgetEle58fjow
	cWMCi7jB5694vMj2gvlnL5pXWNWNhFpcNhr3ashNqxk7E55L/u4A4ASNNzZYxtfx
	oDulK6XOARRJRQk4qrXQGtqshPsLn2oGXIkLzsasjLqsborCVCy85ciy43UEF1qM
	NpqbWOfQrFVLrY/Ax+HpW+q5SNSfHikknXN5SVcop+XoYcemhs0bE/v2qIFu8KZm
	rMHQoHe+jgR1w6/R8YGWGME5FfFAnxuzP23VgUL1l7Crn1iqJNbloCRiICL5ciaA
	jwOs/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmgg5d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 04 Aug 2026 13:43:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349c5af52bso779328185a.0
        for <imx@lists.linux.dev>; Tue, 04 Aug 2026 06:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850981; cv=none;
        d=google.com; s=arc-20260327;
        b=Vv49WYSKHQalwb/uwSIhPcwEeGpd5Ej68eIer8Hh3l2i4aYMu4tIAvj+qbMWzlNH4Y
         m4/g9b7lyNcuQHfBkPym2/hOnei5ryY1ECNpD5Xf/7+kKYWhqSnvpqtGzY+wgC0nfGEj
         +YPgd366u/NL6ns192NEyPc4Avp54XIO0gOJ2aiAGaUC9XfeNZFGA5GPKm9hKgna3DIB
         ydbRjolrIUpGfmsI/lqzEx5EkJ4eDOdf1a5czDHwa8pksSDyTyBKre7tL41eqmtRWBaz
         E0rCebfngUmmpNE1QxJrxDsysKXYZLhz86DgMoNo0lTcVPSfH2TJxyDoBYqX3PS4mR0X
         2gdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVvvAVztjSa7UDj58naCmzw8jLM39lU68nCOnQc7GUA=;
        fh=qppQWM2Aq7ckG6N0iGt0ZV/b5FNv+1kAq52HC+bJSYg=;
        b=iZm3bZgWVFHgNsOJMzpwzd3Ve/lpnAVoQLWbc/hEU7UVz1Vh5wyMJ+aT6z56IzV2jm
         NT2iT5i9parb+DPnyW2bmk7/itgYSW5q666J6ufvD6/PTLaehaqtUQ89QJRUdgWThJPs
         ZKi07bb3pO6wX2Cr9u2KcrJhQ5vtPP+o3E6zx8UlJ2Ly9ImDwe/tL40q/0K8Np/lKLe/
         USXK9sOoPtDQT/QR3gOH6gKwGzfPvNo4rLGDntt+RzHTqDIoWn750QlE0et+mTQM5K/+
         IdsIJyPlMrrhMZGE6/G7MICUKnb6GBGWUsAufb29ww1QOxj4lMQGTTbtesVBYuHK52Z+
         BtBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850981; x=1786455781; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HVvvAVztjSa7UDj58naCmzw8jLM39lU68nCOnQc7GUA=;
        b=RNIr4W/vPBh/mXbyCCzEQmFmScyyB7bwQELsTo+QHXrqqqme6V1oHQX9oXXxQisS/l
         +qOMwshSUcjVt3QNgb4p3GyaDLiEvhasDrIhA7JDTc/3r+vEbU+OH1pDFo30n0j7FAs/
         jmUHzgY4QHefCQ/UrFxNZdgZNiFzwtXJbOvS3UnAc4IYMtjJNOCgwoZjsCHJQrH53/b6
         ALCSdi+jq0IR6xLTX48kZ7W28YgcaoPPg+ONgJdnuhPDZuaO/sD9TYeLLcEyue6wIUhU
         Hgpud4epsQ+NSSej8/KCABohEnSHru1MMqmBHTTbJm95/byuJUOtllm5LN484lRN3RI9
         y/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850981; x=1786455781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVvvAVztjSa7UDj58naCmzw8jLM39lU68nCOnQc7GUA=;
        b=W+HL5qXVIC8qa08DzpB07P/XXKyTTbjluxuuIgmiVFFdQxrDL8LUTkQA+8T8dPbqna
         kNWlj+5YrGQ7kQANWuFwostWo9IQ0IFcjf/asdbh4TUcaOt/SF9MXjySekk2SUFTwuAT
         cBG4WY0Dqy/QVqbulzh/7YQnlOKDiuwmQEz1DvbqF7Ff6SzxaMvkzNQJav4I2VtlUmK3
         WDyf11X1t+Qfc850ISTOIMtWmIE+3XHK0a6TTbuGIF2tX4l3YD9n9M/LX8/u7+3o0zCs
         i35o5rshWXH0GuiYslwBLXw4/uuxnD5bRiZsbTG0RnHQSKhy+L/MlR1RaF3sf6l37XI7
         o+YQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr11j5ZJ2oxMkxhojp+PZo8Ut0J4u/LDg0grYWwbDiHhESKKHlBYWfdYD8UJVkb2AfDQxQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/zwE0ccMISRIlbAS8OWbgz14pPGtHGMSqcQlMqAkzyVTBBciG
	rZCr1nHGWCA40pV5JA1NJ89o6hjnUqHUWhBnBTeMBRJwzhE98kZDmOa7VgYqGywTFaCwiuQyc1y
	9N3ditZy90zaTxGkE96Z+EVuffrEJRvpDIvp/U8Z27oQiK0DZVkANvIVyN66EJBvh9Loi9QdQni
	JiJBSZ7UxH3+zdeA2FQC/AHxOGqj3x3Q==
X-Gm-Gg: AR+sD10o6dtdV6JGuRG7mqqwwphQDbB9cDaB26OfTnIMJLdxxj0KXHH+RttBTejoUWj
	KnEKI7dE/DPcU/fQC3KdEOiJVnj+DimumU37+F2hxNNiLI5JkeX9mQi/yWpi5FXqtDU4H55acAb
	mU/b4mGqOLFrsP3KwtHEeCjF0W3K5YO7E8R04tnlDtpVHiln4eMEuBSlmF8w==
X-Received: by 2002:a05:620a:460a:b0:92a:d10e:bddf with SMTP id af79cd13be357-934a07488famr2617500885a.4.1785850981331;
        Tue, 04 Aug 2026 06:43:01 -0700 (PDT)
X-Received: by 2002:a05:620a:460a:b0:92a:d10e:bddf with SMTP id
 af79cd13be357-934a07488famr2617493885a.4.1785850980858; Tue, 04 Aug 2026
 06:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-sdhci-fix-v1-1-1a655a5d895d@nxp.com>
In-Reply-To: <20260727-sdhci-fix-v1-1-1a655a5d895d@nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:42:49 +0200
X-Gm-Features: AUfX_myk1A7RNMhBTulzM3h54dI-ohoFMQTns5udRhkwANPFbUAdJDDOVeY7yWI
Message-ID: <CAPx+jO81304unQwypjFLvYj108u5r1FJy4j3NeiZ-JR=VXde8A@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci: make tuning_err a signed int
To: haibo.chen@oss.nxp.com
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Yinbo Zhu <yinbo.zhu@nxp.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX1GPXpTMtTaJA
 YnN0M0xk6iXGxcA48t5tubY2Yjq4swMUuHJ4AnrMp6188j5GScEtSKjImQ3M1U5rnzM39LhzhdG
 UhOyJ+OX6Qn5amP27HPs5sOtTXS/9dSUjW/e+I8q2t3h7FVJ+yeO+e0r5Km3nuOnaw5hG0CLhLR
 XTiFXdRU4QMQHC7pVRkupWMH0LhJREzXxIFCGWwl8zfktZcQj4nTbfsdxT1At+5TpsUzNu1Dp+p
 2ryvfz/R+bwYSxmKsZp+gNYx6q8pHMQgJXl2ZfM688R1mx8LIwK1wEkl5pOLkqFUljFnU1gHfJO
 HdCPK6M8Ks1EL49VLw1B3bE/CzqwwbBUFB4DJ3TS9R9DUqo6pWPA1uMm2p+XEQaqSndIMZOzrMS
 DZ3Rlw1jwrZDENEcaNzqXvNmk1TJEVB3omg+iayxvXZArZDgntOqvNjcEClQ7bfAHB5cKW9tRYk
 EAErRVZ/t3yv3GoSJTQ==
X-Proofpoint-GUID: Jpc59IOKAjbL4I_4-jfKGxFHFJVSPKMq
X-Proofpoint-ORIG-GUID: Jpc59IOKAjbL4I_4-jfKGxFHFJVSPKMq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX9L/UXJ6yXSmj
 PnoQq/1pIYkblu3o1z7W/W9ueTX74sP9g46xjW7IRAOb/hwFgKAD+//xs95FE9nVesIsiaLNyHA
 P7LObnLNGxVhp/SM7YCwci6lwHbXfio=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a71ec66 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=8AirrxEcAAAA:8 a=1PNuwfDnIaaTBrVRkbkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040110

On Mon, Jul 27, 2026 at 12:35=E2=80=AFPM <haibo.chen@oss.nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Coverity report INTEGER_OVERFLOW for host->tuning_err.
> The tuning_err field in struct sdhci_host is used to store an error
> code for re-tuning, but it was declared as unsigned int. Several call
> sites store negative error codes into it and later compare against
> negative values:
>
>   - sdhci.c, sdhci-of-dwcmshc.c and sdhci-pci-gli.c assign it the
>     return value of __sdhci_execute_tuning()/__sdhci_execute_tuning_9750(=
),
>     both of which return a signed int (possibly a negative errno);
>   - sdhci-of-esdhc.c assigns host->tuning_err =3D -EAGAIN and later does
>     "ret =3D host->tuning_err; if (ret =3D=3D -EAGAIN ...)";
>   - sdhci-of-dwcmshc.c prints it with the %d (signed) conversion.
>
> Storing a negative errno in an unsigned int and reading it back as a
> signed int only happens to work because of two's-complement, same-width
> integer conversions. It is misleading and triggers sign-conversion
> warnings. All users treat the value either as a signed error code or as
> a boolean (zero / non-zero), so changing the type to a signed int is
> safe and makes the intent explicit.
>
> Fixes: 7d8bb1f46e13 ("mmc: sdhci: add tuning error codes")
> Assisted-by: Cline:claude-sonnet [read_file, search_files, git]
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index b6a571d866fa53ce2aad0105cea2909abe6bce01..f0fd81409a86c6fd9120e6976=
6fa2407c14e9048 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -659,7 +659,7 @@ struct sdhci_host {
>
>         unsigned int            tuning_count;   /* Timer count for re-tun=
ing */
>         unsigned int            tuning_mode;    /* Re-tuning mode support=
ed by host */
> -       unsigned int            tuning_err;     /* Error code for re-tuni=
ng */
> +       int                     tuning_err;     /* Error code for re-tuni=
ng */
>  #define SDHCI_TUNING_MODE_1    0
>  #define SDHCI_TUNING_MODE_2    1
>  #define SDHCI_TUNING_MODE_3    2
>
> ---
> base-commit: c5e32e86ca02b003f86e095d379b38148999293d
> change-id: 20260727-sdhci-fix-13481630ae02
>
> Best regards,
> --
> Haibo Chen <haibo.chen@nxp.com>
>
