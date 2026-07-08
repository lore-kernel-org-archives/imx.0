Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D4D439356
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526404; cv=pass; b=mH5xeMUJ+pN3P+gh8e+05kpObMzuxzhqYjV7EGBU2iDMaj8W15hTGJdiNeGH8ZQ+2R+2AX5ZfDne/vWeJaJmLJzhXhN8I++Romrkmznk/M1z66+TXmChclNKC2slgNRVRjMvZ+PV0LI3yxtA4tXBMTzFhhPXjC1zBiRV3SaSKj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526404; c=relaxed/simple;
	bh=S20u3kEIoDTzgKRFIDn8D1YCZgVa4uT1ltEDRmJ5pQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ct2s6qQWiNUXhy9dGXSRVrL8xJDa4I6/0CxLDgio8wHId8RHqSDN/HCG+K9bOaXDRluNs58sFAq0wUkvNYi6BRHO8Mzv2UnGC9NJac8pP2rKfKSpClfgHkUkFFsw0Lj4/QlCLy8L5cBVJLgT0W+g7vHZWiiOgaq6kMqfpBsVRgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joLcvzan; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0Gcw2Yf; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joLcvzan";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0Gcw2Yf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3NYu2608062
	for <imx@lists.linux.dev>; Wed, 8 Jul 2026 16:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXMZY/w5WVF0nRMX+GxiSjwNGLzZb02w3JE1D3SfZP4=; b=joLcvzannCuf3Ryg
	V2K/EMBuiTgNwVujenQonsGEky+ayxJmShjkbJJt+EoBPez1XnLbujmHhejHNZC0
	sUKxfVr97r+FGeWuLbLSlfpJNGv5X40kvQS9OfFowNKaZFN5vmf71h/iGriZzweE
	JjL3aUgfWB9AERjWRq5Y4SYXQw0CVyiY7KUVJ6oYYf4daNwD2oYozgpvCNb2bXnn
	s4WrxFtKp4DQJK42g7VBjAGqT7XRrEZr4GbO/EeO8sJuyiS93gnHiwTDFyQHyNh1
	QomU2GcRbfc2ilhey5UZFJ6HOjjwCNYRFGx4rMNcFXkG3UbcPQoi+0QX6sJInlzh
	Mf6XTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5bkb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 08 Jul 2026 16:00:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91ed0e140c5so163684085a.0
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 09:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783526401; cv=none;
        d=google.com; s=arc-20260327;
        b=mGlhrUN69Mg4D9lC93DlbpcaaNhw9UUpvruPdeIldXKkI4MSx+R+1ptTwXZfqqaGZJ
         xn2p8g4L4ES4cRojUC7JipU2LsSMOyl1QsWW/BvcFKGEVlKnqlU6x0XCfw1oFxbIkO+y
         ZvynlBO3VO4196xKauzC3wdGZu07uQvzTeyfiZbZQB0/OwK9SJTBF/kJJKZwUdaXZ517
         xaptz2D4cZ3KLUegkxS3BHBJNRMKOUcD2U/1tUYRIm9hJ2/j38qSdXLV6aj8pr6hL6l9
         0H+ocP3d5tiEOfRoD0CKgDwllJPW9C6lqeLRzfIj5Bjmk34KeJgc5A1BswHTtB9o4fW8
         /AoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXMZY/w5WVF0nRMX+GxiSjwNGLzZb02w3JE1D3SfZP4=;
        fh=MDu/7kKhEMdbWF6Rv0q/QL82lVRhPERDAoGqZplJUZQ=;
        b=T/iZ7PhMH2E493lYSGUBVu7f91y7bcabNFbXEuUMrO9/slzkGwpIC5pQ3C+kzX/PiR
         xAfn0nevVRfuHSLomUBarZfAtN4vIllRMo0gL1guspzX4obXLB853ph7L3cJrw66Jsa6
         HlTzIdwQnYD3aejSZzqyMPnJ7wQdKB47+bpNzWpDzv1NpYpzSYwck1wHyS7aLLAoWhep
         ivKHVffM1trrNelPr2zJyhH2GYWIhOxJUquGhpMnsj2LhrumHDwCjI44O1IxRCGoJRht
         9XqA4EZAjXgJupoMUaJEtcNU+rxVlcs7eBbBncuZvf+mnoObcw/uARfn9tOwyB23abc9
         /vFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783526401; x=1784131201; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pXMZY/w5WVF0nRMX+GxiSjwNGLzZb02w3JE1D3SfZP4=;
        b=W0Gcw2YfFl0eFgsFNjI+M1LhSCDMbq0qsUdTvDl/ZfrwtDp3Ao06uumvvsOuRHSpnY
         dXO6cnB4CItnQKj0UMU//OSR4fzhCyY0H03mdZygubPS6h8jzRKWZ+ATKVYs2EGIwPvw
         cd3en6wVC6K107C94FAEdy8JOYxwcPtKLa2dzrpI80VFIzE/q6h36DIxQzAOml7o1StZ
         xAO0Yn1VDDKrfTsTgJuqEUy/JdQK7PndOvIvLDLxYP6DhxIQsbsPiy9hZnHp9NDYv9wS
         TKYEJIq1Vs/gMp0TGcOn1IHE9TeNEThxZ6vVwf0IU9nWfLa2X3PH5i6YCiTcC9Pj7oMg
         Trvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526401; x=1784131201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXMZY/w5WVF0nRMX+GxiSjwNGLzZb02w3JE1D3SfZP4=;
        b=ijX460j6jHUji+AjGzcSd6qBfsBrx7cXZIePZgoYeZyj9uq7Wm0xg3Y9UghIQerMB9
         Z0wg7tVM3YbEXKA2dvNzXNQyuSwhywsirLD49fFvrP5kIaAkx6gjSLtFPqFz1d8JPGAR
         g2+tbakrYdE1oWXC8tB+txbRybe+uDCkQ5TDQBSfE1tdY7vsvOxj6DEnLUPGN9rRxAk2
         m2vHMLUWJ4uNW+rGFcnmrUzOpD1eqL9G7+ps3Ae03IUJ8YzHiF8SOREFE+w2Jj5Yxvk8
         KqwcrCkbgZLqsxyI1UpExviru/DQnrBaIRR3YxT45aApaaix5TR2rR5Td2Po2RQSjttX
         6viA==
X-Forwarded-Encrypted: i=1; AHgh+Rqw0dg8SGiaah+2z/a0PTqIa4bVVpeKR5oOUvyKGG1R690onsWhnmkfd4qcMVhFH/4p2XA=@lists.linux.dev
X-Gm-Message-State: AOJu0YypQsZOJhJ44ohGIY2SvrQp7MpcfTkGNtxWSimt5keeKkhtsGC/
	Ts40tn20+rRg4qQzspNHg6rJai/u5FWIu1AfUYSybD23r6tl+Ycz/OxBv6/KIsPw0v1YG3HJoS3
	4CKkzcreUcrtsgO9NuYnWXOeE6resF8/4h1W4H6W1Yfl0wYMSqTYq8rIB1GdSxJyUhvhlfOYjCS
	QcEpvm9iK0pjbXhQzHGT7k5xVQoWVd0A==
X-Gm-Gg: AfdE7cmsVCCxPKTbuH262yqj0XBLBWdlTpUYr8KwCsF+hO5t+JARobJEUoEEQEmmJUv
	3BSX9Qbg49iLIH1IJOszH1DGgsfXggDyawgivnw8QLMNM6HnaXt1RBKZ59MFtmGnfhu+hVq17ax
	NR75iL3oXTjx2Qb43XYMN4LNNFKbSzZeIDTXdE8ZnTzSJQ7EHvg5nfSosjEkmM+9Ce0JaY
X-Received: by 2002:a05:620a:1a07:b0:92d:e54e:72d9 with SMTP id af79cd13be357-92ecf5c527emr315778485a.1.1783526400541;
        Wed, 08 Jul 2026 09:00:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:92d:e54e:72d9 with SMTP id
 af79cd13be357-92ecf5c527emr315764985a.1.1783526398870; Wed, 08 Jul 2026
 08:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com>
In-Reply-To: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:59:20 +0200
X-Gm-Features: AVVi8CdAnkt7W-EK3sRgfNkIzKWDE74xqiNiWEwP6a_AAGRkEBuSzmKj65KtehM
Message-ID: <CAPx+jO-NMUPfXJpSUa09VrA=naiiFTMpg0qzqi4QeYbeeK3SkA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pmdomain: imx: Fix i.MX8MP VC8000E power up sequence
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e7402 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=P6ToQuPI3Mtl0Vbz5-oA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX4R//TyEozM1f
 pWXNWeaD0a62wEpSU2xmKje5O2xhMhTtQgFv2zW+Or2NWn6h7D+NZLZEnG6GhBAEBu14d4ESN2p
 IKJir19uGgnYXKh+P/K3lyosmeCyOX4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NyBTYWx0ZWRfX2JLoXAaZIpKj
 1RET4k5aTaChfgGvrGhZlKz9cUm3h8kDzP+T4z4C/CotX1MASNBpQfSCYF17TV0N6jmesYwYjf7
 pNyh4/dRtu/h6dund+OG60uhO1vsow024y72lszpQPWKHykbhxOFt+Tt2KN6sYiFhj6zmrJZd+o
 K7ZIkliU8XRVKjuw0g1gVJijZejB8UCO5z+M2VCkIuOxLpNS0iOiOqKw25Et5XTSgH6BU745V7W
 Wr/cUsQtOTTSxL9GO3DAuMlkFafR43aIfsxLTBGRjpzsmP05GBs43kX556vI4X1KU0H8D5Z9Yt+
 6kapVux5zpoSWrgIj3cGWNtubg7QF+sy4HkdrmQOEO4okd31DfCBuYofLSWGvjvl9Tm+rz76Bxj
 gRI2wRCKxGoG3zCYp4TNMs0+WE96HTL3oBxLjP8ToQMl+m9HiLMbrGFhzlBTSdjMLKoNeLoSyuU
 w1vSiXfdL5pPNt++BuQ==
X-Proofpoint-ORIG-GUID: kAP16owgnrPz0fSqg29MG_gJZrV6NudG
X-Proofpoint-GUID: kAP16owgnrPz0fSqg29MG_gJZrV6NudG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080157

On Wed, Jun 10, 2026 at 3:22=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> There is an errata for i.MX8MP VC8000E:
>     ERR050531: VPU_NOC power down handshake may hang during VC8000E/VPUMI=
X
>     power up/down cycling.
>     Description: VC8000E reset de-assertion edge and AXI clock may have a
>     timing issue.
>     Workaround: Set bit2 (vc8000e_clk_en) of BLK_CLK_EN_CSR to 0 to gate =
off
>     both AXI clock and VC8000E clock sent to VC8000E and AXI clock sent t=
o
>     VPU_NOC m_v_2 interface during VC8000E power up(VC8000E reset is
>     de-asserted by HW)
>
> This patchset is to fix the errata. More info could be found in each
> patch commit.
>
> Sorry for sending v4 at 7.1-rc7, no rush for 7.1.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

The v4 series applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v4:
> - Add R-b
> - Set is_errata_err050531 to true for vc8000e
> - Link to v3: https://lore.kernel.org/r/20260409-imx8mp-vc8000e-pm-v3-0-3=
e023eaa245b@nxp.com
>
> Changes in v3:
> - Separate power up notifier fix into patch 1
> - Link to v2: https://lore.kernel.org/r/20260228-imx8mp-vc8000e-pm-v2-1-f=
d255a0d5958@nxp.com
>
> Changes in v2:
> - Add errata link in commit message
> - Add comment for is_errata_err050531
> - Link to v1: https://lore.kernel.org/r/20260128-imx8mp-vc8000e-pm-v1-1-6=
c171451c732@nxp.com
>
> ---
> Peng Fan (2):
>       pmdomain: imx: Fix i.MX8MP power notifier
>       pmdomain: imx: Fix i.MX8MP VC8000E power up sequence
>
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 46 +++++++++++++++++++++++++++++=
++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> ---
> base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
> change-id: 20260610-b4-imx8mp-vc8000e-pm-v4-1-a978b40c59d0
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>
