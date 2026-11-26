Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699919;
	b=1Nby6JnZ6hRtM89Yph5epPu+uPqjXHl/TUg12VYtvdqgGgr/AqhJsuxHJkYQUgl+eZNA
	 rXlWsTu5AzKqY1n/sqnPQaIAhDpqKmeudd7Wub33nCWAKTZWoopCjZRxBylsdrKnxtDxE
	 j520YglmZlkAhk8kRvT1ZuxnKjRuZkhT5A2yjNgwNWLLF2y5upujKY8BTR/qgtdGNFfvA
	 Ad8EHr6VImJrDjUeNuvJuaCTbMsr9iFxdrLpbu9uEvhQirRBwAjD8TReskSFpVMlV0kmA
	 J4yOURE8B3HOhtpOcDnhIfuE4g5jQA7gSj6fvJqWgFKo23oN1dSlHkhmhWRg4ar75Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
	b=ZRg6wMHeZi3xFKUodOg5upoTTyyF8xV1Rgov4LCgbMFEG19t+8a4m8GE7Bh6StpuHxR6
	 bG6f6+BAR9B3M6iv/2fyu7RgbaIXioeGXjEmMYwnS3lM1XhwMpWrTp+hQc9p+5H7cIsEn
	 pmm0Zy2TWSprNye7BVBicf2ZwB9ZLapQZctB8S0g+uWa7Nad15LgEe7M8bDFy9HnL/gab
	 6y880JlZOefe2x/hOQHK82yNGzJXVMTL1y8e6qlzJbdw3PLYdIEPjuCchvZi/5QCAEJK9
	 IpwlJl/9iO3u78QLCHAI//L2PgaoNR/0jq0jvAOomJVjW9pmRF8Sg/cqValRCRpnToQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lVnLx/XV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iNW+xPNe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95692606A337
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 13:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95692606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lVnLx/XV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iNW+xPNe
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVTwx1497094
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 13:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=; b=lVnLx/XVkcJaiSpp
	oLrrfQ0e7ix1RT9OrfS39lYUO3LgCgDlR0pPQctKZyXiAKUmKYttNwqctB1Su//4
	bZyJYRE+/0ED3DvH+FJVuajrn7ZDd0FGi5N/+2ZljKaXaPrmEtLOoEjsWIS3xssN
	0/eULf2JflCZhznLeu1S7ucb7S0C9BpL5fjA8X/qc8uKZ60b4Y3JHpJOqN3eNTZq
	gqkxowsyWy6f6WnxdLPsUbtwcCtf+rneiRq68AiSgHp4hg/AAzVGOrd9qa2lk9kk
	W0SgyL6W6JjziNki682KZA7YwyL/Mgc17iCmLWwZ69dB+CVkgmsvSJaWBQodPWgj
	rxiKiw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y38e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 13:31:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd48746a49so4035240a12.0
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 05:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699917; cv=none;
        d=google.com; s=arc-20260327;
        b=dS5aPlAqtKCr2vOiOJiEcP8JUicorHuHebrkLsmGU0igUmJZ0fMdYpP1I5iuRndS1F
         wKfhQiNRkw3m5HgJjxd/19pBK1NrOvv2wzYJ6+9OWIzPOxvyciHFWdU7cpXet3JXhA7B
         RNB709EhpCVHbrsN0UHSTJyn4zQiLckDCzmw9d1r+9O1TmlaGjjIqbjUKbmxWvmYhCm+
         R3BT9xBZxoi25DnCLMR/6ICmK5AOsTMyPqN1yFsKl5p7WcKR/w2jDZK/Q37lvongg0IW
         jYs39uvMFaHOHpWjKZz+BretjQOkKZGIYsRHa1iUmUZR46RNxMlUIn7BDx25vLjpl+E4
         zDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
        fh=aj4dmE/kE6hDAApV3qJWGZlM402+0OCpU/7xMhYIw+0=;
        b=eTpjIAQWexmgMqc7tXiVWlg1xDrpvFHTvaQ97LBTklVqa8kBX2Akb8ZFMFe/5OC5zt
         2L+N3srO57eNW90b7GInfggQhzQ/8opyzr9y2W9/PbS9pgVCBAa/losoyU/nj98K9st+
         c2caPkXeKV7Z3m1r4owY/u+MIsPxZ9LS3Ir6vus8TPFaaug/g04n5O34J8awedY4YPbE
         x1+JYWfp3xEGzG8YyRswbh18GGU7wHyaHvJ4TSSExg+0nSPp2qxpDLZl1er85CInIVLR
         SEFHXvXHCTZ3bxxvsKytDzaG1ndg30v9d6gmjknD4vJtSgbRikoUyOVA5bxnwv8UpMS3
         7AFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699917; x=1796304717; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
        b=iNW+xPNeSppD4v1aKNvb1LiBuks/9NTnG6oPr5zVXf3zqCCtD2cZGU866JEq8mn8yW
         O4o65yKuAV5wjyJY+vIurw/KVpJtQ49CJ27v39xmir+E+F/kFSeKAr3SdfLWaVjU9L9O
         VY3ZejiNy31iLF4FM3mPQbx/I/IOkwwZd6AtDmSwb2qwBCQLVMW37D/2iYvakXgF6bw4
         hIU+c9kAVHj9cQwSGQMcYu3PJ6k3QCcpeUgmmMX3BOpNSbFSXFJr5MCcH9dKniNl9P10
         tO3AWPYWmDTXrfFyvvr0tu3jvZRVSAB9hwwfCYb8X4PD0bjhXEqO2Hr22Twg+Z+Dn7SL
         tsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699917; x=1796304717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OFxv6MKKXSdqKHSw83//4iMpg5debE9kS/FM6OLb50=;
        b=huLqkfliedPSVFEBFViEKxig56FNzzVc0EEfWSdh3VgeBazJHbBYA9p0JSh4Qmzdpp
         R+W3/rEQ6K/2OKBlfVXtO17rlZqX5rEDNqUOKxXtC97hgB5M1caChMOAs03LQ1vUIgmm
         EqcRCEHcZyxhFe52xzD4VLsQs9D3n00t8OAOa86wGqiHREXaJ3ZMtuACnl4VAXlJXKFD
         3ktlSlqX7Z6Zd1k4BMcEB0moZOtNcBgspbgiDM10M7LOkmX/n4HtI+4pQMQvF+1cvFm1
         7Iyt/DhyNO/e9CP7v6K/4ItXlMgnDwdwBcCiTDe4Wwk57EM6IHE+3G72VRf9gouuyzoU
         LOMA==
X-Forwarded-Encrypted: i=1; AL+hErGqhukuOZ9MfY612QTq7p7upg+Y5H6ylGlQqJcS+NRSTdGjtIErmnJ9VFaqVPQL3lr6IA8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/EOgUDmKMoALzFeFdadPESjPzqCJQtTdIsJgWlb+shiHHUaXdy
	b/3QbOZqvgnfJ4mm5ARnjhPfQBiYiSUXpTnAB0l7sjJYACs1ZW06XYhaNd8lYNZysPEfDTzL7Wy
	/wfTnXkF9v0MznQYWZxmmJHfAb+BaLyOtNt7Dcw3Z1p2Hp+k+kCJe0h7AC99SgGw7LbqKClK13/
	Ks2kODb2dh45d2eJ7DrpbPT20XZm02Mg==
X-Gm-Gg: AZFdTZcKuR8xM26DKJvxwmhibp2UdXEPmFN+24FTHhLZrVNcQbL/1AY+Hqgnmil83q0
	AoFUU1lMZ6wKyBDWGsVIa3F7h1S+jbpoGy+Uci8XbHwxFRliDXp3DAlK9oqTQTd2eS9bygK1WZw
	dKKDj0BXInpDmD0aBYoVtqB6MQv2kyNDq36q9QWcMN7AHE31yMgMG44cUJ1Q==
X-Received: by 2002:a05:6a20:748e:b0:3fb:4a1e:2f82 with SMTP id adf61e73a8af0-4014ce58b6emr21264813637.61.1795699917320;
        Thu, 26 Nov 2026 05:31:57 -0800 (PST)
X-Received: by 2002:a05:6a20:748e:b0:3fb:4a1e:2f82 with SMTP id
 adf61e73a8af0-4014ce58b6emr21264768637.61.1795699916655; Thu, 26 Nov 2026
 05:31:56 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <confirmed-20261105-18-6a8421e1b241@gmail.com>
In-Reply-To: <confirmed-20261105-18-6a8421e1b241@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:31:45 +0100
X-Gm-Features: Aa3M54ozD6ck_D13iF_4G2ldlHlAUxaHQPOAD28BUKrT-8-JuoTdL0auTG-EAf4
Message-ID: <CAPx+jO_btJdPP7Z-S-VCkM4hes33QKEJzjw-p7OhTcGRXirtTA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: gpcv2: Take a reference to each PGC node
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX3lpIWDvXVOwu
 85tOROYEYrC00/4H2WkEXrBjBZVidliYc5pHkhggIN98gQv+PI+JbnOBk9FYvohGA0GINr6ROO7
 6qSujo8qx9tUoeEOVsGVqUZpzDC9/qh0ZnqcksfBVlb83XE7V/d85MiMZR1pwCBrEkvbCW0+v4o
 Fl1+TIUTxpo/60J3x1l/W5uCAvNMUWKmns9YQnhXKMySD5Z+oGbl5A2U3cS+llRDgK9HBhzKMya
 9RsKi9F+SRhCAgSFo1ykPcChUxr4a6Ln0gG5yS77/B6/CzeJVFGBAqf7DeQVPze591zGmDyMKF9
 oZnGPzvfeeciZcffsXF+dxs9Hy77GV07JjRcI3Lt3mmwirY2FFUvzXb6WCPp+7J0jPNxGpHE9MW
 T5WqHFRH5PnIPgFQGZXCuhGXJ4n0xhN4GK/ImEFz1Wx0oD5EAKbWE5gswfAHY6cNZrYcOe+YEim
 p4uewl2otsZxT1xweQg==
X-Proofpoint-GUID: rAy_CDU7KNs48OYcrndI9-G3Zm8py4h_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX7z850fH7ITGE
 fFkax/YwKqgK+mzeraJ/QNu5axlxEMGzt5ntyWdbLIE7D3pMcP+Bs5ztsVKEv+9CGKkXVmWSZaW
 nCDr5JhuwnZM1bQdudD0IJSBbl0vCtc=
X-Proofpoint-ORIG-GUID: rAy_CDU7KNs48OYcrndI9-G3Zm8py4h_
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0834cd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=zyzk0L4BWZHpzulOrW0A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

On Mon, Nov 23, 2026 at 6:19=E2=80=AFPM Yige Jiang <yigejiang86@gmail.com> =
wrote:
>
> The child-node iterator owns the reference to each PGC node, but
> imx_gpcv2_probe() assigns the node to a newly allocated platform device
> without taking another reference. If platform_device_add() fails,
> platform_device_put() releases the node through platform_device_release()=
,
> and the iterator then drops the same reference again.
>
> Use platform_device_set_of_node() to give the child device its own node
> reference, paired with the put in platform_device_release().
>
> Fixes: 03aa12629fc4 ("soc: imx: Add GPCv2 power gating driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/20260530004541.E04701F00898@smtp.kernel=
.org/
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> AI assistance was used for analysis and patch preparation.
>
> Based on next-20261104 (8b7179210b22).
> Compile-tested: arm64, GCC 14.2.0, W=3D1, drivers/pmdomain/imx/gpcv2.o;
> baseline and patched objects built with no warnings.
> Static source review; no hardware, boot, or KASAN test was performed.
>
>  drivers/pmdomain/imx/gpcv2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 6a54ee734514645db7e0628bdddcf579d1f0d904..7b377bf0196491298e9e772b9=
7d15a2bda9ff83a 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1513,7 +1513,7 @@ static int imx_gpcv2_probe(struct platform_device *=
pdev)
>                 domain->genpd.power_off =3D imx_pgc_power_down;
>
>                 pd_pdev->dev.parent =3D dev;
> -               device_set_node(&pd_pdev->dev, of_fwnode_handle(np));
> +               platform_device_set_of_node(pd_pdev, np);
>
>                 ret =3D platform_device_add(pd_pdev);
>                 if (ret) {
>
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
