Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2076409286
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526372; cv=pass; b=OWiFAx+yx5OmJA6Rgt5KI/IRCsjB7b2cysYbZ+z4KEbFmyCZuYcXI5Vx+FQuYMM2Cg8g2ezisWsCoZCpLu62WRMa2vZlHWQ1idB6DrmLMwnB29toRNJxztYDOuqyHPCWePX3PO7e2gYlDaXiSHrbLT6JzsXdcbgloqbZAwvSa5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526372; c=relaxed/simple;
	bh=HIVEgcuKsvKP9oTptdmuFPNK/sIQQFxDjbmix66hFW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTeWuUempKr9CLG3tAQMB74wuj15eY+y4xUeGg1OepX7lW50QmMClYj3IJ8dD6XXri1oj8fbQJWUXDOoo/esozoJ3GMvVi6b4Hfmv6bbKsVP23vCkW65+tUiN521nO49yr4LNKqlgglqJ+w7hWCqK7PGyZ1AFwkA2iIT/DOVQuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyA045nB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKLCDtuX; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XyA045nB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKLCDtuX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668Er2EJ3100847
	for <imx@lists.linux.dev>; Wed, 8 Jul 2026 15:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=; b=XyA045nBOM5EH5Ke
	LNkFrfA9nQDJlcveGj2IHyeLt/bwfZVepg2Lvu1e8orRvbvsxiIi7z8zdI274WG1
	boey+aCihWfvPW4e5Nw6dcPx4Vj8dz8y3KDI3BfCIOP9AKlfSYhb48poQ21W5n6j
	gzaStDxvYVKkgOiRbEePjq89MlTbXpRjCEYHnTemwLl3whXN7lv60jJO3ClGjege
	h92FRnTFNsKKDVA9IbE/vq1trLW3UwOxTMH+GILaJxgi77uiIykYMQLx+zAiEJ5B
	tp8+/n+37p6V0FGEd4wpGQ5aC+xKz2KHp7F59PUEvOgGcn+nQivIx0OiMkAUKtu7
	8jOAOg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq30a96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 08 Jul 2026 15:59:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso15590516d6.1
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 08:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783526369; cv=none;
        d=google.com; s=arc-20260327;
        b=WWasMXrk/jfjoFHdVDNsMlpmdcZ2gDC+iBBrttvICuNjisv5IYu6D4VcGQ1jvOKxqH
         pjrGtpq+AAu2RgMA7UHqZ5wgjfVkRZtCDQlD9OpUU3KmgplgauyCuVI1V2aAVUDxR5Dr
         5rUEu5TOKbcvVFxpgkgJc5hNd9slvhEb65j9l7SAvnNbv1B5DzPEfEDx56Hu8MJMwegc
         y5ZOau4bbuRZf2ihXEBNnbNLy0jeg1/7myFn5/uWMbu2VjODZqnhwiWMcPNeB0QhH8U0
         tX8xj/rulRjS1Nwek33ajwd5oBF4SOyw73mc4gF1vIqYYGSSWfQFyPxqRjf+VAcuPo/W
         e3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=;
        fh=J6ArTwHowg+AuWG4AhMtvX+SOHX81Krky6DKdfdH62Y=;
        b=N/Mj9SWIx7i6Q8q6O6BmzVI8Et2gSd0N6B7WAMyIznF7Ava9OeEvAw6C6WMuG22AmN
         8ac/ccq/cKlmTwmk+H7kE+LOKJsMZthJr7o2suqqlEmzk6nKjaCBQXkX0d7a/bloz/Ov
         wx9zRrPOwdGls71kUpfCdGQUHmtBuNjyDZtadVmWszt+DqyWrKGlsQBYPe9LOdo42/gk
         6r+uyfby5tLoJxL6iOi9jLlKmXSVGL6VsnULm8LWJr8jprrZ2gkYpxp2JswaTYfst3MF
         RYfiTGJwkI8OfNxXaQH+vW1VSJiPMFoMAMnC8TY9NnfFXw+M4W2nxpyV4EmdTvu5FQCj
         b4nQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783526369; x=1784131169; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=;
        b=cKLCDtuXfrE62tY385vNSa7RPOHRgCW+4O6aGFuVRPXTaOyUslCUFMoaIOhD01kwZl
         Hoeu98TOcZt+aigMRk2/GkKLJ6d8dbbS10b4bhU+rH4yY8WHkJJnvOhjOqtVV7yTbBNZ
         D6fonv9BNglf5o9O13MDQgB9tQqN8cEWSOna9fK/kQ/zdh85z7SyksU14/xDtoAyBw05
         lgzVNndSVVTTkbKc3IbXOdS2OO4KAlS9qK00wSMclef+Ihq7+jUM21Bz3AaRIcQV8eiz
         DZ1DjfkZhjCzbpNEsxvC5hu7lPRo1HLO6xmO5c7wCbWgTFq3lkRXGbhUpw24MP7+9/eQ
         lZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526369; x=1784131169;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6RDR7xs+vqWJV5AWHV0iQasXN7uaTYZIuIDBIYGDn4=;
        b=OJo46rK6RROiR8P9pN3O2mfiRhUcNI9Ica34UZMR7QoZqrVIYrkWIhqLOltzax4XMx
         xOPW4y7gwPtpxTN/2Q3Y70I62oFKIdIRUXPePSIx6yOo82W9K9fJ72nTtNYuiC9HUrnk
         xJHwwfW78DeKqTrwhd5frOLgwx1OjUtZn8zbf+CkJn9R0QqnqH1Yut+SdZX6TAwVy+yu
         PX0vxtwe8/ymlQa70akG3CMxK1qnbK2sJzMM3YFvmo5ZjkGqyvPDTcFzd/Rk7RHetvNY
         N/k++eHGxMcrAiCHudBPmN2/Cc0iM2VaqGtz+vz9SgPFdR6HrKmhd73mdl5ocFNMznCZ
         dbZA==
X-Forwarded-Encrypted: i=1; AHgh+RpxpeEhQXABbjiDG5kmZg8x4vTFDa6GRCbDQV/PzVRRPTNyd87G5nLpSBhwHNmCjDQHAa4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx65rTKb4do/XqMJ5ml1UDi53+TqrsHf8Z2BbKysXfONypz2KVB
	+BM3f8+kedeuj2xVWoMTm/Sl2UgkyeszVj/gMM+JLPza4ERlJatVtC4Rd7QJzpwrfx7I2XvYfSX
	U8N2mEriLuikx7TuPSHSzAq5kiJKD4fvHT3Zq6sOxtuzpA+twNw9BqCPtMgGPjOxHDOt2eqtbYg
	6ne5KsIB3lXH5MeK44+Y+g2m8ydp5Gjw==
X-Gm-Gg: AfdE7cnM94ODnu1TO4HWcJJ8zscrHJmD43UMm6heFttkszc86x7zz8O1WPexrzGKc+p
	guusEW4raNJ5WQGgtzh/3QGi5D2oy8h3gb1WQd5Irx6pHSoiOF8ElrEVtN+pSti6KBWJdCpyvjo
	6UDDyPA1EU862fxZhq+6f1GJd2I/hBwCZj2DugmTpE/pUSUnzop1VHystLDVCMCcTOJjce
X-Received: by 2002:a05:6214:20eb:b0:8f6:9379:ecb with SMTP id 6a1803df08f44-8fd3b9b13b5mr81854996d6.26.1783526368972;
        Wed, 08 Jul 2026 08:59:28 -0700 (PDT)
X-Received: by 2002:a05:6214:20eb:b0:8f6:9379:ecb with SMTP id
 6a1803df08f44-8fd3b9b13b5mr81854656d6.26.1783526368570; Wed, 08 Jul 2026
 08:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609-pm_imx93-v1-0-d06c004b0f51@oss.nxp.com>
In-Reply-To: <20260609-pm_imx93-v1-0-d06c004b0f51@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:59:17 +0200
X-Gm-Features: AVVi8CeC7wqwD-02BFpq0hOApFiP2f8o6VkvQcjct29H4Ae_roSruiCfTUPVGNA
Message-ID: <CAPx+jO-BkzRPcuxkC4rCwGvXg8io_yD0Cx7zrwC6Sw6t5ff3SQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pmdomain: imx93: Fix shared MIPI PHY resource management
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: sd1K36oLzr5TjVPrAeTN8pbfEJwVozox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX/qxJjeNiYaN2
 9GrsCvDpCLCK7f0MXLoFtiIUDhN1rfZdka2CxJvRjlIekeJbn+aIzxm/LGoIbHGResqcWke1uMN
 YcbSUEDPScbhsMSTibDoGHHQNC29x66eAXNFQOlqbBZOn6BUsYlIeCuOb76QJVUlKwhpibpJGh0
 DxKuQErT0z/8iaEChpNUQFsGmmI3HiDa0r1Sg/ITDkEGSYZj0TdSUvgj1Exfy0a/tOsoZiKfNuD
 SfCPhIk4RcCTGJ8rklsTu7afnaKpXvbbg12JenUXEhsFnr8z0POtF2d3cXhpbu67RxOpu2LJxyz
 4/we89z0vOrtJDyOTbKWSXfUIaofigsZyAZb9YdtLZfDSAnjnhkW1nUhKRp9HCr7elZFc3lSg9U
 8vQWT/CnOXWr3i0cpoXiWYGPD/zGDZQcaLEd6yvEBYgm7456dTTv2QLXIAbNjsKeDqsg7ZOYBTA
 eRUaYHbx2sIrRvDFq/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX7jkqYje0QH9Q
 hgFSd240Obng1vQkUKpv/4E86fC+ekhSUcr3aRfM16+1Ui4VoU0Bi3o4pjaKfM9aSM7J5xtRe6h
 a7sr0voGDIhNeypmByYV1Blnm9QYR5s=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4e73e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8 a=v9JiyUteCMCEH8Pa4FgA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: sd1K36oLzr5TjVPrAeTN8pbfEJwVozox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080157

On Tue, Jun 9, 2026 at 8:24=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.com=
> wrote:
>
> The i.MX93 MIPI DSI and CSI domains share control bits for clock and
> reset in the media block controller. This creates a resource conflict
> where one domain can inadvertently disable shared resources while the
> other domain is still active, leading to system instability.
>
> This series fixes the issue by introducing a dedicated MIPI PHY power
> domain that owns the shared clock and reset control bits. The DSI and
> CSI domains are then made subdomains of this PHY domain, ensuring proper
> reference counting and preventing premature resource shutdown.
>
> Tested on i.MX93 EVK with concurrent DSI and CSI operations.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Both patches applied for fixes and by adding fixes/stable tag to
patch1 as well, thanks!

Kind regards
Uffe


> ---
> Guoniu Zhou (2):
>       dt-bindings: power: imx93: Add MIPI PHY power domain
>       pmdomain: imx93-blk-ctrl: Extract PHY as shared domain for DSI/CSI
>
>  drivers/pmdomain/imx/imx93-blk-ctrl.c       | 60 +++++++++++++++++++++++=
+++++-
>  include/dt-bindings/power/fsl,imx93-power.h |  1 +
>  2 files changed, 59 insertions(+), 2 deletions(-)
> ---
> base-commit: 3b7a18a34e8d3b14c7c926f033488a0350de9759
> change-id: 20260608-pm_imx93-6ccc1aa11932
>
> Best regards,
> --
> Guoniu Zhou <guoniu.zhou@oss.nxp.com>
>
