Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04036448B9F
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905630; cv=pass; b=cYTkSug/u8rbSM3RDluH7NwNYKnvAXNWt0UR2nVsLVEYeDDDH7kGcWehp2fse4M7RiZveb9TQzV0PCfv9+I8u6HvAQoGDPnfM4ZwGfAx8X+I7Ly04sTtdByz/IyATQRZf6qdtZVeGMG92Ig/Z8PhndlxO8Eaj87QjNpp0FsMZgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905630; c=relaxed/simple;
	bh=TqF3wLHIA1jAdZt0Tltgjjcw3xRF7uJIwJwkCK9UGR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukyGgysfvxpJP2hdQDR8BqwpS6cb8uFtgNirkhZjpQrP1eqL7hUUDFDDytu69qy0ohH8VM5tvie/Vh1r3rsrvzTPgg3sU6p64w5BhUEVPc25KucSl3Bs8V+oPc9wFFOR31HReXV8wnjdQUqLSLT1sG5SSwt2tBcaGtfuNrlxx1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMNYH8YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMFf3aBJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMNYH8YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMFf3aBJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbAFi151524
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=; b=CMNYH8YKsP0vLnKa
	kg5kejSOcOGDDykg6w4NaAMhIZjMwg5Hvpg2qVVAeGFA6SXIkFXHAI/V9jYZZTSy
	RttEgtp4bwm6aE9p1KGLNE0/MB+O/oivlVfzYqqXeDZ/TYz39Fv1fPEUWjQMmKmB
	ZOhZL4fM89UgzYGiONz5xZQQ8LEp9cpVqsU7E9WNOiG8/iFseatouKgfxZnlVqh6
	rWFhOjCyVDJkJyyzui4Pk9uGykx+T9GFLHJOTV+t4bciz5za3v7JZndxoHiqDk4w
	c6pEZ4xZYfHEQPLIJ2zTQeesRUAuDTSkH8JP6vyj4qfAeEMOO27lPxff5lNMPRVs
	QuKvrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck8gn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 15:07:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e8004d60eso84893585a.1
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905624; cv=none;
        d=google.com; s=arc-20260327;
        b=e18aUbu8XvAc0HdGHdVSE0JCV+qAEI/h0hIuGsSWVrP+p34sYQJ4YQvmkutXSkFvTe
         /IIDccbg6fVuVy3U4t3Q9olCqbwtfYCd9Imbp/vZfX6TrAoJufSDKCkJ1rY3uQHn/MX9
         +Aj5sJoOpDXrVpSab09XrOe/Rvp2XiXiaBTeD7ySCGCuuXbchyIbToRqF2FjnIgWA3HH
         vAZXsY/gLwqdmVYhjgic4L1WIkPevX3eRb2GdjjNM0N094XnnST8QUa5JTHj9j+YSt14
         3pVFuX41a9Psqqs8eZGYgpXj37nuwl04SbsXZGKBhjWzSCu8FtUE5FSRqMErH7LYaAHE
         f05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        fh=9a8/oh9YCTmQAprhqPljAGhoaGIBGkxJ6aUYlmaDlD0=;
        b=IS2H8sizru9/cxIowGKmG+giiTyeujwmMvrhwJ80TbmHiEQsgpERof48sQFEDwzjyY
         stGeaF/ZEQW433NPL1IJHParwslisA5O1NLQGK+5VhKHSsGKFUlLgzviQU4S47gymLu0
         7t/OoVxoHtZTKk+lgjESAQSo6hHkdNnAZuF/mhJaPdOviQf173o+YL4AGIrIeReQhAo8
         /lGCpabHwNKmXXe2Jju/Lad1HCy5okX3SQ5oXJ/TopgBgnVDkmI4V/mnpV9LDeIOze/n
         vDuUxyNvZFPr2wUOidOgjShUumRqOP1mw+Uhdmtby4oyPlSmCmLHIvGI9K7F+Nn/Rgl7
         mM2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905624; x=1785510424; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=DMFf3aBJXWZmEyyf3ZJpCzufZt2FEkCHIKwbIGE7H5jDnCfdk09N4s2P+DprWR5tqj
         Oc1pSb5MRbgVUGaSGgoxE2x3CFhqlc42CTypFDiC9IPeNrvYLKcorUyLXcvWgwZP9bzr
         ekZ8kGkkLzyZJrmblrvh/8id6VmFn33C0QKPZFGy67+u4hg1sx/RrphBW2TOO3M8q7cz
         CE42U8Y5y7RetRWXSiW3WMgqaq8QJ4Rw8yp2hElK0kqOS4IzHbR40v/fO3bWe3Wshzk5
         K31V49tVxjjKRg9l1x+6IzToM/QSLXFUeuC360eA9VAI4dyoZUCAIxni3SBO/f8EU9Qt
         3Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905624; x=1785510424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=kHFV7JUZeqr2/BFd9JgaWSEd1/7OlYqF1lRdQriM9QC4oRALcm8Pkl7v/mvcohSvwA
         MIagOHi9QmWGgX4lC8tGFLm1L8H0p/6Z9K+sa7x8AJQ5ZQsvoSEoyfZXaNPlbO5CPIPM
         1j/sjZujPvEpYyQtzmJdutN4gxas4YX3DsOr3BQGQdqtrgy0EaeeRP6FL3309MNtItXm
         Pmw1WBoMLM7ChIFF9PL5/Ftf89pVX76agxZOh7JGnqYESHt8IlVqQlHDN0fEtSgxdMpC
         mk48bm530+8Ti6YP5ODwyBjdtrsUeJKqrR5dAYUOyO0jythYdUnkT4xTn3PTeZ5YizZc
         BIOg==
X-Forwarded-Encrypted: i=1; AHgh+Rovz3jjCsRIXNqaOSmoP5NVm0UPzvecwYcPox/31UaWaw5/8NEUh9mQ+GhRwDy0mneOuIc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+PEnAEbkviudDbuJzbEnzhBm7MHCYC3xZjzJFzJjuwLIun0p8
	SdB9Q0/O4tCnQirLoaQE2qHwJasrH2HQseHmau20hGNQ7iiNwtMTOYOAA7NxZNyIFPyR6vOaB7C
	kj6iA9Sx8+3M3168KhFOS2QZ3jBFRM7fuCyJB5n8NDRxoI6UywDSHMKEtBaCO6Ud+NRnebC9h73
	KvZqvEd3OI7KfSWLE5hiKDF6GBOqFx4g==
X-Gm-Gg: AR+sD13hLXvD4ekUb6u1/xZ39tR9Z0t8sKhvSayvp/algREuOnKrS2lArBOp2xva4ir
	Z780Hl0e1eFHolc5OFMiA6tIFlEFkXV19kYZUULpruseFCdPs4uA3+c6q5IxPLoPRHO5tRPWpth
	1MQZq9B7DTlZbc4I8sLikiWyle7CrM1BhizKb6pmnXPurkUhaVPOeweifyIg==
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id af79cd13be357-93103a65117mr772235585a.92.1784905623950;
        Fri, 24 Jul 2026 08:07:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id
 af79cd13be357-93103a65117mr772229085a.92.1784905623517; Fri, 24 Jul 2026
 08:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:06:51 +0200
X-Gm-Features: AUfX_mxUpEE-_djVPIMU7ZvWbbzhCFmItK3_9wrfK5-RcRFUSwGHiGhMmnFjL0c
Message-ID: <CAPx+jO9=HWwr4jGoCcWAM6fKTTrg3TphgPiNX+4yvfnyEZa_pg@mail.gmail.com>
Subject: Re: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org,
        driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, netdev@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX3+ltqq4Fcjx1
 JHFNxlSaHzClE9Rn16iSsYsT9PQNeZ+1QVT76C/imKS1DtLzH5ZTRRztK5l55frzjsFeNPxrnoH
 vzP/87b6cQx7TSXJ/o3ZrpKgsBg/HxcrzHPNl4FfQWGNUxR0NjuroM8fzO3esNVQGf8ejZCe1zF
 z0iz0Sgs3Z748lMvHjTwraWUAMeIZ3W5cjCTcU1wGyRRVlV4dI2TvTLHQU/80nluWxcJZPPqWDh
 HdlfHkVCYNT5TCr8IylQhFv2aMs+f8eUn4/rhd07GMdxtT74qRhr2nGZ0kYxROwuWWsDTYs8Dkm
 Tt/HemD3ewyi/EAcfowuJtcYisKD6lG6vCWo5BMFlqFE0B4KOkYHReu6yXR/hz1rGugYVcbEJg9
 Fzeh3egWR3YfGfs5So0189RWH1HkeU+oy3gLl1h3od9j6RRdV3CzunBHSiiqNjX8709AeMR1fFt
 N1g/W6FHd7OBHP4c3TQ==
X-Proofpoint-GUID: 98qpGN8Tfmap-n6vEGJsClfqfGx5DuCX
X-Proofpoint-ORIG-GUID: 98qpGN8Tfmap-n6vEGJsClfqfGx5DuCX
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a637f98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX/fMlkQVTuPCC
 ar3nZxt6T3i40KP8TndfwgIs0bolk3JIvaRhzGAlQUoQ7SexFRF79hcsHRcddO9YLnm23YStN70
 qfUU/nPikAh5JlBmPvFMYsw1gOgZNcU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240136

On Mon, Jul 20, 2026 at 11:25=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a226fbae4213926e1395c413160c950..c147eaf048ba2b79a744ec870=
29420981581e48e 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       platform_device_set_of_node(pd_pdev, np);
> +                       platform_device_set_fwnode(pd_pdev, of_fwnode_han=
dle(np));
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
