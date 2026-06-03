Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C17937C935
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481739; cv=pass; b=H1nYvneL1CUEaDxpjR2e/M8Wt4AtQY5t7HwkHD5FWmNOOPs1RCprs71vyxWf1OVnetixoudwqlHznGvd+pzoSIsaaOwsat9GNXVRKoxCvZX/+vebmZyW1G9FieK0vmKheZKbzdtmuq6w1YjDsIFAjKRHzAEvcMdfPky916HXNQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481739; c=relaxed/simple;
	bh=ImyaRmLghxFwQsTJnShE9IsVAyUjBEQQdEnQ0b9Byos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhH1h2IcEwi1qU2JnKZIMh4XnTrRIMWMqSBcRO8ZOdivI/Ad7+iGT3xQP+sA1pATLNMv7+FPQc3MXIhEBHQ+fB1+6FOLLjo1HuExF3uGdSHGnXF7GoMdhceRFiQmbAyJ6abhCyhxsfWf8CBh6DsZLIBpJBPScw2BYSr/YULErg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RV/ZBQBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SV0VS4tf; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV/ZBQBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SV0VS4tf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vY7J2368138
	for <imx@lists.linux.dev>; Wed, 3 Jun 2026 10:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=; b=RV/ZBQBW1Gz7WB7g
	C36gOhNhdL+lLAmqQlpap6noJbbxHcrt5EIxi83XQdvwRajDeMt1YFcY+H3mGLXT
	9XatmhW6r/yTEhIszMkIGbMkNaO+fyhhVMzwIGL7bcpZ9ReeDX5jEpLuRbcstKSQ
	YhnhXEg7Vp0lJ0rPhBLgdWq78t4NPOsw/LugKMhQPSnThw01mcIgA9my3R2A/CFD
	SMxSsEToum0RhiBvscPxkFsFs1FxqjfwWOQrc5lvshnJbrHXt0WtI8psq0P5nZyX
	LEs1LzosAOE89oi/Bezr5wGe+ccK2iGDRjqfsqOH5hQOImzaSe/nMOk3SRXe02I+
	vbBXAg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gg2d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 03 Jun 2026 10:15:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccdfe1ff26so85824756d6.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 03:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481735; cv=none;
        d=google.com; s=arc-20240605;
        b=cM9NXnKsgxQ1FjuJhIHcxxj45vaE8bAQBXEjjC9p96K+AvYQWWI06UNeTzLvSkgT3U
         zJe3IltS3MWc7MLvfCu8LMncizpC0MkB1ni2+oWX2O/5vZ0JWUuQyM6x6ClFnJwCshNj
         YyHhWQDi9TnvBIW3wQc2bUazPATcArG6CNM9cizB7DbqRKVJJxl3eZN++uBHLmx+4nqA
         /OIp3vScOftm/YWcLRaMgfCtbRPsfmToLfCana6gAZWr4y2u9/+hHiKQaXDCbk3QOl/w
         6iDnIZUqMhf7ZwL0CDMcbDlZ6jaY3WfejEZr1nVDNs0kDpKrOWKluZSiK+8U5TGuyTQO
         lzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        fh=1L3hUok6K/yP7hd035B5686m5QsyBnA12V+hZKaoooo=;
        b=W8aZVyRA31sB5B3N497WAfxGWxihV8kvF6huJuqiqe/B9TkWi8DOKU8HRVSfktq+Qd
         z11fiWdCv2S9ZBZd4eom4Gh7JTdG1rYSxbWEhvFrRwNeV+QbYcnBjj0x03s9D6zMFvq6
         ZxUvKLj2pgpjey85/99C5p8vhdQpSRzgEEjYap801R/WkD8RyddcyjDCSfW93+H54N9S
         I4+M9LjFZFYdVTgq7BdVpWJPz/VuDDIrCxBZaAKYISbex6sOhlRXoKVTmeuZ39yksJ13
         JrbzAAMJ1m3xtxcfuqgS959Xk7+8WTyOV2AUIohgyHrE4E1ViZWyxwYm8sE5Zhq0yFIW
         Urjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481735; x=1781086535; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=SV0VS4tf3FdUe5U+DPPF77N4VtXQF8ccSvYC6qZegUTlSAtFvQF215ftZzpXNWcYt8
         p1HCaXK7xaXg2lYKhZGXrnylual3x7yyj4KbabHxgRefTHmE6+3/oAD6snQrpMBIjOng
         ierth8X0Jv8Y2+Utn6xI2JKKn+ry4dCzXYbAx9jKddScWAARlGNhU6ycL8BwKqJE5B7L
         5D7bJ7NYZGiY12Ozclizq9uF3rvJil4k7iH3zijpm6XkmXvPhgGDK/mO9DqzGEntGcOD
         gXienBa73K5cwgnZZXFutEd37BkSRrEOZSCrScI6VvWvCmamlqRSJpb3tVrF9hz33ekM
         YkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481735; x=1781086535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
        b=TyIjilFgxZhc2C49/48STg2lQLDLWepT8W/FTewyI4WWwmM92bDt6QH3UNoCizBn9x
         pZQrxexJiyyaG9ysnHCvlSkACe6FWeQNzCN7Y9EC/IyJos9Qb57gsTpKmXwMjcmZtvIn
         oS6XF8Iid3TQEMM/QyAXPpylBUTNTDs1F7v2GWc2MacmVBPbB9RKvLxVYW7A78+EuE6O
         GIlb6XO8SKXC7gERIyKYzbrW82czNAbI6M/8CCdDej19ErH3Xld24nCzszyTlgcy7TVC
         rZsUxFWd3at5bQBmLUS2Wroq0IUXHnIctcB2Q27vaE27iVa5Yv7keHVpENRFGb12VEHg
         x7HA==
X-Forwarded-Encrypted: i=1; AFNElJ+b0vQ8yG7aRJLARzCf58mNxxMC8J63ldLtW/p2c10glvYgHZXhmzp3XXQLtHyj5/WpEhM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqkjhdHx4pm0InbKgDSe6eaknREk/irjJF+SEyROvSn+iC5ifS
	O/atDT2Ysby8DrMNjfQVb3vYye/ji75pz/7UBzDaZqDoDuNPVLXReQr4deVzFHzEvW9InYD9XfR
	18IeQRJEiug2aHDktTE7nkK+Ef7Ni4nGYt3C7FqZqJiC5atDa3mAhzbyGGqvSZdbQ+4YBDZFcc8
	Lo0hRXI7yV3II+9M/AGBWFyCUwyTs5fg==
X-Gm-Gg: Acq92OGf8B92N2dcB/JUiEU2lety0Z4L2wrtCOyOGDNQLR0yiPWUc5AKCkHeH9vMf0r
	8NcPE8qvBTymah1RgLvbDqYAudDOjcHV6NSSzKfqA0NoJBmJjYoQP4kEUcyOe2C7Y1X7DS7U9qn
	6awcH53VuDFIasZpEFvtCpNuW2UjqqDzrDqNLBpFke4drNEpD9WwvdAHoNSGNMiVrnKLhMFB30I
	tdZ5H5wfG2a6wUi
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id 6a1803df08f44-8cecdc03682mr27951666d6.9.1780481734736;
        Wed, 03 Jun 2026 03:15:34 -0700 (PDT)
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id
 6a1803df08f44-8cecdc03682mr27951226d6.9.1780481734358; Wed, 03 Jun 2026
 03:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com> <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:23 +0200
X-Gm-Features: AVHnY4J4K5UzPNs1yW8q3X0LoIQq3c8UfPuD4kHDjf5PzjApCRf1PSF1rlsmtoU
Message-ID: <CAPx+jO9iJBx6Yifap55NOhn5YZk8Bbwpnk+aeH+0PgYuMxke1Q@mail.gmail.com>
Subject: Re: [PATCH 04/23] pmdomain: imx: fix OF node refcount
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX89iz3CbY4ELG
 794enGZfOb8VRFV1tWl1TnMoOvoumb7tkr2XpNcyfWw0HlpKYoXgoMyB2D47Cl9ai6PtmxayXOg
 fm4nn/zUvwKnBKC9IZBqgMYCLeZ9xJxNAN1wmz6BdWpsdsByzoleIs0lDh3CGNeV1NyuSQZkM2w
 Yx6Y2fp1/hjmwgxAQI9EqMooPp3qa8LI35jIJxNL7j/OVkjPn8ekL9a5AJTK6IGhyKK6cdmHQJI
 rCxq5jyE/FeoCtaWRGWiOAmpo9W7uOIGY0sOhzSAIiKnsPY+B+2fsxqSKNxg3dTTlni6y4IEZWq
 nvVLSeZ3uxrzr+ldeNfNb+9IYcc8JzXSdvLgJXypySJpJYqPgJYhQWstw9vPLm6QJvgaDACJ0+y
 33SE67yxW18lUHr9xkyIqZOKL1bNLkaKGucHHVOXRRk5ZxXoUCNv25/dCVIi8gDULdWViVfTQHU
 v7hVB3D0Qmz6Oqi1taw==
X-Proofpoint-GUID: ILGBtDgvp1JD1HxR5wK1QJ7x6PCRHJsX
X-Proofpoint-ORIG-GUID: ILGBtDgvp1JD1HxR5wK1QJ7x6PCRHJsX
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a1ffec7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097

On Thu, May 21, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> for_each_child_of_node_scoped() decrements the reference count of the
> nod after each iteration. Assigning it without incrementing the refcount
> to a dynamically allocated platform device will result in a double put
> in platform_device_release(). Add the missing call to of_node_get().
>
> Cc: stable@vger.kernel.org
> Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each O=
F child loop")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d=
4eb5168942a893c 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D np;
> +                       pd_pdev->dev.of_node =3D of_node_get(np);
>                         pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
>
>                         ret =3D platform_device_add(pd_pdev);
>
> --
> 2.47.3
