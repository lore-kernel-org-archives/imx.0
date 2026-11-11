Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794398648;
	b=4BKZc1ycBd/xYEmsVQrgUMwvGII3BG1LP/FCCLwzcdzVkucEG1iyhcvUCfS2LWUPl/l1
	 vKRyXxD1mubY3qN/YvF/iJQfeAGWDOQmWfyauR+gxiyB8ABUONTt91QPPEulW/ueCzomu
	 SVUWOaE9n94m0beTmNa50HZwBE960SfnWVCvy3lkIxvbFE6QlQlow24drcuWhqo5+zkVC
	 p0utn3Ni7a+dMx2SkZQxNDlR3u39qmE29ySCFuG/SU/ThwWZ4coAxIqW1sbdYhbqA0+4y
	 gahp3N8wWYmrDOdPBmleGtAnxsQeceoh2y6of3pc4picTn6TH3wtxKnbF4wLOjAlZQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
	b=pQklSIvJsUM5F2oFpVLa7GLwGZjDBbUwKhSzgaGcKhYDbiNah2udNb3t4DiBuW3rIueJ
	 CA+I3AwfBa111K/C/9YTRY8INT8Tj3ka1Nok+eAFy3XUg63GysENH+g91krmDVucl7lcy
	 sg+fzlTiEA1ylgb/JbPOU1eHN5pZvI1oBBPpe6fR1Df1fzu4hM0CW/0moXgVTNOR3RHR/
	 2Ri78004YaffP2dBWKcLIai/eoehV7WbVFuTa6NVwb3kiueezv705GKiG/O1V4xQK1oiA
	 tQOH53XeFCM4jXbshZRUs4grHTfTFbr+7L/EMhMHr+WIuRrlvR8WgKBpFeahgCjC9sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/CvY2lH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tq+5ykAt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78A4606A32D
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 12:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A78A4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/CvY2lH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tq+5ykAt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6Z9up580972
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 12:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=; b=X/CvY2lHnrvPCeei
	JRPs/8T6Bk5CJZOtU0EfTBYOS2lQmbTIVqOzkcqcqrNmsyZBuVmgUrDGritvAb+C
	xnmv36+J8fK4+sEoG4q97VH7WaUXP4gs0TuJR44UFCW3eooQDoDDZ6zRCV3bquGd
	U+j8qiiDNbWf2e5TzRLwxYgxASRCi6I3STt7ZMcMvGTZeBdEgVk19dnU/aUdTHeR
	kE1WWk/0UMYpIUG31V57uBShQCZcZjFbJZX1oWPV7v9xdi37mIZ1IO/2PDkjQT7m
	XEpXLPS+lfJYdvABe0yY8KfH6E7qcKT8lOp6JwJd+Hopj96CS01nt5iHdzKTNO3u
	3N30ig==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7ps5m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 12:04:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so2877369b3a.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 04:04:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794398646; cv=none;
        d=google.com; s=arc-20260327;
        b=jSOaf6w59JmQZLZbi3trO6RlU8gw+i0hJxke5C4IPnWchX9QqNI44h4GMdzcSweb7I
         O2Rvg+JT5f1wbzVAZchBpeFh3O4a3p/fgAXCkWdoagmA/vI2Cdx0DNBLXHZAspW6+iuQ
         EakKgF50GtJdI41yqCDRBdHTH1wkCvlI/RzuCN0eRxo8e1bWnI5x1OiUcS9dIbyjducP
         202W5X0+5DE5YKxduzr8H8aKvyohkZU28lc90Lt7qCu0kh7h7DpJ2jx/j+tFCge+pNvx
         UV1MXUsgDIOtk4GggvQt9aWpFyJ0Mc1eL1VAaMRzcjv5Zb2xJFtn3h21qFXNA51MEMTy
         yinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
        fh=4U0f0gKNEDzhYcTskQAS3WMuCFCqaDypycUzw7nNL00=;
        b=qEjLlpVCvZjG4Jqwd1hst2O3p1tUokRIWyK4WslFpTIgh1pRbssxlybv9pDsEl03ka
         VpZj010Nb+ZHdJuNhRLgnt6NSirn6VqBGy8ePX8WBhV4K2aTSV6lRwTwCk0UKYC4+K3Z
         tk9o62bCP9IEzLFre1OMf7AUbo0m48fzWU7etQKniwYIXVvTrNayU5ZkaOdjaORxUe7i
         i4fQk6nRCqd2mEQGiK+4t2ogehQn54xBZYu/R8EEbaLLGh3GbRqgeGBOV6tYBBrFmzbk
         2eF2VSXgaZqKqhzksp4iSdfmHkMpbO5sqIvWU/bX79sQYk+RdYPjej45P7PoicgyZ6/d
         tO8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794398646; x=1795003446; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
        b=Tq+5ykAtDFHmGcy5i8ZD+EaOi8Aq029MXtxRNyzG2jnj/OlmPhFMkE5PBb1h2/cmYf
         dYKuPnnyYsj2cIlKrQC0ZeyMy4VkMcVT3EV9NYY9cbp3zeFuOooOFIMOa3hlpDISIATC
         XpB8eac/ecmIqadN8T2fRNbAJ9ArBbaQ1TQJNRe/gu6tcEFAlr49hr12rfQxTLkCcYPW
         mLKumFyLvkFMDxe4IT+GUPgE0A2sl00yIGC/bqH1ebWyOheUnBv2qemzb/U1LlwY3T4H
         B3tuRhXIAsF+H1d0Pm7U0Qm1iUWgWTzDKitC4FSu847zWw29w/7uPUksNGT1c11XrTFo
         J+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398646; x=1795003446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97BeSVJCOsNBXayFIkPJjAeGpvW7WX8qTH2D2rdWJwE=;
        b=ih9vs1kcIkvClaKpkITEs35dmkvKs31TG49iVYglQzv6TUZotAfOLK0KVWskzlBZGZ
         9uoF5VPZ5ajZthrPuaMaTI041IhYyL7tkjvboFl0JsvbcoJj8Rer8nLqgGh9gmprxp//
         KvBBFrxHyY3rzs1e/KH/1hIk1im3DW2N7kCva+aEiufhJVyzqfake5jtRlifOIwLW80N
         zX456s1iiCHymT9D9oF7HUWtmJbxnbQ4Sv8PSvBtIB8kvH9LO7bL61lXlxTX38nfGlzF
         BnC0LNmn3TbbZ9r+PUPAFZC5BdrbfKuhPVorQcIlIiJOXfMuVST1/rS+dSJqAynFPvaQ
         Q9kg==
X-Forwarded-Encrypted: i=1; AL+hErEnk1n2Ss6c//oSIhg6NZBgB6NQkvl32vBEgM15cYHs56XMHz9LMaY3c+K6y+X/fnNh8yk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9daTn3JZQfqZd3SJ2zp9gfDnm27fvoFfnPkWlyhUomEyGua7z4
	hHSz5Fr+JfSVjndb0cVWBhHze/iLHI4/0vpryhPSm27dpQGqv4Vqnm9aISSYhdP1DwRbviq216c
	id3alMAJghN2SgivE8ImUla5H2cVeg7dVa0mm6bcMaqKv73h+EgLpYEt3MNGlcVdYzTyuYeNRWM
	jFtxpZQzf//Gn3F8a0kwlpuiEGXoWXaw==
X-Gm-Gg: AYBFou1kJrI5BIoZ8l2dFBPaIW0e/FsQwYhprqKPiKzIdn+PjHAX+Nk5yJ9UdvJP/7b
	9HOKsyx4FL+UePUqpgToPESJ4/4Yy9up10Qzye8XtT2CQcREATmHwdLgg4xQ7s9EvhPlSgHJqEs
	Ub9bXHl9l/RCpkoJQXfhyGygzdZiNIH1oMk0oH7qppXpAFFFIszKp0ck1iwg==
X-Received: by 2002:a05:6a00:18a1:b0:874:706d:962a with SMTP id d2e1a72fcca58-8bc1cc6842bmr2465037b3a.28.1794398646215;
        Wed, 11 Nov 2026 04:04:06 -0800 (PST)
X-Received: by 2002:a05:6a00:18a1:b0:874:706d:962a with SMTP id
 d2e1a72fcca58-8bc1cc6842bmr2464996b3a.28.1794398645717; Wed, 11 Nov 2026
 04:04:05 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <avNHazNbGtMQJ5pV@sirena.org.uk> <20261110170253.2694265-1-sashal@kernel.org>
In-Reply-To: <20261110170253.2694265-1-sashal@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 13:03:54 +0100
X-Gm-Features: AclHuK-TQiAr8PSNCnxTwZnldPhQ9Cil9VcJUdagL6jktT0AFdXWIAAJvTIePqU
Message-ID: <CAPx+jO_hPY0wZHwE2QdryzgOOAPH-2C0KXZTpt=cT3Aca5d6ig@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pmdomain-fixes tree
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>,
        Guangshuo Li <lgs201920130244@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfXyYiv7N7McKlM
 z0h+Qq2+5HGolgCh+nakd3NTusvsiBMtygFEpShDpO7xus8r6OA5p60IS9WI27OEkZqYFTQePYT
 YgZTME3lUlBcwTBECpaCpivPav7lRII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfX5wfdEcBHBmZk
 6KDUKBGDWnE0DeqpNZboQYu5F3QmoXGBUgQHaA6UxCDVOa6UxNsi0DM7HAz/lBtWgPeUWIcQsUQ
 uu4bAyT+DJ7ZEl7HbGVVImVK29nJlOtVwPDRy6cXutPpbQS0w7AJ4PB/99HBSmN+PVX47Yy17s1
 GCw+c5eLb++EBeZQ9Hki7UimFBHCHuDD5F3ijPr8E++8A8zmGgQNGcLZwIXQpCGTDhxLwMveQiw
 0O4jE8ufHiAmZfq7pyCwYC/4X5CLpgi61WEc2pZYfDo+kGIRnoz1zDgPOuws461NE2vd2F6p0n+
 Qb2GDoVP6/BLatTzQ4jcmNKYuvBX27HsXpb/VnKHdx9MRVVdgWxtR3D8W/1AYPMoPKPmZRlPQWx
 t4crJrKXE1H5LqDtfg67wv7gsTTIUmg0G9N5PpLFZqIXblc8ncm5sCgNYfabcubGSLQEh163m+R
 auNsXWPEeZstRTn1gVg==
X-Proofpoint-GUID: cix2oJroe3XshVcPbtZkUtQSkfAMDKaa
X-Proofpoint-ORIG-GUID: cix2oJroe3XshVcPbtZkUtQSkfAMDKaa
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af459b6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=FacbNd98rA_P5PhHUj8A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110047

On Tue, Nov 10, 2026 at 6:02=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Tue, Nov 10, 2026 at 04:33:47PM +0000, Mark Brown wrote:
> >AFAICT this is caused by commit
> >
> >   d7262971a2acc (pmdomain: imx: gpc: remove all initialized power domai=
ns)
> >
> >though I don't really see how.  I have used the tree from next-20261109
> >instead.
>
> The while loop that commit adds to imx_gpc_remove() is never closed, so
> the function is still open at the end of the file:
>
>                 while (num_domains--) {
>                         ret =3D pm_genpd_remove(&imx_gpc_domains[num_doma=
ins].base);
>                         if (ret) {
>                                 ...
>                                 return;
>                         }
>
>                 if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
>                         imx_pgc_put_clocks(&imx_gpc_domains[num_domains])=
;
>         }
>
> The patch was posted that way [1]. gpc.c is only built with
> HAVE_IMX_GPC, which only SOC_IMX6 on 32-bit ARM selects, so x86 and
> arm64 builds do not see it.
>
> With the brace added, gpc.o builds with imx_v6_v7_defconfig:
>
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -536,8 +536,9 @@
>                                 return;
>                         }
>
> -               if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> -                       imx_pgc_put_clocks(&imx_gpc_domains[num_domains])=
;
> +                       if (num_domains =3D=3D GPC_PGC_DOMAIN_PU)
> +                               imx_pgc_put_clocks(&imx_gpc_domains[num_d=
omains]);
> +               }
>         }
>
>         of_node_put(pgc_node);
>
> [1] https://lore.kernel.org/all/20260924142520.1594149-1-lgs201920130244@=
gmail.com/
>
> --
> Thanks,
> Sasha

Thanks, I amended the change like that and rebased my branch.

Kind regards
Uffe
