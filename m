Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89EB3CFF7E
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215692; cv=pass; b=oVFnpgFgO3apeHEnA8sl8slHACtfegmR7CTE80vKZdmtscPKAVIyQ0WGg2k0iMTHzc3tm+G41MyrLL7RTnfIKb0mQ8ot36mChlSDnH9GHEu3+iv2nK9xMkLVPaSz71i21jiv6+y2IwTqYWypuezd8Gcr8loqpuDIxVaE3SX/HII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215692; c=relaxed/simple;
	bh=RRpkkLa0W2etFg/RhsIv5UIlJlesmVn4cGN+MF0OYls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCDZK1D9LkBV0IdiemUg7R6EbhFz5QugndEPjbvbJoBRFGtsiesMMlY3+tBKH4eE9O5Bd+qxLYHhCJF4+7DbjTq47q5zMBh5797zBBCeR9ZAofPS2UOmHyvjukwgy839WllaFKrr3Ui/wD1kkSql5JbtrZ/r/VDvkyXgroJqdvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vvc/uqFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STE7dfj7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vvc/uqFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STE7dfj7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZCGd031267
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 11:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=; b=Vvc/uqFUHWTIaaHw
	CgykLxh+JHbckuAbxr8LVfoxnnIpUyBQj287laGknSqX7pOZSSLpGsPrSAYWRcS+
	k+H+i40QkYoQxdBykEvh5BrF6HyKN3Td1orFAy1o2bYjnSuwYjOwvcRofmktQE5k
	hMqVRmd0wJAgUGR1+zMxIcflbZlA5seD39z7St0Kbrike7NxXRQOmlwaK0X5nhTm
	yPe5OSX6oy6SXOyRLgdjXnZbsO/scPyawcLxVz2PGhOunTtpvEwhL1Bb0WBJqd73
	yNUIKOr3FoCTo2VwA5NNDjw4wW28XoaBUS9X7FrTqyhPI+MtMGKYDfZEQkulIne0
	+DOtnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe68mm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 11:54:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157f453a27so862003785a.1
        for <imx@lists.linux.dev>; Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782215689; cv=none;
        d=google.com; s=arc-20240605;
        b=WzoYIbw21l7/fJJeXDHmvfRgYhQLVmkHvsL/hSAU1Lb+9AldszRjsbMF6sOMl1EVzk
         UUWxC/4Lu7ieLoHcTkGSSt/qGRPabJt5Acmtih0+xvtDcC11uSDg3fwyZutT3nop0GNq
         b7n/PafXhnE35+W5MZBbrfrHWxOM0X9mtz7NNqlZu5ra5WYpqAEQnAlEtjNi615RuziG
         5MM3ucp6YPI7oYSRBmmBRSEk1J5Fead3mNhvx0+wLDPIJseCr8piEBTNH8I5OIZrEbEH
         snCDUNVesYcYx01KfG6Tu4oIlDEAK0mw53pOHNw9pnP48pLLr4l/tk4QeIc8AT4NSHTf
         ms0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        fh=058wil4J0agxFPmdsi7AVMOe26JkmUqWnGkSlHtRp78=;
        b=lEBwQIMlXqTKtj6X+hc69njVpi31raG6+m5OZqDWEzsopBRb/7kTXhXaUPixmmRebt
         YChUjHUk4UnZ6OuZm25oY7rqhZcpOVvvfhHtN5KWEf8C0g4Srx6rbXmumqlK9TYV2oro
         5Pz6KPUu6KjxjCxILqAbPDCgqYQwSfgpzwPMTPRbSZLuG7Rgw9diJ1CzK6p9jGN9+Z6V
         qk9ZTHZHXl/l75LFvLudo1cRnGwP7+0ieim9O/c2iePhsJtuQX4+G1O+oxqxZ/8HcLme
         B2DSOea6dZOaUgLmXbrUNSNJJNfeptZpfSvnKyn5Ku7akUYRk51z8jGbmPdEOaIRZcMb
         34RQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215689; x=1782820489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=STE7dfj7+YReynp6vSg8ZCjtdNly68LVbY7pkMvK2RVo7ty23SEu9WxQ3unsvNlO4x
         6KgPbZp433D/T/vwwgwzdO6GCbRCPS+6m5B73Wau906gRSwADoMZRM+w+fcGCUKrTrcd
         MTjYsJXRAi2IQKAcBs75Q7XFQmiV9Uuc47zDmYnSkh916l3KJnU4QswJxzd0q5zur3zN
         8ThABBczkXtN+2/KS82xEY/Q8wZoeDk3P5cmKYxMvqN5gwLaWijQpBTQGiHUAz6gxVac
         EzNkgZn+O3UzEhTnz8lfTnYDCSuGZghIcPefP3TFb9ek5f5XK57O2vFcgjAbegH8Zk7p
         3REQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215689; x=1782820489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=XceGn1In9hBHW4RbomlxPdiilF/Gd07MyyMtsc73hY58lKeMlHmKszSF6eycVxt4cr
         H/vYZ9szoJgbRw6kFnLdS8kkktoE4Gkvq23WcMJBilAANJZVnWS863Vxhw539ffS/w1E
         HUe1UJFXrj3t5Ug3hqlJ8zylxQbJKYDf5aqOa0QMz9ky+L96PWv0Lvn+/TiwKMFHltjc
         1qE57agr7qMI3jrgcBnMXX50RgEuJbgIsdTnoj2CSExdmWJ/wfZ1EanSpNprPvKFaVAm
         0CSz+Th18qDWfo4znAUv+Mlu/nLfSp2UAPdGdjPZtoyNg2WbY4CEmY4q73CBV+eyXJjf
         alBA==
X-Forwarded-Encrypted: i=1; AFNElJ95ckPXA8MKeB38QRN/8uFLJw7wSD9wgInSD9pxA+8jzB3J8XS05icK6Bsq+EO/6pvPuew=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeC2shEQur32j0qZCRvi2dZnpcQH+MLva4BameLmYGFD0fQAHG
	0HeUjMVdmRvl8QXTrT+nW4PGxefp/4RCz6EfleSlAxdRmlGxAXiMKhiWs+BWO7HoVAT2XY9qZG7
	LddA5MhhOdUzUneakZu/VftmAbsRqD+1alrwXvKT82PU2sLsMEjaLOaF8qLtk+TljXcnghK70Jg
	YVV4uVPgbMSZgwTQS5kJmnlvnmTjhlqQ==
X-Gm-Gg: AfdE7ckvDdT+SM2H8fsZrTnpugRMBSS0/mg4hOXhZz0EAmJtStkA8Hv9GhCXGdHvWRR
	g+Z+NNFIkIgUvVx3qIv+op4E+Dm9AI2yIq0wjMDjjhkqUpdTFrRkVBoSeCr0hMzCxFrnl4v9NWf
	BG1g0tOFRkJhXrIz+U5dSQH8PNB3OAtWqjhl//elk5zixO15Ac6rINSTEu5lOFJbUOc3KkTfxvW
	V2XWhcKD/Kv6QEdLGnIGxNOvHZZ9T8ir5R3WZsPJpdnyKNB1jx6g+apOqnPTHY5Pf5mguXTdCnd
	Qy9aW/wmeBI=
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id af79cd13be357-9264771b2a0mr434706285a.30.1782215689072;
        Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id
 af79cd13be357-9264771b2a0mr434702185a.30.1782215688526; Tue, 23 Jun 2026
 04:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com> <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:54:37 +0200
X-Gm-Features: AVVi8Cdel5T7fniqHB4_fyyFIVPTxPRe8hWJeBKySDY3t80yH0us_4QRaPBT6xo
Message-ID: <CAFEp6-1vaeC9oDKuPAdPNtmGSsewbHRFS9RcPMzzzWHjnXQA-w@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped()
 to simpifly code
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: tn6E9bynLnLyDtej3f0FPKkSeN46VZo-
X-Proofpoint-ORIG-GUID: tn6E9bynLnLyDtej3f0FPKkSeN46VZo-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX9kJrq2YoIUU2
 N11Tw7bt/n1kvfxPkTdMjzURGUcQCUsiMgN+Cou4WbVXGvmHJ37yHUm5RI4nA7ikLPyePfEgRNw
 gzfoq6DFMPitthjuQ6qdbbIjwcZ5+hM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfXwAGf6kertqaY
 frNcwWNAC+xkoM52AwsSJDxVXzrZAHwg6aFnAhuekt1WIazfD5X8OR/WMsgcUJAL2UgWi234xJ+
 wlTWVjSor8P3bhZFEdGQnTkF4iIgv8RSH3IKxYDFO0Mwk0g1FhX3q+/gZu/+wM2uZMet78Kd/5b
 yBS4ERBZcqkM8SKX0cM2R7eH5qRneIIDjKL2XQyFZQhORuw+Qu7ZngwkVDhbiv2dsEvnQ/RPdsM
 VeZy6OhUNf5nEfkB2j/i6LYCADDAS+tdT7ZMGkOw2h3gJoUNbDteVad+MiPR6QsRNqJWwCRh+e6
 +hn0KhjfnzNLdtvTJkINw0keAWF/jcaEQRmrpysOX6VguMNyT/AYm2FA6uad3Y96v914TNkxpke
 xDfcSv6IYkOdhH7BylB5E1d7g5dvjt2jH3oNzJZS2qrb8jvXJH65Z6WEu/e+fnWygosRpNOhM/w
 y/eGyQuUqaBuuCoICfQ==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a7409 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=9UnFPMSZPvWmRCPcKGwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230097

On Mon, Jun 22, 2026 at 4:31=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Use fwnode_graph_for_each_endpoint_scoped() to simpifly code.
>
> No functional changes.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct devic=
e *dev,
>  static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
> -       struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>         int ret;
>
> -       fwnode_graph_for_each_endpoint(fwnode, ep) {
> +       fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
>                 csd =3D v4l2_async_nf_add_fwnode_remote(&camss->notifier,=
 ep,
>                                                       typeof(*csd));
> -               if (IS_ERR(csd)) {
> -                       ret =3D PTR_ERR(csd);
> -                       goto err_cleanup;
> -               }
> +               if (IS_ERR(csd))
> +                       return PTR_ERR(csd);
>
>                 ret =3D camss_parse_endpoint_node(dev, ep, csd);
>                 if (ret < 0)
> -                       goto err_cleanup;
> +                       return ret;
>         }
>
>         return 0;
> -
> -err_cleanup:
> -       fwnode_handle_put(ep);
> -
> -       return ret;
>  }
>
>  /*
>
> --
> 2.43.0
>
